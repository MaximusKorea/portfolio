package domain.movie;

import java.util.Date;

public class Movie {
	private int mv_no;
	private String mv_state;
	private String mv_reserveRate;
	private String mv_name;
	private String mv_director;
	private String mv_actor;
	private String mv_runTime;
	private String mv_info;
	private Date mv_date;
	private String mv_age;
	private String mv_image;
	private String mv_trailer;
	private String mv_genre;
	
	public Movie() {}
	public Movie(int mv_no, String mv_state, String mv_reserveRate, String mv_name, String mv_director, String mv_actor,
			String mv_runTime, String mv_info, Date mv_date, String mv_age, String mv_image, String mv_trailer,
			String mv_genre) {
		super();
		this.mv_no = mv_no;
		this.mv_state = mv_state;
		this.mv_reserveRate = mv_reserveRate;
		this.mv_name = mv_name;
		this.mv_director = mv_director;
		this.mv_actor = mv_actor;
		this.mv_runTime = mv_runTime;
		this.mv_info = mv_info;
		this.mv_date = mv_date;
		this.mv_age = mv_age;
		this.mv_image = mv_image;
		this.mv_trailer = mv_trailer;
		this.mv_genre = mv_genre;
	}

	public int getMv_no() {
		return mv_no;
	}

	public String getMv_state() {
		return mv_state;
	}

	public String getMv_reserveRate() {
		return mv_reserveRate;
	}

	public String getMv_name() {
		return mv_name;
	}

	public String getMv_director() {
		return mv_director;
	}

	public String getMv_actor() {
		return mv_actor;
	}

	public String getMv_runTime() {
		return mv_runTime;
	}

	public String getMv_info() {
		return mv_info;
	}

	public Date getMv_date() {
		return mv_date;
	}

	public String getMv_age() {
		return mv_age;
	}

	public String getMv_image() {
		return mv_image;
	}

	public String getMv_trailer() {
		return mv_trailer;
	}

	public String getMv_genre() {
		return mv_genre;
	}

	public void setMv_no(int mv_no) {
		this.mv_no = mv_no;
	}

	public void setMv_state(String mv_state) {
		this.mv_state = mv_state;
	}

	public void setMv_reserveRate(String mv_reserveRate) {
		this.mv_reserveRate = mv_reserveRate;
	}

	public void setMv_name(String mv_name) {
		this.mv_name = mv_name;
	}

	public void setMv_director(String mv_director) {
		this.mv_director = mv_director;
	}

	public void setMv_actor(String mv_actor) {
		this.mv_actor = mv_actor;
	}

	public void setMv_runTime(String mv_runTime) {
		this.mv_runTime = mv_runTime;
	}

	public void setMv_info(String mv_info) {
		this.mv_info = mv_info;
	}

	public void setMv_date(Date mv_date) {
		this.mv_date = mv_date;
	}

	public void setMv_age(String mv_age) {
		this.mv_age = mv_age;
	}

	public void setMv_image(String mv_image) {
		this.mv_image = mv_image;
	}

	public void setMv_trailer(String mv_trailer) {
		this.mv_trailer = mv_trailer;
	}

	public void setMv_genre(String mv_genre) {
		this.mv_genre = mv_genre;
	}
	
	@Override
	public String toString() {
		return "["+mv_no+"]"+mv_name+"/"+mv_date;
	}
	
}