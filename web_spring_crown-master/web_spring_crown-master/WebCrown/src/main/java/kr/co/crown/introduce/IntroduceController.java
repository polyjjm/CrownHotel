package kr.co.crown.introduce;

import java.util.HashMap;
import java.util.Map;

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
public class IntroduceController {
	SqlSession SqlSession;
	
	public SqlSession getSqlSession() {
		return SqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		SqlSession = sqlSession;
	}
	
	
	
	
	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String introduceMain() {
		
		return "introduce/introduce";
	}
	
	@RequestMapping(value = "/introduceTour", method = RequestMethod.GET)
	public String introduceTour() {
		
		return "introduce/introduceTour";
	}
	
	@RequestMapping(value = "/introduceTourCulture", method = RequestMethod.GET)
	public String introduceTourCulture() {
		
		return "introduce/introduceTourCulture";
	}
	@RequestMapping(value = "/introduceLocation", method = RequestMethod.GET)
	public String introduceLocation() {
		
		return "introduce/introduceLocation";
	}
	@RequestMapping(value = "/introduceNews", method = RequestMethod.GET)
	public String introduceNews() {
		return "introduce/introduceNews";
	}
	@RequestMapping(value = "/introduceNewsView", method = RequestMethod.GET)
	public String introduceNewsView() {
		
		return "introduce/introduceNewsView";
	}
	
}
