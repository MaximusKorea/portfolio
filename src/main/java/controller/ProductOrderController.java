package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import domain.member.Member;
import domain.product.Product;
import domain.product.ProductJoinResult;
import domain.product.ProductOrder;
import service.product.ProductOrderService;
import service.product.ProductService;

@Controller
public class ProductOrderController {

	private ProductOrderService productOrderService;
	private ProductService productService;
	
	public ProductOrderService getProductOrderService() {
		return productOrderService;
	}
	
	@Autowired
	public void setProductOrderService(ProductOrderService productOrderService) throws Exception {
		this.productOrderService = productOrderService;
	}

	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	@RequestMapping (value = "/porder_list")
	public String orderlist(@RequestParam(value="m_no") int m_no, Model model) throws Exception {
		List<ProductJoinResult> po_list = productOrderService.selectAllPOrder(m_no);
		
		model.addAttribute("po_list",po_list);
		System.out.println(po_list);
		
		return "product/porder_list";
	}
	
	@RequestMapping(value ="/porder_finish")
	public String orderfinish(@RequestParam int p_no,
								@RequestParam int count,
								Model model,
								HttpSession httpSession ){
		try {
			Product p = productService.productselectNo(p_no);
			Member m = (Member)httpSession.getAttribute("Smember");
			if(m ==null ) {
				return "redirect:product_view?p_no="+p_no;
			}
			
			productOrderService.insertPOrder(new ProductOrder(m.getM_no(), p_no, 0, count, p.getP_price()*count));
			model.addAttribute("product",p);
			model.addAttribute("m_no",m.getM_no());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "product/porder_finish";
	}
	
	@RequestMapping(value="/porder_delete")
	public String orderDelete(@RequestParam int po_no,HttpSession session){
		
		try {
			int res = productOrderService.deletePOrder(po_no);
			System.out.println("res : " + res + "po_no: " + po_no);
			Member m = (Member)session.getAttribute("Smember");
			
			return "redirect:porder_list?m_no="+m.getM_no();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "zz";
	}
	
}