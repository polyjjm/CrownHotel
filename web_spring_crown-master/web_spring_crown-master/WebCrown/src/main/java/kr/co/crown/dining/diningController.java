package kr.co.crown.dining;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class diningController {
	SqlSession SqlSession;

	public SqlSession getSqlSession() {
		return SqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		SqlSession = sqlSession;
	}
	
	@RequestMapping("/diningMain")
	public String diningMain() {
		
		return "dining/diningMain";
	}
}
