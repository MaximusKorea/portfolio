package dao.member;

import java.util.List;

import domain.member.Member;
import domain.member.MemberJoinResult;
import domain.member.MemberPointJoinResult;

public interface MemberDao {

	/*create*/
	public int create(Member member) throws Exception;
	
	public int createKakao(Member member) throws Exception;

	
	/*read*/
	public Member readByNo(int no) throws Exception;
	
	public Member readById(String id) throws Exception;
	
	public String findID(Member member) throws Exception;
	
	public String findPW(Member member) throws Exception;
	
	public List<MemberJoinResult> readJoinResult(int startRow, int endRow, int m_no) throws Exception;
	
	public int countReadByMNO(int m_no) throws Exception; 
	
	
 	/*readAll*/
	public List<Member> readAll() throws Exception;
	
	public List<MemberPointJoinResult> readByManager() throws Exception;
	
	
	/*update*/
	public int update(int m_no, String m_password) throws Exception;
	
	public int update(int m_no, int pt_point) throws Exception;

	public int update(Member member) throws Exception;

	public int updatePoint(int m_no, int m_point) throws Exception;
	
	
	/*delete*/
	public int delete(int no) throws Exception;
	
}
