package kr.co.crown.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	//��Ʈ�ѷ��� ȣ��Ǳ� ���� ȣ��ȴ�.
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse response, Object handler)
			throws Exception {
		//�α��� ���θ� Ȯ���Ͽ� �α��� ������ ��� ����, �α��� �������� �����ߴ�
		HttpSession ses = req.getSession();
		String user_id = (String)ses.getAttribute("user_id");
		
		//�α����� �ȵǾ��� ��� �α��� â���� ������
		
		if(user_id ==null || user_id.equals("") ) {//로그인을 안했을 경우 
			
			
			response.sendRedirect(req.getContextPath()+"/loginForm");//  /crown/loginForm
			return false;
		}
		//로그인 했을 경우  1.관리자 2.유저
		
		return true;
	}

	//��Ʈ�ѷ� ���� �� views�������� �̵��ϱ� ���� ȣ��ȴ�.
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}

	//��Ʈ�ѷ��� ���� �� ȣ��ȴ�.
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
	}
}
