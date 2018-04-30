package metabit.web.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

public class BoardPage {
	private HttpServletRequest _req = null;
	//private HttpServletResponse _res = null;
	private PageContext _pg = null;
	
	public BoardPage(PageContext pg, HttpServletRequest request, HttpServletResponse response) {
		_pg = pg;
		_req = request;
		//_res = response;
	}
		
	/**
	 * 파라미터 받기
	 * @param key : 파라미터 키
	 * @param defaultValue : 디폴트 값
	 * @return 파라미터 값
	 */
	public String getParam(String key, String defaultValue)
	{
		String retVal = defaultValue;
		String val;
		
		if( _req != null ) {
			val = _req.getParameter(key);
			if( val == null || String.valueOf(val).equals("") ) {
				retVal = defaultValue;
			} else {
				retVal = val;
			}
		}
		
		return retVal;
	}
	
	/**
	 * 웹의 Context Path 얻기
	 * @return 문자열
	 */
	public String getContextPath()
	{
		if( _pg != null ) {
			return _pg.getServletContext().getContextPath();
		}
		
		return "";
	}
	
	public String getIP()
	{
		return _req.getRemoteAddr();
	}
	
	public String getUserID()
	{
		String ret = "";
		HttpSession sess = null;
		Object value = null;
		
		if( _req != null ) {
			sess = _req.getSession();
			value = sess.getAttribute(BoardConfig.UserID());
			
			if( value != null ) {
				ret = "test1";
			}
		}
		
		return ret;
	}
	
	public String getSessionUserID()
	{
		String ret = "";
		HttpSession sess = null;
		Object value = null;
		
		if( _req != null ) {
			sess = _req.getSession();
			value = sess.getAttribute(BoardConfig.UserID());
			
			if( value != null ) {
				ret = String.valueOf(value);
			}
		}
		
		return ret;
	}
	
	public String getUserName()
	{
		String ret = "";
		HttpSession sess = null;
		Object value = null;
		
		if( _req != null ) {
			sess = _req.getSession();
			value = sess.getAttribute(BoardConfig.UserName());
			
			if( value != null ) {
				ret = String.valueOf(value);
			}
		}
		
		return ret;
	}
	
	public String getGroupCode()
	{
		String ret = "";
		HttpSession sess = null;
		Object value = null;
		
		if( _req != null ) {
			sess = _req.getSession();
			value = sess.getAttribute(BoardConfig.UserGroupCode());
			
			if( value != null ) {
				ret = String.valueOf(value);
			}
		}
		
		return ret;
	}
	
	// 권한 레벨
	// 9 : 관리자
	// 5 : 파워유저
	// 3 : 사용자
	// 1 : Guest
	// 0 : 비로그인자
	public int getUserAuth()
	{
		int ret = 0;
		HttpSession sess = null;
		Object value = null;
		
		if( _req != null ) {
			sess = _req.getSession();
			value = sess.getAttribute(BoardConfig.UserAuth());
			
			if( value != null ) {
				ret = Integer.parseInt(String.valueOf(value));
			}
		}
		
		return ret;
	}
	
	public int getGroupAuth()
	{
		int ret = 0;
		HttpSession sess = null;
		Object value = null;
		
		if( _req != null ) {
			sess = _req.getSession();
			value = sess.getAttribute(BoardConfig.GroupAuth());
			
			if( value != null ) {
				ret = Integer.parseInt(String.valueOf(value));
			}
		}
		
		return ret;
	}
	
	// 사용자 권한 체크
	public boolean checkAuthority(int pageLevel, boolean bBackURL, boolean bScript)
	{
		JspWriter out = _pg.getOut();
		int userAuth, groupAuth;
		
		userAuth = getUserAuth();
		groupAuth = getGroupAuth();
		
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
					out.println("alert('\\n로그인이 필요한 페이지입니다.\\n\\n권한 확인을 위해 로그인을 해 주십시오.');");
					out.println("top.location.href='" + getContextPath() + "/" + BoardConfig.LoginPage() + "';");
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
			} else if( groupAuth >= pageLevel ) {
				if( userAuth >= 9 ) {
					return true;
				} else {
					try {
						if( bScript == false ) {
							out.println("<script type='text/javascript' language='javascript'>");
							out.println("alert('죄송합니다. 해당 기능에 대한 접근권한이 없습니다.');");
						}
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
