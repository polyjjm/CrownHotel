package kr.co.crown.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PasswordChkInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession ses = req.getSession();
		String pwdStatus = (String)ses.getAttribute("pwdStatus");
		
		if(!pwdStatus.equals("Y")) {
			response.sendRedirect(req.getContextPath()+"/adminMain");//  /bitcamp/loginFrm
			return false;
		}
		return true;
	}
	
}
