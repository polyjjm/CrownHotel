package kr.co.crown.admin;

import java.util.ArrayList;
import java.util.List;

public class AdminRoomTypeVO {

	private int room_type_code;
	private String room_type;
	private String room_name;
	private String room_mdsp;
	private String room_sdsp;
	private String room_area;
	
	private String room_general; //�Ϲ� �ɼ�
	//�Ϲ� �ɼ� 
	private String chkBoxGen_01;
	private String chkBoxGen_02;
	private String chkBoxGen_03;
	private String chkBoxGen_04;
	private String chkBoxGen_05;
	private String chkBoxGen_06;
	private String chkBoxGen_07;
	private String chkBoxGen_08;
	private String chkBoxGen_09;
	private String chkBoxGen_10;
	private String chkBoxGen_11;
	private String chkBoxGen_12;
	
	private String room_bath;	//ħ��ɼ�
	//ħ��ɼ�
	private String chkBoxBath_01;
	private String chkBoxBath_02;
	private String chkBoxBath_03;
	private String chkBoxBath_04;
	private String chkBoxBath_05;
	private String chkBoxBath_06;
	private String chkBoxBath_07;
	private String chkBoxBath_08;
	private String chkBoxBath_09;
	
	private String room_etc;	//��Ÿ�ɼ�
	//��Ÿ�ɼ�
	private String chkBoxEtc_01;
	private String chkBoxEtc_02;
	private String chkBoxEtc_03;
	private String chkBoxEtc_04;
	private String chkBoxEtc_05;
	private String chkBoxEtc_06;
	private String chkBoxEtc_07;
	
	private String str_room_price;
	private int room_price;
	
	
	private List<String> roomImgList; // db���� ������ %!���� �̹��� ����Ʈ
	private String img;//db�� ���� img ���ڿ�
	
	private List<String> delRoomImgList; //������ �̹���

	private int room_code;
	private String room_num;
	private int max_adult;
	private int max_child;
	private String bed;
	
	
	
	public AdminRoomTypeVO() {
		delRoomImgList = new ArrayList<String>();
		roomImgList = new ArrayList<String>();
	}
	
	
	public String getStr_room_price() {
		
		return str_room_price;
	}

	public void setStr_room_price(String str_room_price) {
		//���ں�ȯ -
		String rateComma = str_room_price;
		room_price = Integer.parseInt(rateComma.replaceAll(",", ""));
		this.str_room_price = str_room_price;
	}

	public int getRoom_type_code() {
		return room_type_code;
	}

