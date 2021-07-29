package service.schedule;

import java.util.List;
import java.util.Map;

import domain.schedule.MovieSchedule;

public interface MovieScheduleService {
	
	public int Create(MovieSchedule movieSchedule) throws Exception;
	
	public int Delete(String mvs_theater, String mvs_date, String mvs_time) throws Exception;
	
	public int Delete(int mv_no) throws Exception;
	
	public List<Map<String, Object>> readMovieScheduleList(int mv_no) throws Exception;
	
	public List<Map<String, Object>> readMovieScheduleList(String mvs_date) throws Exception;
	
	public List<Map<String, Object>> readMovieScheduleList(String mvs_date, int mv_no) throws Exception;
	
	public List<String> readMovieSchedule(String mvs_date, int mv_no) throws Exception;
	
	public List<String> readScheduleWithTheaterDate(String mvs_theater, String mvs_date) throws Exception;
	
	public List<String> readScheduleWithMovieTheaterDate(int mv_no, String mvs_theater, String mvs_date) throws Exception;
	
	public int readByNoCount(int mv_no, String mvs_date) throws Exception;
	
	public int readByNoCountAll(int mv_no, String mvs_date) throws Exception;
}
