package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.member.Member;
import domain.movie.Movie;
import domain.review.Review;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListPageConfigBeanBasicFinder;
import pagebean.ListResultBeanBasic;
import service.movie.MovieService;
import service.review.ReviewService;
import service.schedule.MovieScheduleService;

@Controller
public class MovieController {

	private MovieService movieService;
	private ReviewService reviewService;
	@Autowired private MovieScheduleService movieScheduleService;
	
	@Autowired
	public void setMovieService(MovieService movieService) {
		this.movieService = movieService;
	}
	
	@Autowired
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
/*	
	@RequestMapping(value="/movie_list")
	public String movieList(Model model, @RequestParam String pageno) throws Exception {
		
		ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(6, 5, pageno));
		model.addAttribute("movieList", movieList);
		
		return "movie/movie_list";		
	}
*/
	@RequestMapping(value="/movie_list")
	public String movieList(Model model,
							@RequestParam String pageno,
							@RequestParam(value="s", required=false) String s,
							@RequestParam(value="kt", required=false) String kt,
							@RequestParam(value="searchtxt", required=false) String searchtxt,
							@RequestParam(value="genre", required=false) String genre,
							@RequestParam(value="indi", required=false) String indi,
							@RequestParam(value="national", required=false) String national,
							@RequestParam(value="grade", required=false) String grade,
							@RequestParam(value="sdate", required=false) String sdate,
							@RequestParam(value="edate", required=false) String edate,
							@RequestParam(value="year_start", required=false) String year_start,
							@RequestParam(value="year_end", required=false) String year_end,
							@RequestParam(value="page", required=false) String page
							) throws Exception {
		
		// 검색 안한 상태
		if(s == null) {
			ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(6, 5, pageno));
			model.addAttribute("movieList", movieList);
			return "movie/movie_list";
		}
		
		// 검색 버튼 누른 상태 : search flag 'true'
		if(s.equals("true")) {
			model.addAttribute("movieListFinder", movieService.ReadAllFinder(
					new ListPageConfigBeanBasicFinder(6, 5, pageno, pageno, s, kt, searchtxt, genre, indi, national, grade, sdate, edate, year_start, year_end, page)));
			return "movie/movie_list";
		// 그 외 경우
		}else {
			ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(6, 5, pageno));
			model.addAttribute("movieList", movieList);
			return "movie/movie_list";
		}
	}
	
	
	@RequestMapping(value="/movie_view")
	public String movieView(@RequestParam int mv_no,
							Model model,
							HttpSession session) throws Exception {
		
			Movie movie = movieService.ReadByNo(mv_no);
			model.addAttribute("movie", movie);
			
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			int count = movieScheduleService.readByNoCountAll(mv_no,format.format(date));
			model.addAttribute("count", count);
			
			List<Review> reviewMvNo = reviewService.selectByMvNo(mv_no);
			model.addAttribute("reviewMvNo", reviewMvNo);
			
			Member member = (Member)session.getAttribute("Smember");
			if(member != null) {
				model.addAttribute("m_no", member.getM_no());
			}
		
		return "movie/movie_view";		
	}
	
	@RequestMapping(value="/movie_orders")
	public String movieOrders(@RequestParam int mv_no,
							Model model,
							HttpSession session) throws Exception {
		Movie movie =  movieService.ReadByNo(mv_no);
		
		Member m = (Member) session.getAttribute("Smember");
		model.addAttribute("loginMember", m);
		
		model.addAttribute("movie", movie);
		return "movie_orders/movie_orders";
	}
	
	@RequestMapping("/movie_info/{movie_no}")
	public @ResponseBody Movie movie_basic_info(@PathVariable("movie_no") int movie_no) throws Exception {
		return movieService.ReadByNo(movie_no);
	}
	
	@RequestMapping("/movie_info_name/{movie_name}")
	public @ResponseBody Movie movie_basic_info_name(@PathVariable("movie_name") String movie_name) throws Exception {
		return movieService.ReadByName(movie_name);
	}
	
}
