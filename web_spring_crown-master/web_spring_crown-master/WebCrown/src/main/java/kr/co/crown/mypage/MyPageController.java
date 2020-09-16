package kr.co.crown.mypage;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.crown.board.BoardDAOImp;
import kr.co.crown.board.BoardVO;
import kr.co.crown.board.PagingVO;
import kr.co.crown.member.MemberVO;


@Controller
public class MyPageController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원정보 가져오기
		@RequestMapping("/myPage")
		public ModelAndView mypageOk(MemberVO vo , HttpServletRequest req) {
			ModelAndView mav = new ModelAndView();
			//interface랑 매피랑 객체를 만든다.
			MypageDAOImp dao = sqlSession.getMapper(MypageDAOImp.class);
			HttpSession ses = req.getSession();
			String userId = (String)ses.getAttribute("user_id");
			vo.setUser_id(userId);
			
			if(userId!=null) {
				
				MemberVO vo2 = dao.memberSelect(vo);
				
				int result1 = dao.totalDate(userId);
				int result2 = dao.totalRsv(userId);
				int result3 = dao.totalPment(userId);
				
				if(vo2 == null) {//마이페이지 실패
					mav.setViewName("member/loginForm");
				}else {
					mav.addObject("vo", vo2);
					
					mav.addObject("result1", result1);
					mav.addObject("result2", result2);
					mav.addObject("result3", result3);
					mav.setViewName("mypage/myPage");
					 
				}
			
			}else {
				mav.setViewName("redirect:/");
			}
			
			return mav;
		}
	
	//비번 확인
	@RequestMapping("/infoPwd")
	public ModelAndView infoPwd(MemberVO vo ,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		//interface랑 매피랑 객체를 만든다.
		MypageDAOImp dao = sqlSession.getMapper(MypageDAOImp.class);
		HttpSession ses = req.getSession();
		String userId = (String)ses.getAttribute("user_id");
		vo.setUser_id(userId);
		
		if(userId!=null) {
		
		MemberVO vo2 = dao.memberSelect(vo);//memberlogin interface에 있는 값
		if(vo2 ==null) {//마이페이지 실패
			mav.setViewName("/");
		}else {
			mav.addObject("vo", vo2);
			//��ũ��
			mav.setViewName("mypage/infoPwd");
		}
		
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	//회원 수정
	@RequestMapping("/memEdit")//컨트롤러 이름
	public ModelAndView memEdit(MemberVO vo ,HttpServletRequest req) {//맴버 vo와 req를 받음
		ModelAndView mav = new ModelAndView();//mav 선언
		//interface랑 매피랑 객체를 만든다.
		MypageDAOImp dao = sqlSession.getMapper(MypageDAOImp.class);//dao 선언
		HttpSession ses = req.getSession();//섹션 선언
		String userId = (String)ses.getAttribute("user_id");//섹션의 userid를 변수에 저장
		vo.setUser_id(userId);//vo에 userid를 저장
		
		if(userId!=null) {
		
		MemberVO vo2 = dao.memberSelect(vo);//vo2에 dao값을 저장

		
		if(vo2 ==null) {//마이페이지 실패
			mav.setViewName("mypage/infoPwd"); //실패시 infoPwd로 이동
		}else {
		
			mav.addObject("vo", vo2);//vo2의 값을 vo에 담음
			
			mav.setViewName("mypage/memEdit");//memEdit로 이동
		}
		
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	
	
	@RequestMapping("/changePwd")
	public String changePwd() {
		return "mypage/changePwd";
	}
	
	@RequestMapping("/withDrawal")
	public ModelAndView withDrawal(MemberVO vo ,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		//interface랑 매피랑 객체를 만든다.
		MypageDAOImp dao = sqlSession.getMapper(MypageDAOImp.class);
		HttpSession ses = req.getSession();
		String userId = (String)ses.getAttribute("user_id");
		vo.setUser_id(userId);
		
		if(userId!=null) {
		
		MemberVO vo2 = dao.memberSelect(vo);//memberlogin interface에 있는 값
		
		if(vo2 ==null) {//마이페이지 실패
			mav.setViewName("mypage/myPage");
		}else {
			mav.addObject("vo", vo2);
			
			mav.setViewName("mypage/withDrawal");
		}
		
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/inquiry")
	public ModelAndView inquiry(MemberVO vo ,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		MypageDAOImp dao = sqlSession.getMapper(MypageDAOImp.class);
		HttpSession ses = req.getSession();
		String userId = (String)ses.getAttribute("user_id");
		vo.setUser_id(userId);
		
		if(userId!=null) {
		
		MemberVO vo2 = dao.memberSelect(vo);//memberlogin interface에 있는 값

		
		if(vo2 == null) {//문의 페이지 실패
			mav.setViewName("member/mypage");
		}else {
			mav.addObject("vo", vo2);
			
			
			mav.setViewName("mypage/inquiry");
			 
		}
		
		}else{
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	//마이페이지 예악 조회
	@RequestMapping("/rsAllSearchOk")
		public ModelAndView reservation(PagingVO pvo ,HttpServletRequest req, ReservationVO vo){
			
	 		MypageDAOImp dao = sqlSession.getMapper(MypageDAOImp.class);
			ModelAndView mav = new ModelAndView();
			String pageNum = req.getParameter("pageNum");
			
			HttpSession ses = req.getSession();
			String user_id=	(String)ses.getAttribute("user_id");
			pvo.setUser_id(user_id);

			if(pageNum != null) {
				pvo.setPageNum(Integer.parseInt(pageNum));
			}else {
				pvo.setPageNum(1);
			}

			pvo.setTotalRecord(dao.resTotalRecord(pvo));	
			mav.addObject("pvo", pvo); 
			mav.addObject("lst", dao.rsAllSearch(pvo));
			mav.setViewName("mypage/reservation");
			return mav;
		}
	
	//문의등록 확인
	@RequestMapping(value = "/inquiryOk", method = RequestMethod.POST)
	public ModelAndView inquiryInsert(InquiryVO vo, MemberVO vo2, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		MypageDAOImp dao2 = sqlSession.getMapper(MypageDAOImp.class);
		HttpSession ses = req.getSession();
		String userId = (String)ses.getAttribute("user_id");
		vo2.setUser_id(userId); 
		InquiryDAOImp dao = sqlSession.getMapper(InquiryDAOImp.class);
		
		if(userId!=null) {
		
		MemberVO vo3 = dao2.memberSelect(vo2);
		int cnt = dao.inquiryInsert(vo);
		
		int result1 = dao2.totalDate(userId);
		int result2 = dao2.totalRsv(userId);
		int result3 = dao2.totalPment(userId);
		
			if(cnt>0) {
				
				mav.addObject("vo", vo3);
				mav.addObject("result1", result1);
				mav.addObject("result2", result2);
				mav.addObject("result3", result3);
				mav.addObject("iq_result","success");
				mav.setViewName("mypage/myPage");
			}else {
				mav.addObject("iq_result","fail");
				mav.setViewName("redirect:inquiry");
				
			}
		
		}else{
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	
		
		//회원수정 완료
		@RequestMapping(value = "/memEditOk", method = RequestMethod.POST )//포스트로 파일 전송, 컨트롤러 이름
		public ModelAndView memEditOk(MemberVO vo,HttpServletRequest req) {//맴버 vo와 req사용
			
			HttpSession ses = req.getSession();//섹션 선언
			String userId = (String)ses.getAttribute("user_id");// 섹션 아아디를 변수에 저장
			vo.setUser_id(userId); //변수값을 vo에 저장
			MypageDAOImp dao= sqlSession.getMapper(MypageDAOImp.class);//dao 선언
			
			
			int cnt= dao.memberUpdate(vo);//dao 사용
			
			int result1 = dao.totalDate(userId);
			int result2 = dao.totalRsv(userId);
			int result3 = dao.totalPment(userId);

			ModelAndView mav = new ModelAndView(); //mav선언
			if(cnt>0) {//회원가입 성공
				  ses.removeAttribute("user_name");	//섹션에 이름 지우기
				  ses.setAttribute("user_name", vo.getUser_name()); //새로운 이름 섹션에 넣기
				  mav.addObject("vo", vo);
				  mav.addObject("result1", result1);
				  mav.addObject("result2", result2);
				  mav.addObject("result3", result3);
				  mav.addObject("me_result","success");
				  mav.setViewName("mypage/myPage");
				  
			}else {
				mav.addObject("me_result","fail");
				mav.setViewName("redirect:memEdit");
			}
			
			return mav;//(다음페이지)여기로 간다.
		}
		
		//회원비밀번호 수정완료
		@RequestMapping(value = "/changePwdOk", method = RequestMethod.POST )
		public ModelAndView changePwdOk(MemberVO vo,HttpServletRequest req) {
			
			//섹션에서 아이디 불러오기
			HttpSession ses = req.getSession();
			String userId = (String)ses.getAttribute("user_id");
			vo.setUser_id(userId);
			MypageDAOImp dao= sqlSession.getMapper(MypageDAOImp.class);
			
			String user_pwd2 = (String)req.getParameter("user_pwd2");
			
			int cnt= dao.pwdCheck(userId, user_pwd2);
			
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {//회원가입 성공
				dao.memberUpdate2(vo.getUser_pwd(), vo.getUser_id());
				mav.addObject("result", "success");
				req.getSession().invalidate();
				mav.setViewName("home");
			}else {
				mav.addObject("result", "fail");
				mav.setViewName("mypage/changePwd");
			}
			return mav;//(다음페이지)여기로 간다.
		}
		
		//회원 비밀번호 확인
		@RequestMapping(value = "/infoPwdOk", method = RequestMethod.POST )
		public ModelAndView infoPwdOk(MemberVO vo, HttpServletRequest req) {
			
			HttpSession ses = req.getSession();
			MypageDAOImp dao= sqlSession.getMapper(MypageDAOImp.class);
			String userId = (String)ses.getAttribute("user_id");
			vo.setUser_id(userId);

			String user_pwd = (String)req.getParameter("user_pwd");
			
			int cnt= dao.pwdCheck(userId, user_pwd);
			
			ModelAndView mav = new ModelAndView();
			
			if(cnt>0) {
				mav.setViewName("redirect:memEdit");
			}else {
				mav.addObject("result", "fail");
				mav.setViewName("mypage/infoPwd");
			}
			return mav;//(다음페이지)여기로 간다.
		}	
		
		//회원 탈퇴 확인
		@RequestMapping(value = "/withDrawalOk", method = RequestMethod.POST )
		public ModelAndView withDrawalOk(WithDrawalVO vo ,MemberVO vo2, HttpServletRequest req) {
			//섹션에서 아이디 불러오기
			MypageDAOImp dao= sqlSession.getMapper(MypageDAOImp.class);
			HttpSession ses = req.getSession();
			String userId = (String)ses.getAttribute("user_id");
			vo.setWd_user_id(userId);
			vo2.setUser_id(userId);
			MemberVO vo3 = dao.memberSelect(vo2);//memberlogin interface�� �ִ� ��
			
			String user_pwd2 = (String)req.getParameter("user_pwd2");
			
			int cnt= dao.pwdCheck(userId, user_pwd2);
			
			ModelAndView mav = new ModelAndView();
			if(cnt>0) {//회원가입 성공
				
				dao.withDrawal(vo);
				dao.memberDelete(userId);
				mav.addObject("wd_result","success");
				req.getSession().invalidate();
				mav.setViewName("home");
			}else {
				
				mav.addObject("vo", vo3);
				mav.addObject("result","fail");
				mav.setViewName("mypage/withDrawal");
			}
			return mav;//(다음페이지)여기로 간다
		}	
		
	
}
