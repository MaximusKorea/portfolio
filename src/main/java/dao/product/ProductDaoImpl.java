package dao.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.product.Product;
import pagebean.ListResultBeanProduct;

public class ProductDaoImpl implements ProductDao {

	private SqlSession sqlSession;

	public ProductDaoImpl() {}

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int insertProduct(Product product) throws Exception {
		return sqlSession.insert("insertProduct",product);
	}

	@Override
	public int deleteProduct(int no) throws Exception {
		return sqlSession.delete("deleteProduct",no);
	}

	@Override
	public int updateProduct(Product product) throws Exception {
		return sqlSession.update("updateProduct",product);
	}

	@Override
	public Product ProductselectByNo(int no) throws Exception {
		return sqlSession.selectOne("ProductselectByNo", no);
	}

	@Override
	public List<Product> ProductselectAll(int startRowNum, int endRowNum) throws Exception {
		ListResultBeanProduct listResultBean = new ListResultBeanProduct();
		listResultBean.setStartRowNum(startRowNum);
		listResultBean.setEndRowNum(endRowNum);
		return sqlSession.selectList("ProductselectAll", listResultBean);
	}
	
	@Override
	public int readCountProduct() throws Exception {
		return sqlSession.selectOne("readCountProduct");
	}

	@Override
	public List<Product> ProductselectByType(int no) throws Exception {
 		return sqlSession.selectList("ProductselectByType", no);
	}
	
}
