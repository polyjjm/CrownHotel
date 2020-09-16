package kr.co.crown.admin;

public class AdminRsvDetailVO {
	private String check_in;
	private String check_out;
	private String room_num;
	private Integer room_people;
	private String require;
	private Integer breakfast_adult;
	private String name;
	private Integer payment_code;
	private String payment;
	
	
	
	//page
	private int pageNum=1;//���� ������
	private int onePageRecord=5;//���������� ����� ���ڵ� ��
	private int totalRecord;
	private int totalPage;
	private int startPage=1;
	private int onePageCount=5;
	private int lastPageRecords=5;
	
	private String searchKey;
	private String searchWord;
	
	
	
	
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
	public String getRoom_num() {
		return room_num;
	}
	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}
	public Integer getRoom_people() {
		return room_people;
	}
	public void setRoom_people(Integer room_people) {
		this.room_people = room_people;
	}
	public String getRequire() {
		return require;
	}
	public void setRequire(String require) {
		this.require = require;
	}
	public Integer getBreakfast_adult() {
		return breakfast_adult;
	}
	public void setBreakfast_adult(Integer breakfast_adult) {
		this.breakfast_adult = breakfast_adult;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPayment_code() {
		return payment_code;
	}
	public void setPayment_code(Integer payment_code) {
		this.payment_code = payment_code;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getOnePageCount() {
		return onePageCount;
	}
	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}
	public int getLastPageRecords() {
		return lastPageRecords;
	}
	public void setLastPageRecords(int lastPageRecords) {
		this.lastPageRecords = lastPageRecords;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	
	
	
}
