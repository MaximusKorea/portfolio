package service.reservation;

import java.sql.Date;
import java.util.List;

import dao.reservation.ReservationDAO;
import domain.reservation.Reservation;

public class ReservationServiceImpl implements ReservationService {
	
	private ReservationDAO reservationDAO;
	
	@Override
	public void setReservationDAO(ReservationDAO reservationDAO) {
		this.reservationDAO = reservationDAO;
	}

	/* 예매 정보 보기 */
	// 1. 예매 번호로 조회
	@Override
	public Reservation showReservByR_No(int r_no) throws Exception {
		return reservationDAO.selectReserv(r_no);
	}

	// 2. 회원 번호로 조회
	@Override
	public List<Object> showReservByM_No(int m_no) throws Exception {
		return reservationDAO.selectReserv_with_m_no(m_no);
	}

	// 3. 회원 번호와 날짜로 조회
	@Override
	public List<Object> showReservByM_No_Date(int m_no, Date r_viewdate) throws Exception {
		return reservationDAO.selectReserv_withDate(m_no, r_viewdate);
	}

	/* 전체 예매 내역 확인 */
	@Override
	public List<Object> showAll() throws Exception {
		return reservationDAO.selectAllReserv();
	}

	@Override
	public int countAllReserv() throws Exception {
		return reservationDAO.selectAllReserv().size();
	}

	/* 예매 */
	public int createReserv(Reservation reserv) throws Exception {
		int exisetedReserv = reservationDAO.checkSeat(reserv.getR_theater(),
														reserv.getR_viewDate(),
														reserv.getR_time(),
														reserv.getR_seat(),
														reserv.getMv_no());
		if (exisetedReserv == 0) { // 이미 예매된 좌석이 아닐 때 예매 진행
			return reservationDAO.create(reserv);
		} else { // 이미 예매된 좌석일 때 Exception을 던짐.
			throw new Exception();
		}
	}

	/* 예매 취소 */
	// 1. 예매 번호로 취소. 현재 날짜가 r_viewDate를 지났으면 삭제 불가
	public int deleteReserv(int r_no) throws Exception {
		return reservationDAO.delete(r_no);
	}

	// 2. 회원 번호로 취소. 회원 탈퇴를 했을 경우
	public int deleteReserv_ByM_No(int m_no) throws Exception {
		return reservationDAO.delete_m_no(m_no);
	}

	public int checkSeat(String r_theater, Date r_viewDate, String r_time, String r_seat, int mv_no) throws Exception {
		return reservationDAO.checkSeat(r_theater, r_viewDate, r_time, r_seat, mv_no);
	}

	public List<String> reservedSeat(String r_theater, Date r_viewDate, String r_time, int mv_no) throws Exception {
		return reservationDAO.reservedSeat(r_theater, r_viewDate, r_time, mv_no);
	}

	public int cancelAvailable(int r_no) throws Exception {
		return reservationDAO.cancelAvailable(r_no);
	}

	@Override
	public int updateReservRate(int mv_no) {
		return reservationDAO.updateReservRate(mv_no);
	}

	@Override
	public List<Integer> getMvnoList() {
		return reservationDAO.getMvnoList();
	}
	
}