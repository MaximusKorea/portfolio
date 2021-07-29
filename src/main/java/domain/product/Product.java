package domain.product;

public class Product {
	private int p_no;
	private String p_name;
	private String p_image;
	private int p_price;
	private String p_content;
	private int p_desc;
	private int p_type;
	
	public Product() {}
	public Product(int p_no, String p_name, String p_image, int p_price, String p_content, int p_desc, int p_type) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_image = p_image;
		this.p_price = p_price;
		this.p_content = p_content;
		this.p_desc = p_desc;
		this.p_type = p_type;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
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

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public int getP_desc() {
		return p_desc;
	}

	public void setP_desc(int p_desc) {
		this.p_desc = p_desc;
	}

	public int getP_type() {
		return p_type;
	}

	public void setP_type(int p_type) {
		this.p_type = p_type;
	}
	
	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_name=" + p_name + ", p_image=" + p_image + ", p_price=" + p_price
				+ ", p_content=" + p_content + ", p_desc=" + p_desc + ", p_type=" + p_type + "]";
	}
    
}