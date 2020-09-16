package kr.co.crown.rsv;

import java.util.List;

public class RsvRoomPackResultVO {
	private List<RsvRoomInfoVO> RoomData;
	private List<RsvPackInfoVO> packData;
	private Integer orderIndex;
	public List<RsvRoomInfoVO> getRoomData() {
		return RoomData;
	}
	public void setRoomData(List<RsvRoomInfoVO> roomData) {
		RoomData = roomData;
	}
	public List<RsvPackInfoVO> getPackData() {
		return packData;
	}
	public void setPackData(List<RsvPackInfoVO> packData) {
		this.packData = packData;
	}
	public Integer getOrderIndex() {
		return orderIndex;
	}
	public void setOrderIndex(Integer orderIndex) {
		this.orderIndex = orderIndex;
	}
	
	
	
}
