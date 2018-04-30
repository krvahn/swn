package kr.go.seoul.water.sql.dao;

import java.util.List;
import java.util.Map;

import kr.go.seoul.water.sql.SqlSessionManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class PageSystemDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<Map<String, Object>> selectStatusManagerList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectStatusManagerList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public int updateStatusMangerItem(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet = session.update("sql.SYSTEM.updateStatusMangerItem", params);
			
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public List<Map<String, Object>> selectDataSendingTotalList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectDataSendingTotalList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectDataSendingOfficeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectDataSendingOfficeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> seletGroupManagerDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.seletGroupManagerDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public Map<String, Object> seletOneGroupManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.SYSTEM.seletOneGroupManagerData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int deleteGroupManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			session.update("sql.SYSTEM.changeGroupManagerData", params);
			
			nRet =  session.delete("sql.SYSTEM.deleteGroupManagerData", params);
			if( nRet >= 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int updateGroupManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.update("sql.SYSTEM.updateGroupManagerData", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertGroupManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.insert("sql.SYSTEM.insertGroupManagerData", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public List<Map<String, Object>> seletUserManagerDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.seletUserManagerDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public Map<String, Object> seletOneUserManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.SYSTEM.seletOneUserManagerData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int deleteUserManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			session.delete("sql.SYSTEM.deleteUserManagerData", params);
			session.delete("sql.SYSTEM.deleteUserWWCodeData", params);			
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
	
	@SuppressWarnings("unchecked")
	public int updateUserManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		List<String> items;
		
		try
		{	
			session.delete("sql.SYSTEM.deleteUserWWCodeData", params);	
			
			nRet =  session.update("sql.SYSTEM.updateUserManagerData", params);			
			if( nRet > 0 ) {
				items = (List<String>) params.get("ITEMS");
				if( items != null ) {
					for(int i = 0; i < items.size(); i ++) {
						params.put("ITEM", items.get(i));
						nRet = session.insert("sql.SYSTEM.insertUserWWCodeData", params);
						if( nRet <= 0 ) {
							break;
						}
					}
				}
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
	
	@SuppressWarnings("unchecked")
	public int insertUserManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		List<String> items;
		
		try
		{	
			session.delete("sql.SYSTEM.deleteUserWWCodeData", params);	
			
			nRet =  session.insert("sql.SYSTEM.insertUserManagerData", params);
			if( nRet > 0 ) {
				items = (List<String>) params.get("ITEMS");
				if( items != null ) {
					for(int i = 0; i < items.size(); i ++) {
						params.put("ITEM", items.get(i));
						nRet = session.insert("sql.SYSTEM.insertUserWWCodeData", params);
						if( nRet <= 0 ) {
							break;
						}
					}
				}
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
	
	public List<Map<String, Object>> seletWaterManagerDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.seletWaterManagerDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public Map<String, Object> seletOneWaterManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.SYSTEM.seletOneWaterManagerData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int updateWaterManagerData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.update("sql.SYSTEM.updateWaterManagerData", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public List<Map<String, Object>> seletPointOfficeDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.seletPointOfficeDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public Map<String, Object> seletOnePointOfficeData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.SYSTEM.seletOnePointOfficeData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int updatePointOfficeDataForDelete(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.update("sql.SYSTEM.updatePointOfficeDataForDelete", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertPointOfficeData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.update("sql.SYSTEM.insertPointOfficeData", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int updatePointOfficeData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.update("sql.SYSTEM.updatePointOfficeData", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public List<Map<String, Object>> selectMeasureItemDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectMeasureItemDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public Map<String, Object> seletOneMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.SYSTEM.seletOneMeasureItemData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public Map<String, Object> selectOneExistAppendMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.SYSTEM.selectOneExistAppendMeasureItemData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public Map<String, Object> selectOneExistAddMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.SYSTEM.selectOneExistAddMeasureItemData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int updateMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			// 반드시 먼저 해 준다.
			nRet = session.update("sql.SYSTEM.updateMeasureItemDataForItemStandard1", params);			
			if( nRet > 0 ) {
				nRet =  session.update("sql.SYSTEM.updateMeasureItemDataForAnalItem", params);
			}
			
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertAppendMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.insert("sql.SYSTEM.insertMeasureItemDataForItemStandard1", params);
			
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertAddMeasureItemData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.insert("sql.SYSTEM.insertMeasureItemDataForAnalItem", params);
			if( nRet > 0 ) {
				nRet = session.insert("sql.SYSTEM.insertMeasureItemDataForItemStandard1", params);
			}
			
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	@SuppressWarnings("unchecked")
	public int updateItemSetList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.delete("sql.SYSTEM.deleteItemSetList", params);
			if( nRet >= 0 ) {
				List<String> items = null;
				
				items = (List<String>) params.get("ITEMS");
				if( items != null && items.size() > 0 ) {
					for( int i = 0; i < items.size(); i++ ) {
						params.put("ITEM_CODE", items.get(i));
						nRet = session.insert("sql.SYSTEM.insertItemSetList", params);
						
						if( nRet < 1) {
							nRet = -1;
							break;
						}
					}
				}
			}			
			if( nRet >= 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public List<Map<String, Object>> selectItemSetUnselectList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectItemSetUnselectList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectItemSetSelectList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectItemSetSelectList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectStatusSubDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectStatusSubDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public Map<String, Object> seletOneStatusSubData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.SYSTEM.seletOneStatusSubData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int deleteStatusSubData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.delete("sql.SYSTEM.deleteStatusSubData", params);
			if( nRet >= 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int updateStatusSubData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.update("sql.SYSTEM.updateStatusSubData", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertStatusSubData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.insert("sql.SYSTEM.insertStatusSubData", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public List<Map<String, Object>> selectStatusTopDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectStatusTopDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	} 
	
	public Map<String, Object> seletOneStatusTopData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.SYSTEM.seletOneStatusTopData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int deleteStatusTopData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.delete("sql.SYSTEM.deleteStatusTopData", params);
			if( nRet >= 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int updateStatusTopData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.update("sql.SYSTEM.updateStatusTopData", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertStatusTopData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet =  session.insert("sql.SYSTEM.insertStatusTopData", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			nRet = -1;
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public List<Map<String, Object>> selectBaseLineExecPlantDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectBaseLineExecPlantDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectBaseLineExecWaterDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectBaseLineExecWaterDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectSmsSendList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.SYSTEM.selectSmsSendList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
}
