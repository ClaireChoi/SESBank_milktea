package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.Customer;

public class CustomerDAO {
	SqlSessionFactory factory= MybatisConfig.getSqlSessionFactory();
	SqlSession sqlSession;

	public CustomerDAO() {
		super();
	}
	
	public void insertCustomer(Customer c){
		try{
			sqlSession = factory.openSession();
			sqlSession.insert("Customer.insertCustomer",c);
			sqlSession.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		
	}
	
	public Customer selectCustomer(String custid){
		
		Customer c =null;
		c= new Customer();
		c.setCustid(custid);
		try{
			sqlSession = factory.openSession();
			c= sqlSession.selectOne("Customer.selectCustomer",c);
			sqlSession.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		return c;
		
	}
	
	public int updateCustomer(Customer c){
		int cnt =0;
		try{
			sqlSession = factory.openSession();
			cnt= sqlSession.update("Customer.updateCustomer",c);
			sqlSession.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		
		return cnt;
	}
	
	public Customer find(Customer c){
		Customer cu =null ;
		try{
			sqlSession = factory.openSession();
			cu = sqlSession.selectOne("Customer.findCustomer",c);
			sqlSession.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(sqlSession != null) sqlSession.close();
		}
		return cu;
	}
	
}
