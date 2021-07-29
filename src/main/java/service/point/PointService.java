package service.point;

import java.util.List;

import domain.point.Point;
import pagebean.ListPageConfigBeanNo;
import pagebean.ListResultBeanPoint;

public interface PointService {

	public int userPoint(Point point) throws Exception;

	public ListResultBeanPoint userPntInfo(ListPageConfigBeanNo pageConfig) throws Exception;

	public Point recentPntInfo(int m_no) throws Exception;

	public int readPageCount(int m_no);

	public Point previousInfo(int no) throws Exception;

	public int previousPntInfo(int no) throws Exception;

	public Point getPointByM_no(int m_no) throws Exception;

	public List<String> getDateInfo(int m_no) throws Exception;

	public int pointOut(int m_no) throws Exception;
}
