package kr.co.crown.admin;

public class AdminRsvVO {
	private Integer payment_code;
	private Integer payment;
	private String payment_order_number;
	private String status;
	private String pay_date;
	private String name;
	private String check_in;
	private String check_out;
	
	
	
	private int pageNum=1;
	private int pageRecord=10;
	private int totalRecord;
	private int totalPage;
	private int startPage=1;
	private int onePageCount=5;	
	private int lastPageRecord=5;
	
	private String searchKey;
	private String searchWord;
	public Integer getPayment_code() {
		return payment_code;
	}
	public void setPayment_code(Integer payment_code) {
		this.payment_code = payment_code;
	}
	public Integer getPayment() {
		return payment;
	}
	public void setPayment(Integer payment) {
		this.payment = payment;
	}
	public String getPayment_order_number() {
		return payment_order_number;
	}
	public void setPayment_order_number(String payment_order_number) {
		this.payment_order_number = payment_order_number;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		
		startPage=((pageNum-1)/onePageCount)*onePageCount+1;
	}
	public int getPageRecord() {
		return pageRecord;
	}
	public void setPageRecord(int pageRecord) {
		this.pageRecord = pageRecord;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		totalPage= (int)Math.ceil((double)totalRecord/pageRecord);
		if(totalRecord%pageRecord==0) {
			lastPageRecord = pageRecord;
		}else {
			lastPageRecord = totalRecord%pageRecord;
		}
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
	public int getLastPageRecord() {
		return lastPageRecord;
	}
	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
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
