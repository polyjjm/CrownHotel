package kr.co.crown.admin;

import java.util.List;

public interface AdminRoomTypeDAOImp {
	
	//����Ÿ�� ���
	public int insertRoomTypeRecord(AdminRoomTypeVO vo);
	//����Ÿ�� ��ü ���ڵ� ����
	public List<AdminRoomTypeVO> allSelectRoomTypeRecord(AdminRoomTypePaginVO pvo);
	//ajax ��ü ���ڵ� ����
	public List<AdminRoomTypeVO> allSelectRoomTypeRecordAjax();
	//�� ���ڵ��
	public int getTotalRoomTypeRecord(AdminRoomTypePaginVO pvo);
	//����Ÿ�� �ϳ�����(view)
	public AdminRoomTypeVO selectRoomTypeRecord(int no);
	//����Ÿ�� ���ڵ� ����
	public int deleteRoomTypeRecord(int no);
	//����Ÿ�� ���ڵ� ����
	public int updateRoomTypeRecord(AdminRoomTypeVO vo);
	//���� �̸� �������� (ajax)
	public List<AdminRoomTypeVO> getRoomTypeRecordAjax(String room_type);
	
	//���������� ������ ��ü���ڵ� ����
	public List<AdminRoomTypeVO> viewPageAllSelectRoomTypeRecord(AdminRoomTypePaginVO pvo);

}
