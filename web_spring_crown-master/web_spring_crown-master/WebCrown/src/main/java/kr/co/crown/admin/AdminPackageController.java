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
public class AdminPackageController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/adminPackageList")
	public ModelAndView adminPackageList(HttpServletRequest req) {
		AdminPackDAOImp apdao = sqlSession.getMapper(AdminPackDAOImp.class);
		ModelAndView mav = new ModelAndView();

		String pageNumStr = req.getParameter("pageNum");
		AdminPackPaginVO appvo =new AdminPackPaginVO();
		
		if(pageNumStr != null) {
			appvo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		appvo.setSearchKey(req.getParameter("searchKey"));
		appvo.setSearchWord(req.getParameter("searchWord"));
		
		appvo.setTotalRecord(apdao.getTotalPack(appvo));
		
		mav.addObject("plist", apdao.allSelectPack(appvo));
		mav.addObject("appvo", appvo);
		mav.setViewName("admin/adminPackageList");
		return mav;
	}	
	
	@RequestMapping("/adminPackageAdd")
	public String adminPackageAdd(){
		
		return "admin/adminPackageAdd";
	}
	
	@RequestMapping(value="/adminPackAddOk", method = RequestMethod.POST)
	public ModelAndView adminPackAddOk(AdminPackVO apvo, HttpServletRequest req) {		
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
			apvo.setImg(fName);
		}
		String pName = req.getParameter("dsp");
		String replaceDSP = pName.replace("\r\n", "<br/>");
		apvo.setDsp(replaceDSP);
		
		String pName2 = req.getParameter("sdsp");
		String replacePDSP1 = pName2.replace("\r\n", "<br/>");
		apvo.setSdsp(replacePDSP1);
		
		AdminPackDAOImp apdao = sqlSession.getMapper(AdminPackDAOImp.class);
		
		int packNumAddResult;
		if(apvo.getPack_num() <= (apdao.selectRoomNum()-apdao.selectChkRoomNum())) {
			packNumAddResult=1;
		}else if(apdao.selectChkRoomNum()==0){
			packNumAddResult=2;
		}else {
			packNumAddResult=-1;
		}
				
		int pack_roomTN = Integer.parseInt(req.getParameter("room_name"));
		
		apvo.setRoom_type_code(pack_roomTN);
		
		int packAddResult = apdao.insertPackage(apvo);
		mav.addObject("packAddResult", packAddResult);
		
		if(packAddResult>0 && packNumAddResult>0) {
			mav.setViewName("redirect:adminPackAddResult");
		}else {
			if(fName!=null) {
				deleteFile(path, fName);
			}
			mav.setViewName("redirect:adminPackAddResult");
		}
		return mav;
	}
	
	public void deleteFile(String p, String f) {
		File fn = new File(p, f);
		fn.delete();
	}
	
	@RequestMapping("/adminPackAddResult")
	public ModelAndView adminPackageAddResult(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("packAddResult", req.getParameter("packAddResult"));
		
		mav.setViewName("admin/adminPackageAddOk");
		return mav;
	}

	@RequestMapping("/adminPackView")
	public ModelAndView adminPackView(HttpServletRequest req) {
		AdminPackDAOImp apdao = sqlSession.getMapper(AdminPackDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		int pack_code = Integer.parseInt(req.getParameter("pack_code"));
		
		mav.addObject("pack_roomType", apdao.selectRoomTypeName(pack_code));
		mav.addObject("apvo", apdao.selectPackage(pack_code));
		mav.setViewName("admin/adminPackageView");
		return mav;
	}

	@RequestMapping("/adminPackEdit")
	public ModelAndView adminPackEdit(HttpServletRequest req) {
		
		AdminPackDAOImp apdao = sqlSession.getMapper(AdminPackDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		int pack_code = Integer.parseInt(req.getParameter("pack_code"));		
		
		AdminPackVO apvo = apdao.selectPackage(pack_code);
		
		String pMDSP = apvo.getDsp();
		String replaceMDSP = pMDSP.replace("<br/>", "\r\n");
		
		String pSDSP = apvo.getSdsp();
		String replaceSDSP = pSDSP.replace("<br/>", "\r\n");
		
		mav.addObject("pack_roomType", apdao.selectRoomTypeName(pack_code));
		mav.addObject("apvo", apdao.selectPackage(pack_code));
		mav.addObject("replaceMDSP", replaceMDSP);
		mav.addObject("replaceSDSP", replaceSDSP);
		mav.setViewName("admin/adminPackageEdit");
		
		return mav;
	}
	
	@RequestMapping(value="/adminPackEditOk", method = RequestMethod.POST)
	public ModelAndView adminPackEditOk(AdminPackVO apvo, HttpServletRequest req,
										@RequestParam("filename") MultipartFile img) {
		
		ModelAndView mav = new ModelAndView();
		AdminPackDAOImp apdao = sqlSession.getMapper(AdminPackDAOImp.class);
		
		String path = req.getSession().getServletContext().getRealPath("/upload");
		
		int pack_code = Integer.parseInt((String)req.getParameter("pack_code"));
		AdminPackVO imgvo = apdao.selectPackage(pack_code);
		
		String getDBFile = imgvo.getImg();
		String imgName = img.getOriginalFilename();
		
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
		apvo.setImg(newImgName);
		
		String newUploadImg = apvo.getImg();
		
		int updateCnt = apdao.updatePack(apvo);
		
		if(updateCnt>0) {
			if(newUploadImg!=null) {
				deleteFile(path, getDBFile);
			}
		}else {
			if(newUploadImg != null) {
				deleteFile(path, newImgName);
			}
		}
		
		String pName = req.getParameter("dsp");
		String replaceDSP = pName.replace("\r\n", "<br/>");
		apvo.setDsp(replaceDSP);
		
		String pName2 = req.getParameter("sdsp");
		String replacePDSP1 = pName2.replace("\r\n", "<br/>");
		apvo.setSdsp(replacePDSP1);
		
		
		mav.addObject("updateCnt", updateCnt);
		mav.addObject("pack_code", req.getParameter("pack_code"));
		mav.setViewName("redirect:adminPackResult");
		return mav;
	}

	@RequestMapping("adminPackResult")
	public ModelAndView adminPackResult(String updateCnt, String pack_code) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("updateCnt", updateCnt);
		mav.addObject("pack_code", pack_code);
		mav.setViewName("admin/adminPackageEditOk");
		
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
	
	@RequestMapping("adminSalesView")
	public ModelAndView adminSalesView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminSalesView");
		
		return mav;
	}
}
