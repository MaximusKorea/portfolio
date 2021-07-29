package dao.member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.member.Member;
import domain.member.MemberJoinResult;
import domain.member.MemberPointJoinResult;
import pagebean.ListResultBeanReserve;

public class MemberDaoImpl implements MemberDao {

	private SqlSession sqlSession;
	 
	public MemberDaoImpl() {
		System.out.println("##1. 생성자 호출");
	}
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("생성된 sqlSession:"+sqlSession);
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int create(Member member) throws Exception {	 
		return sqlSession.insert("createMember",member);
	}
	
	@Override
	public int createKakao(Member member) throws Exception {
		return sqlSession.insert("createKakaoMember", member);
	}

	@Override
	public Member readByNo(int no) throws Exception {
		System.out.println("readByno 호출시의 sqlSession:"+this.sqlSession);
		return sqlSession.selectOne("readByNoMember",no);
	}
	
	@Override
	public Member readById(String id) throws Exception {
		return sqlSession.selectOne("readByIdMember",id);
	}
	
	@Override
	public String findID(Member member) throws Exception {
		return sqlSession.selectOne("findIdMember",member);
	}
	
	@Override
	public String findPW(Member member) throws Exception {
		return sqlSession.selectOne("findPwMember",member);
	}
	
	@Override
	public List<Member> readAll() throws Exception {	 
		return sqlSession.selectList("readAllMember");
	}

	@Override
	public int delete(int no) throws Exception {
		return sqlSession.delete("deleteMember",no);
	}

	@Override
	public List<MemberJoinResult> readJoinResult(int startRow, int endRow, int m_no) throws Exception {
		ListResultBeanReserve listResultBean = new ListResultBeanReserve();
		listResultBean.setStartRowNum(startRow);
		listResultBean.setEndRowNum(endRow);
		listResultBean.setM_no(m_no);
		return sqlSession.selectList("readJoinResult",listResultBean);
	}

	@Override
	public int countReadByMNO(int m_no) throws Exception {
		return sqlSession.selectOne("readCountSeeMvMember", m_no);
	}

	@Override
	public List<MemberPointJoinResult> readByManager() throws Exception {
		return sqlSession.selectList("readByManageMember");
	}

	@Override
	public int update(int m_no, String m_password) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("m_no", m_no);
		inputMap.put("m_password", m_password);
		return sqlSession.update("updateMemberPass", inputMap);
	}

	@Override
	public int update(int m_no, int pt_point) throws Exception {
		HashMap<String,Integer> inputMap = new HashMap<String,Integer>();
		inputMap.put("m_no", m_no);
		inputMap.put("pt_point", pt_point);
		return sqlSession.update("updatePointByManage", inputMap);
	}

	@Override
	public int update(Member member) throws Exception {
		 return sqlSession.update("updateMember",member);
	}

	@Override
	public int updatePoint(int m_no, int m_point) throws Exception {
		HashMap<String,Integer> inputMap = new HashMap<String,Integer>();
		inputMap.put("m_no", m_no);
		inputMap.put("m_point", m_point);
		return sqlSession.update("calcPointMember", inputMap);
	} 

}