package kr.go.seoul.water.sql;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	protected static SqlSessionFactory sqlSession = null;
	
	public static SqlSessionFactory getSqlSession()
	{
		synchronized(SqlSessionManager.class) {
			if( SqlSessionManager.sqlSession == null )
			{
				String resource = "mybatis-config.xml";
				Reader reader;
				
				try {
					reader = Resources.getResourceAsReader(resource);
					sqlSession = new SqlSessionFactoryBuilder().build(reader);
				} catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return SqlSessionManager.sqlSession;
	}
}
