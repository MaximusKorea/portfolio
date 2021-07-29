package service.schedule;

import java.util.List;
import java.util.Map;

import dao.schedule.MovieScheduleDao;
import domain.schedule.MovieSchedule;

public class MovieScheduleServiceImpl implements MovieScheduleService{

	private MovieScheduleDao movieScheduleDao;

	public void setMovieScheduleDao(MovieScheduleDao movieScheduleDao) {
		this.movieScheduleDao = movieScheduleDao;
	}

	@Override
	public int Create(MovieSchedule movieSchedule) throws Exception {
		return movieScheduleDao.create(movieSchedule);
	}

	@Override
	public int Delete(String mvs_theater, String mvs_date, String mvs_time) throws Exception {
		return movieScheduleDao.remove(mvs_theater, mvs_date, mvs_time);
	}

	@Override
	public int Delete(int mv_no) throws Exception {
		return movieScheduleDao.remove(mv_no);
	}

	@Override
	public List<Map<String, Object>> readMovieScheduleList(int mv_no) throws Exception {
		return movieScheduleDao.readMovieScheduleList(mv_no);
	}

	@Override
	public List<Map<String, Object>> readMovieScheduleList(String mvs_date) throws Exception {
		return movieScheduleDao.readMovieScheduleList(mvs_date);
	}

	@Override
	public List<Map<String, Object>> readMovieScheduleList(String mvs_date, int mv_no) throws Exception {
		return movieScheduleDao.readMovieScheduleList(mvs_date,mv_no);
	}

	@Override
	public List<String> readMovieSchedule(String mvs_date, int mv_no) throws Exception {
		return movieScheduleDao.readMovieSchedule(mvs_date, mv_no);
	}

	@Override
	public List<String> readScheduleWithTheaterDate(String mvs_theater, String mvs_date) throws Exception {
		return movieScheduleDao.readScheduleWithTheaterDate(mvs_theater, mvs_date);
	}

	@Override
	public List<String> readScheduleWithMovieTheaterDate(int mv_no, String mvs_theater, String mvs_date) throws Exception {
		return movieScheduleDao.readScheduleWithMovieTheaterDate(mv_no, mvs_theater, mvs_date);
	}
	
	@Override
	public int readByNoCount(int mv_no, String mvs_date) throws Exception {
		return movieScheduleDao.readByNoCount(mv_no,mvs_date);
	}

	@Override
	public int readByNoCountAll(int mv_no, String mvs_date) throws Exception {
		return movieScheduleDao.readByNoCountAll(mv_no,mvs_date);
	}
	
}