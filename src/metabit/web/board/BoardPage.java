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
			if( val == null || String.valueOf(val).equals("") ) {
				retVal = defaultValue;
			} else {
				retVal = val;
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
	
	// ���� ����
	// 9 : ������
	// 5 : �Ŀ�����
	// 3 : �����
	// 1 : Guest
	// 0 : ��α�����
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
	
	// ����� ���� üũ
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
					out.println("alert('\\n�α����� �ʿ��� �������Դϴ�.\\n\\n���� Ȯ���� ���� �α����� �� �ֽʽÿ�.');");
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
							out.println("alert('�˼��մϴ�. �ش� ��ɿ� ���� ���ٱ����� �����ϴ�.');");
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
