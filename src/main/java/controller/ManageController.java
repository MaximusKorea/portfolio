package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import domain.member.MemberPointJoinResult;
import domain.movie.Movie;
import domain.movie.MovieRental;
import domain.product.Product;
import domain.schedule.MovieSchedule;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListResultBeanBasic;
import pagebean.ListResultBeanBasicRental;
import pagebean.ListResultBeanProduct;
import service.member.MemberService;
import service.movie.MovieService;
import service.point.PointService;
import service.product.ProductService;
import service.schedule.MovieScheduleService;

@Controller
public class ManageController {

	private MovieService movieService;
	private MemberService memberService;
	private MovieScheduleService movieScheduleService;
	private ProductService productService;
	private PointService pointService;
	
	public ManageController() {
		System.out.println("### ManageController()");
	}
	
	public MovieService getMovieService() {
		return movieService;
	}

	@Autowired
	public void setMovieService(MovieService movieService) {
		this.movieService = movieService;
	}
	
	public MemberService getMemberService() {
		return memberService;
	}

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public MovieScheduleService getMovieScheduleService() {
		return movieScheduleService;
	}

	@Autowired
	public void setMovieScheduleService(MovieScheduleService movieScheduleService) {
		this.movieScheduleService = movieScheduleService;
	}
	
	public ProductService getProductService() {
		return productService;
	}

	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public PointService getPointService() {
		return pointService;
	}
	
	@Autowired
	public void setPointService(PointService pointService) {
		this.pointService = pointService;
	}

