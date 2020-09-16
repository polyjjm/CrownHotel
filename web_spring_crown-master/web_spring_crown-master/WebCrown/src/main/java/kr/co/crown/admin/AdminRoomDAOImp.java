package kr.co.crown.admin;

import java.util.List;

public interface AdminRoomDAOImp {
	
	//객실 등록
	public int insertRoomRecord(AdminRoomVO vo);
	//객실 전체 레코드 선택
	public List<AdminRoomVO> allSelectRoomRecord(AdminRoomVO vo);
	
	//총 레코드 수 
	public int getTotalRoomRecord(AdminRoomTypePaginVO pvo);
	//객실 하나선택(view)
	public AdminRoomVO selectRoomRecord(int no);
	//객실 레코드 삭제
	public int deleteRoomRecord(int no);
	//객실 레코드 수정
	public int updateRoomRecord(AdminRoomVO vo);
	
	//객실 호수 중복여부 ajax
	public int getRoomNumAjax(String room_num);
	
	//객실타입 + 객실 join해서 rooms 전체 레코드 가져오기
	public List<AdminRoomTypeVO> allSelectRoomAndTypeRecord(AdminRoomTypePaginVO pvo);
}
