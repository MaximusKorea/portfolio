package domain.schedule;

public class MovieSchedule {
	private String mvs_theater;
	private String mvs_date;
	private String mvs_time;
	private int mv_no;
	
	public MovieSchedule() {}
	public MovieSchedule(String mvs_theater, String mvs_date, String mvs_time, int mv_no) {
		super();
		this.mvs_theater = mvs_theater;
		this.mvs_date = mvs_date;
		this.mvs_time = mvs_time;
		this.mv_no = mv_no;
	}

	public String getMvs_theater() {
		return mvs_theater;
	}

	public String getMvs_date() {
		return mvs_date;
	}

	public String getMvs_time() {
		return mvs_time;
	}

	public int getMv_no() {
		return mv_no;
	}

	public void setMvs_theater(String mvs_theater) {
		this.mvs_theater = mvs_theater;
	}

	public void setMvs_date(String mvs_date) {
		this.mvs_date = mvs_date;
	}

	public void setMvs_time(String mvs_time) {
		this.mvs_time = mvs_time;
	}

	public void setMv_no(int mv_no) {
		this.mv_no = mv_no;
	}
	
}