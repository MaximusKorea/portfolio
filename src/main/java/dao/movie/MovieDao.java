package dao.movie;

import java.util.List;

import domain.movie.Movie;
import domain.movie.MovieFinder;
import domain.movie.MovieRental;

public interface MovieDao {

	int create(Movie movie) throws Exception;
	
	int createRental(MovieRental movieRental) throws Exception;

	int update(Movie movie) throws Exception;
	
	int updateRental(MovieRental movieRental) throws Exception;

	int delete(int movieNo) throws Exception;
	
	int deleteRental(int movieRentalNo) throws Exception;

	Movie readByNo(int movieNo) throws Exception;
	
	MovieRental readRentalByNo(int movieRentalNo) throws Exception;
	
	Movie readByName(String movieName) throws Exception;

	int movieCount() throws Exception;
	
	int movieRentalCount() throws Exception;
	
	List<Movie> readAll(int startRow, int endRow) throws Exception;
	
	List<MovieFinder> readAllFinder(int startRow, int endRow,
									String pageno, String s, String kt, String searchtxt, String genre,
									String indi, String national, String grade, String sdate, String edate,
									String year_start, String year_end, String page) throws Exception;
	
	List<MovieRental> readRentalAll(int startRow, int endRow) throws Exception;
	
}