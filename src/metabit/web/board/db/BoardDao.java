package metabit.web.board.db;

import java.util.List;
import java.util.Map;

import metabit.web.board.BoardConfig;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class BoardDao {
	private SqlSessionFactory sqlSessionFactory = BoardConfig.GetSqlSession();
	
	public Map<String, Object> selectOneBoardAdmin(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.board.selectOneBoardAdmin", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public long selectOnBoardListTotalCnt(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		long item = 0;
		
		try
		{	
			item = session.selectOne("sql.board.selectOneBoardListTotalCnt", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public List<Map<String, Object>> selectBoardList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> item = null;
		
		try
		{	
			item = session.selectList("sql.board.selectBoardList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int updateBoardViewCount(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			nRet = session.update("sql.board.updateBoardViewCount", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public Map<String, Object> selectOneBoardContent(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.board.selectOneBoardContent", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int deleteBoardContent(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			nRet = session.delete("sql.board.deleteBoardContent", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertBoardContent(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			nRet = session.delete("sql.board.insertBoardContent", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int updateBoardContent(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			nRet = session.update("sql.board.updateBoardContent", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertBoardAnswerContent(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			// 번호 재부여
			nRet = session.update("sql.board.updateBoardAnswerReorder", params);
			if( nRet > 0 ) {
				nRet = session.insert("sql.board.insertBoardAnswerContent", params);
			}
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	//===================================================================================================
	// Open Board 관련
	//===================================================================================================
	
	public long selectOneOpenBoardListTotalCnt(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		long item = 0;
		
		try
		{	
			item = session.selectOne("sql.board.selectOneOpenBoardListTotalCnt", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public List<Map<String, Object>> selectOpenBoardList(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> item = null;
		
		try
		{	
			item = session.selectList("sql.board.selectOpenBoardList", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int updateOpenBoardViewCount(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			nRet = session.update("sql.board.updateOpenBoardViewCount", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public Map<String, Object> selectOneOpenBoardContent(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> item = null;
		
		try
		{	
			item = session.selectOne("sql.board.selectOneOpenBoardContent", params);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return item;
	}
	
	public int deleteOpenBoardContent(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			nRet = session.delete("sql.board.deleteOpenBoardContent", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int insertOpenBoardContent(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			nRet = session.delete("sql.board.insertOpenBoardContent", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
	
	public int updateOpenBoardContent(Map<String, Object> params)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int nRet = -1;
		
		try
		{
			nRet = session.update("sql.board.updateOpenBoardContent", params);
			if( nRet > 0 ) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch(Exception e) {
			session.rollback();
		} finally {
			try { if(session != null) {session.close();} } catch(Exception e) {}
		}
		
		return nRet;
	}
}
