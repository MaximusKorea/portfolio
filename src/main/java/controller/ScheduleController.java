package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.schedule.MovieScheduleService;

@Controller
public class ScheduleController {

	private MovieScheduleService movieScheduleService;
	
	@Autowired
	public void setMovieScheduleService(MovieScheduleService movieScheduleService) {
		this.movieScheduleService = movieScheduleService;
	}
	
	@RequestMapping("/movie_time_info/{mv_no}/{mvs_date}")
	public @ResponseBody List<String> schedule_basic_info(@PathVariable("mv_no") int mv_no, @PathVariable("mvs_date") String mvs_date) throws Exception {
		List<String> schedule = movieScheduleService.readMovieSchedule(mvs_date, mv_no);
		return schedule;
	}
	
	@RequestMapping("/movie_schedule_info/{mvs_date}/{mvs_theater}")
	public @ResponseBody List<String> schedule_basic_info_create(@PathVariable("mvs_date") String mvs_date,
																@PathVariable("mvs_theater") String mvs_theater) throws Exception {
		List<String> schedule = movieScheduleService.readScheduleWithTheaterDate(mvs_theater, mvs_date);
		return schedule;
	}
	
	
	@RequestMapping("/movie_schedule_info/{mvs_date}/{mvs_theater}/{mv_no}")
	public @ResponseBody List<String> schedule_basic_info_delete(@PathVariable("mv_no") int mv_no,
																@PathVariable("mvs_date") String mvs_date,
																@PathVariable("mvs_theater") String mvs_theater) throws Exception {
		List<String> schedule = movieScheduleService.readScheduleWithMovieTheaterDate(mv_no,mvs_theater, mvs_date);
		return schedule;
	}
	
}
