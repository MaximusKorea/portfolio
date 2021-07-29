package service.product;

import java.util.List;

import dao.product.ProductOrderDao;
import domain.product.ProductJoinResult;
import domain.product.ProductOrder;

public interface ProductOrderService {

	ProductOrderDao getProductOrderDao();

	void setProductOrderDao(ProductOrderDao productOrderDao);

	int insertPOrder(ProductOrder productOrder) throws Exception;

	int deletePOrder(int no) throws Exception;

	int updatePOrder(ProductOrder productOrder) throws Exception;

	List<ProductJoinResult> selectAllPOrder(int m_no) throws Exception;

	ProductOrder selectOnePOrder(int no) throws Exception;

}