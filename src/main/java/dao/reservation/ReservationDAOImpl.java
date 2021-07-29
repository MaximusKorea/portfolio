package dao.reservation;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.reservation.Reservation;

public class ReservationDAOImpl implements ReservationDAO {

	private SqlSession sqlSession;

	private ReservationDAOImpl() {}

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("### ReservationDAOImpl.setSqlSession(" + sqlSession + ")");
		this.sqlSession = sqlSession;
	}

	public Reservation selectReserv(int r_no) throws Exception {
		return sqlSession.selectOne("selectReserv", r_no);
	}

	public List<Object> selectAllReserv() throws Exception {
		return sqlSession.selectList("selectAllReserv");
	}

	public int create(Reservation reserv) throws Exception {
		int insertRowCount = sqlSession.insert("createReserv", reserv);
		return insertRowCount;
	}

	public int delete(int r_no) throws Exception {
		return sqlSession.delete("deleteResev", r_no);
	}

	public int delete_m_no(int m_no) throws Exception {
		return sqlSession.delete("deleteResev_m_no", m_no);
	}

	public List<Object> selectReserv_with_m_no(int m_no) throws Exception {
		return sqlSession.selectList("selectReserv_with_m_no", m_no);
	}

	public List<Object> selectReserv_withDate(int m_no, Date r_viewdate) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("m_no", m_no);
		inputMap.put("r_viewDate", r_viewdate);
		return sqlSession.selectList("selectReserv_withDate", inputMap);
	}

	public int checkSeat(String r_theater, Date r_viewDate, String r_time, String r_seat, int mv_no) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("r_theater", r_theater);
		inputMap.put("r_viewDate", r_viewDate);
		inputMap.put("r_time", r_time);
		inputMap.put("r_seat", "%" + r_seat + "%");
		inputMap.put("mv_no", mv_no);
		return sqlSession.selectOne("checkSeat", inputMap);
	}

	public List<String> reservedSeat(String r_theater, Date r_viewDate, String r_time, int mv_no) {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("r_theater", r_theater);
		inputMap.put("r_viewdate", r_viewDate);
		inputMap.put("r_time", r_time);
		inputMap.put("mv_no", mv_no);
		return sqlSession.selectList("reservedSeat", inputMap);
	}

	public int cancelAvailable(int r_no) throws Exception {
		return sqlSession.selectOne("cancelAvailable", r_no);
	}
	
	public int updateReservRate(int mv_no){
		if(sqlSession.selectOne("updateReservRate", mv_no) == null){
			return 0;
		}else{
			return sqlSession.selectOne("updateReservRate", mv_no);
		}
	}
	
	@Override
	public List<Integer> getMvnoList() {
		return sqlSession.selectList("getMvnoList");
	}
}