	public void setRoom_type_code(int room_type_code) {
		this.room_type_code = room_type_code;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_mdsp() {
		return room_mdsp;
	}

	public void setRoom_mdsp(String room_mdsp) {
		this.room_mdsp = room_mdsp;
	}

	public String getRoom_sdsp() {
		return room_sdsp;
	}

	public void setRoom_sdsp(String room_sdsp) {
		this.room_sdsp = room_sdsp;
	}

	public String getRoom_area() {
		return room_area;
	}

	public void setRoom_area(String room_area) {
		this.room_area = room_area;
	}

	public String getRoom_general() {
		return chkBoxGen_01+"%!"+chkBoxGen_02+"%!"+chkBoxGen_03+"%!"
				+chkBoxGen_04+"%!"+chkBoxGen_05+"%!"+chkBoxGen_06+"%!"
				+chkBoxGen_07+"%!"+chkBoxGen_08+"%!"+chkBoxGen_09+"%!"
				+chkBoxGen_10+"%!"+chkBoxGen_11+"%!"+chkBoxGen_12;
	}

	public void setRoom_general(String room_general) {
		this.room_general = room_general;
		
		String genList[] = room_general.split("%!");
		
		chkBoxGen_01 = genList[0];
		chkBoxGen_02 = genList[1];
		chkBoxGen_03 = genList[2];
		chkBoxGen_04 = genList[3];
		chkBoxGen_05 = genList[4];
		chkBoxGen_06 = genList[5];
		chkBoxGen_07 = genList[6];
		chkBoxGen_08 = genList[7];
		chkBoxGen_09 = genList[8];
		chkBoxGen_10 = genList[9];
		chkBoxGen_11 = genList[10];
		chkBoxGen_12 = genList[11];
		
	}

	public String getRoom_bath() {
		return chkBoxBath_01+"%!"+chkBoxBath_02+"%!"+chkBoxBath_03+"%!"
				+chkBoxBath_04+"%!"+chkBoxBath_05+"%!"+chkBoxBath_06+"%!"
				+chkBoxBath_07+"%!"+chkBoxBath_08+"%!"+chkBoxBath_09;
	}

	public void setRoom_bath(String room_bath) {
		this.room_bath = room_bath;
		
		String bathList[] = room_bath.split("%!");
		chkBoxBath_01 = bathList[0];
		chkBoxBath_02 = bathList[1];
		chkBoxBath_03 = bathList[2];
		chkBoxBath_04 = bathList[3];
		chkBoxBath_05 = bathList[4];
		chkBoxBath_06 = bathList[5];
		chkBoxBath_07 = bathList[6];
		chkBoxBath_08 = bathList[7];
		chkBoxBath_09 = bathList[8];
		
	}

	public String getRoom_etc() {
		return chkBoxEtc_01+"%!"+chkBoxEtc_02+"%!"+chkBoxEtc_03+"%!"
				+chkBoxEtc_04+"%!"+chkBoxEtc_05+"%!"+chkBoxEtc_06+"%!"
				+chkBoxEtc_07;
		
	}

	public void setRoom_etc(String room_etc) {
		this.room_etc = room_etc;
		
		String etcList[] = room_etc.split("%!");
		chkBoxEtc_01 = etcList[0];
		chkBoxEtc_02 = etcList[1];
		chkBoxEtc_03 = etcList[2];
		chkBoxEtc_04 = etcList[3];
		chkBoxEtc_05 = etcList[4];
		chkBoxEtc_06 = etcList[5];
		chkBoxEtc_07 = etcList[6];
		
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	
	/*=======  �ɼ�: �Ϲ�, ���, ��Ÿ  =============================*/
	
	
	public String getChkBoxGen_01() {
		return chkBoxGen_01;
	}

	public void setChkBoxGen_01(String chkBoxGen_01) {
		this.chkBoxGen_01 = chkBoxGen_01;
	}

	public String getChkBoxGen_02() {
		return chkBoxGen_02;
	}

	public void setChkBoxGen_02(String chkBoxGen_02) {
		this.chkBoxGen_02 = chkBoxGen_02;
	}

	public String getChkBoxGen_03() {
		return chkBoxGen_03;
	}

	public void setChkBoxGen_03(String chkBoxGen_03) {
		this.chkBoxGen_03 = chkBoxGen_03;
	}

	public String getChkBoxGen_04() {
		return chkBoxGen_04;
	}

	public void setChkBoxGen_04(String chkBoxGen_04) {
		this.chkBoxGen_04 = chkBoxGen_04;
	}

	public String getChkBoxGen_05() {
		return chkBoxGen_05;
	}

	public void setChkBoxGen_05(String chkBoxGen_05) {
		this.chkBoxGen_05 = chkBoxGen_05;
	}

	public String getChkBoxGen_06() {
		return chkBoxGen_06;
	}

	public void setChkBoxGen_06(String chkBoxGen_06) {
		this.chkBoxGen_06 = chkBoxGen_06;
	}

	public String getChkBoxGen_07() {
		return chkBoxGen_07;
	}

	public void setChkBoxGen_07(String chkBoxGen_07) {
		this.chkBoxGen_07 = chkBoxGen_07;
	}

	public String getChkBoxGen_08() {
		return chkBoxGen_08;
	}

	public void setChkBoxGen_08(String chkBoxGen_08) {
		this.chkBoxGen_08 = chkBoxGen_08;
	}

	public String getChkBoxGen_09() {
		return chkBoxGen_09;
	}

	public void setChkBoxGen_09(String chkBoxGen_09) {
		this.chkBoxGen_09 = chkBoxGen_09;
	}

	public String getChkBoxGen_10() {
		return chkBoxGen_10;
	}

	public void setChkBoxGen_10(String chkBoxGen_10) {
		this.chkBoxGen_10 = chkBoxGen_10;
	}

	public String getChkBoxGen_11() {
		return chkBoxGen_11;
	}

	public void setChkBoxGen_11(String chkBoxGen_11) {
		this.chkBoxGen_11 = chkBoxGen_11;
	}

	public String getChkBoxGen_12() {
		return chkBoxGen_12;
	}

	public void setChkBoxGen_12(String chkBoxGen_12) {
		this.chkBoxGen_12 = chkBoxGen_12;
	}

	public String getChkBoxBath_01() {
		return chkBoxBath_01;
	}

	public void setChkBoxBath_01(String chkBoxBath_01) {
		this.chkBoxBath_01 = chkBoxBath_01;
	}

	public String getChkBoxBath_02() {
		return chkBoxBath_02;
	}

	public void setChkBoxBath_02(String chkBoxBath_02) {
		this.chkBoxBath_02 = chkBoxBath_02;
	}

	public String getChkBoxBath_03() {
		return chkBoxBath_03;
	}

	public void setChkBoxBath_03(String chkBoxBath_03) {
		this.chkBoxBath_03 = chkBoxBath_03;
	}

	public String getChkBoxBath_04() {
		return chkBoxBath_04;
	}

	public void setChkBoxBath_04(String chkBoxBath_04) {
		this.chkBoxBath_04 = chkBoxBath_04;
	}

	public String getChkBoxBath_05() {
		return chkBoxBath_05;
	}

	public void setChkBoxBath_05(String chkBoxBath_05) {
		this.chkBoxBath_05 = chkBoxBath_05;
	}

	public String getChkBoxBath_06() {
		return chkBoxBath_06;
	}

	public void setChkBoxBath_06(String chkBoxBath_06) {
		this.chkBoxBath_06 = chkBoxBath_06;
	}

	public String getChkBoxBath_07() {
		return chkBoxBath_07;
	}

	public void setChkBoxBath_07(String chkBoxBath_07) {
		this.chkBoxBath_07 = chkBoxBath_07;
	}

	public String getChkBoxBath_08() {
		return chkBoxBath_08;
	}

	public void setChkBoxBath_08(String chkBoxBath_08) {
		this.chkBoxBath_08 = chkBoxBath_08;
	}

	public String getChkBoxBath_09() {
		return chkBoxBath_09;
	}

	public void setChkBoxBath_09(String chkBoxBath_09) {
		this.chkBoxBath_09 = chkBoxBath_09;
	}

	public String getChkBoxEtc_01() {
		return chkBoxEtc_01;
	}

	public void setChkBoxEtc_01(String chkBoxEtc_01) {
		this.chkBoxEtc_01 = chkBoxEtc_01;
	}

	public String getChkBoxEtc_02() {
		return chkBoxEtc_02;
	}

	public void setChkBoxEtc_02(String chkBoxEtc_02) {
		this.chkBoxEtc_02 = chkBoxEtc_02;
	}

	public String getChkBoxEtc_03() {
		return chkBoxEtc_03;
	}

	public void setChkBoxEtc_03(String chkBoxEtc_03) {
		this.chkBoxEtc_03 = chkBoxEtc_03;
	}

	public String getChkBoxEtc_04() {
		return chkBoxEtc_04;
	}

	public void setChkBoxEtc_04(String chkBoxEtc_04) {
		this.chkBoxEtc_04 = chkBoxEtc_04;
	}

	public String getChkBoxEtc_05() {
		return chkBoxEtc_05;
	}

	public void setChkBoxEtc_05(String chkBoxEtc_05) {
		this.chkBoxEtc_05 = chkBoxEtc_05;
	}

	public String getChkBoxEtc_06() {
		return chkBoxEtc_06;
	}

	public void setChkBoxEtc_06(String chkBoxEtc_06) {
		this.chkBoxEtc_06 = chkBoxEtc_06;
	}

	public String getChkBoxEtc_07() {
		return chkBoxEtc_07;
	}

	public void setChkBoxEtc_07(String chkBoxEtc_07) {
		this.chkBoxEtc_07 = chkBoxEtc_07;
	}

	
	
	/* ====== �̹���  =======================*/
	
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
		
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
		
		
		String[] array = new String[roomImgList.size()];
		int idx =0;
		for(String temp : roomImgList) {
			array[idx++] = temp;
		}
		
		String str = "%!";
		
		img = String.join(str,array);

	}

	public List<String> getDelRoomImgList() {
		return delRoomImgList;
	}

	public void setDelRoomImgList(List<String> delRoomImgList) {
		System.out.println(" vo ���� �̹��� ����Ʈ :"+delRoomImgList);
		this.delRoomImgList = delRoomImgList;
	}


	public int getRoom_code() {
		return room_code;
	}


	public void setRoom_code(int room_code) {
		this.room_code = room_code;
	}


	public String getRoom_num() {
		return room_num;
	}


	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}


	public int getMax_adult() {
		return max_adult;
	}


	public void setMax_adult(int max_adult) {
		this.max_adult = max_adult;
	}


	public int getMax_child() {
		return max_child;
	}


	public void setMax_child(int max_child) {
		this.max_child = max_child;
	}


	public String getBed() {
		return bed;
	}


	public void setBed(String bed) {
		this.bed = bed;
	}


}
