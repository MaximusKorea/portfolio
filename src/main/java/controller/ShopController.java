package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import domain.member.Member;
import domain.movie.MovieRental;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListResultBeanBasicRental;
import service.movie.MovieService;

@Controller
public class ShopController {
	
	private MovieService movieService;
	
	@Autowired
	public void setMovieService(MovieService movieService) {
		this.movieService = movieService;
	}
	
	@RequestMapping("/shop_list")
	public String shop_list(@RequestParam(value="s_type") int s_type) throws Exception{
		if(s_type == 1)
			return "shop/shop_list_go_1";
		else
			return "shop/shop_list_go_2";
	}
	
	@RequestMapping("/shop_list_choice")
	public String shop_list_choice(Model model, @RequestParam String pageno) throws Exception {
		ListResultBeanBasicRental shopRentalList = movieService.ReadRentalAll(new ListPageConfigBeanBasic(6, 5, pageno));
		model.addAttribute("shopRentalList", shopRentalList);
		
		return "shop/shop_list_choice_go";
	}

	@RequestMapping(value="/shop_rental_view")
	public String shopRentalView(@RequestParam int mv_rt_no, Model model, HttpSession session) throws Exception {
		MovieRental shopRental = movieService.ReadRentalByNo(mv_rt_no);
		model.addAttribute("shopRental", shopRental);
		
		Member member = (Member)session.getAttribute("Smember");
		if(member != null) {
			model.addAttribute("m_no", member.getM_no());
		}
		
		return "shop/shop_rental_view";
	}
	
	@RequestMapping(value="/shop_rental_view_way")
	public String shopRentalViewWay(@RequestParam int mv_rt_no, Model model, HttpSession session, @RequestParam(value = "pay_ok") String pay_ok) throws Exception {
		MovieRental shopRental = movieService.ReadRentalByNo(mv_rt_no);
		model.addAttribute("shopRental", shopRental);
		
		Member member = (Member)session.getAttribute("Smember");
		if(member != null) {
			model.addAttribute("m_no", member.getM_no());
		}
		
		if(pay_ok.equals("pay_success")) {
			model.addAttribute("pay_ok", pay_ok);
		}

		return "shop/shop_rental_view";
	}

	/**대여 완료**/
	@RequestMapping(value = "/reserv_shop")
	public String reserv_shop(@RequestParam(value = "mv_rt_no") int mv_rt_no,
								@RequestParam(value = "mv_rt_name") String mv_rt_name,
								@RequestParam(value = "price") int price,
								@RequestParam(value = "way") String way, 
								Model model,
								RedirectAttributes redirectAttributes) throws Exception {
		
		if(way.equals("pay_success")) {
			redirectAttributes.addFlashAttribute("pay_ok", way);
			return "redirect:shop_rental_view_way?mv_rt_no="+mv_rt_no+"&pay_ok="+way;
		}else {
			return "redirect:shop_rental_view?mv_rt_no="+mv_rt_no;
		}
	}
	
}
