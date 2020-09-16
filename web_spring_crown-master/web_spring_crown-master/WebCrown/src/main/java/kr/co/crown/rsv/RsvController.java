package kr.co.crown.rsv;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RsvController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping(value = "/rsv", method = RequestMethod.GET)
	public String rsv() {

		return "/rsv/rsv_main";
	}

	@RequestMapping("/room_selection")
	public ModelAndView rsv(HttpServletRequest req, ModelAndView pack_sdspsub) {

		List<String> list = new ArrayList<String>();
		RsvDAOImp dao = sqlSession.getMapper(RsvDAOImp.class);
		ModelAndView mav = new ModelAndView();
		String check_in = req.getParameter("rsv_check_in");
		String check_out = req.getParameter("rsv_check_out");
		int adult = Integer.parseInt(req.getParameter("rsv_adult"));
		int child = Integer.parseInt(req.getParameter("rsv_child"));
		int room_count = Integer.parseInt(req.getParameter("rsv_room_count"));
		int adult1 = 0;
		int child1 = 0;
		int adult2 = 0;
		int child2 = 0;
		if (Integer.parseInt(req.getParameter("rsv_adult1")) > 0) {
			adult1 = Integer.parseInt(req.getParameter("rsv_adult1"));
			child1 = Integer.parseInt(req.getParameter("rsv_child1"));
		}
		if (Integer.parseInt(req.getParameter("rsv_adult2")) > 0) {
			adult2 = Integer.parseInt(req.getParameter("rsv_adult1"));
			child2 = Integer.parseInt(req.getParameter("rsv_child1"));
		}
		List<room_typeVO> RoomTypeList;
		// 입력한 날짜 check_in check_out 의 날짜를 구함
		String[] checkList = dao.dateList(check_in, check_out);
		// 체크인 체크아웃 날짜가 checkList 랑 같은지 비교

		Integer[] roomCode = dao.checkList(checkList);
		// 방번호가 같은컬럼을 제외하고 나머지의 room_type_code 를 distinct해서가져옴
		if (roomCode.length != 0) {
			Integer[] roomTypeCode = dao.roomTypeCode(roomCode);
			// 만약에룸타입의 모든 객실이 예약되어있으면 제외시키고 room_type을뿌려줌
			RoomTypeList = dao.RoomType(roomTypeCode);
			mav.addObject("lst", RoomTypeList);
			
		} else {
			// 만약에 예약되어있는 룸타입이없으면 전체 room_tpye을뿌려줌
			RoomTypeList = dao.allRoomType();
			mav.addObject("lst", RoomTypeList);
		}
		String room_ct = req.getParameter("rsv_room_count");
		// 기간내에 들어가있어야함 그리고 품절이 아니여야함 여기서 품절은 예약하려고하는 고객의 방수보다 같거나 많아야함
		//dao.pack(check_in, check_out,room_ct);
		List<RsvPackInfoVO> packlst= dao.packList(check_in, check_out,room_ct);
		
			
		//System.out.println(packlst.get(0).getPack_sdspsub() +  "pack sub");
		
		mav.addObject("packlst",packlst);
		mav.addObject("check_in", check_in);
		mav.addObject("check_out", check_out);
		mav.addObject("adult", adult);
		mav.addObject("adult1", adult1);
		mav.addObject("adult2", adult2);
		mav.addObject("child", child);
		mav.addObject("child1", child1);
		mav.addObject("child2", child2);
		mav.addObject("room_count", room_count);
		mav.setViewName("/rsv/rsv_room_selection");
		return mav;
	}

	@RequestMapping("/rsv_info")
	public String rsvInfo() {

		return "/rsv/rsv_info";

	}

	@RequestMapping("/init")
	public ModelAndView init(HttpServletRequest req, RsvTotalVO vo) {
		HttpSession ses = req.getSession();
		ModelAndView mav = new ModelAndView();
		List<RsvTotalVO> RsvTotalVO = new ArrayList<RsvTotalVO>();
		RsvMemberInfoVO memvo = new RsvMemberInfoVO();
		RsvDAOImp dao = sqlSession.getMapper(RsvDAOImp.class);
		String userid = (String) ses.getAttribute("user_id");
		String check_in = req.getParameter("Total_check_in");
		String check_out = req.getParameter("Total_check_out");
		int room_count = Integer.parseInt(req.getParameter("Total_count"));
		String room1 = req.getParameter("Total_room1");
		String room2 = req.getParameter("Total_room2");
		String room3 = req.getParameter("Total_room3");
		int room1_adult = Integer.parseInt(req.getParameter("Total_room1_adult"));
		int room2_adult = Integer.parseInt(req.getParameter("Total_room2_adult"));
		int room3_adult = Integer.parseInt(req.getParameter("Total_room3_adult"));
		int room1_child = Integer.parseInt(req.getParameter("Total_room1_child"));
		int room2_child = Integer.parseInt(req.getParameter("Total_room2_child"));
		int room3_child = Integer.parseInt(req.getParameter("Total_room3_child"));
		String bk_price = req.getParameter("Total_bk_price");
		String room_price = req.getParameter("Total_room_price");
		int pack_code = Integer.parseInt(req.getParameter("Total_pack_code"));
		String require1 = req.getParameter("Total_requests1");
		String require2 = req.getParameter("Total_requests2");
		String require3 = req.getParameter("Total_requests3");
		int bk1 = Integer.parseInt(req.getParameter("Total_bk1"));
		int bk2 = Integer.parseInt(req.getParameter("Total_bk2"));
		int bk3 = Integer.parseInt(req.getParameter("Total_bk3"));
		int price = Integer.parseInt(req.getParameter("Total_price"));
		int savepoint = Integer.parseInt(req.getParameter("Total_point"));

		vo.setRoom_count(room_count);
		vo.setCheck_in(check_in);
		vo.setCheck_out(check_out);
		vo.setPack_code(pack_code);
		vo.setRequire1(require1);
		vo.setRequire2(require2);
		vo.setRequire3(require3);
		vo.setPrice(price);
		vo.setRoom_num1(room1);
		vo.setRoom1_adult(room1_adult);
		vo.setRoom1_child(room1_child);
		vo.setBk1(bk1);
		vo.setRoom_num2(room2);
		vo.setRoom2_adult(room2_adult);
		vo.setRoom2_child(room2_child);
		vo.setBk2(bk2);
		vo.setRoom_num3(room3);
		vo.setRoom3_adult(room3_adult);
		vo.setRoom3_child(room3_child);
		vo.setBk3(bk3);
		vo.setSavepoint(savepoint);
		if (userid != null) {
			memvo = dao.RsvMemberInfo(userid);
			String name = memvo.getUser_name();
			memvo.setUser_first_name(name.substring(0, 1));
			String tel[]=memvo.getUser_tel().split("%!");
			String tel1=tel[2].substring(0,3);
			String tel2=tel[2].substring(3,7);
			String tel3=tel[2].substring(7,11);
			//System.out.println(tel1+","+ tel2+","+tel3);
			memvo.setUser_tel1(tel1);
			memvo.setUser_tel2(tel2);
			memvo.setUser_tel3(tel3);
			memvo.setUser_last_name(name.substring(1, 3));
			mav.addObject("Total_room_price", room_price);
			mav.addObject("Total_bk_price", bk_price);
			mav.addObject("memvo", memvo);
			mav.addObject("vo", vo);
			mav.setViewName("/rsv/rsv_mem");

		}

		if (userid == null) {

			mav.addObject("Total_room_price", room_price);
			mav.addObject("Total_bk_price", bk_price);
			mav.addObject("vo", vo);
			mav.setViewName("/rsv/rsv_mem");
		}

		return mav;
	}

	@RequestMapping(value = "/rsvCodeChk")
	public ModelAndView rsvCodeChk() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/rsv/rsv_complete");
		return mav;
	}

	@RequestMapping(value = "/rsvChk", method = RequestMethod.POST)
	public ModelAndView rsvChk(HttpServletRequest req, HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		String paymentCode =req.getParameter("payment_code");
		String guestFirstName = req.getParameter("guestFirstName");
		String guestLastName = req.getParameter("guestLastName");
		//List<RsvPayMentVO> RsvPayMentVOList =new ArrayList<RsvPayMentVO>();
		System.out.println(paymentCode);
		String guestName= guestFirstName+guestLastName;
		System.out.println(guestName);
		RsvDAOImp dao = sqlSession.getMapper(RsvDAOImp.class);
		List<RsvSelectVO> RsvSelectVO = new ArrayList<RsvSelectVO>();
		//룸코드 가져옴
		Integer[] RsvPayMentVOList = dao.payMentSelect(paymentCode,guestName);
		
		
		if(RsvPayMentVOList.length==0) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('입력하신정보를 다시확인해주세요.'); history.go(-1);</script>");
            out.flush();
         
            return null;
			
		}
		
		if(RsvPayMentVOList.length!=0) {
		RsvSelectVO =dao.RsvSelect(RsvPayMentVOList, guestName);
		//System.out.println(RsvSelectVO.get(0).getGuest_name());
		//System.out.println(RsvPayMentVOList.get(0).getRoom_rsv_code());
		if(RsvSelectVO.size()!= 0) {
		mav.addObject("lst",RsvSelectVO);
		
		mav.setViewName("/rsv/rsv_list");
		}
		
		if(RsvSelectVO.size()== 0) {
			 response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('입력하신정보를 다시확인해주세요.'); history.go(-1);</script>");
	            out.flush();
	         
	            return null;
			
		}
		
		}
		
		return mav;
	}
	
	@RequestMapping(value="/chkNumber")
	public ModelAndView chkNumber(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String uid  =req.getParameter("uid");
		System.out.println(uid);
		mav.addObject("uid",uid);
		mav.setViewName("rsv/rsv_GuestCheckNumber");
		return mav;
	};

}
