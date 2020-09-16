package kr.co.crown.admin;

import java.util.List;

public interface AdminRoomTypeDAOImp {
	
	//객실타입 등록
	public int insertRoomTypeRecord(AdminRoomTypeVO vo);
	//객실타입 전체 레코드 선택
	public List<AdminRoomTypeVO> allSelectRoomTypeRecord(AdminRoomTypePaginVO pvo);
	//ajax 전체 레코드 선택
	public List<AdminRoomTypeVO> allSelectRoomTypeRecordAjax();
	//총 레코드수
	public int getTotalRoomTypeRecord(AdminRoomTypePaginVO pvo);
	//객실타입 하나선택(view)
	public AdminRoomTypeVO selectRoomTypeRecord(int no);
	//객실타입 레코드 삭제
	public int deleteRoomTypeRecord(int no);
	//객실타입 레코드 수정
	public int updateRoomTypeRecord(AdminRoomTypeVO vo);
	//객실 이름 가져오기 (ajax)
	public List<AdminRoomTypeVO> getRoomTypeRecordAjax(String room_type);
	
	//뷰페이지에 보여줄 전체레코드 선택
	public List<AdminRoomTypeVO> viewPageAllSelectRoomTypeRecord(AdminRoomTypePaginVO pvo);

}
