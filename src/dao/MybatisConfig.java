package dao;

import java.io.InputStream;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConfig {
	private static SqlSessionFactory sqlSessionFactory;
	
	static{//클래스 로딩 때 자동 생
		String resource = "myBatisConfig.xml";
	//데이타베이스 접속 역할 

		try{
		Reader reader = Resources.getResourceAsReader(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
				reader.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	}
	public static SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
		
	}
	
}
