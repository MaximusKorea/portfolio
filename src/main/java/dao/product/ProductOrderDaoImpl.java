package dao.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.product.ProductJoinResult;
import domain.product.ProductOrder;

public class ProductOrderDaoImpl implements  ProductOrderDao {

	private SqlSession sqlSession;
	
	public ProductOrderDaoImpl() {}
	
	@Override
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Override
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int insertOrder(ProductOrder productOrder)throws Exception{
		return sqlSession.insert("insertOrder",productOrder);
	}
	
	@Override
	public int deleteOrder(int no) throws Exception{
		return sqlSession.delete("deleteOrder",no);
	}
	
	@Override
	public int updateOrder(ProductOrder productOrder) throws Exception{
		return sqlSession.update("updateOrder",productOrder);
	}
	
	@Override
	public ProductOrder selectoneOrder(int no)throws Exception{
		return sqlSession.selectOne("selectoneOrder",no);
	}
	
	@Override
	public List<ProductJoinResult> selectallOrder(int m_no) throws Exception{
		return sqlSession.selectList("selectallOrder",m_no);
	}
	
}
