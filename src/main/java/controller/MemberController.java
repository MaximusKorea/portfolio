package controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import domain.member.Member;
import domain.member.MemberNotFoundException;
import domain.member.PasswordCheck;
import domain.movie.Movie;
import domain.point.Point;
import domain.product.ProductJoinResult;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListPageConfigBeanNo;
import pagebean.ListResultBeanBasic;
import pagebean.ListResultBeanPoint;
import pagebean.ListResultBeanReserve;
import service.member.MemberService;
import service.movie.MovieService;
import service.point.PointService;
import service.product.ProductOrderService;
import util.CaptchaUtil;

@Controller 
public class MemberController {
	
	private MemberService memberService;
	private MovieService movieService;
	private ProductOrderService productOrderService;
	private PointService pointService;

 	@Autowired
 	public void setMemberService(MemberService memberService) {
 		this.memberService = memberService;
 	}
 	
 	@Autowired
 	public void setMovieService(MovieService movieService) {
		this.movieService = movieService;
	}
 	
 	@Autowired
	public void setProductOrderService(ProductOrderService productOrderService) throws Exception {
		this.productOrderService = productOrderService;
	}
 	
 	@Autowired
 	public void setPointService(PointService pointService) {
 		this.pointService = pointService;
 	}
	
	@Autowired
 	private JavaMailSender mailSender;
	
 	/***************** ???????????? ?????? ????????????********************/
 	@RequestMapping("/member_write")
	public String member_write_form() throws Exception{
 		return "member/member_write_go";
	}
 	
	/*******************	 ?????? ??????   *************************/
 	@RequestMapping(value="/member_write_action",method=RequestMethod.POST )
 	public String member_wrtie_action(@ModelAttribute Member m) throws Exception{
 		String m_id = m.getM_id();
 		String m_password = m.getM_password();
 		String m_name = m.getM_name();
 		String m_birth = m.getM_birth();
 		String m_phone = m.getM_phone();
 		String m_zipcode = m.getM_zipcode();
 		String m_address1 = m.getM_address1();
 		String m_address2 = m.getM_address2();
 		String m_email = m.getM_email();
 			 	
 	 	Member member = new Member(0, m_id, m_password, m_name, m_birth, m_phone, m_zipcode, m_address1, m_address2, m_email, 1000);
 		
 		try{
 			memberService.memberJoin(member);
 			pointService.userPoint(new Point(0, member.getM_no(), 1000, 1000, "0", "????????????"));
  		}catch(Exception e){
 			e.printStackTrace();
 		}
 		return "redirect:/main"; 
 	}
 		
 	/*******************    ?????? ??????   *************************/
 	@RequestMapping(value="/member_modify",method=RequestMethod.POST)
 	public String member_modify(Model model, @ModelAttribute Member m) throws Exception{
 		
 		try{
	 		int res = memberService.memberInfoModify(m);
	 		System.out.println("res : " + res);
	 		model.addAttribute("loginMember",m);
 		}catch (Exception e) {
			e.printStackTrace();
		}
 		return "member/menu_go1";
 	}
 	
  	/*******************	?????? ??????   *************************/
  	@RequestMapping("/member_check")
 	public String member_check(@RequestParam String m_id, Model model) throws Exception{
 		System.out.println("???????????? ?????? ????????? ???:"+m_id);
 		Member member = memberService.showMemberOneById(m_id);
 		
 		String op = "true";
 		System.out.println(member);
 		
 		if(member == null){
 			op = "true";
 		}else{
 			op = "false";
 		}
 		model.addAttribute("op",op);
 		return "member/member_check";
 	} 
 	
  	
 	/*******************	???????????? ??????   *************************/
  	@RequestMapping("/pw_check")
  	public String pw_check(@RequestParam String m_password,
  							HttpSession session,
  							Model model) throws Exception{
  		System.out.println("password : *"+m_password);
  		Member member = (Member)session.getAttribute("Smember");
  		
  		boolean isTrue = member.getM_password().equalsIgnoreCase(m_password);
  		System.out.println(isTrue);
  		 
  		model.addAttribute("equalPw",isTrue);
  		return "member/pw_check"; 
  	}
  	
  	/********************   ???????????? ******************/
	@RequestMapping(value="/member_out")
  	public String member_out(HttpSession session) throws Exception{

		Member member = (Member)session.getAttribute("Smember");
		
		pointService.pointOut(member.getM_no());
		memberService.memberOut(member.getM_no());
		session.invalidate();
		
  		return "redirect:/main";
  	}
 	
  	
  	/*******************	????????? ???  *************************/
 	@RequestMapping(value="/member_login")
 	public String member_login_form (){
 		return "/member/member_login_go";
 	}
 	
