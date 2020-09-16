package kr.co.crown.admin;

public class AdminPackVO {
	private int pack_code;
	private String room_type;
	private String room_name;
	private int room_type_code;
	private String pack_name;
	private String img;
	private String dsp;
	private String pack_start;
	private String pack_end;
	
	private String pack_option;
	private String chkBoxOp1;
	private String chkBoxOp2;
	private String chkBoxOp3;
	private String chkBoxOp4;
	private String chkBoxOp5;
	private String chkBoxOp6;
	private String chkBoxOp7;
	
	private String sdsp;
	private String pack_price;
	private int pack_num;
	
	public int getPack_code() {
		return pack_code;
	}
	public void setPack_code(int pack_code) {
		this.pack_code = pack_code;
	}
	public String getRoom_type() {
		return room_type;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public int getRoom_type_code() {
		return room_type_code;
	}
	public void setRoom_type_code(int room_type_code) {
		this.room_type_code = room_type_code;
	}
	public String getPack_name() {
		return pack_name;
	}
	public void setPack_name(String pack_name) {
		this.pack_name = pack_name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDsp() {
		return dsp;
	}
	public void setDsp(String dsp) {
		this.dsp = dsp;
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
	public String getPack_option() {
		return chkBoxOp1+"%@"+chkBoxOp2+"%@"+chkBoxOp3+"%@"+chkBoxOp4+"%@"+chkBoxOp5
				+"%@"+chkBoxOp6+"%@"+chkBoxOp7;
	}
	public void setPack_option(String pack_option) {
		this.pack_option = pack_option;
		
		String optionList[] = pack_option.split("%@");
		
		chkBoxOp1 = optionList[0];
		chkBoxOp2 = optionList[1];
		chkBoxOp3 = optionList[2];
		chkBoxOp4 = optionList[3];
		chkBoxOp5 = optionList[4];
		chkBoxOp6 = optionList[5];
		chkBoxOp7 = optionList[6];
		
	}
	public String getChkBoxOp1() {
		return chkBoxOp1;
	}
	public void setChkBoxOp1(String chkBoxOp1) {
		this.chkBoxOp1 = chkBoxOp1;
	}
	public String getChkBoxOp2() {
		return chkBoxOp2;
	}
	public void setChkBoxOp2(String chkBoxOp2) {
		this.chkBoxOp2 = chkBoxOp2;
	}
	public String getChkBoxOp3() {
		return chkBoxOp3;
	}
	public void setChkBoxOp3(String chkBoxOp3) {
		this.chkBoxOp3 = chkBoxOp3;
	}
	public String getChkBoxOp4() {
		return chkBoxOp4;
	}
	public void setChkBoxOp4(String chkBoxOp4) {
		this.chkBoxOp4 = chkBoxOp4;
	}
	public String getChkBoxOp5() {
		return chkBoxOp5;
	}
	public void setChkBoxOp5(String chkBoxOp5) {
		this.chkBoxOp5 = chkBoxOp5;
	}
	public String getChkBoxOp6() {
		return chkBoxOp6;
	}
	public void setChkBoxOp6(String chkBoxOp6) {
		this.chkBoxOp6 = chkBoxOp6;
	}
	public String getChkBoxOp7() {
		return chkBoxOp7;
	}
	public void setChkBoxOp7(String chkBoxOp7) {
		this.chkBoxOp7 = chkBoxOp7;
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
	public int getPack_num() {
		return pack_num;
	}
	public void setPack_num(int pack_num) {
		this.pack_num = pack_num;
	}
}
