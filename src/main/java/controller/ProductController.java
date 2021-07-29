package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import domain.product.Product;
import service.product.ProductService;

@Controller
public class ProductController {
   
	private ProductService productService;
	
	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@RequestMapping(value = "/product_list")
 	public String productAll(@RequestParam(value="p_type") int p_type, Model model) throws Exception {
		List<Product> p_list = productService.ProductselectByType(p_type);
		model.addAttribute("p_list",p_list);
		
		return "product/product_list";
	} 
	
	@RequestMapping(value = "/product_view")
	public String productView(@RequestParam(value="p_no") int p_no,
								Model model,
								HttpSession session) throws Exception {
		Product p_view = productService.productselectNo(p_no);
		int op = 0;
		
		if(session.getAttribute("Smember") == null){
			op = 1;
		}else{
			op = 2; 
		}
		 
		model.addAttribute("product",p_view); 
		model.addAttribute("op",op);
		
		return "product/product_view";
	} 
	
}