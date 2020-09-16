package kr.co.crown.admin;

public class AdminRoomVO {
	private int room_code;
	private int room_type_code;
	private String room_num;
	private int max_adult;
	private int max_child;
	private String bed;
	
	/*======== 객실 타입 ========*/
	private String room_type;
	private String room_name;
	private String str_room_price;
	private int room_price;
	
	public int getRoom_code() {
		return room_code;
	}
	public void setRoom_code(int room_code) {
		this.room_code = room_code;
	}
	public int getRoom_type_code() {
		return room_type_code;
	}
	public void setRoom_type_code(int room_type_code) {
		this.room_type_code = room_type_code;
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
	public String getStr_room_price() {
		return str_room_price;
	}
	public void setStr_room_price(String str_room_price) {
		//숫자변환 -
		String rateComma = str_room_price;
		room_price = Integer.parseInt(rateComma.replaceAll(",", ""));
		this.str_room_price = str_room_price;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	
}
