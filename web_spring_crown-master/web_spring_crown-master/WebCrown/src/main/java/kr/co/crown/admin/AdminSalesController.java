package kr.co.crown.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminSalesController {
SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	
	@RequestMapping(value="/adminsales")
	public ModelAndView AdminSales() {
		ModelAndView mav =new ModelAndView();
		AdminRsvDAOImp dao = sqlSession.getMapper(AdminRsvDAOImp.class);
		AdminSalesVO vo = new AdminSalesVO();
		vo = dao.adminSales();
		System.out.println(vo.getJanuary());
	
			

		mav.addObject("vo1",vo);
		mav.setViewName("admin/adminSalesView");
		return mav;
	}
}
