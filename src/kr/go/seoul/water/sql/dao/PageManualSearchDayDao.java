package kr.go.seoul.water.sql.dao;

import java.util.List;
import java.util.Map;

import kr.go.seoul.water.sql.SqlSessionManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class PageManualSearchDayDao {
private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<Map<String, Object>> selectLabDayOpWaterDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpWaterDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpWaterDataList2(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpWaterDataList2", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpSendDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpSendDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpSendPointDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpSendPointDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpProdDayDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpProdDayDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpProdDayDataList2(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpProdDayDataList2", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpProdYearDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpProdYearDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpProdYearDataList2(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpProdYearDataList2", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpProdInOutDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpProdInOutDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpProdFactDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpProdFactDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpProdNowProdDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpProdNowProdDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabDayOpPowerDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_DAY.selectLabDayOpPowerDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
}
