package service.product;

import java.util.List;

import dao.product.ProductDao;
import domain.product.Product;
import pagebean.ListPageConfigBeanBasic;
import pagebean.ListResultBeanProduct;
import pagebean.PageCounterProduct;

public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;
	
	@Override
	public void setProductDao(ProductDao productDao){
		this.productDao = productDao;
	}
	
	@Override
	public int productinsert(Product product) throws Exception{
		return productDao.insertProduct(product);
	}
	
	@Override
	public int productdelete(int no) throws Exception{
		return productDao.deleteProduct(no);
	}

	@Override
	public int productupdate(Product product) throws Exception{
		return productDao.updateProduct(product);
	}
	
	@Override
	public ListResultBeanProduct productlistAll(ListPageConfigBeanBasic pageConfig) throws Exception{
		int totalRecordCount = productDao.readCountProduct();
		System.out.println("totalRecordCount: " + productDao.readCountProduct());
		ListResultBeanProduct resultBean = PageCounterProduct.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
																			pageConfig.getRowCountPerPage(),
																			pageConfig.getPageCountPerPage(),
																			totalRecordCount);
		System.out.println("PageCounterProduct.getSelectPage: " + pageConfig.getSelectPage());
		System.out.println("PageCounterProduct.getRowCountPerPage: " + pageConfig.getRowCountPerPage());
		System.out.println("PageCounterProduct.getPageCountPerPage: " + pageConfig.getPageCountPerPage());
		List<Product> productList = productDao.ProductselectAll(resultBean.getStartRowNum(),
																resultBean.getEndRowNum());
		System.out.println("ListResultBeanProduct.getStartRowNum: " + resultBean.getStartRowNum());
		System.out.println("ListResultBeanProduct.getEndRowNum: " + resultBean.getEndRowNum());
		
		resultBean.setList(productList);
		
		return resultBean;
	}
	
	public Product productselectNo(int no) throws Exception{
		return productDao.ProductselectByNo(no);
	}

	@Override
	public List<Product> ProductselectByType(int no) throws Exception {
		return productDao.ProductselectByType(no);
	}

}