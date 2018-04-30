package kr.go.seoul.water.sql.dao;

import java.util.List;
import java.util.Map;

import kr.go.seoul.water.sql.SqlSessionManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class PageManualValueDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public Map<String, Object> selectOneManualValuePlantData(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.MANUAL_VALUE.selectOneManualValuePlantData", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public List<Map<String, Object>> selectManualValuePlantPointDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_VALUE.selectManualValuePlantPointDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectManualValuePlantItemDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_VALUE.selectManualValuePlantItemDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public Map<String, Object> selectOneManualValuePlantHorseDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.MANUAL_VALUE.selectOneManualValuePlantHorseDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	@SuppressWarnings("unchecked")
	public int insertManualValuePlantDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			int i, j;
			List<String> item = null;
			List<String> item2 = null;
			nRet = 1;			
			
			//  생산현황, 약품투입현황, 여과지속시간, 기타 내용 저장
			session.delete("sql.MANUAL_VALUE.deleteManageVal", params);
			if(nRet > 0) {								                    
				nRet = session.insert("sql.MANUAL_VALUE.insertManageVal", params);
			}
			
			// 생산현황 - 수계데이터 넣기
			if( nRet > 0 ) 
			{	
				item = (List<String>) params.get("PS_POINT_CODE_LIST");
				if( item != null && item.size() > 0 ) {
					params.put("POINT_TYPE", "P");
					session.delete("sql.MANUAL_VALUE.deleteManagePointVal", params);
					
					for(i = 0; i < item.size(); i ++) {
						params.put("POINT_CODE", item.get(i));
						params.put("ITEM_SEQ", 0);
						params.put("ITEM_VAL1", params.get("PS_ITEM_VAL1_" + item.get(i)));
						params.put("ITEM_VAL2", null);
						params.put("ITEM_VAL3", null);
						nRet = session.insert("sql.MANUAL_VALUE.insertManagePointVal", params);
						
						if( nRet < 1 ) {
							break;
						}
					}
				}
			}
			
			// 수질 현황
			if( nRet > 0 ) 
			{	
				item = (List<String>) params.get("PS_POINT_CODE_LIST");
				if( item != null && item.size() > 0 ) {
					params.put("POINT_TYPE", "P");
					session.delete("sql.MANUAL_VALUE.deleteManagePointVal", params);
					
					for(i = 0; i < item.size(); i ++) {
						params.put("POINT_CODE", item.get(i));
						params.put("ITEM_SEQ", 0);
						params.put("ITEM_VAL1", params.get("PS_ITEM_VAL1_" + item.get(i)));
						params.put("ITEM_VAL2", null);
						params.put("ITEM_VAL3", null);
						nRet = session.insert("sql.MANUAL_VALUE.insertManagePointVal", params);
						
						if( nRet < 1 ) {
							break;
						}
					}
				}
			}
			
			// 송수현황 - 송수량
			if( nRet > 0 ) 
			{	
				item = (List<String>) params.get("SS_POINT_CODE_LIST");
				if( item != null && item.size() > 0 ) {
					params.put("POINT_TYPE", "S");
					session.delete("sql.MANUAL_VALUE.deleteManagePointVal", params);
					
					for(i = 0; i < item.size(); i ++) {
						params.put("POINT_CODE", item.get(i));
						params.put("ITEM_SEQ", 0);
						params.put("ITEM_VAL1", params.get("SS_ITEM_VAL1_" + item.get(i)));
						params.put("ITEM_VAL2", null);
						params.put("ITEM_VAL3", null);
						nRet = session.insert("sql.MANUAL_VALUE.insertManagePointVal", params);
						
						if( nRet < 1 ) {
							break;
						}
					}
				}
			}
			
			// 송수현황 -  관압
			if( nRet > 0 ) 
			{	
				item = (List<String>) params.get("RS_POINT_CODE_LIST");
				if( item != null && item.size() > 0 ) {
					params.put("POINT_TYPE", "R");
					session.delete("sql.MANUAL_VALUE.deleteManagePointVal", params);
					
					for(i = 0; i < item.size(); i ++) {
						params.put("POINT_CODE", item.get(i));
						params.put("ITEM_SEQ", 0);
						params.put("ITEM_VAL1", params.get("RS_ITEM_VAL1_" + item.get(i)));
						params.put("ITEM_VAL2", params.get("RS_ITEM_VAL2_" + item.get(i)));
						params.put("ITEM_VAL3", params.get("RS_ITEM_VAL3_" + item.get(i)));
						nRet = session.insert("sql.MANUAL_VALUE.insertManagePointVal", params);
						
						if( nRet < 1 ) {
							break;
						}
					}
				}
			}
			
			// 송수현황 - 펌프가동
			if( nRet > 0 ) 
			{	
				item = (List<String>) params.get("AS_POINT_CODE_LIST");
				if( item != null && item.size() > 0 ) {
					params.put("POINT_TYPE", "A");
					session.delete("sql.MANUAL_VALUE.deleteManagePointVal", params);
					
					for(i = 0; i < item.size(); i ++) {
						params.put("POINT_CODE", item.get(i));
						params.put("ITEM_SEQ", 0);
						params.put("ITEM_VAL1", null);
						params.put("ITEM_VAL2", params.get("AS_ITEM_VAL2_" + item.get(i)));
						params.put("ITEM_VAL3", params.get("AS_ITEM_VAL3_" + item.get(i)));
						nRet = session.insert("sql.MANUAL_VALUE.insertManagePointVal", params);
						
						if( nRet < 1 ) {
							break;
						}
					}
				}
			}
			
			// 송수현황 - 펌프가동 추가 내용
			if( nRet > 0 )
			{
				item = (List<String>) params.get("AS_POINT_CODE_LIST");
				item2 = (List<String>) params.get("AS_POINT_VAL_CNT_LIST");
				int cnt;
				
				if( item != null && item.size() > 0 ) {
					for(i = 0; i < item.size(); i ++) {
						// 기존 자료 삭제
						params.put("POINT_CODE", item.get(i));
						session.delete("sql.MANUAL_VALUE.deleteOtherVal", params);
						
						cnt = Integer.parseInt(item2.get(i));
						if( cnt > 0 )
						{
							for(j = 0; j < cnt - 1; j ++)
							{
								params.put("ORDER_NUM", j + 1);
								params.put("ITEM_VAL1", params.get("AS_POINT_VAL1_" + item.get(i) + "_" + String.valueOf(j)));
								params.put("ITEM_VAL2", params.get("AS_POINT_VAL2_" + item.get(i) + "_" + String.valueOf(j)));
								
								nRet = session.insert("sql.MANUAL_VALUE.insertOtherVal", params);
								
								if( nRet < 1 ) {
									break;
								}
							}
							
							if( nRet < 1 ) {
								break;
							}
						}
					}
				}
			}
			
			// 수질 현황
			if( nRet > 0 )
			{
				item = (List<String>) params.get("ITEM_CODE_LIST");
				if( item != null && item.size() > 0 ) {
					params.put("POINT_TYPE", "W");
					session.delete("sql.MANUAL_VALUE.deleteManagePointVal", params);
					
					for(i = 0; i < item.size(); i ++) {
						params.put("POINT_CODE", "");
						params.put("ITEM_CODE", "");
						params.put("ITEM_SEQ", item.get(i));
						params.put("ITEM_VAL1", params.get("ITEM_" + item.get(i)));
						params.put("ITEM_VAL2", 0);
						params.put("ITEM_VAL3", null);
						nRet = session.insert("sql.MANUAL_VALUE.insertManagePointVal", params);
						
						System.out.println(item.get(i) + " => " + params.get("ITEM_" + item.get(i)));
						
						if( nRet < 1 ) {
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
	
	public List<Map<String, Object>> selectManualValueInOutResultExistDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_VALUE.selectManualValueInOutResultExistDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectManualValueInOutResultDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_VALUE.selectManualValueInOutResultDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public int deleteManualValueInOutResultDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet = session.delete("sql.MANUAL_VALUE.deleteDataLab", params);
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
	public int insertManualValueInOutResultDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		List<String> items;
		
		try
		{	
			nRet = session.delete("sql.MANUAL_VALUE.deleteDataLab", params);
			if( nRet >= 0 ) {
				items = (List<String>) params.get("ITEM_LIST");
				if( items != null ) {
					for(int i = 0; i < items.size(); i ++) {
						params.put("INDEX", String.valueOf(i));
						params.put("ITEM_CODE", items.get(i));
						nRet = session.insert("sql.MANUAL_VALUE.insertDataLab", params);
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
	
	public List<Map<String, Object>> selectLabManualValueBaselineStanrdPointValDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_VALUE.selectLabManualValueBaselineStanrdPointValDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectManualValuePowerDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_VALUE.selectManualValuePowerDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public int insertManualValuePowerDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		List<String> items;
		
		try
		{	
			nRet = session.delete("sql.MANUAL_VALUE.deleteElecVal", params);
			if( nRet >= 0 ) {
				items = (List<String>) params.get("POINT_CODE_LIST");
				if( items != null ) {
					for(int i = 0; i < items.size(); i ++) {
						params.put("POINT_CODE", items.get(i));
						nRet = session.insert("sql.MANUAL_VALUE.insertElecVal", params);
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
	
	public List<Map<String, Object>> selectManualValueWaterExistDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_VALUE.selectManualValueWaterExistDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, Object>> selectManualValueWaterDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.MANUAL_VALUE.selectManualValueWaterDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public int deleteManualValueWaterDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{	
			nRet = session.delete("sql.MANUAL_VALUE.deleteDataLabWO", params);
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
	public int insertManualValueWaterDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		List<String> items;
		
		try
		{	
			nRet = session.delete("sql.MANUAL_VALUE.deleteDataLabWO", params);
			if( nRet >= 0 ) {
				items = (List<String>) params.get("ITEM_LIST");
				if( items != null ) {
					for(int i = 0; i < items.size(); i ++) {
						params.put("INDEX", String.valueOf(i));
						params.put("ITEM_CODE", items.get(i));
						nRet = session.insert("sql.MANUAL_VALUE.insertDataLabWO", params);
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
}
