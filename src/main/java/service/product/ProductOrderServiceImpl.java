package service.product;

import java.util.List;

import dao.product.ProductOrderDao;
import domain.product.ProductJoinResult;
import domain.product.ProductOrder;

public class ProductOrderServiceImpl implements  ProductOrderService {

	private ProductOrderDao productOrderDao;

	@Override
	public ProductOrderDao getProductOrderDao() {
		return productOrderDao;
	}

	@Override
	public void setProductOrderDao(ProductOrderDao productOrderDao) {
		this.productOrderDao = productOrderDao;
	}
	
	public ProductOrderServiceImpl() {}
	
	@Override
	public int insertPOrder(ProductOrder productOrder) throws Exception{
		return productOrderDao.insertOrder(productOrder);
	}
	
	@Override
	public int deletePOrder(int no) throws Exception{
		return productOrderDao.deleteOrder(no);
	}
	
	@Override
	public int updatePOrder(ProductOrder productOrder)throws Exception{
		return productOrderDao.updateOrder(productOrder);
		
	}
	
	@Override
	public List<ProductJoinResult> selectAllPOrder(int m_no) throws Exception{
		return productOrderDao.selectallOrder(m_no);
	}
	
	@Override
	public ProductOrder selectOnePOrder(int no) throws Exception{
		return productOrderDao.selectoneOrder(no);
	}
	
}
