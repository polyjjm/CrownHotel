package kr.co.crown.member;

import java.util.List;
import java.util.Map;

import kr.co.crown.board.BoardVO;
import kr.co.crown.board.PagingVO;

public interface MemberDAOInterface {
	//ȸ������
	public int memberInsert(MemberVO vo);
	//ȸ������ �� ����Ʈ �Է�
	public int pointInsert(PointVO vo1);
	//�α���
	public MemberVO memberlogin(MemberVO vo);
	//���̵� �ߺ� üũ
	public int IdCheck(String user_id);
	//�̸��� �ߺ� üũ
	public int emailCheck(String user_email);
	//���̵� ã��
	public MemberVO idFind(MemberVO vo);
	//��й�ȣ ã��
	public MemberVO pwdFind(MemberVO vo);
	//관리자
	public int passwordCheck(String string, String password);
	//������ ȸ�����
	public List<MemberVO> adminMember(MemberVO vo);
	//������ ����Ʈ ��� ����Ʈ
	public List<PointVO> adminPointList(PagingVO vo);
	//������ ȸ�� ��
	public MemberVO adminMemberView(int member_code);
	//������ ����¡ ó���Ǵ� ȸ�� ���
	public List<MemberVO> adminMemberPaging(PagingVO pvo);
	//������ ����¡ ó���Ǵ� ����Ʈ ���
	public List<PointVO> adminPointPaging(PagingVO pvo);
	//������ ����¡ ��ü���ڵ� ���ϱ�
	public int adminMemberTotal(PagingVO pvo);
	//������ ����Ʈ ����¡ ��ü���ڵ� ���ϱ�
	public int adminPointTotal();
	//������ ����Ʈ ����¡ ��
	public int adminPointRecordTotal(PagingVO pvo);
	//������ ȸ������ ����
	public int adminMemberUpdate(int member_code, String user_name, String country,String user_tel,String user_email,
								 String birthday, String user_id, String user_pwd);
	//������ ȸ������ ����
	public int adminMemberDelete(int member_code);
	//ȸ�� �α��� ��¥
	public int memberLogin(MemberLoginVO vo3);
	
	
	
}
