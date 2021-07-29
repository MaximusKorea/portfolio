package domain.product;

import java.sql.Date;

public class ProductOrder {
	private int m_no;
	private int p_no;
	private int po_no;
	private int po_count;
	private Date po_date;
	private int p_tot;
	
	public ProductOrder() {}
	public ProductOrder(int m_no, int p_no, int po_no, int po_count,int p_tot) {
		super();
		this.m_no = m_no;
		this.p_no = p_no;
		this.po_no = po_no;
		this.po_count = po_count;
		this.p_tot=p_tot;
	}
	
	public int getP_tot() {
		return p_tot;
	}

	public void setP_tot(int p_tot) {
		this.p_tot = p_tot;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getPo_no() {
		return po_no;
	}

	public void setPo_no(int po_no) {
		this.po_no = po_no;
	}

	public int getPo_count() {
		return po_count;
	}

	public void setPo_count(int po_count) {
		this.po_count = po_count;
	}

	public Date getPo_date() {
		return po_date;
	}

	public void setPo_date(Date po_date) {
		this.po_date = po_date;
	}

	@Override
	public String toString() {
		return "ProductOrder [m_no=" + m_no + ", p_no=" + p_no + ", po_no=" + po_no
				+ ", po_count=" + po_count + ", po_date=" + po_date + "]";
	}
	
}