package kr.co.crown.admin;

import java.util.List;

public interface AdminPackDAOImp {
	
	public int insertPackage(AdminPackVO apvo);

	public int getTotalPack(AdminPackPaginVO appvo);

	public AdminPackVO selectPackage(int no);

	public List<AdminPackVO> allSelectPack(AdminPackPaginVO appvo);

	public int updatePack(AdminPackVO apvo);

	public int deletePack(int no);
	
	//////////////////////////////////////////////////////////////////////
	
	public int selectRoomNum();

	public int selectChkRoomNum();

	public int selectRoomTypeCode(String pack_room_type);

	public String selectRoomTypeName(int pack_code);
}
