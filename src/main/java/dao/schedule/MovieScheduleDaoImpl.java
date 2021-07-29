package dao.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import domain.schedule.MovieSchedule;

public class MovieScheduleDaoImpl implements MovieScheduleDao {

	private SqlSession sqlSession;
	
	public MovieScheduleDaoImpl() {}
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int create(MovieSchedule movieSchedule) throws Exception {
		return sqlSession.insert("createSchedule", movieSchedule);
	}

	@Override
	public int update(MovieSchedule movieSchedule) throws Exception {
		return sqlSession.update("updateSchedule", movieSchedule);
	}

	@Override
	public int remove(String mvs_theater, String mvs_date, String mvs_time) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("mvs_theater", mvs_theater);
		inputMap.put("mvs_date", mvs_date);
		inputMap.put("mvs_time", mvs_time);
		return sqlSession.delete("deleteSchedule", inputMap);
	}

	@Override
	public int remove(int mv_no) throws Exception {
		return sqlSession.delete("deleteByNoSchedule", mv_no);
	}

	@Override
	public List<Map<String, Object>> readMovieScheduleList(int mv_no) throws Exception {
		return sqlSession.selectList("readByNoSchedule", mv_no);
	}

	@Override
	public List<Map<String, Object>> readMovieScheduleList(String mvs_date) throws Exception {
		return sqlSession.selectList("readByDateSchedule", mvs_date);
	}

	@Override
	public List<Map<String, Object>> readMovieScheduleList(String mvs_date, int mv_no) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("mv_no", mv_no);
		inputMap.put("mvs_date", mvs_date);
		return sqlSession.selectList("readByNoWithDateSchedule", inputMap);
	}

	@Override
	public List<String> readMovieSchedule(String mvs_date, int mv_no) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("mv_no", mv_no);
		inputMap.put("mvs_date", mvs_date);
		return sqlSession.selectList("readSchedule", inputMap);
	}

	@Override
	public List<String> readScheduleWithTheaterDate(String mvs_theater, String mvs_date) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("mvs_theater", mvs_theater);
		inputMap.put("mvs_date", mvs_date);
		return sqlSession.selectList("readScheduleWithTheaterDate",inputMap);
	}

	@Override
	public List<String> readScheduleWithMovieTheaterDate(int mv_no, String mvs_theater, String mvs_date) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("mvs_theater", mvs_theater);
		inputMap.put("mvs_date", mvs_date);
		inputMap.put("mv_no", mv_no);
		return sqlSession.selectList("readScheduleWithMovieTheaterDate", inputMap);
	}

	@Override
	public int readByNoCount(int mv_no, String mvs_date) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("mv_no", mv_no);
		inputMap.put("mvs_date", mvs_date);
		return sqlSession.selectOne("readByNoCount",inputMap);
	}

	@Override
	public int readByNoCountAll(int mv_no, String mvs_date) throws Exception {
		HashMap<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("mv_no", mv_no);
		inputMap.put("mvs_date", mvs_date);
		return sqlSession.selectOne("readByNoCountAll",inputMap);
	}
	
	
}
