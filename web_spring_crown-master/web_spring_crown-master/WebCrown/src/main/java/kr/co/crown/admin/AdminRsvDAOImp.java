package kr.co.crown.admin;

import java.util.List;

public interface AdminRsvDAOImp {
	
	
	
	
	public List<AdminRsvVO> adminRsv(AdminRsvVO pvo);
	
	
	public Integer[] adminRsvCodeSelect(String paymentCode);
	
	public int getTotalPage(AdminRsvVO pvo);
	
	public List<AdminRsvDetailVO> adminRsvInfo(Integer[] rsv_code);

	public AdminSalesVO adminSales();
}
