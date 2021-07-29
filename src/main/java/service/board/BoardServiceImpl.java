package service.board;

import java.util.List;

import dao.board.BoardDao;
import domain.board.Board;
import pagebean.ListPageConfigBean;
import pagebean.ListPageConfigBeanContent;
import pagebean.ListPageConfigBeanType;
import pagebean.ListPageConfigBeanTypeWriter;
import pagebean.ListResultBeanContent;
import pagebean.ListResultBeanType;
import pagebean.ListResultBeanTypeWriter;
import pagebean.PageCounterContent;
import pagebean.PageCounterType;
import pagebean.PageCounterTypeWriter;

public class BoardServiceImpl implements BoardService {
	
	private BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	// 게시물생성
	@Override
	public int board_create(Board board) throws Exception {
		int result = boardDao.createBoard(board);
		return result;
	}

	// Read 1개
	@Override
	public Board board_readByNo(int no) throws Exception {
		Board readBoard = boardDao.readByNoBoard(no);
		return readBoard;
	}

	// Read 전체
	@Override
	public ListResultBeanType board_readAll(ListPageConfigBeanType pageConfig) throws Exception {
		int totalRecordCount = boardDao.readCountByType(pageConfig.getBoard_type());
		System.out.println("BoardServiceImpl.board_readAll -> totalRecordCount -->" + totalRecordCount);
		ListResultBeanType resultBean = PageCounterType.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
																	pageConfig.getRowCountPerPage(),
																	pageConfig.getPageCountPerPage(),
																	totalRecordCount,
																	pageConfig.getBoard_type());

		List<Board> boardList = boardDao.board_readAll(resultBean.getStartRowNum(),
														resultBean.getEndRowNum(),
														resultBean.getBoard_type());
		resultBean.setList(boardList);

		return resultBean;
	}

	// Read 전체 writer
	@Override
	public ListResultBeanTypeWriter board_readAll_writer(ListPageConfigBeanTypeWriter pageConfig) throws Exception {
		int totalRecordCount = boardDao.readCountByWriter(pageConfig.getBoard_writer());
		System.out.println("BoardServiceImpl.board_readAll_writer -> totalRecordCount -->" + totalRecordCount);
		ListResultBeanTypeWriter resultBean = PageCounterTypeWriter.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
																				pageConfig.getRowCountPerPage(),
																				pageConfig.getPageCountPerPage(),
																				totalRecordCount,
																				pageConfig.getBoard_type(),
																				pageConfig.getBoard_writer());

		List<Board> boardList = boardDao.board_readAll_writer(resultBean.getStartRowNum(),
															resultBean.getEndRowNum(),
															resultBean.getBoard_type(),
															resultBean.getBoard_writer());
		resultBean.setList(boardList);

		return resultBean;
	}

	// Search 제목
	@Override
	public ListResultBeanType board_searchByTitle(ListPageConfigBean pageConfig) {
		int totalRecordCount = boardDao.board_searchCountByTitle(pageConfig.getBoard_title());
		System.out.println("BoardServiceImpl.board_searchCountByTitle -> totalRecordCount -->" + totalRecordCount);
		ListResultBeanType resultBean = null;
		try {
			resultBean = PageCounterType.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
														pageConfig.getRowCountPerPage(),
														pageConfig.getPageCountPerPage(),
														totalRecordCount,
														pageConfig.getBoard_title());
			List<Board> boardList = boardDao.board_searchByTitle(resultBean.getStartRowNum(),
																resultBean.getEndRowNum(),
																resultBean.getBoard_type());
			resultBean.setList(boardList);
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultBean;
	}
	
	// Search 내용
	@Override
	public ListResultBeanContent board_searchByContent(ListPageConfigBeanContent pageConfig) {
		int totalRecordCount = boardDao.board_searchCountByContent(pageConfig.getBoard_content(),
																	pageConfig.getBoard_type(),
																	pageConfig.getBoard_writer());
		
		System.out.println("BoardServiceImpl.board_searchCountByContent -> totalRecordCount -->" + totalRecordCount);
		ListResultBeanContent resultBean = null;
		try {
			resultBean = PageCounterContent.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
															pageConfig.getRowCountPerPage(),
															pageConfig.getPageCountPerPage(),
															totalRecordCount,
															pageConfig.getBoard_content(),
															pageConfig.getBoard_type(),
															pageConfig.getBoard_writer());
			List<Board> boardList = boardDao.board_searchByContent(resultBean.getStartRowNum(),
																	resultBean.getEndRowNum(),
																	resultBean.getBoard_content(),
																	resultBean.getBoard_type(),
																	resultBean.getBoard_writer());
			resultBean.setList(boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultBean;
	}

	// Search 제목 페이징
	@Override
	public int board_searchCountByTitle(String board_title) {
		return 0;
	}

	// Search 내용 페이징
	@Override
	public int board_searchCountByContent(String board_content) {
		return 0;
	}

	// Read 타입 하나의 페이징
	@Override
	public int board_readCountByType(String board_type) {
		return boardDao.readCountByType(board_type);
	}

	// Read writer 하나의 페이징
	@Override
	public int board_readCountByWriter(String board_writer) {
		return boardDao.readCountByWriter(board_writer);
	}

	// Read 타입 하나의 리스트
	@Override
	public List<Board> board_readBoardType(String board_type) {
		return boardDao.board_readBoardType(board_type);
	}
	
	// 조회수 증가
	@Override
	public int board_update_readCount(Board board) throws Exception {
		return boardDao.updateReadCount(board);
	}

	// Update
	@Override
	public int board_update(Board board) throws Exception {
		int result = boardDao.updateBoard(board);
		return result;
	}

	// Delete
	@Override
	public int board_delete(int no) throws Exception {
		int result = boardDao.deleteBoard(no);
		return result;
	}

	// 답글 작성전에 step증가
	public int board_reply_stepAdd(Board board) throws Exception {
		int result = boardDao.reply_board_stepAdd(board);
		return result;
	}

	// 답글 작성
	@Override
	public int board_reply_create(Board board) throws Exception {
		int result = boardDao.reply_createBoard(board);
		return result;
	}

}
