package domain.member;

public class Member {
	private int m_no;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_birth;
	private String m_phone;
	private String m_zipcode;
	private String m_address1;
	private String m_address2;
	private String m_email;
	private int m_point;  
	
	public Member() {}
	public Member(String m_name,String m_birth,String m_phone) {
		super();
		this.m_name=m_name;
		this.m_birth=m_birth;
		this.m_phone=m_phone;
	}
	public Member(String m_id,String m_name,String m_birth,String m_phone) {
		super();
		this.m_id = m_id;
		this.m_name=m_name;
		this.m_birth=m_birth;
		this.m_phone=m_phone;
	}
	public Member(int m_no,String m_id,String m_name,String m_email,int m_point) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_name=m_name;
		this.m_email = m_email;
		this.m_point = m_point;
	}
	public Member(int m_no, String m_id, String m_password, String m_name, String m_birth, String m_phone,
			String m_zipcode, String m_address1, String m_address2, String m_email, int m_point) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_phone = m_phone;
		this.m_zipcode = m_zipcode;
		this.m_address1 = m_address1;
		this.m_address2 = m_address2;
		this.m_email = m_email;
		this.m_point = m_point;
	}
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_zipcode() {
		return m_zipcode;
	}

	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}

	public String getM_address1() {
		return m_address1;
	}

	public void setM_address1(String m_address1) {
		this.m_address1 = m_address1;
	}

	public String getM_address2() {
		return m_address2;
	}

	public void setM_address2(String m_address2) {
		this.m_address2 = m_address2;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	
	public boolean isMatchPassword(String m_password){
		boolean isMatch = false;
		if(this.m_password.equals(m_password)) isMatch = true;
		return isMatch;
	}
	
	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name + ", m_birth=" + m_birth
				+ ", m_phone=" + m_phone + ", m_zipcode=" + m_zipcode + ", m_address1=" + m_address1 + ", m_address2=" + m_address2
				+ ", m_email=" + m_email + ", m_point=" + m_point + "]";
	}
	
}
