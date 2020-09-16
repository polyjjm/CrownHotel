package kr.co.crown.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.crown.member.MemberDAOInterface;

@Controller
public class AdminRoomTypeController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//����Ÿ�� ��� ������ �̵�
	@RequestMapping("/adminRoomTypeAdd")
	public String adminRoomTypeAdd(){
		
		return "admin/adminRoomTypeAdd";
	}
	
	//����Ÿ�� ���
	@RequestMapping(value="/adminRoomTypeAddOk", method = RequestMethod.POST)
	public ModelAndView roomTypeAddOk(
									@RequestParam("inpRoomTypeName0") MultipartFile inpRoomTypeName0,
									@RequestParam("inpRoomTypeName1") MultipartFile inpRoomTypeName1,
									@RequestParam("inpRoomTypeName2") MultipartFile inpRoomTypeName2,
									@RequestParam("inpRoomTypeName3") MultipartFile inpRoomTypeName3,
									@RequestParam("inpRoomTypeName4") MultipartFile inpRoomTypeName4,
									@RequestParam("inpRoomTypeName5") MultipartFile inpRoomTypeName5,
									@RequestParam("inpRoomTypeName6") MultipartFile inpRoomTypeName6,
									HttpServletRequest req, AdminRoomTypeVO vo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("����Ÿ�� ��� ��Ʈ�ѷ� ����");
		String path = req.getSession().getServletContext().getRealPath("/upload");
		
		String imgNames0 = inpRoomTypeName0.getOriginalFilename();//���� �̹���
		String imgNames1 = inpRoomTypeName1.getOriginalFilename();
		String imgNames2 = inpRoomTypeName2.getOriginalFilename();
		String imgNames3 = inpRoomTypeName3.getOriginalFilename();
		String imgNames4 = inpRoomTypeName4.getOriginalFilename();
		String imgNames5 = inpRoomTypeName5.getOriginalFilename();
		String imgNames6 = inpRoomTypeName6.getOriginalFilename();
		
		List<String> orgImgNameList = new ArrayList<String>();
		orgImgNameList.add(imgNames0);
		orgImgNameList.add(imgNames1);
		orgImgNameList.add(imgNames2);
		orgImgNameList.add(imgNames3);
		orgImgNameList.add(imgNames4);
		orgImgNameList.add(imgNames5);
		orgImgNameList.add(imgNames6);
		
		System.out.println("������ �̹��� ���ε� ���� ");
		
		//vo�� ���ϸ� ���� 
		List<String> imgNameList = new ArrayList<String>();
		// ������ �̹��� ���ε�
		
		for(int i=0; i<orgImgNameList.size(); i++) {
			System.out.println("111for�� �������� �̸� : orgImgName = "+orgImgNameList.get(i));
			if(orgImgNameList.get(i) !=null && !orgImgNameList.get(i).equals("")) {
				String orgImgName = orgImgNameList.get(i);
				System.out.println("222for�� �������� �̸� : orgImgName = "+orgImgNameList.get(i));
				String newImgName = changFileName(path, orgImgName);
				System.out.println("333for�� ���� �� �̸� : newImgName = "+newImgName);
				try {
					System.out.println("=========�̹��� ���ε� ����===========");
					if(i==0) {
						inpRoomTypeName0.transferTo(new File(path, newImgName));
					}
					if(i==1) {
						inpRoomTypeName1.transferTo(new File(path, newImgName));
					}
					if(i==2) {
						inpRoomTypeName2.transferTo(new File(path, newImgName));
					}
					if(i==3) {
						inpRoomTypeName3.transferTo(new File(path, newImgName));
					}
					if(i==4) {
						inpRoomTypeName4.transferTo(new File(path, newImgName));
					}
					if(i==5) {
						inpRoomTypeName5.transferTo(new File(path, newImgName));
					}
					if(i==6) {
						inpRoomTypeName6.transferTo(new File(path, newImgName));
					}
					
					System.out.println("=========�̹��� ���ε� ����=========== ");
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				imgNameList.add(newImgName);
			}
		}

		vo.setRoomImgList(imgNameList);

		AdminRoomTypeDAOImp dao = sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		
		int roomTypeAddResult = dao.insertRoomTypeRecord(vo);
		mav.addObject("roomTypeAddResult" ,roomTypeAddResult);
		
		//���ڵ� �߰� ���н� ���� ����
		if(roomTypeAddResult<=0) {
			
			for(int i=0; i<imgNameList.size(); i++) {
				
				if(imgNameList.get(i)!=null) {
					deleteFile(path, imgNameList.get(i));
				}
			}
			
		}
		mav.setViewName("redirect:adminRoomTypeAddResult");
		return mav;
	}
	
	//���ϸ� ����
	public String changFileName(String path, String fname) {
		System.out.println("���ϸ� ���� ����");
		System.out.println("path : "+path);
		System.out.println("fname : "+fname);
		File f = new File(path, fname);
		if(f.exists()) {
			System.out.println("���� ���ϸ��� ���� �Ҷ�");
			for(int renameNum=1;;renameNum++) {
				String orgFilename = fname.substring(0, fname.lastIndexOf("."));
				String orgExt = fname.substring(fname.lastIndexOf(".")+1);
				System.out.println("�������� �̸� : "+fname);
				f = new File(path, orgFilename + renameNum +"."+ orgExt);
				if(!f.exists()) {
					fname = orgFilename+renameNum+"."+orgExt;
					System.out.println("������ �̸� : "+fname);
					return fname;
				}
			}
		}
		return fname;
	}
	//���� ����
	public void deleteFile(String p, String f) {
		System.out.println("���� ���� ����"); 
		File fn = new File(p,f);
		System.out.println("���� ���� fn"+fn);
		fn.delete();
	}
	
	@RequestMapping("/adminRoomTypeAddResult")
	public ModelAndView adminRoomTypeAddResult(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession ses = req.getSession();
		String pwdStatus = "N";
		ses.setAttribute("pwdStatus", pwdStatus);
		
		mav.addObject("roomTypeAddResult", req.getParameter("roomTypeAddResult"));
		
		mav.setViewName("admin/adminRoomTypeAddOk");
		return mav;
	}
	
	
	//����Ÿ�� ��� ������ �̵�
	@RequestMapping("/adminRoomTypeList")
	public ModelAndView adminRoomTypeList(HttpServletRequest req) {
		AdminRoomTypeDAOImp dao = sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		ModelAndView mav = new ModelAndView();
		//������ ������ ��ȣ ���ϱ� 
		String pageNumStr = req.getParameter("pageNum");
		AdminRoomTypePaginVO pvo =new AdminRoomTypePaginVO();
		
		//������ ��ȣ�� ���۵� ��� ������ ��ȣ�� ����
		if(pageNumStr != null) {
			pvo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//�˻���, �˻�Ű request
		pvo.setSearchKey(req.getParameter("searchKey"));
		pvo.setSearchWord(req.getParameter("searchWord"));
		
		pvo.setTotalRecord(dao.getTotalRoomTypeRecord(pvo));
		
		mav.addObject("list", dao.allSelectRoomTypeRecord(pvo));
		mav.addObject("pvo",pvo);
		
		mav.setViewName("admin/adminRoomTypeList");
		return mav;
	}
	
	// ����Ÿ�� �󼼺���
	@RequestMapping("/adminRoomTypeView" )
	public ModelAndView adminRoomTypeView(int room_type_code) {
		AdminRoomTypeDAOImp dao = sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", dao.selectRoomTypeRecord(room_type_code));
		mav.setViewName("admin/adminRoomTypeView");
		return mav;
	}
	
	
	
	
/*=========== ����Ÿ�� ���� ==========*/
	
	//������ ��� üũ â �̵�
	@RequestMapping("/adminPasswordChk")
	public ModelAndView adminPasswordChk(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("room_type_code", req.getParameter("room_type_code"));
		mav.addObject("room_code",req.getParameter("room_code"));
		mav.addObject("room_separator", req.getParameter("room_separator"));
		mav.addObject("separator", req.getParameter("separator"));
		System.out.println("room_separator = "+req.getParameter("room_separator"));
		mav.setViewName("admin/adminPasswordChk");
		return mav;
	}
	
	// ������ ��й�ȣ Ȯ��
	@RequestMapping(value="/adminPasswordChkOk", method = RequestMethod.POST)
	public ModelAndView adminPasswordChkOk(HttpServletRequest req) {
		System.out.println("������ ��й�ȣ ��Ʈ�ѷ�");
		
		String password = (String) req.getParameter("password");
		ModelAndView mav = new ModelAndView();
		MemberDAOInterface memdao = sqlSession.getMapper(MemberDAOInterface.class);
		HttpSession ses = req.getSession();
		
		String separator = (String) req.getParameter("separator");
		int pwdResult = memdao.passwordCheck("admin", password);
		String pwdStatus = (String) ses.getAttribute("pwdStatus");
		mav.addObject("pwdResult", pwdResult);
		mav.addObject("separator", separator);
		
		if(pwdStatus!=null && pwdResult>0) {//��й�ȣ�� ��ġ�ҋ�
			pwdStatus = "Y";
			ses.setAttribute("pwdStatus", pwdStatus);
		}
		
		mav.addObject("pwdStatus",pwdStatus);
		mav.addObject("room_code",req.getParameter("room_code"));
		mav.addObject("room_type_code",req.getParameter("room_type_code"));
		mav.addObject("room_separator", req.getParameter("room_separator"));
		mav.setViewName("admin/adminPasswordChk");
		
		return mav;
	}
	
	// ����Ÿ�� ����
	@RequestMapping("/adminRoomTypeDel")
	public ModelAndView adminRoomTypeDel(HttpServletRequest req) {
		
		AdminRoomTypeDAOImp dao = sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		int room_type_code = Integer.parseInt((String)req.getParameter("room_type_code"));
		//����Ÿ�� �̹����� �����ϸ� ������ �̹��� ����
		//����Ÿ�� �ڵ�� vo�� ��´�.
		AdminRoomTypeVO vo = dao.selectRoomTypeRecord(room_type_code);
		
		List <String> imgList = vo.getRoomImgList();
		ModelAndView mav = new ModelAndView();
		System.out.println("imgList"+ imgList);
		if(imgList != null) {//�̹��� ����
			//�̹��� ����
			System.out.println("�̹��� ����");
			//���� �̹��� ����
			String path = req.getSession().getServletContext().getRealPath("/upload");
			System.out.println("path : "+ path);
			for(String imgName : imgList) {
				System.out.println("imgName : " +imgName);
				deleteFile(path, imgName);
			}
		}
		//���ڵ� ����
		int delResult = dao.deleteRoomTypeRecord(room_type_code);
		mav.addObject("delResult", delResult);
		mav.addObject("room_type_code", room_type_code);
		mav.setViewName("redirect:adminRoomTypeDelOk");
		return mav;
	}
	
	//����Ÿ�� ���� Ok
	@RequestMapping("/adminRoomTypeDelOk")
	public ModelAndView adminRoomTypeDelOk(String room_type_code, String delResult, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		if(delResult!=null) {
			mav.addObject("delResult", delResult);
		}
		if(room_type_code!=null) {
			mav.addObject("room_type_code", room_type_code);
		}
		System.out.println("delResult = "+delResult);
		System.out.println("room_type_code = "+room_type_code);
		HttpSession ses = req.getSession();
		String pwdStatus = "N";
		ses.setAttribute("pwdStatus", pwdStatus);
		
		mav.setViewName("admin/adminRoomTypeDeleteOk");
		return mav;
	}
	
	
	
/*=========  ����Ÿ�� ����	========================*/	
	
	//����Ÿ�� ���� ������ �̵�
	@RequestMapping("/adminRoomTypeEdit")
	public ModelAndView adminRoomTypeEdit(int room_type_code) {
		AdminRoomTypeDAOImp dao= sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", dao.selectRoomTypeRecord(room_type_code));
		
		mav.setViewName("admin/adminRoomTypeEdit");
			
		return mav;
	}
	
	//����Ÿ�� ���� 
	@RequestMapping(value="/adminRoomTypeEditOk", method = RequestMethod.POST)
	public ModelAndView adminRoomTypeEditOk(AdminRoomTypeVO vo, HttpServletRequest req,
											@RequestParam("inpRoomTypeName0") MultipartFile inpRoomTypeName0,
											@RequestParam("inpRoomTypeName1") MultipartFile inpRoomTypeName1,
											@RequestParam("inpRoomTypeName2") MultipartFile inpRoomTypeName2,
											@RequestParam("inpRoomTypeName3") MultipartFile inpRoomTypeName3,
											@RequestParam("inpRoomTypeName4") MultipartFile inpRoomTypeName4,
											@RequestParam("inpRoomTypeName5") MultipartFile inpRoomTypeName5,
											@RequestParam("inpRoomTypeName6") MultipartFile inpRoomTypeName6) {
		ModelAndView mav = new ModelAndView();
		AdminRoomTypeDAOImp dao = sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		
		String path = req.getSession().getServletContext().getRealPath("/upload");

		//������ ���ϸ� 
		String[] delFiles = req.getParameterValues("delRoomTypeImgList"); //������ �̹����� ��� �׸�
		
		System.out.println(""+vo.getRoom_name());
		
		//���ڵ� ��ȣ�� ������ �̹��� ����Ʈ �ޱ�
		int room_type_code= Integer.parseInt((String)req.getParameter("room_type_code"));
		AdminRoomTypeVO imgvo = dao.selectRoomTypeRecord(room_type_code);
		
		//������ ���̽��� �ִ� �̹��� ����Ʈ
		List<String> getDBFiles = imgvo.getRoomImgList();
		System.out.println("������ ���̽��� �ִ� �̹��� ����Ʈ : "+getDBFiles);
		
		String imgNames0 = inpRoomTypeName0.getOriginalFilename();//���� �̹���
		String imgNames1 = inpRoomTypeName1.getOriginalFilename();
		String imgNames2 = inpRoomTypeName2.getOriginalFilename();
		String imgNames3 = inpRoomTypeName3.getOriginalFilename();
		String imgNames4 = inpRoomTypeName4.getOriginalFilename();
		String imgNames5 = inpRoomTypeName5.getOriginalFilename();
		String imgNames6 = inpRoomTypeName6.getOriginalFilename();
		System.out.println("���ε��� �̹��� �̸� imgNames0 : "+imgNames0);
		System.out.println("���ε��� �̹��� �̸� inpRoomTypeName0.getOriginalFilename() : "+inpRoomTypeName0.getOriginalFilename());
		System.out.println("���ε��� �̹��� �̸� imgNames1 : "+imgNames1);
		//���ε� �̹��� ���� �̸� ����Ʈ
		List<String> orgImgNameList = new ArrayList<String>();
		orgImgNameList.add(imgNames0);
		orgImgNameList.add(imgNames1);
		orgImgNameList.add(imgNames2);
		orgImgNameList.add(imgNames3);
		orgImgNameList.add(imgNames4);
		orgImgNameList.add(imgNames5);
		orgImgNameList.add(imgNames6);
		
		//���ε� �̹��� ���� �̸� ����Ʈ
		String newImgNames[] = new String[7];
		
		for(int i=0; i<orgImgNameList.size(); i++) {
			System.out.println("111for�� �������� �̸� : orgImgName = "+orgImgNameList.get(i));
			if(orgImgNameList.get(i) !=null && !orgImgNameList.get(i).equals("")) {
				String orgImgName = orgImgNameList.get(i);
				System.out.println("222for�� �������� �̸� : orgImgName = "+orgImgNameList.get(i));
				String newImgName = changFileName(path, orgImgName);
				System.out.println("333for�� ���� �� �̸� : newImgName = "+newImgName);
				newImgNames[i] = newImgName;
				System.out.println("444for�� ���� �� �̸� �迭 �� :"+newImgNames[i]);
				try {
					System.out.println("=========�̹��� ���ε� ����===========");
					if(i==0) {
						
						inpRoomTypeName0.transferTo(new File(path, newImgName));
					}
					if(i==1) {
						inpRoomTypeName1.transferTo(new File(path, newImgName));
					}
					if(i==2) {
						inpRoomTypeName2.transferTo(new File(path, newImgName));
					}
					if(i==3) {
						inpRoomTypeName3.transferTo(new File(path, newImgName));
					}
					if(i==4) {
						inpRoomTypeName4.transferTo(new File(path, newImgName));
					}
					if(i==5) {
						inpRoomTypeName5.transferTo(new File(path, newImgName));
					}
					if(i==6) {
						inpRoomTypeName6.transferTo(new File(path, newImgName));
					}
					
					System.out.println("=========�̹��� ���ε� ����=========== ");
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		//������ ���̽� �̹��� �̸��� �����Ѵ�.
		int dbListSize = getDBFiles.size(); // ���������� ���� 1~7�� //4
		int newImgNamelength = newImgNames.length; //������ 7��
		System.out.println("dbListSize : "+dbListSize);
		System.out.println("newImgNamelength : "+newImgNamelength);
		for(int i=0; i<newImgNamelength; i++) {
			System.out.println("�ݺ��� ���� ");
			if(i<=dbListSize) {// 0 1 2 3
				System.out.println("�����Ϳ� �̹��� �̸� ���� if ��");
				if(newImgNames[i]!=null && !newImgNames[i].equals("")) {
					getDBFiles.set(i, newImgNames[i]);
				}
			}else if(i>dbListSize || i<newImgNamelength){
				System.out.println("�����Ϳ� �̹��� �̸� ���� else if ��");
				if(newImgNames[i]!=null && !newImgNames[i].equals("")) {
					getDBFiles.add(i, newImgNames[i]);
				}
			}
		}
		vo.setRoomImgList(getDBFiles);
		
		
		//2.��� ������Ʈ
		int updateCnt = dao.updateRoomTypeRecord(vo);
		mav.addObject("updateCnt", updateCnt);
		mav.addObject("room_type_code", req.getParameter("room_type_code"));
		
		if(updateCnt>0) {//���� : ������ ������ �̹��� ���� �����
			/*====== ������ �̹��� ���� =============*/
			if(delFiles!=null && delFiles.length>0) {
				System.out.println("������ ���� ���� : "+delFiles.length);
				for(int i=0; i<delFiles.length; i++) {
					System.out.println("������ �̹��� �̸� : "+delFiles[i]);
					deleteFile(path, delFiles[i]);
				}
			}
		}else {//���� : ���� ���ε� ���� �����
			//���ڵ� �߰� ���н� ���� ����
			for(int i=0; i<getDBFiles.size(); i++) {
				
				if(getDBFiles.get(i)!=null) {
					deleteFile(path, getDBFiles.get(i));
				}
			}
		}
		mav.setViewName("redirect:adminRoomTypeEditResult");
		return mav;
	}
	
	//����Ÿ�� ���� 
	@RequestMapping("adminRoomTypeEditResult")
	public ModelAndView adminRoomTypeEditResult(String updateCnt, String room_type_code, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		String pwdStatus = "N";
		ses.setAttribute("pwdStatus", pwdStatus);
		
		mav.addObject("updateCnt", updateCnt);
		mav.addObject("room_type_code", room_type_code);
		mav.setViewName("admin/adminRoomTypeEditOk");
		
		return mav;
	}
	
}
