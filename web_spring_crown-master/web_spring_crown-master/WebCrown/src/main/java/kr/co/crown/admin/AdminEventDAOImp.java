package kr.co.crown.admin;

import java.util.List;

public interface AdminEventDAOImp {
	
	public int insertEvent(AdminEventVO aevo);

	public int getTotalEvent(AdminEventPaginVO aepvo);

	public AdminEventVO selectEvent(int no);

	public List<AdminEventVO> allSelectEvent(AdminEventPaginVO aepvo);

	public int updateEvent(AdminEventVO aevo);

	public int deleteEvent(int no);
	
}
