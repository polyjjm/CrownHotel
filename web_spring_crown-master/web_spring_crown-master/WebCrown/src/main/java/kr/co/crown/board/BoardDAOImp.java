package kr.co.crown.board;

import java.util.List;

public interface BoardDAOImp {
	//����¡ ó���Ǵ� �Խ��� ���
	public List<BoardVO> allSelectRecord(PagingVO pvo);
	//���ڵ� �߰�
	public int boardInsert(BoardVO vo);
	//���ڵ� �Ѱ� ����
	public BoardVO selectRecord(int no);
	//���ڵ� ����
	public int updateRecord(int no, String subject, String content);
	//���ڵ� ����
	public int deleteRecord(int no);
	//����¡ ��ü���ڵ� ���ϱ�
	public int getTotalRecord(PagingVO pvo);
	
	
	
	
}
