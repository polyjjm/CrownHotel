package kr.co.crown.admin;

public class AdminRoomTypePaginVO {
	
	//페이지 
	private int pageNum=1;//현재 페이지
	private int pageRecord=5;//한페이지에 출력할 레코드 수
	private int totalRecord;//총 레코드 수
	private int totalPage;//총페이지 수
	private int startPage=1;//시작 페이지 번호
	private int onePageCount=5;//한번에 출력할 페이지 갯수
	
	//마지막 페이지의 남아 있는 레코드 수
	private int lastPageRecord=5;
	
	//검색어와 검색키
	private String searchKey;//검색키
	private String searchWord;//검색어
	
	//�������� ���� Ÿ�� �˻�
	private String rOptions;
	private String rOption;
	private String[] rOptionsList;
	
	private String rOption1;
	private String rOption2;
	private String rOption3;
	
	//�������� ���� select
	private String rOrder;
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		
		/*시작 페이지 계산
		 * ((페이지 번호 -1) / 총 페이지 사이즈 ) * 총 페이지 사이즈 + 1
		 * */
		startPage = ((pageNum-1)/onePageCount)*onePageCount+1;
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
		
		//총 페이지 수 : 총 레코드 수 / 한번에 출력할 페이지 수 를 올림해준다
		totalPage = (int)Math.ceil((double)totalRecord/onePageCount);
	
		if(totalRecord%onePageCount == 0) {
			lastPageRecord = onePageCount;
		}else {
			lastPageRecord = totalRecord%onePageCount;
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
	
	
	public String getrOptions() {
		return rOptions;
	}
	public void setrOptions(String rOptions) {
		this.rOptions = rOptions;
	}
	public String getrOption() {
		return rOption;
	}
	public void setrOption(String rOption) {
		this.rOption = rOption;
	}
	public String[] getrOptionsList() {
		return rOptionsList;
	}
	public void setrOptionsList(String[] rOptionsList) {
		this.rOptionsList = rOptionsList;
		System.out.println("vo 확인 시작 ");
		rOption1 = rOptionsList[0];
		System.out.println("vo 확인 시작 rOptoin1 : "+rOption1);
		rOption2 = rOptionsList[1];
		System.out.println("vo 확인 시작 rOptoin2 : "+rOption2);
		rOption3 = rOptionsList[2];
		System.out.println("vo 확인 시작 rOptoin3 : "+rOption3);
	}
	public String getrOrder() {
		return rOrder;
	}
	public void setrOrder(String rOrder) {
		this.rOrder = rOrder;
	}
	public String getrOption1() {
		return rOption1;
	}
	public void setrOption1(String rOption1) {
		this.rOption1 = rOption1;
	}
	public String getrOption2() {
		return rOption2;
	}
	public void setrOption2(String rOption2) {
		this.rOption2 = rOption2;
	}
	public String getrOption3() {
		return rOption3;
	}
	public void setrOption3(String rOption3) {
		this.rOption3 = rOption3;
	}
	
	
}
