package kr.co.crown.rsv;

public class RsvPayMentVO {
	private Integer payment_code;
	private int room_rsv_code;
	private String pay_date;
	private int payment;
	private String status;
	private String payment_order_number;
	private String name;
	public Integer getPayment_code() {
		return payment_code;
	}
	public void setPayment_code(Integer payment_code) {
		this.payment_code = payment_code;
	}
	public int getRoom_rsv_code() {
		return room_rsv_code;
	}
	public void setRoom_rsv_code(int room_rsv_code) {
		this.room_rsv_code = room_rsv_code;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPayment_order_number() {
		return payment_order_number;
	}
	public void setPayment_order_number(String payment_order_number) {
		this.payment_order_number = payment_order_number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	
	
	
	
}
