package kr.co.crown.rsv;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class RsvRestController {

	private final SqlSession sqlSession;

	public RsvRestController(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;

	}
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@RequestMapping(value = "/room_detail", method = RequestMethod.GET)
	public List<String> roomdetail(String room_type_code, String chk_in, String chk_out, String room_ct) {

		RsvDAOImp dao = sqlSession.getMapper(RsvDAOImp.class);

		String[] checkList = dao.dateList(chk_in,chk_out);
		//체크인 체크아웃 날짜가 checkList 랑 같은지 비교
		Integer[] roomCode =dao.checkList(checkList);
		// 예약 방 체크...
		Integer lst[] = new Integer[roomCode.length];

		for (int i = 0; i < lst.length; i++) {
 
			lst[i] =roomCode[i];

		}
		// 0
		List<String> list2 = new ArrayList<String>();
		if (lst.length != 0) {
			list2 = dao.RoomDetail(lst, room_ct, room_type_code);
		} else if (lst.length == 0) {
			
			lst  = new Integer[1];
			lst[0] = 999999;
			list2 = dao.RoomDetail(lst, room_ct, room_type_code);
		}
		
		
		return list2;

	}

	@RequestMapping(value = "/sprayItem", method = RequestMethod.GET)
	public RsvRoomPackResultVO spread(String chk_in, String chk_out, String room_type_code,String orderIndex,String room_ct,String selectOrder,String packCode) {
		int selectOrderStatus = Integer.parseInt(selectOrder);
		System.out.println(orderIndex + " 정렬 스테이터스값");
		System.out.println(packCode + " pack 번호");
		RsvDAOImp dao = sqlSession.getMapper(RsvDAOImp.class);
		RsvRoomPackResultVO rpvo = new RsvRoomPackResultVO();
		
		System.out.println(selectOrder);
		List<RsvRoomInfoVO> RsvRoomInfoVOList = new ArrayList<RsvRoomInfoVO>();
		if (selectOrderStatus ==1) {
			
		RsvRoomInfoVOList = dao.normal_pack(room_type_code);
		List<RsvPackInfoVO> RsvPackInfoVOList = dao.pack(chk_in, chk_out, room_type_code,room_ct,orderIndex);
			rpvo.setRoomData(RsvRoomInfoVOList);
			rpvo.setPackData(RsvPackInfoVOList);
			rpvo.setOrderIndex(Integer.parseInt(orderIndex));
			System.out.println("111컨트롤러 이미지 = "+RsvRoomInfoVOList.get(0).getImg());
			System.out.println("222컨트롤러 이미지 = "+rpvo.getRoomData().get(0).getImg());
			
		}
		else if(selectOrderStatus ==0) {
		RsvRoomInfoVOList = dao.normalRoomType(packCode);	
		rpvo.setRoomData(RsvRoomInfoVOList);
		rpvo.setOrderIndex(Integer.parseInt(orderIndex));
		}

		return rpvo;
		

	}
//	@RequestMapping(value="/pack_list" ,method = RequestMethod.GET)
//	public RsvPackInfoVO pack_list(RsvPackInfoVO vo ,HttpServletRequest req) {
//		RsvDAOImp dao =sqlSession.getMapper(RsvDAOImp.class);
//		System.out.println(vo.getChk_in() +"pack list check_in");
//		System.out.println(vo.getRoom_type_code() +"22pack list check_in");
//		System.out.println(vo.getSelectOrder() + " select");
//		return vo;
//	}

	@RequestMapping(value = "/pack_sparead", method = RequestMethod.GET)
	public List pack_sparead(HttpServletRequest req, String pack_code, String room_type_code) {

		List list = new ArrayList();

		RsvDAOImp dao = sqlSession.getMapper(RsvDAOImp.class);

		HttpSession ses = req.getSession();
		String log = (String) ses.getAttribute("logStatus");
		//System.out.println(log);

		if (!pack_code.equals("0")) {
			list = dao.pack_dsp(pack_code);
		} else if (pack_code.equals("0")) {
			list = dao.pack_roomdsp(room_type_code);
		}

		return list;
	}


	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	public String pay(@RequestBody RsvTotalVO rsvTotalVO, HttpServletRequest req) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		HttpSession ses = req.getSession();
		RsvDAOImp dao = sqlSession.getMapper(RsvDAOImp.class);
		String room_num= "";
		Integer room_code =0;
		Integer rr = 0;
		String imp_uid =rsvTotalVO.getImp_uid();
		try {

		
		String userid = (String)ses.getAttribute("user_id");
		//System.out.println(rsvTotalVO.getGuestName() + "1111111111111");
		RsvPayMentVO RsvPayMentVO = new RsvPayMentVO();

	
		
	

		if(userid !=null) {
			if (rsvTotalVO.getRoom_num1() !=null  ) {
				
				
				
				///////////////////////////////////
				room_num =rsvTotalVO.getRoom_num1();
				room_code=dao.selectRoomCode(room_num);
				System.out.println(room_code);
				int room_people = rsvTotalVO.getRoom1_adult()  + rsvTotalVO.getRoom1_child() ;

			
				
				RsvInsertVO rsvInsertVO = RsvInsertVO.of(room_code, room_people,userid,rsvTotalVO.getCheck_in(),rsvTotalVO.getCheck_out(),rsvTotalVO.getRequire1(),rsvTotalVO.getBk1(),rsvTotalVO.getRoom_price(),rsvTotalVO.getPack_code());
				System.out.println(rsvInsertVO.getPack_code());
				rr =dao.rsvInsert(rsvInsertVO);

				//System.out.println(rr);
				RsvPayMentVO.setPayment(rsvTotalVO.getRoom_price());
				RsvPayMentVO.setRoom_rsv_code(rsvInsertVO.getRoom_rsv_code());
				RsvPayMentVO.setPayment_order_number(imp_uid);
				RsvPayMentVO.setStatus("결제완료");
				RsvPayMentVO.getPayment_code();
				RsvPayMentVO.setName(rsvTotalVO.getGuestName());
				System.out.println("어디서 에러가날까요3");
				dao.payMentInsert(RsvPayMentVO);
				
			} 
			
	
		if (rsvTotalVO.getRoom_num2() !=null) {
			
			room_num =rsvTotalVO.getRoom_num2();
			room_code=dao.selectRoomCode(room_num);
			int room_people = rsvTotalVO.getRoom2_adult()  + rsvTotalVO.getRoom2_child() ;
			RsvInsertVO rsvInsertVO = RsvInsertVO.of(room_code, room_people,userid,rsvTotalVO.getCheck_in(),rsvTotalVO.getCheck_out(),rsvTotalVO.getRequire2(),rsvTotalVO.getBk2(),rsvTotalVO.getRoom_price(),rsvTotalVO.getPack_code());
			
			rr =dao.rsvInsert(rsvInsertVO);
			RsvPayMentVO.setPayment(rsvTotalVO.getRoom_price());
			RsvPayMentVO.setRoom_rsv_code(rsvInsertVO.getRoom_rsv_code());
			RsvPayMentVO.setPayment_order_number(imp_uid);
			RsvPayMentVO.setStatus("결제완료");
			RsvPayMentVO.getPayment_code();
			RsvPayMentVO.setName(rsvTotalVO.getGuestName());
			dao.payMentInsert(RsvPayMentVO);
		} 
		
		if (rsvTotalVO.getRoom_num3() !=null) {
			
			//System.out.println("roo3 " + rsvTotalVO.getRoom_num3());
			room_num =rsvTotalVO.getRoom_num3();
			room_code=dao.selectRoomCode(room_num);
			int room_people = rsvTotalVO.getRoom3_adult()  + rsvTotalVO.getRoom3_child() ;
			RsvInsertVO rsvInsertVO = RsvInsertVO.of(room_code, room_people,userid,rsvTotalVO.getCheck_in(),rsvTotalVO.getCheck_out(),rsvTotalVO.getRequire3(),rsvTotalVO.getBk3(),rsvTotalVO.getRoom_price(),rsvTotalVO.getPack_code());
			
			rr =dao.rsvInsert(rsvInsertVO);
			RsvPayMentVO.setPayment(rsvTotalVO.getRoom_price());
			RsvPayMentVO.setRoom_rsv_code(rsvInsertVO.getRoom_rsv_code());
			RsvPayMentVO.setPayment_order_number(imp_uid);
			RsvPayMentVO.setStatus("결제완료");
			RsvPayMentVO.getPayment_code();
			RsvPayMentVO.setName(rsvTotalVO.getGuestName());
			dao.payMentInsert(RsvPayMentVO);
		}
		String pointCon = "결제적립";
		String pointCon2 = "결제사용";
			//포인트 적립
			dao.savePoint(userid ,rsvTotalVO.getSavePoint(),pointCon);
			//포인트사용
			if(rsvTotalVO.getUsePoint() != 0) {
				dao.usePoint(userid,rsvTotalVO.getUsePoint()*-1,pointCon2);
			}
			//총 포인트 검색 
		int point=	dao.pointSelect(userid);
			//포인트 업데이트
			dao.updatePoint(point,userid);
			
			
			if(rsvTotalVO.getPack_code()!=0) {
				//pack_code == pack_code인거의pack_num을가져옴
				//dao.packSelect();
				//pack_num 을 room_count 만큼 감소 해주고다시 넣음
				dao.packUpdate(rsvTotalVO.getRoom_count(),rsvTotalVO.getPack_code());
			}

		
		}
		
		
		else if(userid ==null) {
		dao.guestInfo(rsvTotalVO);

			if (rsvTotalVO.getRoom_num1() !=null  ) {
				
				room_num =rsvTotalVO.getRoom_num1();
				
				room_code=dao.selectRoomCode(room_num);
				//System.out.println(room_code);
				int room_people = rsvTotalVO.getRoom1_adult()  + rsvTotalVO.getRoom1_child() ;

				
				RsvInsertVO rsvInsertVO = RsvInsertVO.of(room_code,rsvTotalVO.getGuest_code(), room_people,rsvTotalVO.getCheck_in(),rsvTotalVO.getCheck_out(),rsvTotalVO.getRequire1(),rsvTotalVO.getBk1(),rsvTotalVO.getRoom_price(),rsvTotalVO.getPack_code());
				
				rr =dao.rsvInsert(rsvInsertVO);
				System.out.println(rsvInsertVO.getRoom_rsv_code());
				RsvPayMentVO.setPayment(rsvTotalVO.getRoom_price());
				RsvPayMentVO.setRoom_rsv_code(rsvInsertVO.getRoom_rsv_code());
				RsvPayMentVO.setPayment_order_number(imp_uid);
				RsvPayMentVO.setStatus("결제완료");
				RsvPayMentVO.setName(rsvTotalVO.getGuestName());
				//System.out.println(rsvpay);
				//int payment = RsvPayMentVO.getPayment_code();
				dao.payMentInsert(RsvPayMentVO);
				
				
				
				
				
				
			} 
			
	
		if (rsvTotalVO.getRoom_num2() !=null) {
			room_num =rsvTotalVO.getRoom_num2();
			room_code=dao.selectRoomCode(room_num);
			int room_people = rsvTotalVO.getRoom2_adult()  + rsvTotalVO.getRoom2_child() ;
			RsvInsertVO rsvInsertVO = RsvInsertVO.of(room_code,rsvTotalVO.getGuest_code(), room_people,rsvTotalVO.getCheck_in(),rsvTotalVO.getCheck_out(),rsvTotalVO.getRequire2(),rsvTotalVO.getBk2(),rsvTotalVO.getRoom_price(),rsvTotalVO.getPack_code());
			
			rr =dao.rsvInsert(rsvInsertVO);
			System.out.println(rsvInsertVO.getRoom_rsv_code());
			RsvPayMentVO.setPayment(rsvTotalVO.getRoom_price());
			RsvPayMentVO.setRoom_rsv_code(rsvInsertVO.getRoom_rsv_code());
			int payment = RsvPayMentVO.getPayment_code();
			RsvPayMentVO.setPayment_order_number(imp_uid);
			//RsvPayMentVO.setPayment_code((payment -1));
			RsvPayMentVO.setStatus("결제완료");
			RsvPayMentVO.setName(rsvTotalVO.getGuestName());
			dao.payMentInsert(RsvPayMentVO);
		} 
		
		if (rsvTotalVO.getRoom_num3() !=null) {
			room_num =rsvTotalVO.getRoom_num3();
			room_code=dao.selectRoomCode(room_num);
			int room_people = rsvTotalVO.getRoom3_adult()  + rsvTotalVO.getRoom3_child() ;
			RsvInsertVO rsvInsertVO = RsvInsertVO.of(room_code,rsvTotalVO.getGuest_code(), room_people,rsvTotalVO.getCheck_in(),rsvTotalVO.getCheck_out(),rsvTotalVO.getRequire3(),rsvTotalVO.getBk3(),rsvTotalVO.getRoom_price(),rsvTotalVO.getPack_code());
			
			rr =dao.rsvInsert(rsvInsertVO);
			System.out.println(rsvInsertVO.getRoom_rsv_code());
			RsvPayMentVO.setPayment(rsvTotalVO.getRoom_price());
			RsvPayMentVO.setRoom_rsv_code(rsvInsertVO.getRoom_rsv_code());
			RsvPayMentVO.setPayment_order_number(imp_uid);
			RsvPayMentVO.setStatus("결제완료");
			int payment = RsvPayMentVO.getPayment_code();
			RsvPayMentVO.setName(rsvTotalVO.getGuestName());
			//RsvPayMentVO.setPayment_code((payment -1));
			dao.payMentInsert(RsvPayMentVO);
		}
		}
		
		System.out.println(rsvTotalVO.getImp_uid());
		
		if(rsvTotalVO.getPack_code()!=0) {
			//pack_code == pack_code인거의pack_num을가져옴
			//dao.packSelect();
			//pack_num 을 room_count 만큼 감소 해주고다시 넣음
			dao.packUpdate(rsvTotalVO.getRoom_count(),rsvTotalVO.getPack_code());
		}
		transactionManager.commit(status);
		
		
		//dao.paymentSelect(RsvPayMentVO.getPayment_code());
		}catch(Exception e) {
			System.out.println(e.getMessage());
			transactionManager.rollback(status);
		}
	
		return imp_uid;
	}
	
//@RequestMapping("/rsvComplete")


}
