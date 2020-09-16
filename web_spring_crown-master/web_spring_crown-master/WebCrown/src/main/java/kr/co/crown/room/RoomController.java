package kr.co.crown.room;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.crown.admin.AdminRoomTypeDAOImp;
import kr.co.crown.admin.AdminRoomTypePaginVO;
import kr.co.crown.admin.AdminRoomTypeVO;
@Controller
public class RoomController {

	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//���� ����
	@RequestMapping(value = "/roomMain", method = RequestMethod.GET)
	public ModelAndView roomMain(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		AdminRoomTypeDAOImp dao = sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		
		String rOption1 = req.getParameter("rOption1");
		String rOption2 = req.getParameter("rOption2");
		String rOption3 = req.getParameter("rOption3");
		
		System.out.println("컨트롤러 rOption1 :" +rOption1);
		System.out.println("컨트롤러 rOption2 :" +rOption2);
		System.out.println("컨트롤러 rOption3 :" +rOption3);
		//�˻�
		AdminRoomTypePaginVO pvo = new AdminRoomTypePaginVO();
		String [] rOptionsList;
		
		if(rOption1!=null || rOption2!=null || rOption3!=null) {
			rOptionsList = new String[3];
			if(rOption1!=null) {
				rOptionsList[0]=rOption1;
				System.out.println("if문  값 확인  rOptionsList[0] :"+rOptionsList[0]);
			}else {
				rOptionsList[0]="";
			}
			if(rOption2!=null) {
				rOptionsList[1]=rOption2;
				System.out.println("if문  값 확인  rOptionsList[1] :"+rOptionsList[1]);
			}else {
				rOptionsList[1]="";
			}
			if(rOption3!=null) {
				rOptionsList[2]=rOption3;
				System.out.println("if문  값 확인  rOptionsList[2] :"+rOptionsList[2]);
			}else {
				rOptionsList[2]="";
			}
			
			pvo.setrOptionsList(rOptionsList);
			if(pvo.getrOptionsList() !=null) {
				for(int i=0; i<rOptionsList.length; i++) {
					System.out.println("컨트로럴  배열 값 확인  "+pvo.getrOptionsList()[i]);
					
				}
			}
			
		}
		String rOrder = req.getParameter("rOrder");
		System.out.println("rOrder : "+rOrder);
		
		pvo.setrOrder(rOrder);
		System.out.println("DB 들어가기 전 ");
		List<AdminRoomTypeVO> list = dao.viewPageAllSelectRoomTypeRecord(pvo);
		System.out.println("DB 들어간 후 ");
		
		mav.addObject("pvo", pvo);
		mav.addObject("list", list);
		mav.setViewName("room/roomMain");
		return mav;
	}
	
	//���� ��
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public ModelAndView standard(HttpServletRequest req) {
		int room_type_code = Integer.parseInt((String)req.getParameter("room_type_code"));
		ModelAndView mav = new ModelAndView();
		AdminRoomTypeDAOImp dao = sqlSession.getMapper(AdminRoomTypeDAOImp.class);
		
		
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
				
		mav.addObject("vo", dao.selectRoomTypeRecord(room_type_code));
		mav.setViewName("room/room");
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