	@RequestMapping(value = "/manage")
	public String manage_login_form(Model model) throws Exception {
		ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, "1")); 
		model.addAttribute("movieList", movieList);
		return "manage/manage_login_form";
	}
	
	@RequestMapping(value = "/manage_main")
	public String manage_main(Model model) throws Exception {
		ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, "1")); 
		model.addAttribute("movieList", movieList);
		return "manage/manage_main";
	}

	@RequestMapping(value = "/manage_movie_info")
	public String manage_movie_info(Model model) {
		return "manage/manage_movie_info";
	}
	
	@RequestMapping(value = "/manage_movie_info_list")
	public String manage_movie_info_list(Model model, @RequestParam String pageno) throws Exception {
		ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, pageno));
		model.addAttribute("movieList", movieList);		
		return "manage/manage_movie_info_list";
	}
	
	@RequestMapping(value = "/manage_movie_info_action")
	public String manage_movie_info(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String mv_name = request.getParameter("mv_name");
		String mv_state = request.getParameter("mv_state");
		String mv_director = request.getParameter("mv_director");
		String mv_actor = request.getParameter("mv_actor");
		String mv_runTime = request.getParameter("mv_runTime");
		String mv_info = request.getParameter("mv_info");
		java.sql.Date mv_date = java.sql.Date.valueOf(request.getParameter("mv_date"));
	    long temp_date = mv_date.getTime();
		String mv_age = request.getParameter("mv_age");
		String mv_trailer = request.getParameter("mv_trailer");
		String mv_genre = request.getParameter("mv_genre");

		//파일업로드
		String rootPath = "C:\\Users\\HAN\\Desktop\\spr\\spring_workspace\\movieProject\\src\\main\\webapp\\WEB-INF\\resources\\images";
		uploadFile(file, rootPath);
		
		Movie movie = new Movie(0, mv_state, "0", mv_name.trim(), mv_director, mv_actor, mv_runTime, mv_info,
								new Date(temp_date), mv_age, "images/"+file.getOriginalFilename(), mv_trailer, mv_genre);
		System.out.println("movie: "+movie);
		int insertRow = movieService.Create(movie);
		System.out.println("insertRow: "+insertRow);
		if(insertRow!=0){
			return "redirect:manage_movie_info_list?pageno=1";
		}else{
			return "redirect:manage_movie_info";
		}
	}
	
	@RequestMapping(value="/manage_movie_info_detail")
	public String manage_movie_info_detail(HttpServletRequest request, Model model) throws Exception{
		int mv_no = Integer.parseInt(request.getParameter("mv_no"));
		Movie movie = movieService.ReadByNo(mv_no);
		model.addAttribute("movie", movie);
		return "manage/manage_movie_info_detail";
	}
	
	@RequestMapping(value="/manage_movie_info_delete")
	public String manage_movie_info_delete(HttpServletRequest request) throws Exception{
		int mv_no = Integer.parseInt(request.getParameter("mv_no"));
		movieService.Delete(mv_no);
		return "redirect:manage_movie_info_list?pageno=1";
	}
	
	@RequestMapping(value="/manage_movie_info_modify_form")
	public String manage_movie_info_modify_form(HttpServletRequest request, Model model) throws Exception{
		int mv_no = Integer.parseInt(request.getParameter("mv_no"));
		Movie movie = movieService.ReadByNo(mv_no);
		model.addAttribute("movie", movie);
		return "manage/manage_movie_info_modify_form";
	}
	
	@RequestMapping(value="/manage_movie_info_modify_action")
	public String manage_movie_info_modify_action(@RequestParam(value="mv_no") int mv_no,
												@RequestParam(value="mv_name") String mv_name,
												@RequestParam(value="mv_state") String mv_state,
												@RequestParam(value="mv_director") String mv_director,
												@RequestParam(value="mv_actor") String mv_actor,
												@RequestParam(value="mv_runTime") String mv_runTime,
												@RequestParam(value="mv_info") String mv_info,
												@RequestParam(value="mv_date") String date,
												@RequestParam(value="mv_age") String mv_age,
												@RequestParam(value="mv_trailer") String mv_trailer,
												@RequestParam("mv_genre") String mv_genre,
												@RequestParam("file") MultipartFile file) throws Exception{
		System.out.println(mv_no);
		java.sql.Date mv_date = java.sql.Date.valueOf(date);
	    long temp_date = mv_date.getTime();

	    String rootPath = "C:\\Users\\HAN\\Desktop\\spr\\spring_workspace\\movieProject\\src\\main\\webapp\\WEB-INF\\resources\\images";
		uploadFile(file, rootPath);
		
		Movie movie = new Movie(mv_no, mv_state, "0", mv_name.trim(), mv_director, mv_actor, mv_runTime, mv_info,
								new Date(temp_date), mv_age, "images/"+file.getOriginalFilename(), mv_trailer, mv_genre);
		int result = movieService.Update(movie);
		System.out.println("update result: "+result);
		return "redirect:manage_movie_info_detail?mv_no="+mv_no;
	}
	
	@RequestMapping(value="/manage_product_insert")
	public String manage_product_insert(){
		return "manage/manage_product_insert";
	}
	
	@RequestMapping(value = "/manage_product_insert_action")
	public String manage_product_insert(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		String p_name = request.getParameter("p_name");
		int p_price = Integer.parseInt(request.getParameter("p_price"));
		String p_content = request.getParameter("p_content");
		int p_type = Integer.parseInt(request.getParameter("p_type"));
		
		String rootPath = "C:\\Users\\HAN\\Desktop\\spr\\spring_workspace\\movieProject\\src\\main\\webapp\\WEB-INF\\resources\\images";
		uploadFile(file, rootPath);
		
		Product product = new Product(20, p_name, "images/"+file.getOriginalFilename(),p_price, p_content, 0, p_type);
		
		int insertRow = productService.productinsert(product);
		System.out.println("insertRow: "+insertRow);
		if(insertRow!=0){
			return "redirect:manage_product_list?pageno=1";
		}else{
			return "redirect:manage_product_insert";
		}
	}
	
	@RequestMapping(value="/manage_product_delete")
	public String manage_product_delete(HttpServletRequest request) throws Exception{
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		productService.productdelete(p_no);
		return "redirect:manage_product_list?pageno=1";
	}

	@RequestMapping(value="manage_product_list")
	public String manage_product_list(Model model, @RequestParam String pageno)throws Exception{
		ListResultBeanProduct productlist =productService.productlistAll(new ListPageConfigBeanBasic(5, 5, pageno));
		model.addAttribute("productlist", productlist);
		return"manage/manage_product_list";
	}	
	
	@RequestMapping(value="/manage_product_update_action")
	public String manage_product_update_action(@RequestParam(value="p_no") int p_no,
												@RequestParam(value="p_name") String p_name,
												@RequestParam(value="p_price") int p_price,
												@RequestParam(value="p_content") String p_content,
												@RequestParam(value="p_desc") int p_desc,
												@RequestParam(value="p_type") int p_type,
												@RequestParam("file") MultipartFile file,
												@RequestParam String pageno) throws Exception{
	
		String rootPath = "C:\\Users\\HAN\\Desktop\\spr\\spring_workspace\\movieProject\\src\\main\\webapp\\WEB-INF\\resources\\images";
		uploadFile(file, rootPath);
		
		Product product = new Product(p_no, p_name, "images/"+file.getOriginalFilename(), p_price, p_content, p_desc, p_type);
		int result = productService.productupdate(product);
		
		return "redirect:manage_product_detail?p_no="+p_no+"&pageno="+pageno;
	}
	
	@RequestMapping(value="manage_product_detail")
	public String manage_product_detail(@RequestParam int p_no,
										Model model,
										@RequestParam String pageno) throws Exception{
		ListResultBeanProduct productdetail = productService.productlistAll(new ListPageConfigBeanBasic(5, 5, pageno));
		for (int i = 0; i < productdetail.getList().size(); i++) {
			if(productdetail.getList().get(i).getP_no()==p_no){
				model.addAttribute("productdetail", productdetail.getList().get(i));
				model.addAttribute("pageno", pageno);
			}
		}
		return "manage/manage_product_detail";
	}
	
	@RequestMapping(value="manage_product_update_form")
	public String manage_product_update_form(@RequestParam int p_no,
											Model model,
											@RequestParam String pageno) throws Exception{
		ListResultBeanProduct productupdate = productService.productlistAll(new ListPageConfigBeanBasic(5, 5, pageno));
		for (int i = 0; i < productupdate.getList().size(); i++) {
			if(productupdate.getList().get(i).getP_no()==p_no){
				model.addAttribute("productupdate", productupdate.getList().get(i));
				model.addAttribute("pageno", pageno);
			}
		}
		return "manage/manage_product_update_form";
	}
	
	@RequestMapping(value="/manage_member_info_list")
	public String manage_member_info_list(Model model) throws Exception{
		List<MemberPointJoinResult> memberList = memberService.showMemberList(); 
		System.out.println("확인 :====>"+memberList);
		model.addAttribute("memberList", memberList);
		return "manage/manage_member_info_list";
	}
	
	@RequestMapping(value="/manage_member_info_detail")
	public String manage_member_info_detail(@RequestParam int m_no , Model model) throws Exception{
		List<MemberPointJoinResult> memberList = memberService.showMemberList(); 

		for(int i=0; i<memberList.size(); i++){
			if(memberList.get(i).getM_no()==m_no){
				model.addAttribute("member", memberList.get(i));
			}
		}
		return "manage/manage_member_info_detail";
	}

	@RequestMapping(value="/manage_member_info_modify_form")
	public String manage_member_info_modify_form(@RequestParam int m_no, Model model) throws Exception{
		
		List<MemberPointJoinResult> memberList = memberService.showMemberList(); 
		for(int i=0; i<memberList.size(); i++){
			if(memberList.get(i).getM_no()==m_no){
				model.addAttribute("member", memberList.get(i));
			}
		} 
		return "manage/manage_member_info_modify";
	}
	
	@RequestMapping(value="/manage_member_info_modify_action")
	public String manage_member_info_modify_action(@RequestParam int m_no,
													@RequestParam String m_password,
													@RequestParam int m_point,
													Model model) throws Exception{
		memberService.memberInfoModify(m_no, m_password);
		memberService.memberInfoModify(m_no, m_point);
		
		List<MemberPointJoinResult> memberList = memberService.showMemberList(); 

		for(int i=0; i<memberList.size(); i++){
			if(memberList.get(i).getM_no()==m_no){
				model.addAttribute("member", memberList.get(i));
			}
		} 
		return "manage/manage_member_info_detail";
	}
	
	@RequestMapping(value="/managa_member_info_delete")
	public String manage_member_info_delete(@RequestParam int m_no) throws Exception{
		pointService.pointOut(m_no);
		memberService.memberOut(m_no);
		return "redirect:manage_member_info_list";
	}
	
	/***** 로그인 *****/
	@RequestMapping(value = "/manage_login_action")
	public String manage_login_action(@RequestParam String userId,
									@RequestParam String password,
									HttpSession session) {
		System.out.println(userId);
		if (userId.equals("admin") && password.equals("admin")) {
			session.setAttribute("sUserId", userId);
			return "redirect:manage_main";
		}
		return "redirect:manage";
	}

	@RequestMapping(value = "/manage_logout_action")
	public String manage_logout_action(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:manage";
	}
	
	/***** 스케쥴 *****/
	@RequestMapping(value = "/manage_schedule_info_list")
	public String manage_schedule_info_list(Model model, @RequestParam String pageno) throws Exception{
		ListResultBeanBasic movieList = movieService.ReadAll(new ListPageConfigBeanBasic(10, 5, pageno));
		model.addAttribute("movieList", movieList);
		return "manage/manage_schedule_info_list";
	}
	
	@RequestMapping(value = "/manage_schedule_info_detail")
	public String manage_schedule_info_detail(@RequestParam int mv_no, Model model) throws Exception{
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Movie movie = movieService.ReadByNo(mv_no);
		int count = movieScheduleService.readByNoCount(mv_no, format.format(date));
		int countAll = movieScheduleService.readByNoCountAll(mv_no, format.format(date));
		model.addAttribute("movie", movie);
		model.addAttribute("count", count);
		model.addAttribute("countAll", countAll);
		return "manage/manage_schedule_info_detail";
	}
	
	@RequestMapping(value = "/manage_schedule_create_form")
	public String manage_schedule_create_form(@RequestParam int mv_no, Model model) throws Exception{
		Movie movie = movieService.ReadByNo(mv_no);
		model.addAttribute("movie", movie);
		model.addAttribute("msg",0);
		return "manage/manage_schedule_create_form";
	}
	
	@RequestMapping(value = "/manage_schedule_delete_form")
	public String manage_schedule_delete_form(@RequestParam int mv_no, Model model) throws Exception{
		Movie movie = movieService.ReadByNo(mv_no);
		model.addAttribute("movie", movie);
		model.addAttribute("msg",0);
		return "manage/manage_schedule_delete_form";
	}
	
	@RequestMapping(value = "/manage_schedule_create")
	public String manage_schedule_create(@RequestParam(value="no") int mv_no,
										 @RequestParam(value="date") String mvs_date,
										 @RequestParam(value="theater") String mvs_theater,
										 @RequestParam(value="time") String mvs_time,
										 Model model) throws Exception{
		
		MovieSchedule movieSchedule = new MovieSchedule(mvs_theater, mvs_date, mvs_time, mv_no);
		movieScheduleService.Create(movieSchedule);
		
		System.out.println(mvs_theater);
		System.out.println(mvs_date);
		System.out.println(mvs_time);
		System.out.println(mv_no);
		
		Movie movie = movieService.ReadByNo(mv_no);
		String msg = mvs_date + " / " + mvs_theater + " / " + mvs_time + "의 일정이 추가되었습니다.";
		model.addAttribute("movie", movie);
		model.addAttribute("msg", msg);
		return "manage/manage_schedule_create_form";
	}
	
	@RequestMapping(value = "/manage_schedule_delete")
	public String manage_schedule_delete(@RequestParam(value="no") int mv_no,
										 @RequestParam(value="date") String mvs_date,
										 @RequestParam(value="theater") String mvs_theater,
										 @RequestParam(value="time") String mvs_time,
										 Model model) throws Exception{
		
		Movie movie = movieService.ReadByNo(mv_no);
		movieScheduleService.Delete(mvs_theater, mvs_date, mvs_time);
		model.addAttribute("movie", movie);
		model.addAttribute("msg", "선택한 일정이 삭제되었습니다.");
		return "manage/manage_schedule_delete_form";
	}
	
	/************************ 영화 대여 관리 ****************************/
	@RequestMapping(value = "/manage_movie_rental_list")
	public String manage_movie_rental_list(Model model, @RequestParam String pageno) throws Exception {
		ListResultBeanBasicRental movieRentalList = movieService.ReadRentalAll(new ListPageConfigBeanBasic(10, 5, pageno));
		model.addAttribute("movieRentalList", movieRentalList);
		return "manage/manage_movie_rental_list";
	}
	
	@RequestMapping(value = "/manage_movie_rental")
	public String manage_movie_rental(Model model) {
		return "manage/manage_movie_rental";
	}
	
	@RequestMapping(value = "/manage_movie_rental_action")
	public String manage_movie_rental_action(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String mv_rt_name = request.getParameter("mv_rt_name");
		String mv_rt_state = request.getParameter("mv_rt_state");
		String mv_rt_director = request.getParameter("mv_rt_director");
		String mv_rt_actor = request.getParameter("mv_rt_actor");
		String mv_rt_runTime = request.getParameter("mv_rt_runTime");
		String mv_rt_info = request.getParameter("mv_rt_info");
		java.sql.Date mv_rt_date = java.sql.Date.valueOf(request.getParameter("mv_rt_date"));
	    long temp_date = mv_rt_date.getTime();
		String mv_rt_age = request.getParameter("mv_rt_age");
		String mv_rt_trailer = request.getParameter("mv_rt_trailer");
		String mv_rt_genre = request.getParameter("mv_rt_genre");

		//파일업로드
		String rootPath = "C:\\Users\\HAN\\Desktop\\spr\\spring_workspace\\movieProject\\src\\main\\webapp\\WEB-INF\\resources\\images";
		uploadFile(file, rootPath);
		
		MovieRental movieRental = new MovieRental(0, mv_rt_state, "0", mv_rt_name.trim(), mv_rt_director, mv_rt_actor, mv_rt_runTime, mv_rt_info,
								new Date(temp_date), mv_rt_age, "images/"+file.getOriginalFilename(), mv_rt_trailer, mv_rt_genre);
		System.out.println("movieRental: "+movieRental);
		int insertRow = movieService.CreateRental(movieRental);
		System.out.println("insertRow: "+insertRow);
		if(insertRow!=0){
			return "redirect:manage_movie_rental_list?pageno=1";
		}else{
			return "redirect:manage_movie_rental";
		}
	}
	
	@RequestMapping(value="/manage_movie_rental_detail")
	public String manage_movie_rental_detail(HttpServletRequest request, Model model) throws Exception{
		int mv_rt_no = Integer.parseInt(request.getParameter("mv_rt_no"));
		MovieRental movieRental = movieService.ReadRentalByNo(mv_rt_no);
		model.addAttribute("movieRental", movieRental);
		return "manage/manage_movie_rental_detail";
	}
	
	@RequestMapping(value="/manage_movie_rental_delete")
	public String manage_movie_rental_delete(HttpServletRequest request) throws Exception{
		int mv_rt_no = Integer.parseInt(request.getParameter("mv_rt_no"));
		movieService.DeleteRental(mv_rt_no);
		return "redirect:manage_movie_rental_list?pageno=1";
	}
	
	@RequestMapping(value="/manage_movie_rental_modify_form")
	public String manage_movie_rental_modify_form(HttpServletRequest request, Model model) throws Exception{
		int mv_rt_no = Integer.parseInt(request.getParameter("mv_rt_no"));
		MovieRental movieRental = movieService.ReadRentalByNo(mv_rt_no);
		model.addAttribute("movieRental", movieRental);
		return "manage/manage_movie_rental_modify_form";
	}
	
	@RequestMapping(value="/manage_movie_rental_modify_action")
	public String manage_movie_rental_modify_action(@RequestParam(value="mv_rt_no") int mv_rt_no,
													@RequestParam(value="mv_rt_name") String mv_rt_name,
													@RequestParam(value="mv_rt_state") String mv_rt_state,
													@RequestParam(value="mv_rt_director") String mv_rt_director,
													@RequestParam(value="mv_rt_actor") String mv_rt_actor,
													@RequestParam(value="mv_rt_runTime") String mv_rt_runTime,
													@RequestParam(value="mv_rt_info") String mv_rt_info,
													@RequestParam(value="mv_rt_date") String date,
													@RequestParam(value="mv_rt_age") String mv_rt_age,
													@RequestParam(value="mv_rt_trailer") String mv_rt_trailer,
													@RequestParam("mv_rt_genre") String mv_rt_genre,
													@RequestParam("file") MultipartFile file) throws Exception{
		System.out.println(mv_rt_no);
		java.sql.Date mv_rt_date = java.sql.Date.valueOf(date);
	    long temp_date = mv_rt_date.getTime();

	    String rootPath = "C:\\Users\\HAN\\Desktop\\spr\\spring_workspace\\movieProject\\src\\main\\webapp\\WEB-INF\\resources\\images";
		uploadFile(file, rootPath);
		
		MovieRental movieRental = new MovieRental(mv_rt_no, mv_rt_state, "0", mv_rt_name.trim(), mv_rt_director, mv_rt_actor, mv_rt_runTime, mv_rt_info,
								new Date(temp_date), mv_rt_age, "images/"+file.getOriginalFilename(), mv_rt_trailer, mv_rt_genre);
		int resultRental = movieService.UpdateRental(movieRental);
		System.out.println("update result: "+resultRental);
		return "redirect:manage_movie_rental_detail?mv_rt_no="+mv_rt_no;
	}
	
	
	
	/****** 업로드 ******/
	public void uploadFile(MultipartFile file, String rootPath){
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File(rootPath + File.separator);
				if (!dir.exists())
					dir.mkdirs();
				
				File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
	            System.out.println("절대경로" +serverFile.getAbsolutePath());
	            System.out.println("경로images/"+file.getOriginalFilename());
				
			}catch (Exception e) {}
		}
	}
	
}