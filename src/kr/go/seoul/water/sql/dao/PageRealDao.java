package kr.go.seoul.water.sql.dao;

import java.util.List;
import java.util.Map;

import kr.go.seoul.water.sql.SqlSessionManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class PageRealDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<Map<String, Object>> selectTotalSummaryWaterList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.REAL.selectTotalSummaryWaterList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectTotalSummaryPlantList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.REAL.selectTotalSummaryPlantList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectTotalSummaryPointsList(Map<String, Object> params) 
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.REAL.selectTotalSummaryPointsList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectTotalPlantSummaryInList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.REAL.selectTotalPlantSummaryInList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectTotalPlantSummaryOutList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.REAL.selectTotalPlantSummaryOutList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectPlantSummaryProcessList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.REAL.selectPlantSummaryProcessList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectPlantSummaryProviderList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.REAL.selectPlantSummaryProviderList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectWaterSummaryList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{
			list = session.selectList("sql.REAL.selectWaterSummaryList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
}
