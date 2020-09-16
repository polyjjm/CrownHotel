package kr.co.crown.rsv;

import java.util.List;



public interface RsvDAOImp {
	public String[] dateList(String check_in, String check_out);
	
	public Integer[] checkList(String[] checkList);
	
	public Integer[] roomTypeCode(Integer[] roomCode);
	
	public RoomTypeVO roomTypeList(Integer[] roomTypeList);
	
	public List<room_typeVO> allRoomType();
	
	public List<room_typeVO> RoomType(Integer[] roomTypeCode);
	
	public List<ExistRoomVO> room();
	
	public List<String> RoomList(String check_in,String check_out);
	
	public List<String> RoomDetail(Integer[] lst,String room_ct,String room_type_code);
	
	public List<PackChkVO> packChk(String room_type_code);
	
	public List<RsvPackInfoVO> pack(String chk_in,String chk_out,String room_type_code,String room_ct,String orderIndex);
	
	
	public List<RsvPackInfoVO> packList(String check_in,String check_out,String room_count);
	
	public List<RsvRoomInfoVO> normalRoomType(String packCode);
	
	public List<RsvRoomInfoVO> normal_pack(String room_type_code);
	
	public int packUpdate(int room_count,int pack_code);
	
	//public Integer[] paymentSelect(int paymentCode);
	
	public Integer[] payMentSelect(String payment_code,String guestName);
	
	public List<RsvSelectVO> RsvSelect(Integer[] rsv_code,String guestName);
	
	public List<packSpareadVO> pack_dsp(String pack_code);
	
	public List<room_dspVO> pack_roomdsp(String room_Type_code);
	
	public RsvMemberInfoVO RsvMemberInfo(String userid); 
	
	public int rsvInsert(RsvInsertVO vo);
	
	public Integer selectRoomCode(String room_num);
	
	public int payMentInsert(RsvPayMentVO PayMentVO);
	
	public int guestInfo(RsvTotalVO vo);
	
	//public List<RsvPackListVO> packList(String check_in,String chekk_out);
	
	public List<RsvPackListVO> packCount(Integer[] packList);
	
	public int savePoint (String user_id,int savePoint,String pointCon);
	
	public int usePoint(String user_id,int usePoint,String pointCon2);
	
	public int pointSelect(String user_id);
	
	public int updatePoint(int point,String user_id);

 }

