package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import domain.member.Member;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListResultBeanBasic;
import service.movie.MovieService;
import service.point.PointService;

@Controller
public class MainController {
	
	private MovieService movieService;
	private PointService pointService;
	
	@Autowired
	public void setMovieService(MovieService movieService){
		this.movieService = movieService;
	}
	
	@Autowired
 	public void setPointService(PointService pointService) {
 		this.pointService = pointService;
 	}
	
	@RequestMapping({"/index", "/", "/main"})
	public String index(Model model, HttpSession session) throws Exception{
		ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, "1"));
		
		Member member = (Member) session.getAttribute("Smember");
		if(member != null) {
			int m_no = member.getM_no();
			int point = pointService.getPointByM_no(m_no).getPt_point();
			
			model.addAttribute("point", point);
		}
		model.addAttribute("movieList", movieList);
		
		return "main/index";
	}

}
