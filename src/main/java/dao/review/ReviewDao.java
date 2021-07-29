package dao.review;

import java.util.List;

import domain.review.Review;

public interface ReviewDao {

	int insertReview(Review review) throws Exception;
	
	List<Review> selectByMvNo(int mv_no) throws Exception;
	
	List<Object> selectListAll() throws Exception;
	
	Review selectDetail(int rev_no) throws Exception;
	
	int update(Review review) throws Exception;
	
	int delete(int rev_no) throws Exception;
}