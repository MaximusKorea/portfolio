package pagebean;

// 리스트 페이지 관련 사용자 설정
public class ListPageConfigBeanType{
	
	private int rowCountPerPage;   // 테이블(리스트)당 출력 행수
	private int pageCountPerPage;  // 한페이지에 보여지는 페이지 수
	private String selectPage;     // 선택한 현재 페이지 번호
	private String searchTitle;     // 사용자 선택 검색타입
	private String searchContent;  // 사용자 입력 검색내용
	private String board_type;	   // 게시판 타입
	
	public ListPageConfigBeanType() {}
	public ListPageConfigBeanType(	int rowCountPerPage, 
								int pageCountPerPage,
								String selectPage,
								String searchTitle,
								String searchContent,
								String board_type) {
		this.rowCountPerPage = rowCountPerPage;
		this.pageCountPerPage = pageCountPerPage;
		this.selectPage = selectPage;
		this.searchTitle = searchTitle;
		this.searchContent = searchContent;
		this.board_type = board_type;
	}
	
	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
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

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public String getSearchTitle() {
		return searchTitle;
	}

	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}

	public String getSelectPage() {
		return selectPage;
	}

	public void setSelectPage(String selectPage) {
		this.selectPage = selectPage;
	}
			
}