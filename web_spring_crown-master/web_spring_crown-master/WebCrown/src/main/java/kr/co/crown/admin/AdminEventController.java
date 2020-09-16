package kr.co.crown.admin;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminEventController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/adminEventList")
	public ModelAndView adminEventList(HttpServletRequest req) {
		AdminEventDAOImp aedao = sqlSession.getMapper(AdminEventDAOImp.class);
		ModelAndView mav = new ModelAndView();

		String pageNumStr = req.getParameter("pageNum");
		AdminEventPaginVO aepvo =new AdminEventPaginVO();
		
		if(pageNumStr != null) {
			aepvo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		aepvo.setSearchKey(req.getParameter("searchKey"));
		aepvo.setSearchWord(req.getParameter("searchWord"));
		
		aepvo.setTotalRecord(aedao.getTotalEvent(aepvo));
		
		mav.addObject("elist", aedao.allSelectEvent(aepvo));
		mav.addObject("aepvo", aepvo);
		mav.setViewName("admin/adminEventList");
		return mav;
	}	
	
	@RequestMapping("/adminEventAdd")
	public String adminEventAdd(){
		
		return "admin/adminEventAdd";
	}
	
	@RequestMapping(value="/adminEventAddOk", method = RequestMethod.POST)
	public ModelAndView adminEventAddOk(AdminEventVO aevo, HttpServletRequest req) {		
		ModelAndView mav = new ModelAndView();
		
		String path = req.getSession().getServletContext().getRealPath("/upload");
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf = (MultipartFile) mr.getFile("filename");
		
		String fName = mf.getOriginalFilename();
		
		if(mf!=null) {
			if(fName!=null && !fName.equals("")) {
				File f = new File(path, fName);
				if(f.exists()) {
					for(int renameNum=1; ;renameNum++) {
						String orgFilename = fName.substring(0, fName.lastIndexOf(".")); //event_test
						String orgExt = fName.substring(fName.lastIndexOf(".")+1); //jpg
						f = new File(path, orgFilename + renameNum +"."+ orgExt);
						if(!f.exists()) {
							fName = orgFilename+renameNum+"."+orgExt;							
							break;
						}
					}
				} 
				try {
					File f2 = new File(path,fName);
					mf.transferTo(f2);
				}catch(Exception e) {
					e.printStackTrace();
				}					
			}
			aevo.setImg(fName);
		}
		String pName = req.getParameter("dsp");
		String replaceDSP = pName.replace("\r\n", "<br/>");
		aevo.setEvent_mdsp(replaceDSP);
		
		String pName2 = req.getParameter("sdsp");
		String replacePDSP1 = pName2.replace("\r\n", "<br/>");
		aevo.setEvent_sdsp(replacePDSP1);
		
		AdminEventDAOImp aedao = sqlSession.getMapper(AdminEventDAOImp.class);
		
		int eventAddResult = aedao.insertEvent(aevo);
		mav.addObject("eventAddResult", eventAddResult);
		
		if(eventAddResult>0) {
			mav.setViewName("redirect:adminEventAddResult");
		}else {
			if(fName!=null) {
				deleteFile(path, fName);
			}
			mav.setViewName("redirect:adminEventAddResult");
		}
		return mav;
	}
	
	public void deleteFile(String p, String f) {
		File fn = new File(p, f);
		fn.delete();
	}
	
	@RequestMapping("/adminEventAddResult")
	public ModelAndView adminEventAddResult(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("eventAddResult", req.getParameter("eventAddResult"));
		
		mav.setViewName("admin/adminEventAddOk");
		return mav;
	}

	@RequestMapping("/adminEventDel")
	public ModelAndView adminEventkDel(HttpServletRequest req) {
		AdminEventDAOImp aedao = sqlSession.getMapper(AdminEventDAOImp.class);
		int event_code = Integer.parseInt((String)req.getParameter("event_code"));
				
		AdminEventVO aevo = aedao.selectEvent(event_code);
		ModelAndView mav = new ModelAndView();
		
		if(aevo.getImg()!=null) {
			String path = req.getSession().getServletContext().getRealPath("/upload");
			String imgName = aevo.getImg();
			deleteFile(path, imgName);
		}
		
		int deleteResult = aedao.deleteEvent(event_code);
		mav.addObject("deleteResult", deleteResult);
		mav.addObject("event_code", event_code);
		mav.setViewName("redirect:adminEventDelOk");
		return mav;
	}

	@RequestMapping("/adminEventDelOk")
	public ModelAndView adminEventDelOk(String event_code, String deleteResult) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("deleteResult", deleteResult);
		mav.addObject("event_code", event_code);
	
		mav.setViewName("admin/adminEventDeleteOk");
		return mav;
	}
	

	@RequestMapping("/adminEventView")
	public ModelAndView adminEventView(HttpServletRequest req) {
		AdminEventDAOImp aedao = sqlSession.getMapper(AdminEventDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		int event_code = Integer.parseInt(req.getParameter("event_code"));

		mav.addObject("aevo", aedao.selectEvent(event_code));
		mav.setViewName("admin/adminEventView");
		return mav;
	}

	@RequestMapping("/adminEventEdit")
	public ModelAndView adminEventEdit(HttpServletRequest req) {
		
		AdminEventDAOImp aedao = sqlSession.getMapper(AdminEventDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		int event_code = Integer.parseInt(req.getParameter("event_code"));
		
		AdminEventVO aevo = aedao.selectEvent(event_code);
		
		String eMDSP = aevo.getEvent_mdsp();
		String replaceEMDSP = eMDSP.replace("<br/>", "\r\n");
		
		String eSDSP = aevo.getEvent_sdsp();
		String replaceESDSP = eSDSP.replace("<br/>", "\r\n");
		
		mav.addObject("aevo", aedao.selectEvent(event_code));
		mav.addObject("replaceEMDSP", replaceEMDSP);
		mav.addObject("replaceESDSP", replaceESDSP);
		mav.setViewName("admin/adminEventEdit");
		
		return mav;
	}
	
	@RequestMapping(value="/adminEventEditOk", method = RequestMethod.POST)
	public ModelAndView adminEventEditOk(AdminEventVO aevo, HttpServletRequest req,
										@RequestParam("filename") MultipartFile img) {
		ModelAndView mav = new ModelAndView();
		AdminEventDAOImp aedao = sqlSession.getMapper(AdminEventDAOImp.class);
		
		String path = req.getSession().getServletContext().getRealPath("/upload");
		
		int event_code = Integer.parseInt((String)req.getParameter("event_code"));
		AdminEventVO imgvo = aedao.selectEvent(event_code);
		
		String getDBFile = imgvo.getImg();
		String imgName = img.getOriginalFilename();
		
		System.out.println(getDBFile);
		
		String orgImgName = imgName;
		String newImgName = null;
	
		if(orgImgName!=null && !orgImgName.equals("")) {
			newImgName = changFileName(path, orgImgName);
			try {
				img.transferTo(new File(path, newImgName));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}		
		aevo.setImg(newImgName);
		
		String eName = req.getParameter("event_mdsp");
		String replaceEMDSP = eName.replace("\r\n", "<br/>");
		aevo.setEvent_mdsp(replaceEMDSP);
		
		String eName2 = req.getParameter("event_sdsp");
		String replaceESDSP = eName2.replace("\r\n", "<br/>");
		aevo.setEvent_sdsp(replaceESDSP);
		
		int updateCnt = aedao.updateEvent(aevo);
		mav.addObject("updateCnt", updateCnt);
		mav.addObject("event_code", req.getParameter("event_code"));
		
		String newUploadImg = aevo.getImg();
		
		if(updateCnt>0) {
			if(newUploadImg!=null) {
				deleteFile(path, getDBFile);
			}
		}else {
			if(newUploadImg != null) {
				deleteFile(path, newImgName);
			}
		}
		mav.setViewName("redirect:adminEventResult");
		return mav;
	}

	@RequestMapping("adminEventResult")
	public ModelAndView adminPackResult(String updateCnt, String event_code) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("updateCnt", updateCnt);
		mav.addObject("event_code", event_code);
		mav.setViewName("admin/adminEventEditOk");
		
		return mav;
	}
	
	public String changFileName(String path, String fname) {
		File f = new File(path, fname);
		if(f.exists()) {
			for(int renameNum=1;;renameNum++) {
				String orgFilename = fname.substring(0, fname.lastIndexOf("."));
				String orgExt = fname.substring(fname.lastIndexOf(".")+1);
				f = new File(path, orgFilename + renameNum +"."+ orgExt);
				if(!f.exists()) {
					fname = orgFilename+renameNum+"."+orgExt;
					return fname;
				}
			}
		}
		return fname;
	}
}