 	/*******************	?????????   *************************/
 	@RequestMapping(value="/member_login_action", method=RequestMethod.POST)
 	public String member_login_action(@RequestParam String m_id , 
 										@RequestParam String m_pass,
 										HttpSession session,
 										HttpServletRequest request,
 										Model model) {
 		try {
 			String getAnswer = (String) request.getSession().getAttribute("captcha");
 			String answer = request.getParameter("answer");
 			
 			if(getAnswer.equals(answer)){
 				Member loginMember = memberService.login(m_id, m_pass);
 	 			ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, "1"));
 	 			
 	 			int m_no = loginMember.getM_no();
 	 			int point = pointService.getPointByM_no(m_no).getPt_point();
 	 			
 	 			session.setAttribute("Smember", loginMember);
 	 			session.setAttribute("sUserId", m_id);
 	 			model.addAttribute("movieList", movieList);
 	 			model.addAttribute("point", point);
 	 			return "main/index";
 	        }else{
 	        	return "redirect:/member_login";
 	        }
 			
 			
 			
 		} catch (MemberNotFoundException e) {
			model.addAttribute("MSG",e.getMessage());
			return "member/member_login_go";
		} catch (PasswordCheck e) {
			model.addAttribute("MSG1",e.getMessage());
			return "member/member_login_go";
		} catch (Exception e) {
			return "member/member_login_go";
		}
 	}
 	
 	/*******************	????????? ?????????   *************************/
  	@RequestMapping(value="/member_kakaologin_action")
 	public String member_kakaologin_action(	@RequestParam String m_id,
	 										@RequestParam String m_name,
	 										@RequestParam String m_email,
	 										@RequestParam String no,
	 										@RequestParam String pageno,
	 										HttpSession session,
	 										Model model) {
  		try{
  			Member loginMemberCheck = memberService.loginkakao(m_id);

  			if(loginMemberCheck == null) {
  		 	 	Member member = new Member(0, m_id, m_name, m_email, 1000);
  	 	 	
  	 	 		memberService.memberKakaoJoin(member);
  	 	 		pointService.userPoint(new Point(0, member.getM_no(), 1000, 1000, "0", "????????????"));
  	 	 		
  	 	 		kakaoLogin(m_id, session, model);
  			}else {
  				kakaoLogin(m_id, session, model);
  			}
  			//return "main/index";
  			return "redirect:menu?no="+no+"&pageno="+pageno;
 	 		
  		} catch(Exception e){
			e.printStackTrace();
			return "member/member_login_go";
		}
 	}
  	
  	/******************* ??????????????? ????????? ?????????   *************************/
  	@RequestMapping(value="/non_member_login_action")
 	public String non_member_login_action(@RequestParam String m_id , 
 										@RequestParam String m_pass,
 										@RequestParam int mv_no,
 										HttpSession session,
 										Model model) {
 		try {
 			Movie movie =  movieService.ReadByNo(mv_no);
 			Member loginMember=memberService.login(m_id, m_pass);
 			ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, "1"));
 			session.setAttribute("Smember", loginMember);
 			session.setAttribute("sUserId", m_id);
 			model.addAttribute("movieList", movieList);
 			model.addAttribute("movie", movie);
 			
 			return "movie_orders/movie_orders";
 			
 		} catch (MemberNotFoundException e) {
			model.addAttribute("MSG",e.getMessage());
			return "member/member_login_go";
		} catch (PasswordCheck e) {
			model.addAttribute("MSG1",e.getMessage());
			return "member/member_login_go";
		} catch (Exception e) {
			return "member/member_login_go";
		}
 	}
 	
 	/*******************	????????????   *************************/
 	@RequestMapping(value="/member_logout")
 	public String member_logout(HttpSession session, Model model){
 		ListResultBeanBasic movieList;
		try {
			movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, "1"));
	 		model.addAttribute("movieList", movieList);
	 		model.addAttribute("LMSG","2");
	 		session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
 		return "main/index";
 	}
 	
 	/*******************	????????? ?????? ???   *************************/
 	@RequestMapping(value="/member_find")
 	public String member_find_form(){
 		return "member/member_find_go";
 	}
 	
 	/*******************	????????? ?????? *************************/
 	@RequestMapping(value="/findId")
 	public String member_find_action(@RequestParam String m_name,
 									@RequestParam String m_phone,
 									@RequestParam String m_birth,
 									Model model){
 		String msg="";
 		Member findMemberInfo = new Member(m_name, m_birth, m_phone);
 		try {
			String m_id = memberService.memberFindId(findMemberInfo);
			System.out.println("id : "+m_id);
			if(m_id==null){
				msg="";
	 			model.addAttribute("msg",msg);
			}else{
				model.addAttribute("msg",m_id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
 		return "member/findTest";
 	}
 	
	/*******************	?????? ?????? ???   *************************/
 	@RequestMapping(value="/memberpw_find")
 	public String memberpw_find_form(){
 		return "member/memberpw_find_go";
 	}
 
 	/*******************    ?????? ?????? 	   *************************/
 	@RequestMapping(value="/findPw")
 	public String memberpw_find_action(@RequestParam String m_id,
 										@RequestParam String m_name,
 										@RequestParam String m_phone,
 										@RequestParam String m_birth,
 										Model model) {
 		String msg="";
 		Member findMemberInfo = new Member(m_id,m_name,m_birth,m_phone);
 		
 		try {
			String m_password = memberService.memberFindPw(findMemberInfo);
			Member m = memberService.showMemberOneById(findMemberInfo.getM_id());
			if(m_password==null){
				msg = "";
	 			model.addAttribute("msg",msg);
			}else{
				model.addAttribute("msg",findMemberInfo.getM_id());
	 			model.addAttribute("emailAddr",m.getM_email());
	 			model.addAttribute("pwpwpw",m.getM_password());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
 		return "member/findPw";
 	}
 	
 	
	// mail
	@RequestMapping(value = "/mailSending")
	public String mailSending(@RequestParam String email, @RequestParam String pwd) {
		String setfrom = "youiwill1@gmail.com";
		String tomail = email; // ?????? ?????? ?????????
		System.out.println("email :" + email);
		String title = "[CGV ?????? ??????] CGV?????????. ???????????? ?????????????????????.";
		String content = "???????????????" + pwd + "?????????." + "???????????? ???????????? ?????? ??????????????????.";
		System.out.println("pw : " + pwd);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // ??????????????? ??????????????? ?????? ??????????????? ??????
			messageHelper.setTo(tomail); // ???????????? ?????????
			messageHelper.setSubject(title); // ??????????????? ????????? ????????????
			messageHelper.setText(content); // ?????? ??????

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "member/mailSendSuccess";
	}

	/********************* ??????????????? ************************/
	@RequestMapping(value = "/member_mypage")
	public String mypage_go(HttpSession session, Model model) {
		if (session.getAttribute("Smember") == null) return "main/index";
		
		Member m = (Member) session.getAttribute("Smember");
		try {
			System.out.println("****** ????????? ??? ???????????? -> " + m.getM_no());
			int result = memberService.mvSeeCount(m.getM_no());
			Point point = pointService.recentPntInfo(m.getM_no());

			model.addAttribute("mvcount", result);
			model.addAttribute("ptcount", point.getPt_point());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/mypage_go";
	}

	@RequestMapping(value="/menu")
	public String selectedMenu_go(@RequestParam String no,
								@RequestParam String pageno,
								HttpSession session,
								Model model){
		
		if(session.getAttribute("Smember") == null){
			return "main/index";
		}
 		  
		/**********  
		 1. ????????????
		 2. ????????????
		 3. ????????????
		 4. ????????????
		 5. ???????????????
		 **********/ 
 		
		if (no.equals("1")) {
			Member member = (Member) session.getAttribute("Smember");
			model.addAttribute("loginMember", member);
			return "member/menu_go" + no;

		} else if (no.equals("2")) {
			Member member = (Member) session.getAttribute("Smember");
			try {
				ListResultBeanReserve result = memberService.resv_check(new ListPageConfigBeanNo(4, 5, pageno, member.getM_no()));
				model.addAttribute("res", result);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "member/menu_go" + no;

		} else if (no.equals("3")) {
			Member m = (Member) session.getAttribute("Smember");
			try {
				List<ProductJoinResult> po_list = productOrderService.selectAllPOrder(m.getM_no());
				model.addAttribute("po_list", po_list);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "member/menu_go" + no;

		} else if (no.equals("4")) {
			return "member/menu_go" + no;

		} else if (no.equals("5")) {
			try {
				Member member = (Member) session.getAttribute("Smember");
				ListResultBeanPoint list = pointService.userPntInfo(new ListPageConfigBeanNo(7, 5, pageno, member.getM_no()));

				List<String> dateList = pointService.getDateInfo(member.getM_no());

				model.addAttribute("pointList", pointService.userPntInfo(new ListPageConfigBeanNo(7, 5, pageno, member.getM_no())));
				model.addAttribute("dateList", dateList);
				model.addAttribute("size", list.getList().size());
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "member/menu_go" + no;

		} else {
			return "member/menu_go" + 1;
		}
	}
 	 
	@RequestMapping("/movie_join_list/{mv_no}")
	public @ResponseBody Movie movie_join_list(@PathVariable("mv_no") int mv_no) throws Exception {
		return movieService.ReadByNo(mv_no);
	}

	// ????????? ?????????
	public void kakaoLogin(String m_id,
							HttpSession session,
							Model model) throws Exception {
		Member loginMember = memberService.loginkakao(m_id);
		ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, "1"));
		session.setAttribute("Smember", loginMember);
		session.setAttribute("sUserId", m_id);
		model.addAttribute("movieList", movieList);
	}
	
	// ?????? ????????? ??????
	@RequestMapping(value = "captchaImg")
    public void cpatchaImg(HttpServletRequest request, HttpServletResponse response) throws Exception{
        new CaptchaUtil().captchaImg(request, response);
    }
	
    @RequestMapping(value = "captchaAudio")
    public void cpatchaAudio(HttpServletRequest request, HttpServletResponse response) throws Exception{
        new CaptchaUtil().captchaAudio(request, response);
    }
 	 
}