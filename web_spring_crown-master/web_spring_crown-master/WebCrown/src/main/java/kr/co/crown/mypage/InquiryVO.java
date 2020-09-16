package kr.co.crown.mypage;

import java.sql.Date;

public class InquiryVO {
	private int iq_code;
	private String iq_type;
	private String iq_title;
	private String iq_content;
	private String iq_user_name;
	private String iq_user_email;
	private String iq_user_tel;
	private Date iq_sysdate ;
	private String iq_answer_status="N";
	
	public int getIq_code() {
		return iq_code;
	}
	public void setIq_code(int iq_code) {
		this.iq_code = iq_code;
	}
	public String getIq_type() {
		return iq_type;
	}
	public void setIq_type(String iq_type) {
		this.iq_type = iq_type;
	}
	public String getIq_title() {
		return iq_title;
	}
	public void setIq_title(String iq_title) {
		this.iq_title = iq_title;
	}
	public String getIq_content() {
		return iq_content;
	}
	public void setIq_content(String iq_content) {
		this.iq_content = iq_content;
	}
	public String getIq_user_name() {
		return iq_user_name;
	}
	public void setIq_user_name(String iq_user_name) {
		this.iq_user_name = iq_user_name;
	}
	public String getIq_user_email() {
		return iq_user_email;
	}
	public void setIq_user_email(String iq_user_email) {
		this.iq_user_email = iq_user_email;
	}
	public String getIq_user_tel() {
		return iq_user_tel;
	}
	public void setIq_user_tel(String iq_user_tel) {
		this.iq_user_tel = iq_user_tel;
	}
	public Date getIq_sysdate() {
		return iq_sysdate;
	}
	public void setIq_sysdate(Date iq_sysdate) {
		this.iq_sysdate = iq_sysdate;
	}
	public String getIq_answer_status() {
		return iq_answer_status;
	}
	public void setIq_answer_status(String iq_answer_status) {
		this.iq_answer_status = iq_answer_status;
	}
	
}
