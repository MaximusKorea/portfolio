package pagebean;

// 리스트 페이지 관련 사용자 설정
public class ListPageConfigBean{
	
	private int rowCountPerPage;   // 테이블(리스트)당 출력 행수
	private int pageCountPerPage;  // 한페이지에 보여지는 페이지 수
	private String selectPage;     // 선택한 현재 페이지 번호
	private String board_title;     // 사용자 선택 검색타입
	private String board_content;  // 사용자 입력 검색내용
	public ListPageConfigBean() {}
	public ListPageConfigBean(	int rowCountPerPage, 
								int pageCountPerPage,
								String selectPage,
								String board_title,
								String board_content) {
		this.rowCountPerPage = rowCountPerPage;
		this.pageCountPerPage = pageCountPerPage;
		this.selectPage = selectPage;
		this.board_title = board_title;
		this.board_content = board_content;
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

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getSelectPage() {
		return selectPage;
	}

	public void setSelectPage(String selectPage) {
		this.selectPage = selectPage;
	}
			
}