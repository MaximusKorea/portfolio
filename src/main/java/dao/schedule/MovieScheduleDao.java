package dao.schedule;

import java.util.List;
import java.util.Map;

import domain.schedule.MovieSchedule;

public interface MovieScheduleDao {
	
	int create(MovieSchedule movieSchedule) throws Exception;
	
	int update(MovieSchedule movieSchedule) throws Exception;
	
	//상영관,상영날짜,상영시간조건-삭제
	int remove(String mvs_theater, String mvs_date, String mvs_time) throws Exception;
	
	int remove(int mv_no) throws Exception;
	
	//영화번호조건-선택
	List<Map<String, Object>> readMovieScheduleList(int mv_no) throws Exception;
	
	//상영날짜조건-선택
	List<Map<String, Object>> readMovieScheduleList(String mvs_date) throws Exception;
	
	//상영날짜,영화번호조건-선택
	List<Map<String, Object>> readMovieScheduleList(String mvs_date, int mv_no) throws Exception;
	
	//상영날짜,영화번호조건-선택으로 시간만 받아오기
	List<String> readMovieSchedule(String mvs_date, int mv_no) throws Exception;
	
	//상영날짜,상영관조건-선택
	List<String> readScheduleWithTheaterDate(String mvs_theater, String mvs_date) throws Exception;
	
	//상영날짜,상영관조건-선택
	List<String> readScheduleWithMovieTheaterDate(int mv_no, String mvs_theater, String mvs_date) throws Exception;
	
	//영화번호,상영날짜조건- 당일상영 갯수가져오기
	int readByNoCount(int mv_no, String mvs_date) throws Exception;
	
	//영화번호,상영날짜조건- 당일상영 갯수가져오기
	int readByNoCountAll(int mv_no, String mvs_date) throws Exception;
}
