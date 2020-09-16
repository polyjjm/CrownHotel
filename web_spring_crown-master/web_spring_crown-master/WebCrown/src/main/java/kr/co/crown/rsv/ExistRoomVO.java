package kr.co.crown.rsv;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ExistRoomVO {
	
	private Integer room_type_code;
	private Integer room_code;
	private LocalDate check_in;
	private LocalDate check_out;
	private String state;
	
	
	public Integer getRoom_type_code() {
		return room_type_code;
	}
	public void setRoom_type_code(Integer room_type_code) {
		this.room_type_code = room_type_code;
	}
	public Integer getRoom_code() {
		return room_code;
	}
	public void setRoom_code(Integer room_code) {
		this.room_code = room_code;
	}
	public LocalDate getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = LocalDate.parse(check_in, 
				DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	public LocalDate getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = LocalDate.parse(check_out, 
				DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
