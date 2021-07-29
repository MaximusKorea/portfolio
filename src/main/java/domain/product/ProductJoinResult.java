package domain.product;

import java.sql.Date;

public class ProductJoinResult {
	private String p_name;
	private String p_image;
	private int p_price;
	private int po_count;
	private Date po_date;
	private int po_no;
	
	public ProductJoinResult() {}
	public ProductJoinResult(String p_name, String p_image, int p_price, int po_count, Date po_date, int po_no) {
		super();
		this.p_name = p_name;
		this.p_image = p_image;
		this.p_price = p_price;
		this.po_count = po_count;
		this.po_date= po_date;
		this.po_no = po_no;
	}

	public int getPo_no() {
		return po_no;
	}

	public void setPo_no(int po_no) {
		this.po_no = po_no;
	}

	public Date getPo_date() {
		return po_date;
	}

	public void setPo_date(Date po_date) {
		this.po_date = po_date;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getPo_count() {
		return po_count;
	}

	public void setPo_count(int po_count) {
		this.po_count = po_count;
	}

	@Override
	public String toString() {
		return "ProductJoinResult [p_name=" + p_name + ", p_image=" + p_image + ", p_price=" + p_price + ", po_count=" + po_count + "]";
	}
	
}