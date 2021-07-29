package pagebean;

// 리스트 페이지 관련 사용자 설정
public class ListPageConfigBeanBasicFinder{
	
	private int rowCountPerPage;   // 테이블(리스트)당 출력 행수
	private int pageCountPerPage;  // 한페이지에 보여지는 페이지 수
	private String selectPage;     // 선택한 현재 페이지 번호
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
	private String year_start;
	private String year_end;
	private String page;
	
	
	public ListPageConfigBeanBasicFinder() {}
	public ListPageConfigBeanBasicFinder(	int rowCountPerPage, 
								int pageCountPerPage,
								String selectPage,
								String pageno, String s, String kt, String searchtxt,
								String genre, String indi, String national, String grade,
								String sdate, String edate, String year_start, String year_end, String page) {
		this.rowCountPerPage = rowCountPerPage;
		this.pageCountPerPage = pageCountPerPage;
		this.selectPage = selectPage;
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
		this.year_start = year_start;
		this.year_end = year_end;
		this.page = page;
	}
	
	public int getRowCountPerPage() {
		return rowCountPerPage;
	}

	public void setRowCountPerPage(int rowCountPerPage) {
		this.rowCountPerPage = rowCountPerPage;
	}

	public int getPageCountPerPage() {
		return pageCountPerPage;
	}

	public void setPageCountPerPage(int pageCountPerPage) {
		this.pageCountPerPage = pageCountPerPage;
	}

	public String getSelectPage() {
		return selectPage;
	}

	public void setSelectPage(String selectPage) {
		this.selectPage = selectPage;
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

	public String getYear_start() {
		return year_start;
	}

	public void setYear_start(String year_start) {
		this.year_start = year_start;
	}

	public String getYear_end() {
		return year_end;
	}

	public void setYear_end(String year_end) {
		this.year_end = year_end;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

}