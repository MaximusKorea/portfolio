package dao.point;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.point.Point;
import pagebean.ListResultBeanPoint;

public class PointDaoImpl implements PointDao{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int readPageCount(int m_no) {
		return sqlSession.selectOne("readPageCount", m_no);
	}
	
	@Override
	public int create(Point point) throws Exception {
		return sqlSession.insert("createPoint", point);
	}

	@Override
	public Point readByNo(int no) throws Exception {
		return sqlSession.selectOne("readByNoPoint", no);
	}

	@Override
	public List<Point> readByM_noPoint(int startRow, int endRow, int m_no) throws Exception {
		ListResultBeanPoint listResultBean = new ListResultBeanPoint();
		listResultBean.setStartRowNum(startRow);
		listResultBean.setEndRowNum(endRow);
		listResultBean.setM_no(m_no);
		return sqlSession.selectList("readByM_noPoint", listResultBean);
	}

	@Override
	public Point getPointByM_no(int m_no) throws Exception{
		return sqlSession.selectOne("getPointByM_no", m_no);
	}

	@Override
	public Point readRecentColumn(int m_no) throws Exception {
		return sqlSession.selectOne("readRecentPoint", m_no);
	}
	
	@Override
	public int readMAX(int no) throws Exception {
		return sqlSession.selectOne("readMAXPOINT", no);
	}

	@Override
	public List<String> readDate(int no) throws Exception {
		return sqlSession.selectList("readDateFormatter", no);
	}

	@Override
	public int delete(int no) throws Exception {
		return sqlSession.delete("deletePoint", no);
	}
	
}