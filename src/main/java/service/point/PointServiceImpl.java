package service.point;

import java.util.List;

import dao.point.PointDao;
import domain.point.Point;
import pagebean.ListPageConfigBeanNo;
import pagebean.ListResultBeanPoint;
import pagebean.PageCounterPoint;

public class PointServiceImpl implements PointService {

	private PointDao pointDao;

	public void setPointDao(PointDao pointDao) {
		this.pointDao = pointDao;
	}

	public int readPageCount(int m_no) {
		return pointDao.readPageCount(m_no);
	}

	@Override
	public int userPoint(Point point) throws Exception {
		return pointDao.create(point);
	}

	@Override
	public ListResultBeanPoint userPntInfo(ListPageConfigBeanNo pageConfig) throws Exception {
		int totalRecordCount = pointDao.readPageCount(pageConfig.getM_no());
		System.out.println("PointServiceImpl.userPntInfo --> totalRecordCount --> " + totalRecordCount);
		ListResultBeanPoint resultBean = PageCounterPoint.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
																		pageConfig.getRowCountPerPage(),
																		pageConfig.getPageCountPerPage(),
																		totalRecordCount,
																		pageConfig.getM_no());
		List<Point> pointList = pointDao.readByM_noPoint(resultBean.getStartRowNum(),
														resultBean.getEndRowNum(),
														pageConfig.getM_no());
		resultBean.setList(pointList);
		return resultBean;
	}

	@Override
	public Point getPointByM_no(int m_no) throws Exception {
		return pointDao.getPointByM_no(m_no);
	}
	
	@Override
	public Point recentPntInfo(int m_no) throws Exception {
		return pointDao.readRecentColumn(m_no);
	}

	@Override
	public int previousPntInfo(int no) throws Exception {
		return pointDao.readMAX(no);
	}

	@Override
	public Point previousInfo(int no) throws Exception {
		return pointDao.readByNo(no);
	}

	@Override
	public List<String> getDateInfo(int m_no) throws Exception {
		return pointDao.readDate(m_no);
	}

	@Override
	public int pointOut(int m_no) throws Exception {
		return pointDao.delete(m_no);
	}

}
