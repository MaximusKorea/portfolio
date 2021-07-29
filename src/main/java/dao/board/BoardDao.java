package dao.board;

import java.util.List;

import domain.board.Board;

public interface BoardDao {

	// Create
	int createBoard(Board board) throws Exception;

	// Read 1개
	Board readByNoBoard(int no) throws Exception;

	// Read 전체 리스트
	List<Board> board_readAll(int startRow, int endRow, String board_type) throws Exception;

	// Read 전체 Writer
	List<Board> board_readAll_writer(int startRow, int endRow, String board_type, String board_writer) throws Exception;

	// Search 제목
	List<Board> board_searchByTitle(int startRow, int endRow, String board_title);

	// Search 내용
	List<Board> board_searchByContent(int startRow, int endRow, String board_content, String board_type, String board_writer);

	// Read 타입 하나의 리스트
	List<Board> board_readBoardType(String board_type);

	// Search 제목 페이징
	int board_searchCountByTitle(String board_title);

	// Search 내용 페이징
	int board_searchCountByContent(String board_content, String board_type, String board_writer);

	// Read 타입 하나의 페이징
	int readCountByType(String board_type);

	// Read writer 하나의 페이징
	int readCountByWriter(String board_writer);

	// 조회수 증가
	int updateReadCount(Board board) throws Exception;

	// Update
	int updateBoard(Board board) throws Exception;

	// Delete
	int deleteBoard(int no) throws Exception;

	// 전체 페이지 번호
	int totalPageCountBoard() throws Exception;

	// 답글 작성전에 step증가
	public int reply_board_stepAdd(Board board) throws Exception;

	// 답글 작성
	int reply_createBoard(Board board) throws Exception;

}