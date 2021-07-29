package controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import domain.member.Member;
import domain.movie.Movie;
import domain.review.Review;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListResultBeanBasic;
import service.movie.MovieService;
import service.review.ReviewService;

@Controller
public class ReviewController {
	
	private ReviewService reviewService;
	private MovieService movieService;
	
	@Autowired
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	@Autowired
	public void setMovieService(MovieService movieService) {
		this.movieService = movieService;
	}

	public ReviewController() {}

	
	/************** LIST **************/
	@RequestMapping(value="/review_list")
	public String review_list(Model model) throws Exception {
		
		ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, "1"));
		model.addAttribute("movieList", movieList);
		
		List<Object> selectListAll = reviewService.selectListAll();
		model.addAttribute("selectListAll", selectListAll);
		
		return "review/review_list";
	}	
	
	/************** DETAIL **************/	
	@RequestMapping(value="/review_view")
	public String review_detail(@RequestParam int rev_no,
								HttpSession session,
								Model model) throws Exception {

		Review review = reviewService.selectDetail(rev_no);
		model.addAttribute("review", review);
		
		Member member = (Member)session.getAttribute("Smember");
		if(member != null) {
			model.addAttribute("m_id", member.getM_id());
		}
		
		return "review/review_view";
	}

	/************** WRITE_FORM **************/
	@RequestMapping(value="/review_writeForm")
	public String review_writeForm(									
									@RequestParam int mv_no,
									HttpSession session,
									Model model) throws Exception {

		Member member = (Member)session.getAttribute("Smember");

		Movie movie = movieService.ReadByNo(mv_no);
		model.addAttribute("movie", movie);

		List<Review> reviewList = reviewService.selectByMvNo(mv_no);
		model.addAttribute("reviewList", reviewList);

		return "review/review_write";
	}
	
	/************** WRITE **************/
	@RequestMapping(value="/review_write")
	public String review_write(@RequestParam String rev_title,
								@RequestParam String rev_content,
								@RequestParam int rev_rating,
								@RequestParam int mv_no,
								@RequestParam int m_no,
								Model model) throws Exception {
		
		Movie movie = movieService.ReadByNo(mv_no);
		model.addAttribute("movie", movie);
				
		int writeRow = reviewService.insertReview(new Review(1, rev_title, rev_content, new Date(), rev_rating, 0, mv_no, m_no));
		
		return "redirect:movie_view?mv_no="+mv_no;
	}
	
	/************** UPDATE **************/
	@RequestMapping(value="/review_modify")
	public String review_update(@RequestParam int rev_no,
								@RequestParam String rev_title,
								@RequestParam int rev_rating,
								@RequestParam String rev_content,								
								Model model) throws Exception {
		
		int updateRow = reviewService.update(new Review(rev_no, rev_title, rev_content, rev_rating));
		
		List<Object> selectListAll = reviewService.selectListAll();
		model.addAttribute("selectListAll", selectListAll);
		
		return "review/review_list";
	}
	
	/************** DELETE **************/
	@RequestMapping(value="/review_delete")
	public String review_delete(@RequestParam int rev_no, Model model) throws Exception {
		
		int deleteRow = reviewService.delete(rev_no);
				
		List<Object> selectListAll = reviewService.selectListAll();
		model.addAttribute("selectListAll", selectListAll);
		
		return "review/review_list";
	}
}
