package dao.reservation;

import java.sql.Date;
import java.util.List;

import domain.reservation.Reservation;

public interface ReservationDAO {

	int create(Reservation reserv) throws Exception;

	int delete(int r_no) throws Exception;

	int delete_m_no(int m_no) throws Exception;

	Reservation selectReserv(int r_no) throws Exception;

	List<Object> selectReserv_with_m_no(int m_no) throws Exception;

	List<Object> selectReserv_withDate(int m_no, Date r_viewdate) throws Exception;

	List<Object> selectAllReserv() throws Exception;

	int checkSeat(String r_theater, Date r_viewDate, String r_time, String r_seat, int mv_no) throws Exception;

	List<String> reservedSeat(String r_theater, Date r_viewDate, String r_time, int mv_no);
	
	int cancelAvailable(int r_no) throws Exception;
	
	int updateReservRate(int mv_mv_no);
	
	List<Integer> getMvnoList();
}