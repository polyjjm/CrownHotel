package kr.co.crown;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.crown.admin.AdminPackDAOImp;
import kr.co.crown.admin.AdminPackPaginVO;
import kr.co.crown.admin.AdminRoomTypeDAOImp;
import kr.co.crown.admin.AdminRoomTypeVO;

@Controller
public class HomeController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest req) {
		AdminPackDAOImp apdao = sqlSession.getMapper(AdminPackDAOImp.class);
		ModelAndView mav = new ModelAndView();

		String pageNumStr = req.getParameter("pageNum");
		AdminPackPaginVO appvo = new AdminPackPaginVO();

		
		if(pageNumStr != null) { appvo.setPageNum(Integer.parseInt(pageNumStr)); }
		  
		appvo.setSearchKey(req.getParameter("searchKey"));
		appvo.setSearchWord(req.getParameter("searchWord"));
		  
		appvo.setTotalRecord(apdao.getTotalPack(appvo));
		 
		mav.addObject("plist", apdao.allSelectPack(appvo));
		mav.addObject("appvo", appvo);
		  
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
		 
		mav.setViewName("home");

		return mav;
	}

	@RequestMapping(value = "/ajaxSelectRoomType", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminRoomTypeVO> ajaxSelectRoomType() {
		System.out.println("ajaxSelectRoomType 컨트롤러 시작 ");
		AdminRoomTypeDAOImp dao = sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		List<AdminRoomTypeVO> list = dao.allSelectRoomTypeRecordAjax();
		for (int i = 0; i < list.size(); i++) {
			System.out.println("컨트롤러 리스트  room_type : " + list.get(i).getRoom_type());
		}

		return list;
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
