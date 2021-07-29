package service.movie;

import java.util.List;

import dao.movie.MovieDao;
import domain.movie.Movie;
import domain.movie.MovieFinder;
import domain.movie.MovieRental;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListPageConfigBeanBasicFinder;
import pagebean.ListResultBeanBasic;
import pagebean.ListResultBeanBasicFinder;
import pagebean.ListResultBeanBasicRental;
import pagebean.PageCounterBasic;
import pagebean.PageCounterBasicFinder;
import pagebean.PageCounterBasicRental;

public class MovieServiceImpl implements MovieService {

	private MovieDao movieDao;
	
	public void setMovieDao(MovieDao movieDao){
		this.movieDao = movieDao;
	}

	@Override
	public int Create(Movie movie) throws Exception {
		return movieDao.create(movie);
	}
	
	@Override
	public int CreateRental(MovieRental movieRental) throws Exception {
		return movieDao.createRental(movieRental);
	}

	@Override
	public int Update(Movie movie) throws Exception {
		return movieDao.update(movie);
	}
	
	@Override
	public int UpdateRental(MovieRental movieRental) throws Exception {
		return movieDao.updateRental(movieRental);
	}

	@Override
	public int Delete(int mv_no) throws Exception {
		System.out.println("1");
		return movieDao.delete(mv_no);
	}
	
	@Override
	public int DeleteRental(int mv_rt_no) throws Exception {
		System.out.println("1");
		return movieDao.deleteRental(mv_rt_no);
	}

	@Override
	public Movie ReadByNo(int mv_no) throws Exception {
		return movieDao.readByNo(mv_no);
	}
	
	@Override
	public MovieRental ReadRentalByNo(int mv_rt_no) throws Exception {
		return movieDao.readRentalByNo(mv_rt_no);
	}

	@Override
	public Movie ReadByName(String mv_name) throws Exception {
		return movieDao.readByName(mv_name);
	}

	@Override
	public int movieCount() throws Exception {
		return movieDao.movieCount();
	}
	
	@Override
	public ListResultBeanBasic ReadAll(ListPageConfigBeanBasic pageConfig) throws Exception {
		int totalRecordCount = movieDao.movieCount();
		ListResultBeanBasic resultBean = PageCounterBasic.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
																		pageConfig.getRowCountPerPage(),
																		pageConfig.getPageCountPerPage(),
																		totalRecordCount);
		System.out.println("totalRecordCount: " + totalRecordCount);
		System.out.println("ListPageConfigBeanBasic.getSelectPage(): " + pageConfig.getSelectPage());
		System.out.println("ListPageConfigBeanBasic.getRowCountPerPage(): " + pageConfig.getRowCountPerPage());
		System.out.println("ListPageConfigBeanBasic.getPageCountPerPage(): " + pageConfig.getPageCountPerPage());
		List<Movie> movieList = movieDao.readAll(resultBean.getStartRowNum(),
												resultBean.getEndRowNum());
		resultBean.setList(movieList);
		
		return resultBean;
	}
	
	@Override
	public ListResultBeanBasicFinder ReadAllFinder(ListPageConfigBeanBasicFinder pageConfig) throws Exception {
		int totalRecordCount = movieDao.movieCount();
		ListResultBeanBasicFinder resultBean = PageCounterBasicFinder.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
																									pageConfig.getRowCountPerPage(),
																									pageConfig.getPageCountPerPage(),
																									totalRecordCount,
																									pageConfig.getPageno(),
																									pageConfig.getS(),
																									pageConfig.getKt(),
																									pageConfig.getSearchtxt(),
																									pageConfig.getGenre(),
																									pageConfig.getIndi(),
																									pageConfig.getNational(),
																									pageConfig.getGrade(),
																									pageConfig.getSdate(),
																									pageConfig.getEdate(),
																									pageConfig.getYear_start(),
																									pageConfig.getYear_end(),
																									pageConfig.getPage());
		
		System.out.println("totalRecordCount: " + totalRecordCount);
		System.out.println("ListPageConfigBeanBasic.getSelectPage(): " + pageConfig.getSelectPage());
		System.out.println("ListPageConfigBeanBasic.getRowCountPerPage(): " + pageConfig.getRowCountPerPage());
		System.out.println("ListPageConfigBeanBasic.getPageCountPerPage(): " + pageConfig.getPageCountPerPage());
		List<MovieFinder> movieList = movieDao.readAllFinder(resultBean.getStartRowNum(),
															resultBean.getEndRowNum(),
															resultBean.getPageno(),
															resultBean.getS(),
															resultBean.getKt(),
															resultBean.getSearchtxt(),
															resultBean.getGenre(),
															resultBean.getIndi(),
															resultBean.getNational(),
															resultBean.getGrade(),
															resultBean.getSdate(),
															resultBean.getEdate(),
															resultBean.getYear_start(),
															resultBean.getYear_end(),
															resultBean.getPage());
		
		resultBean.setListFinder(movieList);

		return resultBean;
	}
	
	@Override
	public ListResultBeanBasicRental ReadRentalAll(ListPageConfigBeanBasic pageConfig) throws Exception {
		int totalRecordCount = movieDao.movieRentalCount();
		ListResultBeanBasicRental resultBean = PageCounterBasicRental.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
																		pageConfig.getRowCountPerPage(),
																		pageConfig.getPageCountPerPage(),
																		totalRecordCount);
		System.out.println("totalRecordCount: " + totalRecordCount);
		System.out.println("ListPageConfigBeanBasic.getSelectPage(): " + pageConfig.getSelectPage());
		System.out.println("ListPageConfigBeanBasic.getRowCountPerPage(): " + pageConfig.getRowCountPerPage());
		System.out.println("ListPageConfigBeanBasic.getPageCountPerPage(): " + pageConfig.getPageCountPerPage());
		List<MovieRental> movieRentalList = movieDao.readRentalAll(resultBean.getStartRowNum(),
																	resultBean.getEndRowNum());
		resultBean.setListRental(movieRentalList);
		
		return resultBean;
	}

}
