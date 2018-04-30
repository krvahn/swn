package kr.go.seoul.water.sql.dao;

import java.util.List;
import java.util.Map;

import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.SqlSessionManager;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class PageOperDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<Map<String, Object>> selectOperResultDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.OPER.selectOperResultDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public int updateOperResultDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<String> list = null;
		int nRet = 1;
		int nCnt;
		String tmp;
		
		try
		{	
			list = (List<String>) params.get("WW_CODE_LIST");
		
			// 일일모니터링 결과 넣기
			for( int i = 0; i < list.size(); i ++) {
				if( WebUtils.CheckNull(params.get("CHECK_SEL1_" + list.get(i)), "").toUpperCase().equals("ON") ) {
					params.put("WW_CODE", list.get(i));
					
					tmp = WebUtils.CheckNull(params.get("CHECK_YN_" + list.get(i)), "").toUpperCase(); 
					params.put("CHECK_YN_" + list.get(i), (tmp.equals("ON") ? "ON" : ""));
					
					tmp = WebUtils.CheckNull(params.get("UNUSUAL_YN_" + list.get(i)), "").toUpperCase(); 
					params.put("UNUSUAL_YN_" + list.get(i), (tmp.equals("ON") ? "ON" : ""));
					
					nCnt = session.selectOne("sql.OPER.selectOperResultDataCnt", params);
					
					if( nCnt > 0 ) {
						nRet = session.update("sql.OPER.updateOperResultCheckData", params);
					} else {
						nRet = session.insert("sql.OPER.insertOperResultCheckData", params); 
					}
					
					if( nRet <= 0 ) {
						break;
					}
				}
			}			
			
			// 확인 및 조치 결과 넣기
			if( nRet > 0 ) {
				for( int i = 0; i < list.size(); i ++) {
					if( WebUtils.CheckNull(params.get("CHECK_SEL2_" + list.get(i)), "").toUpperCase().equals("ON") ) {						
						params.put("WW_CODE", list.get(i));
						
						System.out.println(params);
						
						nCnt = session.selectOne("sql.OPER.selectOperResultDataCnt", params);
						
						if( nCnt > 0 ) {
							nRet = session.update("sql.OPER.updateOperResultConfirmData", params);
						} else {
							nRet = session.insert("sql.OPER.insertOperResultConfirmData", params); 
						}
						
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
			e.printStackTrace();
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public List<Map<String, Object>> selectOperResultConfirmDataList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> list = null;
		
		try
		{	
			list = session.selectList("sql.OPER.selectOperResultConfirmDataList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
}