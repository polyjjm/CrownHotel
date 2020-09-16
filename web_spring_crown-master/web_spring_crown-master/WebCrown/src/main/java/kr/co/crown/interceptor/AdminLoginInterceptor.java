package kr.co.crown.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
public class AdminLoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse response, Object handler)
			throws Exception {
		
		//로그인을 했다. - > 관리자 페이지 입력해서 들어오면 -> 유저면 loginForm
		
		HttpSession ses = req.getSession();
		String user_id = (String)ses.getAttribute("user_id");
		if(user_id ==null || user_id.equals("")) {//로그인을 안했을 경우,  
			response.sendRedirect(req.getContextPath()+"/loginForm");//유저인경우  /crown/loginForm
			return false;
		}else {//로그인 한경우
			if(!user_id.equals("admin")) {
				response.sendRedirect(req.getContextPath()+"/");//유저인경우  /crown/home
				return false;
			}
		}
		return true;
	}
	
}
