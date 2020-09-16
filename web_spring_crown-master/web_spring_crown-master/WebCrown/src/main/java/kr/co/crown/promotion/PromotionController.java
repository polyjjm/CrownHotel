package kr.co.crown.promotion;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.crown.admin.AdminEventDAOImp;
import kr.co.crown.admin.AdminEventPaginVO;
import kr.co.crown.admin.AdminPackDAOImp;
import kr.co.crown.admin.AdminPackPaginVO;
import kr.co.crown.admin.AdminPackVO;

@Controller
public class PromotionController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping(value="/hotelPackage", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView proMain(AdminPackPaginVO appvo, HttpServletRequest req) {
		AdminPackDAOImp apdao = sqlSession.getMapper(AdminPackDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		String pageNumStr = req.getParameter("pageNum");
		
		if(pageNumStr != null) {
			appvo.setPageNum(Integer.parseInt(pageNumStr));
		}else {
			appvo.setPageNum(1);
		}
		
		mav.addObject("plist", apdao.allSelectPack(appvo));
		mav.addObject("appvo", appvo);
		mav.setViewName("promotion/hotelPackage");
		return mav;
	}
	
	@RequestMapping("/packageView")
	public ModelAndView proView(HttpServletRequest req) {
		AdminPackDAOImp apdao = sqlSession.getMapper(AdminPackDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		int pack_code = Integer.parseInt(req.getParameter("pack_code"));
		
		
		//현재 날짜 구해서 보내기
		Calendar cal = Calendar.getInstance();
		System.out.println("오늘 날짜 = "+cal);
		
		String year =Integer.toString(cal.get(Calendar.YEAR));
		String mon =Integer.toString (cal.get(Calendar.MONTH)+1);
		String day =Integer.toString(cal.get(Calendar.DAY_OF_MONTH));//오늘 날짜
		
		int d = cal.get(Calendar.DAY_OF_WEEK);//요일
		
	    if(mon.length()<2) {
	    	mon = "0"+mon;
	    }
	    if(day.length()<2) {
	    	day = "0"+day;
	    }
		
	    String today = year+mon+day;
	    System.out.println("today= "+today);
	    String tomon = today.substring(4,6);
    	String todate = today.substring(6,8);
    	mav.addObject("tomon", tomon);
    	mav.addObject("todate",todate);
	    try {
	    	String nextDay = nextDate(today);
	    	String nextmon = nextDay.substring(4,6);
	    	String nextday = nextDay.substring(6,8);
	    	System.out.println("nextmon = "+nextmon);
	    	System.out.println("nextday = "+nextday);
	    	//20200702
	    	mav.addObject("nextDay",nextDay);
	    	mav.addObject("nextmon", nextmon);
	    	mav.addObject("nextday",nextday);
	    	
		} catch (ParseException e) {
				
			e.printStackTrace();
		}
	    
	    
		String toDayOfWeek = "";
		switch (d) {
			case 1:
				toDayOfWeek = "일";
				break;
	
			case 2:
				toDayOfWeek = "월";
				break;
			case 3:
				toDayOfWeek = "화";
				break;
			case 4:
				toDayOfWeek = "수";
				break;
			case 5:
				toDayOfWeek = "목";
				break;
			case 6:
				toDayOfWeek = "금";
				break;
			case 7:
				toDayOfWeek = "토";
				break;
		  }
		String nextDayOfWeek = "";
		switch (d+1) {
			case 1:
				nextDayOfWeek = "일";
				break;
	
			case 2:
				nextDayOfWeek = "월";
				break;
			case 3:
				nextDayOfWeek = "화";
				break;
			case 4:
				nextDayOfWeek = "수";
				break;
			case 5:
				nextDayOfWeek = "목";
				break;
			case 6:
				nextDayOfWeek = "금";
				break;
			case 7:
				nextDayOfWeek = "토";
				break;
		  }

		mav.addObject("today",today);
		
		mav.addObject("toDayOfWeek",toDayOfWeek);
		mav.addObject("nextDayOfWeek",nextDayOfWeek);
		
		
		
		
		mav.addObject("pack_roomType", apdao.selectRoomTypeName(pack_code));
		mav.addObject("apvo", apdao.selectPackage(pack_code));
		mav.setViewName("promotion/packageView");
		return mav;
	}
	
	@RequestMapping(value="/hotelEvent", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventMain(AdminEventPaginVO aepvo, HttpServletRequest req) {
		AdminEventDAOImp aedao = sqlSession.getMapper(AdminEventDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		String pageNumStr = req.getParameter("pageNum");
		
		if(pageNumStr != null) {
			aepvo.setPageNum(Integer.parseInt(pageNumStr));
		}else {
			aepvo.setPageNum(1);
		}
		
		aepvo.setTotalRecord(aedao.getTotalEvent(aepvo));
		
		mav.addObject("elist", aedao.allSelectEvent(aepvo));
		mav.addObject("aepvo", aepvo);
		mav.setViewName("promotion/hotelEvent");
		return mav;
	}	
	
	@RequestMapping("/eventView")
	public ModelAndView eventView(HttpServletRequest req) {
		AdminEventDAOImp aedao = sqlSession.getMapper(AdminEventDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		int event_code = Integer.parseInt(req.getParameter("event_code"));
		
		mav.addObject("aevo", aedao.selectEvent(event_code));
		mav.setViewName("promotion/eventView");
		return mav;
	}
	
	private String nextDate(String date) throws ParseException {
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		  Calendar c = Calendar.getInstance();
		  Date d = sdf.parse(date);
		  
		  c.setTime(d);
		  c.add(Calendar.DATE,1);
		  String changeDate = sdf.format(c.getTime());
		  return changeDate;
	}
	
}
