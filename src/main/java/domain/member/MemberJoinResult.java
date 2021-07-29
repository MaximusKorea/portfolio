package domain.member;

import java.sql.Date;

public class MemberJoinResult {
	private int r_no;
	private String r_theater;
	private Date r_viewdate;
	private String r_time;
	private int r_price;
	private int r_persons;
	private String r_seat;
	private String r_age;
	private int mv_no;
	private String mv_name;
	private String mv_runtime;
	private String mv_image;
	
	public MemberJoinResult() {}
	public MemberJoinResult(int r_no, String r_theater, Date r_viewdate, String r_time, int r_price, int r_persons, String r_seat,
			String r_age, int mv_no, String mv_name, String mv_runtime, String mv_image) {
		super();
		this.r_no = r_no;
		this.r_theater = r_theater;
		this.r_viewdate = r_viewdate;
		this.r_time = r_time;
		this.r_price = r_price;
		this.r_persons = r_persons;
		this.r_seat = r_seat;
		this.r_age = r_age;
		this.mv_no = mv_no;
		this.mv_name = mv_name;
		this.mv_runtime = mv_runtime;
		this.mv_image = mv_image;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getMv_no() {
		return mv_no;
	}

	public void setMv_no(int mv_no) {
		this.mv_no = mv_no;
	}

	public String getR_theater() {
		return r_theater;
	}

	public void setR_theater(String r_theater) {
		this.r_theater = r_theater;
	}

	public Date getR_viewdate() {
		return r_viewdate;
	}

	public void setR_viewdate(Date r_viewdate) {
		this.r_viewdate = r_viewdate;
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

	public String getMv_name() {
		return mv_name;
	}

	public void setMv_name(String mv_name) {
		this.mv_name = mv_name;
	}

	public String getMv_runtime() {
		return mv_runtime;
	}

	public void setMv_runtime(String mv_runtime) {
		this.mv_runtime = mv_runtime;
	}

	public String getMv_image() {
		return mv_image;
	}

	public void setMv_image(String mv_image) {
		this.mv_image = mv_image;
	}
	
}