package pagebean;

import java.util.List;

import domain.movie.MovieFinder;

// 리스트 페이지에서 출력에 필요한 테이블 데이터 및 페이징 처리
public class ListResultBeanBasicFinder {
	private List<MovieFinder> listFinder; // 리스트 데이터 콜렉션
	private int startPageNo; 		// 시작페이지번호
	private int endPageNo; 			// 끝페이지번호
	private int selectPageNo; 		// 선택페이지번호
	private int totalRecordCount; 	// 전체 행수
	private int totalPageCount; 	// 전체 페이지수
	private int previousGroupStartPageNo;// 이전그룹의 시작페이지번호
	private int nextGroupStartPageNo;// 다음그룹의 시작페이지번호
	private boolean showPrevious; 	//이전페이지 보이기 여부
	private boolean showNext; 		//다음페이지 보이기 여부
	private boolean showPreviousGroup;// 이전그룹 보이기 여부
	private boolean showNextGroup;  //다음그룹 보이기 여부
	private boolean showFirst; 		//처음으로 보이기 여부
	private boolean showLast; 		//마지막으로 보이기 여부
	private int startRowNum;
	private int endRowNum;
	
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
	
	public ListResultBeanBasicFinder() {}
	public ListResultBeanBasicFinder(List<MovieFinder> listFinder, int startPageNo, int endPageNo,
										int selectPageNo, int totalRecordCount, int totalPageCount,
										int previousGroupStartPageNo, int nextGroupStartPageNo,
										boolean showPrevious, boolean showNext, boolean showPreviousGroup,
										boolean showNextGroup, boolean showFirst, boolean showLast,
										int startRowNum, int endRowNum) {
		this.listFinder = listFinder;
		this.startPageNo = startPageNo;
		this.endPageNo = endPageNo;
		this.selectPageNo = selectPageNo;
		this.totalRecordCount = totalRecordCount;
		this.totalPageCount = totalPageCount;
		this.previousGroupStartPageNo = previousGroupStartPageNo;
		this.nextGroupStartPageNo = nextGroupStartPageNo;
		this.showPrevious = showPrevious;
		this.showNext = showNext;
		this.showPreviousGroup = showPreviousGroup;
		this.showNextGroup = showNextGroup;
		this.showFirst = showFirst;
		this.showLast = showLast;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}
	public ListResultBeanBasicFinder(List<MovieFinder> listFinder, int startPageNo, int endPageNo,
										int selectPageNo, int totalRecordCount, int totalPageCount,
										int previousGroupStartPageNo, int nextGroupStartPageNo,
										boolean showPrevious, boolean showNext, boolean showPreviousGroup,
										boolean showNextGroup, boolean showFirst, boolean showLast,
										int startRowNum, int endRowNum, 
										String pageno, String s, String kt, String searchtxt,
										String genre, String indi, String national, String grade,
										String sdate, String edate, String year_start, String year_end, String page) {
		this.listFinder = listFinder;
		this.startPageNo = startPageNo;
		this.endPageNo = endPageNo;
		this.selectPageNo = selectPageNo;
		this.totalRecordCount = totalRecordCount;
		this.totalPageCount = totalPageCount;
		this.previousGroupStartPageNo = previousGroupStartPageNo;
		this.nextGroupStartPageNo = nextGroupStartPageNo;
		this.showPrevious = showPrevious;
		this.showNext = showNext;
		this.showPreviousGroup = showPreviousGroup;
		this.showNextGroup = showNextGroup;
		this.showFirst = showFirst;
		this.showLast = showLast;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
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

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public List<MovieFinder> getListFinder() {
		return listFinder;
	}

	public void setListFinder(List<MovieFinder> listFinder) {
		this.listFinder = listFinder;
	}
	
	public int getNextGroupStartPageNo() {
		return nextGroupStartPageNo;
	}

	public void setNextGroupStartPageNo(int nextGroupStartPageNo) {
		this.nextGroupStartPageNo = nextGroupStartPageNo;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCountCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPreviousGroupStartPageNo() {
		return previousGroupStartPageNo;
	}

	public void setPreviousGroupStartPageNo(int previousGroupStartPageNo) {
		this.previousGroupStartPageNo = previousGroupStartPageNo;
	}

	public int getSelectPageNo() {
		return selectPageNo;
	}

	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}

	public boolean isShowFirst() {
		return showFirst;
	}

	public void setShowFirst(boolean showFirst) {
		this.showFirst = showFirst;
	}

	public boolean isShowLast() {
		return showLast;
	}

	public void setShowLast(boolean showLast) {
		this.showLast = showLast;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public boolean isShowNextGroup() {
		return showNextGroup;
	}

	public void setShowNextGroup(boolean showNextGroup) {
		this.showNextGroup = showNextGroup;
	}

	public boolean isShowPrevious() {
		return showPrevious;
	}

	public void setShowPrevious(boolean showPrevious) {
		this.showPrevious = showPrevious;
	}

	public boolean isShowPreviousGroup() {
		return showPreviousGroup;
	}

	public void setShowPreviousGroup(boolean showPreviousGroup) {
		this.showPreviousGroup = showPreviousGroup;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
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

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

}
