package kr.go.seoul.water.sql.dao;

import java.util.List;
import java.util.Map;

import kr.go.seoul.water.sql.SqlSessionManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class PageManualSearchEtcDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<Map<String, Object>> selectLabInOutResultPlantDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_ETC.selectLabInOutResultPlantDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabInOutResultWaterDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_ETC.selectLabInOutResultWaterDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabInOutResultWaterAllInDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_ETC.selectLabInOutResultWaterAllInDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabInOutResultWaterAllOutDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_ETC.selectLabInOutResultWaterAllInDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabBaselineStanrdPointValDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_ETC.selectLabBaselineStanrdPointValDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabMeasureValueWaterUpdateDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_ETC.selectLabMeasureValueWaterUpdateDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabMeasureValueWaterDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_ETC.selectLabMeasureValueWaterDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectLabMeasureItemDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_SEARCH_ETC.selectLabMeasureItemDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public Map<String, Object> seletOneLabMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.MANUAL_SEARCH_ETC.seletOneLabMeasureItemData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public Map<String, Object> seletOneLabMeasureItemMaxOutputOrderData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.MANUAL_SEARCH_ETC.seletOneLabMeasureItemMaxOutputOrderData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
}
