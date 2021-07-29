package domain.movie;

import java.util.Date;

public class MovieRental {
	private int mv_rt_no;
	private String mv_rt_state;
	private String mv_rt_reserveRate;
	private String mv_rt_name;
	private String mv_rt_director;
	private String mv_rt_actor;
	private String mv_rt_runTime;
	private String mv_rt_info;
	private Date mv_rt_date;
	private String mv_rt_age;
	private String mv_rt_image;
	private String mv_rt_trailer;
	private String mv_rt_genre;
	
	public MovieRental() {}
	public MovieRental(int mv_rt_no, String mv_rt_state, String mv_rt_reserveRate, String mv_rt_name, String mv_rt_director, String mv_rt_actor,
			String mv_rt_runTime, String mv_rt_info, Date mv_rt_date, String mv_rt_age, String mv_rt_image, String mv_rt_trailer, String mv_rt_genre) {
		super();
		this.mv_rt_no = mv_rt_no;
		this.mv_rt_state = mv_rt_state;
		this.mv_rt_reserveRate = mv_rt_reserveRate;
		this.mv_rt_name = mv_rt_name;
		this.mv_rt_director = mv_rt_director;
		this.mv_rt_actor = mv_rt_actor;
		this.mv_rt_runTime = mv_rt_runTime;
		this.mv_rt_info = mv_rt_info;
		this.mv_rt_date = mv_rt_date;
		this.mv_rt_age = mv_rt_age;
		this.mv_rt_image = mv_rt_image;
		this.mv_rt_trailer = mv_rt_trailer;
		this.mv_rt_genre = mv_rt_genre;
	}

	public int getMv_rt_no() {
		return mv_rt_no;
	}

	public void setMv_rt_no(int mv_rt_no) {
		this.mv_rt_no = mv_rt_no;
	}

	public String getMv_rt_state() {
		return mv_rt_state;
	}

	public void setMv_rt_state(String mv_rt_state) {
		this.mv_rt_state = mv_rt_state;
	}

	public String getMv_rt_reserveRate() {
		return mv_rt_reserveRate;
	}

	public void setMv_rt_reserveRate(String mv_rt_reserveRate) {
		this.mv_rt_reserveRate = mv_rt_reserveRate;
	}

	public String getMv_rt_name() {
		return mv_rt_name;
	}

	public void setMv_rt_name(String mv_rt_name) {
		this.mv_rt_name = mv_rt_name;
	}

	public String getMv_rt_director() {
		return mv_rt_director;
	}

	public void setMv_rt_director(String mv_rt_director) {
		this.mv_rt_director = mv_rt_director;
	}

	public String getMv_rt_actor() {
		return mv_rt_actor;
	}

	public void setMv_rt_actor(String mv_rt_actor) {
		this.mv_rt_actor = mv_rt_actor;
	}

	public String getMv_rt_runTime() {
		return mv_rt_runTime;
	}

	public void setMv_rt_runTime(String mv_rt_runTime) {
		this.mv_rt_runTime = mv_rt_runTime;
	}

	public String getMv_rt_info() {
		return mv_rt_info;
	}

	public void setMv_rt_info(String mv_rt_info) {
		this.mv_rt_info = mv_rt_info;
	}

	public Date getMv_rt_date() {
		return mv_rt_date;
	}

	public void setMv_rt_date(Date mv_rt_date) {
		this.mv_rt_date = mv_rt_date;
	}

	public String getMv_rt_age() {
		return mv_rt_age;
	}

	public void setMv_rt_age(String mv_rt_age) {
		this.mv_rt_age = mv_rt_age;
	}

	public String getMv_rt_image() {
		return mv_rt_image;
	}

	public void setMv_rt_image(String mv_rt_image) {
		this.mv_rt_image = mv_rt_image;
	}

	public String getMv_rt_trailer() {
		return mv_rt_trailer;
	}

	public void setMv_rt_trailer(String mv_rt_trailer) {
		this.mv_rt_trailer = mv_rt_trailer;
	}

	public String getMv_rt_genre() {
		return mv_rt_genre;
	}

	public void setMv_rt_genre(String mv_rt_genre) {
		this.mv_rt_genre = mv_rt_genre;
	}
	
	@Override
	public String toString() {
		return "["+mv_rt_no+"]"+mv_rt_state+"/"+mv_rt_reserveRate+"/"+mv_rt_name+"/"
				+mv_rt_director+"/"+mv_rt_actor+"/"+mv_rt_runTime+"/"+mv_rt_info+"/"
				+mv_rt_date+"/"+mv_rt_age+"/"+mv_rt_image+"/"+mv_rt_trailer+"/"+mv_rt_genre;
	}
	
}