package kr.co.crown.member;

public class MemberVO {
	private int member_code;
	
	private String user_name;
	
	private String user_En_name;
	private String name_first;
	private String name_last;
	
	private String country;
	
	private String user_tel;//
	private String tel_menu;
	private String tel_from;
	private String tel_number;
	
	private String user_email;
	
	private String birthday;
	private String year;
	private String month;
	private String day;
	
	private String user_id;
	private String user_pwd;
	
	private String regdate;
	
	private String logStatus="N";
	private String pwdStatus="N";
	private String emailStatus="N";
	
	
	//포인트
	private int point;
	
	
	
	
	public MemberVO() {
		
	}
	

	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_En_name() {
		return name_first+"%!"+name_last;
	}
	public void setUser_En_name(String user_En_name) {
		this.user_En_name = user_En_name;
		String u[]=user_En_name.split("%!");
		name_first = u[0];
		name_last = u[1];
	}
	public String getName_first() {
		return name_first;
	}
	public void setName_first(String name_first) {
		this.name_first = name_first;
	}
	public String getName_last() {
		return name_last;
	}
	public void setName_last(String name_last) {
		this.name_last = name_last;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getUser_tel() {
		return tel_menu+"%!"+tel_from+"%!"+tel_number;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
		String u[]=user_tel.split("%!");
		tel_menu = u[0];
		tel_from = u[1];
		tel_number = u[2];
	}
	public String getTel_menu() {
		return tel_menu;
	}
	public void setTel_menu(String tel_menu) {
		this.tel_menu = tel_menu;
	}
	public String getTel_from() {
		return tel_from;
	}
	public void setTel_from(String tel_from) {
		this.tel_from = tel_from;
	}
	
	public String getTel_number() {
		return tel_number;
	}

	public void setTel_number(String tel_number) {
		this.tel_number = tel_number;
	}

	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getBirthday() {
		return year+"%!"+month+"%!"+day;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
		String b[]=birthday.split("%!");
		year = b[0];
		month = b[1];
		day = b[2];
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getLogStatus() {
		return logStatus;
	}
	public void setLogStatus(String logStatus) {
		this.logStatus = logStatus;
	}
	public String getPwdStatus() {
		return pwdStatus;
	}
	public void setPwdStatus(String pwdStatus) {
		this.pwdStatus = pwdStatus;
	}
	public String getEmailStatus() {
		return emailStatus;
	}


	public void setEmailStatus(String emailStatus) {
		this.emailStatus = emailStatus;
	}

	//포인트
	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}

	
	

	
	

	}
