package kr.co.crown.mypage;

import java.sql.Date;

public class WithDrawalVO {
	
	private int wd_code;
	private String wd_user_id;
	private Date wd_date ;
	private String wd_type;
	private String wd_content;
	public int getWd_code() {
		return wd_code;
		
	}
	public void setWd_code(int wd_code) {
		this.wd_code = wd_code;
	}
	public Date getWd_date() {
		return wd_date;
	}
	public String getWd_user_id() {
		return wd_user_id;
	}
	public void setWd_user_id(String wd_user_id) {
		this.wd_user_id = wd_user_id;
	}
	public void setWd_date(Date wd_date) {
		this.wd_date = wd_date;
	}
	public String getWd_type() {
		return wd_type;
	}
	public void setWd_type(String wd_type) {
		this.wd_type = wd_type;
	}
	public String getWd_content() {
		return wd_content;
	}
	public void setWd_content(String wd_content) {
		this.wd_content = wd_content;
	}

}
