package kr.co.crown.admin;

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
import kr.co.crown.member.MemberDAOInterface;
import kr.co.crown.member.MemberVO;
import kr.co.crown.member.PointVO;

@Controller
public class AdminMemberController {
	SqlSession SqlSession;
	
	public SqlSession getSqlSession() {
		return SqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		SqlSession = sqlSession;
	}
	//����Ʈ ��븮��Ʈ
	@RequestMapping("/adminPointList")
	public ModelAndView adminPointList(PagingVO pvo,HttpServletRequest req, @RequestParam("user_id") String user_id) {
		//map�� �����ϱ� ���� list�� ���� �˻��ɼǰ� Ű���带 �����Ѵ�.
		MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
		ModelAndView mav = new ModelAndView();
		String pageNum = req.getParameter("pageNum");
		if(pageNum != null) {
			pvo.setPageNum(Integer.parseInt(pageNum));
		}else {
			pvo.setPageNum(1);
		}
		pvo.setUser_id(user_id);
		pvo.setTotalRecord(dao.adminPointRecordTotal(pvo));
		pvo.setSearchKey(req.getParameter("searchKey"));
		pvo.setSearchWord(req.getParameter("searchWord"));
		
		mav.addObject("list2", dao.adminPointList(pvo));
		mav.addObject("pvo", pvo);
		mav.setViewName("admin/adminPointList");
			
		return mav;//(����������)����� ����.
	}
	
	//ȸ�� ����Ʈ
	@RequestMapping("/adminMember")
	public ModelAndView adminMember(PagingVO pvo,HttpServletRequest req,MemberVO vo) {
		//map�� �����ϱ� ���� list�� ���� �˻��ɼǰ� Ű���带 �����Ѵ�.
		MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
		ModelAndView mav = new ModelAndView();
		String pageNum = req.getParameter("pageNum");
		if(pageNum != null) {
			pvo.setPageNum(Integer.parseInt(pageNum));
		}else {
			pvo.setPageNum(1);
		}

		pvo.setTotalRecord(dao.adminMemberTotal(pvo));
		pvo.setSearchKey(req.getParameter("searchKey"));
		pvo.setSearchWord(req.getParameter("searchWord"));
		
		mav.addObject("pvo", pvo);
		mav.addObject("list" ,dao.adminMemberPaging(pvo));
		mav.setViewName("admin/adminMember");
			
		return mav;//(����������)����� ����.
	}
	//ȸ�� ���� ��
	@RequestMapping(value="/adminMemberView" , method=RequestMethod.GET)
	public ModelAndView adminMemberView(int member_code,HttpServletRequest req, HttpServletResponse res) {
		MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
		ModelAndView mav = new ModelAndView();
		PagingVO pvo = new PagingVO();
		
		pvo.setSearchKey(req.getParameter("searchKey"));
		pvo.setSearchWord(req.getParameter("searchWord"));
		mav.addObject("vo",dao.adminMemberView(member_code));
		
		mav.setViewName("admin/adminMemberView");
		
		req.setAttribute("pVo", pvo);
		
		return mav;
	}
	//ȸ������ ����
	@RequestMapping("/adminMemberEdit")
	public ModelAndView adminMemberEdit(int member_code, HttpServletRequest req,HttpServletResponse res) {
		
		
		MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("vo",dao.adminMemberView(member_code));
		mav.setViewName("admin/adminMemberEdit");
		return mav;
	}
	@RequestMapping(value="/adminMemberEditOk", method=RequestMethod.POST)
	public ModelAndView boardEditOk(MemberVO vo,HttpServletRequest req,HttpServletResponse res) {
		MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
		int cnt = dao.adminMemberUpdate(vo.getMember_code(), vo.getUser_name(),vo.getCountry(),
										vo.getUser_tel(),vo.getUser_email(),vo.getBirthday(),
										vo.getUser_id(),vo.getUser_pwd());
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.getMember_code());
		System.out.println(vo.getUser_tel());
		req.setAttribute("cnt", cnt);
		req.setAttribute("member_code", vo.getMember_code());
		mav.addObject("member_code",vo.getMember_code());
		if(cnt>0) {
			mav.setViewName("redirect:adminMemberView");
		}else {
			mav.setViewName("redirect:adminMemberEdit");
		}
		return mav;
		
	}
	//ȸ������
	@RequestMapping("/adminMemberDelete")
	public ModelAndView boardDel(int member_code) {
		MemberDAOInterface dao = SqlSession.getMapper(MemberDAOInterface.class);
		int cnt = dao.adminMemberDelete(member_code);
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:adminMember");
		}else {
			mav.addObject("member_code",member_code);
			mav.setViewName("redirect:adminMemberEdit");
		}
		return mav;
	}
}

