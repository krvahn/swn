package kr.go.seoul.water.comm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import kr.go.seoul.water.sql.dao.CodeDao;
import kr.go.seoul.water.sql.vo.UserInfoVO;

public class WebPage {
	private HttpServletRequest _req = null;
	//private HttpServletResponse _res = null;
	private PageContext _pg = null;
	
	public WebPage(PageContext pg, HttpServletRequest request, HttpServletResponse response) {
		_pg = pg;
		_req = request;
		//_res = response;
	}
	
	/**
	 * �α��� ����
	 * @return ���� ����
	 */
	public boolean isLogin()
	{
		if( _getSessionUserInfo() == null ) {
			return false;
		}
		
		return true;
	}
	
	public void logout()
	{
		// �α��� ���� ���� �����
		HttpSession sess = null;
		
		if( _req != null ) {
			sess = _req.getSession();
			sess.setAttribute(WebConst.WEB_SESSION_USER_INFO, null);
			
			sess.setAttribute("USER_ID", null);
			sess.setAttribute("USER_NAME", null);
			sess.setAttribute("GROUP_CODE", null);
			sess.setAttribute("USER_AUTH", null);
			sess.setAttribute("USER_LEVEL", null);
		}
	}
	
	/**
	 * �Ķ���� �ޱ�
	 * @param key : �Ķ���� Ű
	 * @param defaultValue : ����Ʈ ��
	 * @return �Ķ���� ��
	 */
	public String getParam(String key, String defaultValue)
	{
		String retVal = defaultValue;
		String val;
		
		if( _req != null ) {
			val = _req.getParameter(key);
			if( val != null ) {
				retVal = val;
			}
		}
		
		return retVal;
	}
	
	public Object getAttr(String key) 
	{
		Object val = null;
		if( _req != null ) {
			val = _req.getAttribute(key);
		}
		
		return val;
	}
	
	public String getCookieUserID(String defaultValue)
	{
		String retVal = defaultValue;
		Cookie[] cookie;
		Cookie item;
		
		if( _req != null ) {
			cookie = _req.getCookies();
			if( cookie != null ) {
				for( int i = 0; i < cookie.length; i ++) {
					item = cookie[i];
					
					if( item.getName().equals(WebConst.WEB_COOKIE_USER_ID) ) {
						retVal = item.getValue();
						break;
					}
				}
			}
		}
		
		return retVal;
	}
	
	/**
	 * ���� Context Path ���
	 * @return ���ڿ�
	 */
	public String getContextPath()
	{
		if( _pg != null ) {
			return _pg.getServletContext().getContextPath();
		}
		
		return "";
	}
	
	/**
	 * �ֱ� ���� ���� ���� ����
	 * wwCode : ����� �ڵ�
	 * @return
	 */
	public String selectCurrDataRecord_MaxAnalDate(String wwCode)
	{
		Map<String, String> item = null;
		Map<String, Object> params = new HashMap<String, Object>();
		CodeDao dao = new CodeDao();
		
		if( wwCode != null && wwCode.length() > 0 ) {
			params.put("WW_CODE", wwCode);
		}
		item = dao.selectOneCurrDataRecord_MaxAnalDate(params);
		if( item != null && item.size() > 0 ) {
			return item.get("MAX_ANAL_DATE");
		}
		
		return null;
	}
	
	/**
	 * �������� �ڵ� ����Ʈ ���
	 * @return
	 */
	public List<Map<String, String>> listPlantCode()
	{
		List<Map<String, String>> list = null;
		Map<String, Object> params = new HashMap<String, Object>();
		CodeDao dao = new CodeDao();
		
		params.put("WW_TYPE", "P");
		list = dao.selectWallWaterCodeList(params);
		
		return list;
	}
	
	/**
	 * ��������� �ڵ� ����Ʈ ���
	 * @return
	 */
	public List<Map<String, String>> listWaterCode()
	{
		List<Map<String, String>> list = null;
		Map<String, Object> params = new HashMap<String, Object>();
		CodeDao dao = new CodeDao();
		
		params.put("WW_TYPE", "W");
		list = dao.selectWallWaterCodeList(params);
		
		return list;
	}
	
	private UserInfoVO _getSessionUserInfo() 
	{
		HttpSession sess = null;
		Object value = null;
		
		if( _req != null ) {
			sess = _req.getSession();
			value = sess.getAttribute(WebConst.WEB_SESSION_USER_INFO);
			
			if( value != null ) {
				return (UserInfoVO) value;
			}
		}
		
		return null;
	}
	
	public String getUserID()
	{
		UserInfoVO userInfo;
		
		userInfo = _getSessionUserInfo();
		if( userInfo != null ) {
			return userInfo.getUSER_ID();
		}
		
		return "test1";
	}
	
	public String getUserName()
	{
		UserInfoVO userInfo;
		
		userInfo = _getSessionUserInfo();
		if( userInfo != null ) {
			return userInfo.getUSER_NAME();
		}
		
		return "";
	}
	
	// ����� ���� üũ
	public boolean checkAuthority(int pageLevel, boolean bBackURL, boolean bScript)
	{
		JspWriter out = _pg.getOut();
		UserInfoVO oUser;
		int userAuth, groupAuth;
		
		userAuth = 0;
		groupAuth = 0;
		
		// SESSION �������� ����� ���� ���� ����
		oUser = _getSessionUserInfo();
		if( oUser != null ) {
			if( oUser.getGROUP_AUTH() != null ) {
				groupAuth = Integer.valueOf(oUser.getGROUP_AUTH());
			}
			
			if( oUser.getUSER_AUTH() != null ) {
				userAuth = Integer.valueOf(oUser.getUSER_AUTH());
			}
		}
		
		//System.out.println("PAGE AUTH : " + String.valueOf(pageLevel));
		//System.out.println("USER AUTH : " + String.valueOf(userAuth));
		//System.out.println("GROUP AUTH : " + String.valueOf(groupAuth));
		
		if( pageLevel == 0 ) {
			return true;
		} else if( pageLevel > 0 ) {
			if( groupAuth == 0 ) {
				try {
					if( bScript == false ) {
						out.println("<script type='text/javascript' language='javascript'>");
					}
					out.println("alert('\\n�α����� �ʿ��� �������Դϴ�.\\n\\n���� Ȯ���� ���� �α����� �� �ֽʽÿ�.');");
					out.println("top.location.href='" + getContextPath() + "/login.jsp';");
					if( bScript == false ) {
						out.println("</script>");
					}
					out.flush();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return false;
			}
			
			if( groupAuth >= 9 ) {
				return true;
			} else if( groupAuth < pageLevel ) {
				if( userAuth >= 9 ) {
					return true;
				} else {
					try {
						if( bScript == false ) {
							out.println("<script type='text/javascript' language='javascript'>");
						}
						out.println("alert('�˼��մϴ�. �ش� ��ɿ� ���� ���ٱ����� �����ϴ�.');");
						if( bBackURL ) {
							out.println("history.back();");
						}
						if( bScript == false ) {
							out.println("</script>");
						}
						out.flush();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					return false;
				}
			}
		}
		
		return false;
	}
}
