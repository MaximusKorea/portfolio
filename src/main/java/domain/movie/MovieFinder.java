package domain.movie;

import java.util.Date;

public class MovieFinder {
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
	
	private String pageno;
	private String s;
	private String kt;
	private String searchtxt;
	private String genre;
	private String indi;
	private String national;
	private String grade;
	private String sdate;
	private String edate;
	private String page;

	public MovieFinder() {}
	public MovieFinder(int mv_no, String mv_state, String mv_reserveRate, String mv_name, String mv_director, String mv_actor,
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
	public MovieFinder(String pageno, String s, String kt, String searchtxt,
						String genre, String indi, String national, String grade,
						String sdate, String edate, String page) {
		super();
		this.pageno = pageno;
		this.s = s;
		this.kt = kt;
		this.searchtxt = searchtxt;
		this.genre = genre;
		this.indi = indi;
		this.national = national;
		this.grade = grade;
		this.sdate = sdate;
		this.edate = edate;
		this.page = page;
	}
	
	public int getMv_no() {
		return mv_no;
	}

	public void setMv_no(int mv_no) {
		this.mv_no = mv_no;
	}

	public String getMv_state() {
		return mv_state;
	}

	public void setMv_state(String mv_state) {
		this.mv_state = mv_state;
	}

	public String getMv_reserveRate() {
		return mv_reserveRate;
	}

	public void setMv_reserveRate(String mv_reserveRate) {
		this.mv_reserveRate = mv_reserveRate;
	}

	public String getMv_name() {
		return mv_name;
	}

	public void setMv_name(String mv_name) {
		this.mv_name = mv_name;
	}

	public String getMv_director() {
		return mv_director;
	}

	public void setMv_director(String mv_director) {
		this.mv_director = mv_director;
	}

	public String getMv_actor() {
		return mv_actor;
	}

	public void setMv_actor(String mv_actor) {
		this.mv_actor = mv_actor;
	}

	public String getMv_runTime() {
		return mv_runTime;
	}

	public void setMv_runTime(String mv_runTime) {
		this.mv_runTime = mv_runTime;
	}

	public String getMv_info() {
		return mv_info;
	}

	public void setMv_info(String mv_info) {
		this.mv_info = mv_info;
	}

	public Date getMv_date() {
		return mv_date;
	}

	public void setMv_date(Date mv_date) {
		this.mv_date = mv_date;
	}

	public String getMv_age() {
		return mv_age;
	}

	public void setMv_age(String mv_age) {
		this.mv_age = mv_age;
	}

	public String getMv_image() {
		return mv_image;
	}

	public void setMv_image(String mv_image) {
		this.mv_image = mv_image;
	}

	public String getMv_trailer() {
		return mv_trailer;
	}

	public void setMv_trailer(String mv_trailer) {
		this.mv_trailer = mv_trailer;
	}

	public String getMv_genre() {
		return mv_genre;
	}

	public void setMv_genre(String mv_genre) {
		this.mv_genre = mv_genre;
	}

	public String getPageno() {
		return pageno;
	}

	public void setPageno(String pageno) {
		this.pageno = pageno;
	}

	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public String getKt() {
		return kt;
	}

	public void setKt(String kt) {
		this.kt = kt;
	}

	public String getSearchtxt() {
		return searchtxt;
	}

	public void setSearchtxt(String searchtxt) {
		this.searchtxt = searchtxt;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getIndi() {
		return indi;
	}

	public void setIndi(String indi) {
		this.indi = indi;
	}

	public String getNational() {
		return national;
	}

	public void setNational(String national) {
		this.national = national;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

}