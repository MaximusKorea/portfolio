package dao.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.board.Board;
import pagebean.ListPageConfigBeanContent;
import pagebean.ListResultBeanContent;
import pagebean.ListResultBeanType;
import pagebean.ListResultBeanTypeWriter;

public class BoardDaoImpl implements BoardDao {
	
	private SqlSession sqlSession;

	public BoardDaoImpl() {
		System.out.println("##1. 생성자 호출");
	}

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// Create
	@Override
	public int createBoard(Board board) throws Exception {
		return sqlSession.insert("createBoard", board);
	}

	// Read 1개
	@Override
	public Board readByNoBoard(int no) throws Exception {
		return sqlSession.selectOne("readByNoBoard", no);
	}

	// Read 전체
	@Override
	public List<Board> board_readAll(int startRow, int endRow, String board_type) throws Exception {
		ListResultBeanType listResultBean = new ListResultBeanType();
		listResultBean.setStartRowNum(startRow);
		listResultBean.setEndRowNum(endRow);
		listResultBean.setBoard_type(board_type);
		return sqlSession.selectList("board_readAll", listResultBean);
	}

	// Read 전체
	@Override
	public List<Board> board_readAll_writer(int startRow, int endRow, String board_type, String board_writer)
			throws Exception {
		ListResultBeanTypeWriter listResultBean = new ListResultBeanTypeWriter();
		listResultBean.setStartRowNum(startRow);
		listResultBean.setEndRowNum(endRow);
		listResultBean.setBoard_type(board_type);
		listResultBean.setBoard_writer(board_writer);
		return sqlSession.selectList("board_readAll_writer", listResultBean);
	}

	// Read 타입 하나의 리스트
	@Override
	public List<Board> board_readBoardType(String board_type) {
		return sqlSession.selectList("board_readBoardType", board_type);
	}

	// Search 제목
	@Override
	public List<Board> board_searchByTitle(int startRow, int endRow, String board_title) {
		ListResultBeanType listResultBean = new ListResultBeanType();
		listResultBean.setStartRowNum(startRow);
		listResultBean.setEndRowNum(endRow);
		listResultBean.setBoard_type(board_title);
		System.out.println("listResultBean.getBoard_type : " + listResultBean.getBoard_type());
		return sqlSession.selectList("board_searchByTitle", listResultBean);
	}
	
	// Search 내용
	@Override
	public List<Board> board_searchByContent(int startRow,
											int endRow,
											String board_content,
											String board_type,
											String board_writer) {
		ListResultBeanContent listResultBean = new ListResultBeanContent();
		listResultBean.setStartRowNum(startRow);
		listResultBean.setEndRowNum(endRow);
		listResultBean.setBoard_content(board_content);
		listResultBean.setBoard_type(board_type);
		listResultBean.setBoard_writer(board_writer);
		return sqlSession.selectList("board_searchByContent", listResultBean);
	}
	
	// Search 제목 페이징
	public int board_searchCountByTitle(String board_title) {
		return sqlSession.selectOne("board_searchCountByTitle", board_title);
	}

	// Search 내용 페이징
	public int board_searchCountByContent(String board_content, String board_type, String board_writer) {
		ListPageConfigBeanContent pageConfig = new ListPageConfigBeanContent();
		pageConfig.setBoard_content(board_content);
		pageConfig.setBoard_type(board_type);
		pageConfig.setBoard_writer(board_writer);
		return sqlSession.selectOne("board_searchCountByContent", pageConfig);
	}

	// Read 타입 하나의 페이징
	@Override
	public int readCountByType(String board_type) {
		return sqlSession.selectOne("readCountByType", board_type);
	}

	// Read writer 하나의 페이징
	public int readCountByWriter(String board_writer) {
		return sqlSession.selectOne("readCountByWriter", board_writer);
	}

	// 조회수 증가
	@Override
	public int updateReadCount(Board board) throws Exception {
		return sqlSession.update("updateReadCount", board);
	};

	// Update
	@Override
	public int updateBoard(Board board) throws Exception {
		return sqlSession.update("updateBoard", board);
	}

	// Delete 1개
	@Override
	public int deleteBoard(int no) throws Exception {
		return sqlSession.delete("deleteBoard", no);
	}

	// 전체 페이지 번호
	@Override
	public int totalPageCountBoard() throws Exception {
		return sqlSession.selectOne("totalPageCountBoard");
	}

	// 답글 작성전에 step증가
	@Override
	public int reply_board_stepAdd(Board board) throws Exception {
		return sqlSession.update("reply_board_stepAdd", board);
	}

	// 답글 작성
	@Override
	public int reply_createBoard(Board board) throws Exception {
		return sqlSession.insert("reply_createBoard", board);
	}

}
