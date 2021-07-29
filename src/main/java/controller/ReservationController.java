package controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.member.Member;
import domain.member.MemberPointJoinResult;
import domain.reservation.Reservation;
import domain.schedule.MovieSchedule;
import service.member.MemberService;
import service.reservation.ReservationService;

@Controller
public class ReservationController {
	
	private ReservationService reservationService;
	private MemberService memberService;

	@Autowired
	public void setReservationService(ReservationService reservationService) {
		this.reservationService = reservationService;
	}
	
	@Autowired
 	public void setMemberService(MemberService memberService) {
 		this.memberService = memberService;
 	}

	public ReservationController() {}

	/**결제 완료**/
	@RequestMapping(value = "/reserv_create", method=RequestMethod.POST)
	public String reserv_insert(@RequestParam(value = "mv_no") int mv_no,
								@RequestParam(value = "mvs_date") String mvs_date,
								@RequestParam(value = "mvs_time") String r_time,
								@RequestParam(value = "mvs_theater") String r_theater,
								@RequestParam(value = "r_count") int r_count,
								@RequestParam(value = "r_scount") int r_scount,
								@RequestParam(value = "price") int price,
								@RequestParam(value = "SelectedSeat") String r_seat,
								HttpSession session) throws Exception {
		
		Member member = (Member) session.getAttribute("Smember");
		int m_no = member.getM_no();
		int r_persons = r_count + r_scount;
		String r_age = "";
		Date r_viewDate = Date.valueOf(mvs_date);
		
		if (r_scount != 0) {
			r_age = "청소년";
		} else {
			r_age = "일반";
		}
		
		Reservation reserv = new Reservation(r_theater, r_viewDate, r_time, price, r_persons, r_seat, r_age, mv_no, m_no);
		int result = reservationService.createReserv(reserv);
		System.out.println("result: " + result);
		
		return "redirect:index";
	}
	
	/**예매 취소**/
	@RequestMapping(value="/reserv_cancel/{r_no}")
	public @ResponseBody int reserv_cancel(@PathVariable(value="r_no") int r_no) throws Exception{
		return reservationService.deleteReserv(r_no);
	}
	
	@RequestMapping(value="/reserv_cancel_ava/{r_no}")
	public @ResponseBody int reserv_cancel_ava(@PathVariable(value="r_no") int r_no) throws Exception{
		return reservationService.cancelAvailable(r_no);
	}
	
	/**좌석 선택**/
	@RequestMapping(value = "/reserv_select_seat", method=RequestMethod.POST)
	public String reserv_select_seat(Model model,
									@RequestParam(value = "movie") int mv_no,
									@RequestParam(value = "date") String mvs_date,
									@RequestParam(value = "time") String mvs_time,
									@RequestParam(value = "theater") String mvs_theater,
									@RequestParam(value = "d_count") String d_count,
									@RequestParam(value = "d_scount") String d_scount,
									@RequestParam(value = "d_price") String d_price) throws Exception {

		MovieSchedule ms = new MovieSchedule(mvs_theater, mvs_date, mvs_time, mv_no);
		model.addAttribute("MovieSchedule", ms);
		// 일반
		model.addAttribute("r_count", d_count);
		// 학생
		model.addAttribute("r_scount", d_scount);
		
		model.addAttribute("price", d_price);
		
		return "reservation/reservation_select_seat";
	}
	
	/**이미 예매가 완료된 좌석 체크**/
	@RequestMapping("/reserv_seat_list/{mv_no}/{mvs_date}/{mvs_time}/{mvs_theater}")
	public @ResponseBody List<String> reserv_basic_info(@PathVariable(value = "mv_no") int mv_no,
														@PathVariable(value = "mvs_date") String mvs_date,
														@PathVariable(value = "mvs_time") String mvs_time,
														@PathVariable(value = "mvs_theater") String mvs_theater) throws Exception {
		System.out.println("mv_no: " + mv_no);
		List<String> reserv_list = reservationService.reservedSeat(mvs_theater, Date.valueOf(mvs_date), mvs_time, mv_no);
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < reserv_list.size(); i++) {
			if (reserv_list.get(i).contains(",")) {
				String[] temp = reserv_list.get(i).split(",");
				for (int j = 0; j < temp.length; j++) {
					list.add(temp[j]);
				}
			} else {
				list.add(reserv_list.get(i));
			}
		}
		return list;
	}
	
	/**좌석 선택 후 정도 패스**/
	@RequestMapping(value = "/reserv_select_seat_action")
	public String reserv_select_seat_action(@RequestParam(value = "mv_no") int mv_no,
											@RequestParam(value = "mvs_date") String mvs_date,
											@RequestParam(value = "mvs_time") String mvs_time,
											@RequestParam(value = "mvs_theater") String mvs_theater,
											@RequestParam(value = "r_count") String d_count,
											@RequestParam(value = "r_scount") String d_scount,
											@RequestParam(value = "price") String d_price,
											HttpServletRequest request,
											Model model) {
		
		String[] choice = request.getParameterValues("S");
		model.addAttribute("mv_no", mv_no);
		model.addAttribute("mvs_date", mvs_date);
		model.addAttribute("mvs_time", mvs_time);
		model.addAttribute("mvs_theater", mvs_theater);
		
		// 일반
		model.addAttribute("r_count", d_count);
		// 학생
		model.addAttribute("r_scount", d_scount);
		
		model.addAttribute("price", d_price);
		model.addAttribute("SelectedSeat", choice);
		
		return "redirect:reserv_pay";
	}

	/**결제 전 예매 정보 확인**/
	@RequestMapping(value = "/reserv_pay")
	public String reserv_pay(@RequestParam(value = "mv_no") int mv_no,
							@RequestParam(value = "mvs_date") String mvs_date,
							@RequestParam(value = "mvs_time") String mvs_time,
							@RequestParam(value = "mvs_theater") String mvs_theater,
							@RequestParam(value = "r_count") String r_count,
							@RequestParam(value = "r_scount") String r_scount,
							@RequestParam(value = "price") String price,
							@RequestParam(value = "SelectedSeat") String[] SelectedSeat,
							HttpSession session,
							Model model) {

		Member member = (Member)session.getAttribute("Smember");
		try {
			List<MemberPointJoinResult> memberList = memberService.showMemberList(); 
			for(int i=0; i<memberList.size(); i++){
				if(memberList.get(i).getM_no() == member.getM_no()){
					model.addAttribute("member", memberList.get(i));
				}
			}
		}catch(Exception e) {}
		
		MovieSchedule ms = new MovieSchedule(mvs_theater, mvs_date, mvs_time, mv_no);
		model.addAttribute("MovieSchedule", ms);
		model.addAttribute("mv_no", mv_no);
		model.addAttribute("mvs_date", mvs_date);
		model.addAttribute("mvs_time", mvs_time);
		model.addAttribute("mvs_theater", mvs_theater);
		model.addAttribute("r_count", r_count);
		model.addAttribute("r_scount", r_scount);
		model.addAttribute("price", price);
		model.addAttribute("SelectedSeat", SelectedSeat);
		
		return "reservation/reservation_pay";
	}
	
	/**예매율 갱신**/
	@RequestMapping(value="/update_reservrate/{mv_no}")
	public @ResponseBody int reserv_update(@PathVariable int mv_no) {
		return reservationService.updateReservRate(mv_no);
	}

	@RequestMapping(value="/getMvnoList")
	public @ResponseBody List<Integer> getMvnoList() {
		return reservationService.getMvnoList();
	}
	
}