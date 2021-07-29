package service.movie;

import domain.movie.Movie;
import domain.movie.MovieRental;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListPageConfigBeanBasicFinder;
import pagebean.ListResultBeanBasic;
import pagebean.ListResultBeanBasicFinder;
import pagebean.ListResultBeanBasicRental;

public interface MovieService {
	
	/***** 영화 추가 *****/
	public int Create(Movie movie) throws Exception;
	
	/***** 영화 대여 추가 *****/
	public int CreateRental(MovieRental movieRental) throws Exception;
	
	/***** 영화 수정 *****/
	public int Update(Movie movie) throws Exception;
	
	/***** 영화 대여 수정 *****/
	public int UpdateRental(MovieRental movieRental) throws Exception;
	
	/***** 영화 삭제 *****/
	public int Delete(int mv_no) throws Exception;
	
	/***** 영화대여 삭제 *****/
	public int DeleteRental(int mv_rt_no) throws Exception;
	
	/***** 번호로 영화 찾기 *****/
	public Movie ReadByNo(int mv_no) throws Exception;
	
	/***** 번호로 대여 영화 찾기 *****/
	public MovieRental ReadRentalByNo(int mv_rt_no) throws Exception;
	
	/***** 이름으로 영화 찾기 *****/
	public Movie ReadByName(String mv_name) throws Exception;
	
	/***** 영화리스트 컬럼수 찾기 *****/
	public int movieCount() throws Exception;
	
	/***** 영화 전체찾기 *****/
	public ListResultBeanBasic ReadAll(ListPageConfigBeanBasic pageConfig) throws Exception;

	/***** 영화 파인더 *****/
	public ListResultBeanBasicFinder ReadAllFinder(ListPageConfigBeanBasicFinder pageConfig) throws Exception;
	
	/***** 영화대여 전체찾기 *****/
	public ListResultBeanBasicRental ReadRentalAll(ListPageConfigBeanBasic pageConfig) throws Exception;

	

}
