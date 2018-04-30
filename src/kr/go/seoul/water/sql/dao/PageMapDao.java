package kr.go.seoul.water.sql.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.go.seoul.water.sql.SqlSessionManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class PageMapDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<Map<String, Object>> selectCurrentDataList(String pointCode)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		Map<String, Object> params = new HashMap<String, Object>();
		
		try
		{	
			params.put("POINT_CODE", pointCode);
			
			list = session.selectList("sql.MAP.selectCurrentDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
}
