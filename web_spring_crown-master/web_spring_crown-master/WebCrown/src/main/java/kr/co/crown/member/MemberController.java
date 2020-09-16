package kr.co.crown.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Random;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class MemberController {
	 

	@Inject
	JavaMailSender mailSender;
	SqlSession SqlSession;
	
	public SqlSession getSqlSession() {
		return SqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		SqlSession = sqlSession;
	}
	
	//����� ���̰� �ϴ°�(���� �ƴҋ��� get����̴�.)
	@RequestMapping("/loginMain")
	public String loginMain() {
		
		return "member/loginMain";
	}
	
	@RequestMapping("/loginSignUp")
	public String signUp() {
		
		return "member/loginSignUp";//(����������)����� ����.
	}
	@RequestMapping("/loginForm")
	public String loginForm() {
		
		return "member/loginForm";
	}
	//���̵� �ߺ�üũ
	@RequestMapping(value="/idCheck", method = RequestMethod.GET)
	public ModelAndView idCheck(String user_id) {
		ModelAndView mav = new ModelAndView();
		
		//db���̵� üũ
		MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
		int idresult = dao.IdCheck(user_id);
		mav.addObject("idresult", idresult);
		mav.addObject("user_id", user_id);
		mav.setViewName("member/idCheck");

		return mav;
	}
	//�̸��� �ߺ�üũ
		@RequestMapping(value="/emailCheck", method = RequestMethod.GET)
		public ModelAndView emailCheck(String user_email) {
			ModelAndView mav = new ModelAndView();
			
			//db�̸��� üũ
			MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
			int emailresult = dao.emailCheck(user_email);
			mav.addObject("emailresult", emailresult);
			mav.addObject("user_email", user_email);
			mav.setViewName("member/emailCheck");

			return mav;
		}
	//���̵� ��� ã��
	@RequestMapping("/findId")
	public String findId() {
		return "member/findId";
	}
	//��� ã��
	@RequestMapping("/findPwd")
	public String findPwd() {
		return "member/findPwd";
	}
	//�̸���
	@RequestMapping("/email")
	public String emailOk() {
		return "member/email";
	}
	
	
	
	//ȸ������ (modelandview�� �����͸� �״�� ��������(�����ҋ���,����Ʈ�� �״�� ȭ�� �ѷ��ٶ�)
		@RequestMapping(value="/loginSignUpOk", method = RequestMethod.POST)//value�� ���� �ִ� action ���̶� ���ƾ� �Ѵ�.
		public ModelAndView signUp(MemberVO vo,PointVO vo1) {
			ModelAndView mav = new ModelAndView();
			
			//int a  = vo.getPoint_code();
			//System.out.println("����Ʈ = "+a);
			
			
			MemberDAOInterface dao= SqlSession.getMapper(MemberDAOInterface.class);
			
			
			int cnt= dao.memberInsert(vo);
			if(cnt>0) {//ȸ������ ����
				mav.setViewName("redirect:loginForm");
			}else {
				mav.setViewName("redirect:loginSignUp");
			}
			int cnt1= dao.pointInsert(vo1);
			if(cnt1>0) {//����Ʈ
				mav.setViewName("redirect:loginForm");
			}else {
				mav.setViewName("redirect:loginSignUp");
			}
			
			
			return mav;//(����������)����� ����.
		}
	//���̵��ߺ� üũ(�ߺ��ϋ� �ȿ� ��)
		@RequestMapping(value="/idCheckOk", method = RequestMethod.POST)
		public ModelAndView idCheckOk(String user_id) {
			ModelAndView mav = new ModelAndView();
			
			//db���̵� üũ
			MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
			int idresult = dao.IdCheck(user_id);
			mav.addObject("idresult", idresult);
			mav.addObject("user_id", user_id);
			mav.setViewName("member/idCheck");

			return mav;
		}
	
		//�α���
		@RequestMapping(value="/loginOk", method=RequestMethod.POST)
		public ModelAndView login(MemberVO vo ,MemberLoginVO vo3,HttpServletRequest req) {
			ModelAndView mav = new ModelAndView();
			//interface�� ���۶� ��ü�� �����.
			MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
			MemberVO vo2 = dao.memberlogin(vo);//memberlogin interface�� �ִ� ��
			int cnt  = dao.memberLogin(vo3);//insert �ҋ��� ���� Ÿ���� int,String ���� �޾Ƽ� ��Ʈ�ѷ��� int�� ����� �Ѵ�.
			
			
			if(vo2 ==null) {//�α��� ����
				mav.setViewName("redirect:loginForm");
			}else {
				HttpSession ses = req.getSession();
				
				if(vo2.getUser_id().equals("admin")) {
					
					ses.setAttribute("user_id", vo2.getUser_id());
					ses.setAttribute("user_name", vo2.getUser_name());
					ses.setAttribute("logStatus", vo2.getLogStatus());

					mav.setViewName("redirect:/adminMain");
					return mav;
				}
				//				 ������    ��
				ses.setAttribute("user_id", vo2.getUser_id());
				ses.setAttribute("user_name", vo2.getUser_name());
				ses.setAttribute("logStatus", vo2.getLogStatus());

				mav.setViewName("redirect:/");
			}
			
			return mav;
		}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/";
	}
	//���̵� ã��
	@RequestMapping(value="/idFindOk", method=RequestMethod.POST)
	public ModelAndView idFindOk(HttpServletRequest req, MemberVO vo){
		ModelAndView mav = new ModelAndView();
		MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);

		mav.addObject("vo", dao.idFind(vo));//interface�� �ִ°Ŷ� �Ű� ������ Ÿ���� ���ƾ� �Ѵ�.
		mav.setViewName("member/idSearch");
				
				
		return mav; 
	}
	
	//��й�ȣ ã��
	@RequestMapping(value="/pwdFindOk", method=RequestMethod.POST)
	public ModelAndView pwdFindOk(HttpServletRequest req, MemberVO vo){
		ModelAndView mav = new ModelAndView();
		MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
		//			  key      value
		mav.addObject("vo", dao.pwdFind(vo));//interface�� �ִ°Ŷ� �Ű� ������ Ÿ���� ���ƾ� �Ѵ�.
		mav.setViewName("member/pwdSearch");
				
				
		return mav; 
	}
	
	//�̸���
	@RequestMapping("/sendEmail")
	@ResponseBody
	public String sendEmail(HttpServletRequest req) {
		String ok = "";
		String sesId = req.getSession().getId();
		String subject = "CrownHotel 이메일 인증번호 입니다.";//���� ����
		String body = "CrownHotel 이메일 인증번호 입니다. \n"+sesId;//���� ����
		String emailCode = req.getParameter("user_email");
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("dlalsgh24207@naver.com");
			messageHelper.setTo(emailCode);
			messageHelper.setSubject(subject);
			messageHelper.setText(body);
			mailSender.send(message);
			ok = "ok";
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return ok;
	}
	//�̸��� �����ڵ�
		@RequestMapping("/sendCodeEmail")
		@ResponseBody
		public String sendCodeEmail(HttpServletRequest req) {
			String yes = "";
			String sesId = req.getSession().getId();
			String emailCode = req.getParameter("user_code_email");
			System.out.println(emailCode);
			if(sesId.equals(emailCode)) {
				System.out.println("�����Ϸ�");
				yes = "yes";
						
			}
			return yes;
		}

}
