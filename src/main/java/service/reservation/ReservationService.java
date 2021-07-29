package service.reservation;

import java.sql.Date;
import java.util.List;

import dao.reservation.ReservationDAO;
import domain.reservation.Reservation;

public interface ReservationService {

	void setReservationDAO(ReservationDAO reservationDAO);

	/* 예매 정보 보기 */
	// 1. 예매 번호로 조회
	Reservation showReservByR_No(int r_no) throws Exception;

	// 2. 회원 번호로 조회
	List<Object> showReservByM_No(int m_no) throws Exception;

	// 3. 회원 번호와 날짜로 조회
	List<Object> showReservByM_No_Date(int m_no, Date r_viewdate) throws Exception;

	
	/* 전체 예매 내역 확인 */
	List<Object> showAll() throws Exception;

	int countAllReserv() throws Exception;

	
	/* 예매하기 */
	int createReserv(Reservation reserv) throws Exception;

	
	/* 예매 취소하기 */
	// 1. 예매 번호로 취소. 현재 날짜가 r_viewDate를 지났으면 삭제 불가
	int deleteReserv(int r_no) throws Exception;

	// 2. 회원 번호로 취소. 회원 탈퇴를 했을 경우.
	int deleteReserv_ByM_No(int m_no) throws Exception;

	int checkSeat(String r_theater, Date r_viewDate, String r_time, String r_seat, int mv_no) throws Exception;

	public List<String> reservedSeat(String r_theater, Date r_viewDate, String r_time, int mv_no) throws Exception;

	int cancelAvailable(int r_no) throws Exception;

	int updateReservRate(int mv_no);

	List<Integer> getMvnoList();
}