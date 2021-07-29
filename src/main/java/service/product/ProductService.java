package service.product;

import java.util.List;

import dao.product.ProductDao;
import domain.product.Product;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListResultBeanProduct;

public interface ProductService {

	void setProductDao(ProductDao productDao);

	/************ 상품 추가 *************/
	int productinsert(Product product) throws Exception;

	/************ 상품 삭제 *************/
	int productdelete(int no) throws Exception;

	/************ 상품 수정 *************/
	int productupdate(Product product) throws Exception;

	/************ 상품 리스트 *************/
	ListResultBeanProduct productlistAll(ListPageConfigBeanBasic pageConfig) throws Exception;

	List<Product> ProductselectByType(int no) throws Exception;

	
	/************ 상품 상세정보 ***************/
	Product productselectNo(int no) throws Exception;

}