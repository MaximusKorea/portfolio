package service.review;

import java.util.List;

import dao.review.ReviewDao;
import domain.review.Review;

public class ReviewServiceImpl implements ReviewService {

	private ReviewDao reviewDao;
	
	public ReviewServiceImpl() {}
		
	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}
		
	public int insertReview(Review review) throws Exception {		
		return reviewDao.insertReview(review);
	}
	
	public List<Review> selectByMvNo(int mv_no) throws Exception {
		return reviewDao.selectByMvNo(mv_no);
	}
	
	public List<Object> selectListAll() throws Exception {
		return reviewDao.selectListAll();
	}
	
	public Review selectDetail(int rev_no) throws Exception {
		return reviewDao.selectDetail(rev_no);
	}
	
	public int update(Review review) throws Exception {
		return reviewDao.update(review);
	}

	public int delete(int rev_no) throws Exception {
		return reviewDao.delete(rev_no);
	}
}
