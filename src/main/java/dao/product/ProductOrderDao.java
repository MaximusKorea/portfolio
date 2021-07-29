package dao.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.product.ProductJoinResult;
import domain.product.ProductOrder;

public interface ProductOrderDao {

	SqlSession getSqlSession();

	void setSqlSession(SqlSession sqlSession);

	int insertOrder(ProductOrder productOrder) throws Exception;

	//delete
	int deleteOrder(int no) throws Exception;

	//update
	int updateOrder(ProductOrder productOrder) throws Exception;

	//read one
	ProductOrder selectoneOrder(int no) throws Exception;
	
	//read All
	List<ProductJoinResult> selectallOrder(int m_no) throws Exception;

}