package kr.go.seoul.water.action.json;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONObject;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.sql.dao.CodeDao;
import kr.go.seoul.water.sql.vo.UserInfoVO;

public class LoginJsonAction extends BaseActionImp {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -1900191039110925957L;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String act;
		
		act = getAct();
		
		if( act.equals("login") ) {
			_login();
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private void _login()
	{
		CodeDao dao = new CodeDao();
		UserInfoVO item;
		
		JSONObject result = new JSONObject();
		
		boolean isLogin = false;
		boolean isOpenSystem = false;
		
		item = dao.selectOneLoginUserInfo(_getParamMap());
		if( item != null ) {
			isLogin = true;			
			if( item.getUSER_ID().equals("opensystem") ) {
				isOpenSystem = true;
			}
			
			HttpServletResponse res = null;
			HttpServletRequest req = null;
			
			try {
				res = ServletActionContext.getResponse();
				req = ServletActionContext.getRequest();
				
				// COOKIE에 정보 넣기
				{
					Cookie cookie;			
					cookie = new Cookie(WebConst.WEB_COOKIE_USER_ID, item.getUSER_ID());					
					cookie.setMaxAge(WebConst.WEB_COOKIE_AGE); // 유지기간 1년
					res.addCookie(cookie);
					cookie = null;
				}				
				
				// SESSION에 정보 넣기
				{
					HttpSession sess;
					sess = req.getSession();
					
					sess.setAttribute(WebConst.WEB_SESSION_USER_INFO, item);					

					// board를 위한 처리
					sess.setAttribute("USER_ID", item.getUSER_ID());
					sess.setAttribute("USER_NAME", item.getUSER_NAME());
					sess.setAttribute("USER_GROUP_CODE", item.getWW_CODE());
					sess.setAttribute("USER_AUTH", item.getUSER_AUTH());
					sess.setAttribute("GROUP_AUTH", item.getGROUP_AUTH());					
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else {
			isLogin = false;
		}
		
		result.put("isLogin", isLogin);
		result.put("isOpenSystem", isOpenSystem);
		
		// 페이지 출력
		_writeJsonResultPage(result);
		
		// 소멸
		result = null;		
		dao = null;
	}
}
