package dao.product;

import java.util.List;

import domain.product.Product;

public interface ProductDao {
	//create
	int insertProduct(Product product) throws Exception;

	//delete
	int deleteProduct(int no) throws Exception;
	
	//update
	int updateProduct(Product product) throws Exception;

	//select one
	Product ProductselectByNo(int no) throws Exception;
	
	//read All
	List<Product> ProductselectAll(int startRow, int endRow) throws Exception;
	
	int readCountProduct() throws Exception;
	
	List<Product> ProductselectByType(int no) throws Exception;

}