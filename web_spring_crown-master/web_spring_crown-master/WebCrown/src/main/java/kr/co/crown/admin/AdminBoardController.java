package kr.co.crown.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class AdminBoardController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//사용자 공지사항 리스트
	@RequestMapping("/boardList")
	public ModelAndView boardList(PagingVO pvo ,HttpServletRequest req, BoardVO vo){
		//map에 저장하기 위해 list를 만들어서 검색옵션과 키워드를 저장한다.
		MemberVO vo1 = new MemberVO();
		//Map<String,Object> map = new HashMap<>();
 		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		ModelAndView mav = new ModelAndView();
		String pageNum = req.getParameter("pageNum");
		System.out.println("페이지"+pvo.getPageNum());
		
		if(pageNum != null) {
			pvo.setPageNum(Integer.parseInt(pageNum));
		}else {
			pvo.setPageNum(1);
		}
		HttpSession ses = req.getSession();
		ses.setAttribute("user_id", vo1.getUser_id());
		
		pvo.setTotalRecord(dao.getTotalRecord(pvo));	
		pvo.setSearchKey(req.getParameter("searchKey"));
		pvo.setSearchWord(req.getParameter("searchWord"));
		
		System.out.println("searchKey : "+ pvo.getSearchKey());
		System.out.println("searchWord : "+ pvo.getSearchWord());
		
		mav.addObject("pvo", pvo);
		mav.addObject("lst", dao.allSelectRecord(pvo));
		mav.setViewName("board/list");
		return mav;
		
	}
	@RequestMapping("/boardWrite")
	public String boardWrite() {
		return "admin/adminBoardWrite";
	}
	@RequestMapping(value="/boardWriteOk", method=RequestMethod.POST)
	public ModelAndView boardWriteOK(BoardVO vo, HttpServletRequest req) {
	
		vo.setIp(req.getRemoteAddr());
		System.out.println(vo.getContent());
		System.out.println(vo.getNo());
		System.out.println(vo.getSubject());
		
		System.out.println(vo.getIp());
		System.out.println(vo.getWritedate());
		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		
		int cnt = dao.boardInsert(vo);
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:/admin/boardList");
		}else {
			mav.setViewName("redirect:boardWrite");
		}
		return mav;
	}
	//사용자 공지사랑 내용 페이지
	@RequestMapping("/boardView")
	public ModelAndView boardView(int no,HttpServletRequest req, HttpServletResponse res) {
		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		ModelAndView mav = new ModelAndView();
		PagingVO pVo = new PagingVO();
		
		pVo.setSearchKey(req.getParameter("searchKey"));
		pVo.setSearchWord(req.getParameter("searchWord"));
		mav.addObject("vo",dao.selectRecord(no));
		mav.setViewName("board/boardView");
		
		req.setAttribute("pVo", pVo);
		
		return mav;
	}
	@RequestMapping("/boardEdit")
	public ModelAndView boardEdit(int no, HttpServletRequest req,HttpServletResponse res) {
		System.out.println("게시판 수정 시작 컨트롤러");
		System.out.println(no);
		
		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("vo",dao.selectRecord(no));
		mav.setViewName("admin/adminBoardEdit");
		return mav;
	}
	@RequestMapping(value="/boardEditOk", method=RequestMethod.POST)
	public ModelAndView boardEditOk(BoardVO vo,HttpServletRequest req,HttpServletResponse res) {
		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		int cnt = dao.updateRecord(vo.getNo(), vo.getSubject(), vo.getContent());
		ModelAndView mav = new ModelAndView();
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("no", vo.getNo());
		mav.addObject("no",vo.getNo());
		if(cnt>0) {
			mav.setViewName("redirect:/admin/boardView");
		}else {
			mav.setViewName("redirect:adminBoardEdit");
		}
		return mav;
	}
	@RequestMapping("/boardDel")
	public ModelAndView boardDel(int no) {
		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		int cnt = dao.deleteRecord(no);
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:/admin/boardList");
		}else {
			mav.addObject("no",no);
			mav.setViewName("redirect:adminBoardNews");
		}
		return mav;
	}
	//관리지 공지사항 리스트
	@RequestMapping("/admin/boardList")
	public ModelAndView admainBoardList(PagingVO pvo ,HttpServletRequest req, BoardVO vo){
		
 		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		ModelAndView mav = new ModelAndView();
		String pageNum = req.getParameter("pageNum");
	
		if(pageNum != null) {
			pvo.setPageNum(Integer.parseInt(pageNum));
		}else {
			pvo.setPageNum(1);
		}
		
		pvo.setTotalRecord(dao.getTotalRecord(pvo));	
		pvo.setSearchKey(req.getParameter("searchKey"));
		pvo.setSearchWord(req.getParameter("searchWord"));
		System.out.println("전체레코드 수="+dao.getTotalRecord(pvo));
		
	
		mav.addObject("pvo", pvo); 
		mav.addObject("lst", dao.allSelectRecord(pvo));
		mav.setViewName("admin/adminBoardView");
		return mav;
		
	}
	
	//관리자 공지사항 내용 페이지
	@RequestMapping("/admin/boardView")
	public ModelAndView adminBoardView(int no) {
		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",dao.selectRecord(no));
		mav.setViewName("admin/adminBoardNews");
		return mav;
	}
}
