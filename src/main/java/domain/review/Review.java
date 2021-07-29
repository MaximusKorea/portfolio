package domain.review;

import java.util.Date;

public class Review {
	private int rev_no;
	private String rev_title;
	private String rev_content;
	private Date rev_date;
	private int rev_rating;
	private int rev_count;
	private int mv_no;
	private int m_no;
	private String mv_image;
	private String m_id;
	
	public Review() {}
	public Review(int rev_no, String rev_title, String rev_content, int rev_rating) {
		super();
		this.rev_no = rev_no;
		this.rev_title = rev_title;
		this.rev_content = rev_content;
		this.rev_rating = rev_rating;
	}	
	public Review(int rev_no, String rev_title, String rev_content, Date rev_date, int rev_rating, int rev_count) {
		super();
		this.rev_no = rev_no;
		this.rev_title = rev_title;
		this.rev_content = rev_content;
		this.rev_date = rev_date;
		this.rev_rating = rev_rating;
		this.rev_count = rev_count;
	}
	public Review(int rev_no, String rev_title, String rev_content, Date rev_date, int rev_rating, int rev_count, int mv_no, int m_no) {
		super();
		this.rev_no = rev_no;
		this.rev_title = rev_title;
		this.rev_content = rev_content;
		this.rev_date = rev_date;
		this.rev_rating = rev_rating;
		this.rev_count = rev_count;
		this.mv_no = mv_no;
		this.m_no = m_no;
	}	
	public Review(int rev_no, String rev_title, String rev_content, Date rev_date, int rev_rating, int rev_count,
			int mv_no, int m_no, String mv_image) {
		super();
		this.rev_no = rev_no;
		this.rev_title = rev_title;
		this.rev_content = rev_content;
		this.rev_date = rev_date;
		this.rev_rating = rev_rating;
		this.rev_count = rev_count;
		this.mv_no = mv_no;
		this.m_no = m_no;
		this.mv_image = mv_image;
	}
	public Review(int rev_no, String rev_title, String rev_content, Date rev_date, int rev_rating, int rev_count,
			int mv_no, int m_no, String mv_image, String m_id) {
		super();
		this.rev_no = rev_no;
		this.rev_title = rev_title;
		this.rev_content = rev_content;
		this.rev_date = rev_date;
		this.rev_rating = rev_rating;
		this.rev_count = rev_count;
		this.mv_no = mv_no;
		this.m_no = m_no;
		this.mv_image = mv_image;
		this.m_id = m_id;
	}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public String getRev_title() {
		return rev_title;
	}

	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public Date getRev_date() {
		return rev_date;
	}

	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}

	public int getRev_rating() {
		return rev_rating;
	}

	public void setRev_rating(int rev_rating) {
		this.rev_rating = rev_rating;
	}

	public int getRev_count() {
		return rev_count;
	}

	public void setRev_count(int rev_count) {
		this.rev_count = rev_count;
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

	public String getMv_image() {
		return mv_image;
	}

	public void setMv_image(String mv_image) {
		this.mv_image = mv_image;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
}