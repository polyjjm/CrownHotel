package kr.co.crown.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.crown.board.PagingVO;

@Controller
public class AdminRsvController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	
	@RequestMapping(value = "/adminRsvList")
	public String adminRsvList () {

		return "admin/adminRsv";
	}
	
	
	@RequestMapping(value ="/allUserRsvList")
	public ModelAndView allUserRsvList(AdminRsvVO pvo,HttpServletRequest req) {
		ModelAndView mav =new ModelAndView();
		AdminRsvDAOImp dao = sqlSession.getMapper(AdminRsvDAOImp.class);
		Integer pageNumStr = pvo.getPageNum();
		
		
		if(pageNumStr != null) {
			pvo.setPageNum(pageNumStr);
			
		}
		
		pvo.setTotalRecord(dao.getTotalPage(pvo));
		
		
		
		
		List<AdminRsvVO> Rsv = new ArrayList<AdminRsvVO>();
		Rsv=dao.adminRsv(pvo);

		mav.addObject("lst",Rsv);
		mav.addObject("pvo",pvo);
		mav.setViewName("admin/adminRsv");
		return mav;
	}
	
	@RequestMapping(value="/adminRsvInfo")
	public ModelAndView adminRsvInfo(HttpServletRequest req) {
		ModelAndView mav =new ModelAndView();
		AdminRsvDAOImp dao = sqlSession.getMapper(AdminRsvDAOImp.class);
		System.out.println(req.getParameter("paymentCode"));
		String paymentCode = req.getParameter("paymentCode");
		Integer[]  rsv_code= dao.adminRsvCodeSelect(paymentCode);
		List<AdminRsvDetailVO> detail = dao.adminRsvInfo(rsv_code);
		
		mav.addObject("lst",detail);
		mav.setViewName("admin/adminRsvDetail");
		return mav;
	}
	
}
