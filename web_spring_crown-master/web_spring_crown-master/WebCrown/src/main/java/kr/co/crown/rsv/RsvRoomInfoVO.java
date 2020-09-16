package kr.co.crown.rsv;

import java.util.ArrayList;
import java.util.List;

public class RsvRoomInfoVO {
	private String room_name;
	private String room_price;
	private String img;
	private String room_type_code;
	private List<String> roomImgList;
	public RsvRoomInfoVO() { }
	
	
	public RsvRoomInfoVO(String room_name,String room_price) {
		this.room_name = room_name;
		this.room_price = room_price; 
	}
	
	
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_price() {
		return room_price;
	}
	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}
	
	@Override
	public String toString() {
		return "RsvRoomInfoVO [room_name=" + room_name + ", room_price=" + room_price + "]";
	}




	public String getRoom_type_code() {
		return room_type_code;
	}


	public void setRoom_type_code(String room_type_code) {
		this.room_type_code = room_type_code;
	}
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
		
		//���ڿ��� �����ڸ� ������ �� ����Ʈ�� �ٲٱ�
		String str = "%!";
		String[] array = img.split(str);
		roomImgList = new ArrayList<String>();
		for(String temp : array) {
			roomImgList.add(temp);
		}
		
	}

	public List<String> getRoomImgList() {
		return roomImgList;
	}

	public void setRoomImgList(List<String> roomImgList) {
		this.roomImgList = roomImgList;
		
		//����Ʈ�� �����ڸ� �����Ͽ� ���ڿ��� �ٲٱ�
		
		String[] array = new String[roomImgList.size()];
		int idx =0;
		for(String temp : roomImgList) {
			array[idx++] = temp;
		}
		
		String str = "%!";
		// array���� ���ڿ��� �о�� ' %! '�� �����ڷ� ����.
		img = String.join(str,array);

		
	}
	
}
