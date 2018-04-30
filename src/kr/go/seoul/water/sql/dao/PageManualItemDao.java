package kr.go.seoul.water.sql.dao;

import java.util.List;
import java.util.Map;

import kr.go.seoul.water.sql.SqlSessionManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class PageManualItemDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<Map<String, Object>> selectLabMeasureItemDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANAUL_ITEM.selectLabMeasureItemDataList", params);
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
			item = session.selectOne("sql.MANAUL_ITEM.seletOneLabMeasureItemData", params);			
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
			item = session.selectOne("sql.MANAUL_ITEM.seletOneLabMeasureItemMaxOutputOrderData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int deleteLabeMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			session.delete("sql.MANAUL_ITEM.deleteLabeMeasureItemData", params);
			session.delete("sql.MANAUL_ITEM.deleteLabeMeasureItemStandardData", params);
			nRet = 1;
			
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
			
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int updateLabMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.update("sql.MANAUL_ITEM.updateLabMeasureItemData", params);
			if( nRet > 0 ) {
				nRet = session.update("sql.MANAUL_ITEM.updateLabMeasureItemStandardData", params);
			}
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
			
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertLabMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.insert("sql.MANAUL_ITEM.insertLabMeasureItemData", params);
			if( nRet > 0 ) {
				nRet = session.insert("sql.MANAUL_ITEM.insertLabMeasureItemStandardData", params);
			}
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
			
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
}
