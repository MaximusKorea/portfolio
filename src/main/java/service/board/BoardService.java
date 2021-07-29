package service.board;

import java.util.List;

import domain.board.Board;
import pagebean.ListPageConfigBean;
import pagebean.ListPageConfigBeanContent;
import pagebean.ListPageConfigBeanType;
import pagebean.ListPageConfigBeanTypeWriter;
import pagebean.ListResultBeanContent;
import pagebean.ListResultBeanType;
import pagebean.ListResultBeanTypeWriter;

public interface BoardService {

	// 게시물생성
	int board_create(Board board) throws Exception;

	// Read 1개
	Board board_readByNo(int no) throws Exception;

	// Read 전체 리스트
	ListResultBeanType board_readAll(ListPageConfigBeanType pageConfig) throws Exception;

	// Read 전체 writer
	ListResultBeanTypeWriter board_readAll_writer(ListPageConfigBeanTypeWriter pageConfig) throws Exception;

	// Read 타입 하나의 리스트
	List<Board> board_readBoardType(String board_type);

	// Search 제목
	ListResultBeanType board_searchByTitle(ListPageConfigBean pageConfig);

	// Search 내용
	ListResultBeanContent board_searchByContent(ListPageConfigBeanContent pageConfig);

	// Search 제목 페이징
	int board_searchCountByTitle(String board_title);

	// Search 내용 페이징
	int board_searchCountByContent(String board_content);

	// Read 타입 하나의 페이징
	int board_readCountByType(String board_type);

	// Read writer 하나의 페이징
	int board_readCountByWriter(String board_writer);

	// 조회수 증가
	int board_update_readCount(Board board) throws Exception;

	// Update
	int board_update(Board board) throws Exception;

	// Delete
	int board_delete(int no) throws Exception;

	// 답글 작성전에 step증가
	int board_reply_stepAdd(Board board) throws Exception;

	// 답글 작성
	int board_reply_create(Board board) throws Exception;

}