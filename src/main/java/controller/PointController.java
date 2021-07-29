package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.member.Member;
import domain.point.Point;
import service.point.PointService;

@Controller
public class PointController {
	
	private PointService pointService;

	@Autowired
	public void setPointService(PointService pointService) {
		this.pointService = pointService;
	}
	
	@RequestMapping(value="/get_totalPoint")
	public @ResponseBody int get_totalPoint(HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("Smember");
		int m_no = member.getM_no();
		int point = pointService.getPointByM_no(m_no).getPt_point();
		return point;
	}
	
	@RequestMapping(value="/update_point/{price}/{way}")
	public @ResponseBody int update_point(@PathVariable(value="price") int price,
										@PathVariable(value="way") String way,
										HttpSession session) throws Exception{
		
		Member member = (Member) session.getAttribute("Smember");
		int m_no = member.getM_no();
		int pt_point = pointService.getPointByM_no(m_no).getPt_point();
		int result_point = 0;
		
		if(way.equals("p")) {
			Point point = new Point(1, m_no, pt_point-price, price, "2", "영화예매");
			pointService.userPoint(point);
			result_point = pt_point-price;
			
		} else if(way.equals("o")) {
			int usedPoint = price/10;
			Point point = new Point(1, m_no, pt_point+usedPoint, usedPoint, "1", "영화예매");
			pointService.userPoint(point);
			result_point = usedPoint;
			
		} else if(way.equals("c")){
			result_point = pt_point-(price/10);
			Point point = new Point(1, m_no, result_point, (price/10), "2", "예매취소");
			pointService.userPoint(point);
		}
		return result_point;
	}
}
