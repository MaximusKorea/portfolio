package dao.movie;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import domain.movie.Movie;
import domain.movie.MovieFinder;
import domain.movie.MovieRental;
import pagebean.ListResultBeanBasic;
import pagebean.ListResultBeanBasicFinder;
import pagebean.ListResultBeanBasicRental;

public class MovieDaoImpl implements MovieDao {
	 
	private SqlSession sqlSession;
	 
	public MovieDaoImpl() {
		System.out.println("##1. 생성자 호출");
	}
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("생성된 sqlSession:"+sqlSession);
		this.sqlSession = sqlSession;
	 
	}

	@Override
	public int create(Movie movie) throws Exception {
		return sqlSession.insert("createMovie",movie);
	}
	
	@Override
	public int createRental(MovieRental movieRental) throws Exception {
		return sqlSession.insert("createMovieRental",movieRental);
	}

	@Override
	public int update(Movie movie) throws Exception {
		return sqlSession.update("updateMovie",movie);
	}
	
	@Override
	public int updateRental(MovieRental movieRental) throws Exception {
		return sqlSession.update("updateRentalMovie",movieRental);
	}

	@Override
	public int delete(int mv_no) throws Exception {
		return sqlSession.delete("deleteMovie",mv_no);
	}
	
	@Override
	public int deleteRental(int mv_rt_no) throws Exception {
		return sqlSession.delete("deleteRentalMovie",mv_rt_no);
	}

	@Override
	public Movie readByNo(int mv_no) throws Exception {
		return sqlSession.selectOne("readByNoMovie", mv_no);
	}
	
	@Override
	public MovieRental readRentalByNo(int mv_rt_no) throws Exception {
		return sqlSession.selectOne("readRentalByNoMovie", mv_rt_no);
	}

	@Override
	public Movie readByName(String mv_Name) throws Exception {
		return sqlSession.selectOne("readByNameMovie", mv_Name);
	}

	@Override
	public int movieCount() throws Exception {
		return sqlSession.selectOne("movieCount");
	}
	
	@Override
	public int movieRentalCount() throws Exception {
		return sqlSession.selectOne("movieRentalCount");
	}
	
	@Override
	public List<Movie> readAll(int startRow, int endRow) throws Exception {
		ListResultBeanBasic listResultbean = new ListResultBeanBasic();
		listResultbean.setStartRowNum(startRow);
		listResultbean.setEndRowNum(endRow);
		return sqlSession.selectList("readAllMovie", listResultbean);
	}
	
	@Override
	public List<MovieFinder> readAllFinder(int startRow, int endRow,
											String pageno, String s, String kt, String searchtxt, String genre,
											String indi, String national, String grade, String sdate, String edate,
											String year_start, String year_end, String page) throws Exception {
		
		ListResultBeanBasicFinder listResultbean = new ListResultBeanBasicFinder();
		listResultbean.setStartRowNum(startRow);
		listResultbean.setEndRowNum(endRow);
		listResultbean.setPageno(pageno);
		listResultbean.setS(s);
		listResultbean.setKt(kt);
		listResultbean.setSearchtxt(searchtxt);
		listResultbean.setGenre(genre);
		listResultbean.setIndi(indi);
		listResultbean.setNational(national);
		listResultbean.setGrade(grade);
		listResultbean.setSdate(sdate);
		listResultbean.setEdate(edate);
		listResultbean.setYear_start(year_start);
		listResultbean.setYear_end(year_end);
		listResultbean.setPage(page);
		
		System.out.println("listResultbean.getSearchtxt() : " + listResultbean.getSearchtxt());
		
		return sqlSession.selectList("readFinderAllMovie", listResultbean);
	}

	@Override
	public List<MovieRental> readRentalAll(int startRow, int endRow) throws Exception {
		ListResultBeanBasicRental listResultbean = new ListResultBeanBasicRental();
		listResultbean.setStartRowNum(startRow);
		listResultbean.setEndRowNum(endRow);
		return sqlSession.selectList("readRentalAllMovie", listResultbean);
	}

}
