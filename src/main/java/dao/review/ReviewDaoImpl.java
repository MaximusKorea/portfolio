package dao.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.review.Review;

public class ReviewDaoImpl implements ReviewDao {
	
	private SqlSession sqlSession;

	public ReviewDaoImpl() {}
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertReview(Review review) throws Exception {
		return sqlSession.insert("insertReview", review);
	}
	
	public List<Review> selectByMvNo(int mv_no) throws Exception { 
		return sqlSession.selectList("selectByMvNo", mv_no);
	}
	
	public List<Object> selectListAll() throws Exception {
		return sqlSession.selectList("selectListAll");
	}	
	
	public Review selectDetail(int rev_no) throws Exception {
		return sqlSession.selectOne("selectDetail", rev_no);
	}

	public int update(Review review) throws Exception {
		return sqlSession.update("update", review);
	}

	public int delete(int rev_no) throws Exception {
		return sqlSession.delete("delete", rev_no);
	}
	
}
