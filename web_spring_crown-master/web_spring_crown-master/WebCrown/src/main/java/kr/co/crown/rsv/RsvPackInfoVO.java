package kr.co.crown.rsv;

import java.util.ArrayList;
import java.util.List;

public class RsvPackInfoVO {

	private String pack_name;
	private String pack_code;
	private String chk_in;
	private String room_type_code;
	private String chk_out;
	private String room_ct;
	private String selectOrder;
	private String pack_start;
	private String pack_end;
	private String sdsp;
	private String pack_price;
	private String dsp;
	private String img;
	private String pack_option;
	
	private List<String> roomImgList;
	private String pack_sdspsub;
	
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
	public String getPack_name() {
		return pack_name;
	}
	public void setPack_name(String pack_name) {
		this.pack_name = pack_name;
	}
	public String getPack_code() {
		return pack_code;
	}
	public void setPack_code(String pack_code) {
		this.pack_code = pack_code;
	}
	
	public String toString() {
		return "RsvPackInfoVO [pack_name=" + pack_name+", pakc_code= " +pack_code+" ]";
	}
	public String getChk_in() {
		return chk_in;
	}
	public void setChk_in(String chk_in) {
		this.chk_in = chk_in;
	}
	public String getRoom_type_code() {
		return room_type_code;
	}
	public void setRoom_type_code(String room_type_code) {
		this.room_type_code = room_type_code;
	}
	public String getChk_out() {
		return chk_out;
	}
	public void setChk_out(String chk_out) {
		this.chk_out = chk_out;
	}
	public String getRoom_ct() {
		return room_ct;
	}
	public void setRoom_ct(String room_ct) {
		this.room_ct = room_ct;
	}
	public String getSelectOrder() {
		return selectOrder;
	}
	public void setSelectOrder(String selectOrder) {
		this.selectOrder = selectOrder;
	}
	public String getPack_start() {
		return pack_start;
	}
	public void setPack_start(String pack_start) {
		this.pack_start = pack_start;
	}
	public String getPack_end() {
		return pack_end;
	}
	public void setPack_end(String pack_end) {
		this.pack_end = pack_end;
	}

	public String getSdsp() {
		return sdsp;
	}
	public void setSdsp(String sdsp) {
		this.sdsp = sdsp;
	}
	public String getPack_price() {
		return pack_price;
	}
	public void setPack_price(String pack_price) {
		this.pack_price = pack_price;
	}
	public String getDsp() {
		return dsp;
	}
	public void setDsp(String dsp) {
		this.dsp = dsp;
	}

	public String getPack_option() {
		return pack_option;
	}
	public void setPack_option(String pack_option) {
		this.pack_option = pack_option;
	}
	public String getPack_sdspsub() {
		String[]  s =sdsp.split("<br/>");
		pack_sdspsub = s[0];	
		
		
		
		return pack_sdspsub ;
	}
	public void setPack_sdspsub(String pack_sdspsub) {
		
	
		this.pack_sdspsub = pack_sdspsub;
	}
	
	
}
