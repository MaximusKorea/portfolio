package domain.reservation;

import java.sql.Date;

public class Reservation {
	private int r_no;
	private String r_theater;
	private Date r_viewDate;
	private String r_time;
	private int r_price;
	private int r_persons;
	private String r_seat;
	private String r_age;
	private int mv_no;
	private int m_no;
	private String mv_name;
	
	public Reservation() {}
	public Reservation(String r_theater, Date r_viewDate, String r_time, int r_price,
						int r_persons, String r_seat, String r_age, int mv_no, int m_no) {
		super();
		this.r_theater = r_theater;
		this.r_viewDate = r_viewDate;
		this.r_time = r_time;
		this.r_price = r_price;
		this.r_persons = r_persons;
		this.r_seat = r_seat;
		this.r_age = r_age;
		this.mv_no = mv_no;
		this.m_no = m_no;
	}
	public Reservation(int r_no, String r_theater, Date r_viewDate, String r_time, int r_price,
						int r_persons, String r_seat, String r_age, int mv_no, int m_no) {
		super();
		this.r_no = r_no;
		this.r_theater = r_theater;
		this.r_viewDate = r_viewDate;
		this.r_time = r_time;
		this.r_price = r_price;
		this.r_persons = r_persons;
		this.r_seat = r_seat;
		this.r_age = r_age;
		this.mv_no = mv_no;
		this.m_no = m_no;
	}
	public Reservation(int r_no, String r_theater, Date r_viewDate, String r_time, int r_price,
						int r_persons, String r_seat, String r_age, int m_no, String mv_name) {
		super();
		this.r_no = r_no;
		this.r_theater = r_theater;
		this.r_viewDate = r_viewDate;
		this.r_time = r_time;
		this.r_price = r_price;
		this.r_persons = r_persons;
		this.r_seat = r_seat;
		this.r_age = r_age;
		this.m_no = m_no;
		this.mv_name = mv_name;
	}
	
	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_theater() {
		return r_theater;
	}

	public void setR_theater(String r_theater) {
		this.r_theater = r_theater;
	}

	public Date getR_viewDate() {
		return r_viewDate;
	}

	public void setR_viewDate(Date r_viewDate) {
		this.r_viewDate = r_viewDate;
	}

	public String getR_time() {
		return r_time;
	}

	public void setR_time(String r_time) {
		this.r_time = r_time;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public int getR_persons() {
		return r_persons;
	}

	public void setR_persons(int r_persons) {
		this.r_persons = r_persons;
	}

	public String getR_seat() {
		return r_seat;
	}

	public void setR_seat(String r_seat) {
		this.r_seat = r_seat;
	}

	public String getR_age() {
		return r_age;
	}

	public void setR_age(String r_age) {
		this.r_age = r_age;
	}

	public int getMv_no() {
		return mv_no;
	}

	public void setMv_no(int mv_no) {
		this.mv_no = mv_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	
	@Override
	public String toString() {
		return "["+r_no+"]"+r_theater+"/"+r_viewDate+"/"+r_time+"/"+r_price+"/"+r_persons+"/"+r_seat+"/"+r_age+"/"+mv_name+"/"+m_no;
	}
	
}