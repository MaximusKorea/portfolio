package dao.point;

import java.util.List;

import domain.point.Point;

public interface PointDao {

	public int create(Point point) throws Exception;

	public Point readByNo(int no) throws Exception;

	public List<Point> readByM_noPoint(int startRow, int endRow, int no) throws Exception;

	int readPageCount(int m_no);

	public Point readRecentColumn(int m_no) throws Exception;

	public int readMAX(int no) throws Exception;

	public Point getPointByM_no(int m_no) throws Exception;
	
	public List<String> readDate(int no) throws Exception;

	public int delete(int no) throws Exception;
	
}
