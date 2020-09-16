package kr.co.crown.board;

public class PagingVO {
	private int point_code;
	private String user_id;
	private int pageNum=1;//현재 페이지
	private int onePageRecord=5;//한페이지에 출력할 레코드 수
	private int totalRecord;
	private int totalPage;
	private int startPage=1;
	private int onePageCount=5;
	private int lastPageRecords=5;
	
	private String searchKey;
	private String searchWord;
	
	private String startDate;
	private String endDate;
	
	public int getPoint_code() {
		return point_code;
	}
	public void setPoint_code(int point_code) {
		this.point_code = point_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		
		startPage=((pageNum-1)/onePageCount)*onePageCount+1;
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
				
		totalPage= (int)Math.ceil((double)totalRecord/onePageRecord);
		if(totalRecord%onePageRecord==0) {
			lastPageRecords = onePageRecord;
		}else {
			lastPageRecords = totalRecord%onePageRecord;
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
	public int getLastPageRecords() {
		return lastPageRecords;
	}
	public void setLastPageRecords(int lastPageRecords) {
		this.lastPageRecords = lastPageRecords;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	

}
