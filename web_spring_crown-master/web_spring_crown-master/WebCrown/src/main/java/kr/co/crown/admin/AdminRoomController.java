package kr.co.crown.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminRoomController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//객실 목록 페이지 이동
	@RequestMapping("/adminRoomList")
	public ModelAndView adminRoomList(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		AdminRoomDAOImp dao = sqlSession.getMapper(AdminRoomDAOImp.class);
		
		//선택한 페이지 번호 구하기 
		String pageNumStr = req.getParameter("pageNum");
		AdminRoomTypePaginVO pvo =new AdminRoomTypePaginVO();
		
		//페이지 번호가 전송된 경우 페이지 번호를 변경
		if(pageNumStr != null) {
			pvo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키 request
		pvo.setSearchKey(req.getParameter("searchKey"));
		pvo.setSearchWord(req.getParameter("searchWord"));
	
		pvo.setTotalRecord(dao.getTotalRoomRecord(pvo));
		
		mav.addObject("list", dao.allSelectRoomAndTypeRecord(pvo));
		mav.addObject("pvo", pvo);
		
		mav.setViewName("admin/adminRoomList");
		return mav;
	}
	
	//객실 등록 페이지 이동
	@RequestMapping("/adminRoomAdd")
	public ModelAndView adminRoomAdd(){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/adminRoomAdd");
		return mav;
	}
	
	//객실 등록 
	@RequestMapping(value="/adminRoomAddOk", method=RequestMethod.POST)
	public ModelAndView adminRoomAddOk(AdminRoomVO vo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("객실 등록 컨트롤러 시작");
		AdminRoomDAOImp dao = sqlSession.getMapper(AdminRoomDAOImp.class);
		System.out.println("객실등록 컨트롤러 vo 정보 getBed"+vo.getBed());
		System.out.println("객실등록 컨트롤러 vo 정보 getMax_adult"+vo.getMax_adult());
		System.out.println("객실등록 컨트롤러 vo 정보 getMax_child"+vo.getMax_child());
		System.out.println("객실등록 컨트롤러 vo 정보 getRoom_type_code"+vo.getRoom_type_code());
		
		int roomAddResult = dao.insertRoomRecord(vo);
		mav.addObject("roomAddResult", roomAddResult);
		mav.setViewName("redirect:adminRoomAddResult");
		return mav;
	}
	
	//객실 등록 result
	@RequestMapping("/adminRoomAddResult")
	public ModelAndView adminRoomAddResult(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		String pwdStatus = "N";
		ses.setAttribute("pwdStatus", pwdStatus);
		
		mav.addObject("roomAddResult", req.getParameter("roomAddResult"));
		mav.setViewName("admin/adminRoomAddOk");
		return mav;
	}
	
	//객실 타입 :객실타입 레크도 ajax로 받아오기
	@RequestMapping(value="/adminGetRoomTypeRecordAjax", method=RequestMethod.POST)
	@ResponseBody
	public List<AdminRoomTypeVO> adminGetRoomTypeRecordAjax(HttpServletRequest req){
		String room_type = req.getParameter("room_type");
		AdminRoomTypeDAOImp dao = sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		List<AdminRoomTypeVO> list =  dao.getRoomTypeRecordAjax(room_type);
		
		return list ; 
	}
	
	//객실 호수 : 객실호수 ajax로 받아오기
	@RequestMapping(value="/adminGetRoomNumAjax", method=RequestMethod.POST)
	@ResponseBody
	public int adminGetRoomNumAjax(HttpServletRequest req){
		
		String room_num = req.getParameter("room_num");
		System.out.println("room_num = "+room_num);
		AdminRoomDAOImp dao = sqlSession.getMapper(AdminRoomDAOImp.class);
		
		int cntRoomNum =  dao.getRoomNumAjax(room_num);
		System.out.println("cntRoomNum = "+cntRoomNum);
		return cntRoomNum ; 
	}
	
	//객실 상세 페이지 이동
	@RequestMapping("adminRoomView")
	public ModelAndView adminRoomView(int room_code) {
		ModelAndView mav = new ModelAndView();
		AdminRoomDAOImp dao = sqlSession.getMapper(AdminRoomDAOImp.class);
		
		mav.addObject("vo", dao.selectRoomRecord(room_code));
		mav.setViewName("admin/adminRoomView");
		return mav;
	}
	
	//객실 삭제
	@RequestMapping("/adminRoomDel")
	public ModelAndView adminRoomDel(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		AdminRoomDAOImp dao = sqlSession.getMapper(AdminRoomDAOImp.class);
		
		HttpSession ses = req.getSession();
		String pwdStatus = "N";
		ses.setAttribute("pwdStatus", pwdStatus);
		
		int room_code = Integer.parseInt((String) req.getParameter("room_code"));
		int delResult = dao.deleteRoomRecord(room_code);
		mav.addObject("delResult",delResult);
		mav.setViewName("admin/adminRoomDel");
		return mav;
	}
	
	//객실 수정 페이지 이동
	@RequestMapping("adminRoomEdit")
	public ModelAndView adminRoomEdit(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		AdminRoomDAOImp dao = sqlSession.getMapper(AdminRoomDAOImp.class);
		int room_code = Integer.parseInt((String) req.getParameter("room_code"));
		mav.addObject("vo", dao.selectRoomRecord(room_code));
		mav.setViewName("admin/adminRoomEdit");
		return mav;
	}
	
	//객실 수정 Ok
	@RequestMapping(value="/adminRoomEditOk", method=RequestMethod.POST)
	public ModelAndView adminRoomEditOk(AdminRoomVO vo,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		AdminRoomDAOImp dao = sqlSession.getMapper(AdminRoomDAOImp.class);

		
		mav.addObject("room_code", vo.getRoom_code());
		
		int updateCnt = dao.updateRoomRecord(vo);
		
		mav.addObject("updateCnt", updateCnt);
		
		mav.setViewName("redirect:adminRoomEditResult");
		return mav;
	}
	
	@RequestMapping("adminRoomEditResult")
	public ModelAndView adminRoomEdit(int updateCnt, String room_code, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession ses = req.getSession();
		String pwdStatus = "N";
		ses.setAttribute("pwdStatus", pwdStatus);
		
		
		mav.addObject("room_code", room_code);
		mav.addObject("updateCnt", updateCnt);
		mav.setViewName("admin/adminRoomEditOk");
		return mav;
	}
	
}

