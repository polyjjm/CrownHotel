package kr.co.crown.mypage;



import java.util.List;

import kr.co.crown.board.PagingVO;
import kr.co.crown.member.MemberVO;

public interface MypageDAOImp {
	
	//ȸ������
	public MemberVO memberSelect(MemberVO vo);
	
	//ȸ������
	public int memberUpdate(MemberVO vo);
	
	//��й�ȣ ����
	public int memberUpdate2(String user_pwd2, String user_id);
	
	//ȸ�� Ż��
	public int memberDelete(String user_id);
	
	//��й�ȣ Ȯ��
	public int pwdCheck(String user_id, String user_pwd);
	
	//ȸ��Ż�� Ȯ��
	public int withDrawal(WithDrawalVO vo);
	
	//����ȸ��
	public int totalDate(String user_id);
	
	//�����ϼ�
	public int totalRsv(String user_id);
		
	//�����ݾ�
	public int totalPment(String user_id);
	
	//마이페이지 예약목록 페이징,리스트
	public List<ReservationVO> rsAllSearch(PagingVO pvo);
	//마이페이지 예약목록 레코드
	public int resTotalRecord(PagingVO pvo);
}
