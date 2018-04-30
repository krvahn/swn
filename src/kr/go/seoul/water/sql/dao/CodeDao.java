package kr.go.seoul.water.sql.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.go.seoul.water.sql.SqlSessionManager;
import kr.go.seoul.water.sql.vo.UserInfoVO;

public class CodeDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public UserInfoVO selectOneLoginUserInfo(Map<String, Object> params)
	{
		UserInfoVO item = null;
		SqlSession session = sqlSessionFactory.openSession();
		
		try
		{	
			item = session.selectOne("sql.CODE.selectOneLoginUserInfo", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public Map<String, String> selectOneCurrDataRecord_MaxAnalDate(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> item = null;
		
		try
		{	
			item = session.selectOne("sql.CODE.selectOneCurrDataRecord_MaxAnalDate", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public Map<String, String> selectOneWallWaterRecord(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> item = null;
		
		try
		{	
			item = session.selectOne("sql.CODE.selectOneWallWaterRecord", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public List<Map<String, String>> selectItemCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectItemCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectWallWaterCodeAllList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectWallWaterCodeAllList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectPointCodeAllList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectPointCodeAllList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectUserSelectPointCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectUserSelectPointCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectWallWaterCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectWellWaterCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectWellWaterPathWWCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectWellWaterPathWWCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectWaterPointCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectWaterPointCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectPlantPointCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectPlantPointCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectPlantWaterPathPointCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectPlantWaterPathPointCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectWaterPointItemCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectWaterPointItemCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectPlantPointItemCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectPlantPointItemCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectPlantFactoryCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectPlantFactoryCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectPlantFactoryPointCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectPlantFactoryPointCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectPointClassCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectPointClassCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectPlantPointClassCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectPlantPointClassCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectWaterPointClassCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectWaterPointClassCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectStatusTopCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectStatusTopCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectLabItem16CodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectLabItem16CodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public List<Map<String, String>> selectGroupCodeList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, String>> list = null;
		
		try
		{	
			list = session.selectList("sql.CODE.selectGroupCodeList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return list;
	}
	
	public String selectOneWWCodeByPointCode(String pointCode)
	{
		SqlSession session = sqlSessionFactory.openSession();
		String wwCode;
		
		wwCode = "";
		try
		{
			wwCode = session.selectOne("sql.CODE.selectOneWWCode", pointCode);
		}  catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return wwCode;
	}
}
