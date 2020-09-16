package kr.co.crown.admin;

public class AdminEventVO {
	private int event_code;
	private String event_name;
	private String event_mdsp;
	private String event_sdsp;
	private String event_start;
	private String event_end;
	private String img;
	
	public int getEvent_code() {
		return event_code;
	}
	public void setEvent_code(int event_code) {
		this.event_code = event_code;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getEvent_mdsp() {
		return event_mdsp;
	}
	public void setEvent_mdsp(String event_mdsp) {
		this.event_mdsp = event_mdsp;
	}
	public String getEvent_sdsp() {
		return event_sdsp;
	}
	public void setEvent_sdsp(String event_sdsp) {
		this.event_sdsp = event_sdsp;
	}
	public String getEvent_start() {
		return event_start;
	}
	public void setEvent_start(String event_start) {
		this.event_start = event_start;
	}
	public String getEvent_end() {
		return event_end;
	}
	public void setEvent_end(String event_end) {
		this.event_end = event_end;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
