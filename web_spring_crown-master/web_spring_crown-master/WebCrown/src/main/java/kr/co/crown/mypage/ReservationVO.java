package kr.co.crown.mypage;

public class ReservationVO {
	private String user_id;
	private String rownum;
	private String payment_order_number;
	private String room_name;
	private String check_in;
	private String check_out;
	private String status;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getPayment_order_number() {
		return payment_order_number;
	}
	public void setPayment_order_number(String payment_order_number) {
		this.payment_order_number = payment_order_number;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
