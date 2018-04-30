package kr.go.seoul.water.action;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class BaseActionImp extends ActionSupport {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5479733875711783787L;
	
	/*******************************************************************
	 * 사용 파라미터 설정
	 *******************************************************************
	 * Act : action 명칭
	 *******************************************************************/
	private String Act;
	
	protected void _writeJsonResultPage(JSONObject result)
	{
		HttpServletResponse res = null;		
		ServletOutputStream out = null;
		
		try {
			res = ServletActionContext.getResponse();
			if( res != null ) {
				out = res.getOutputStream();
				if( out != null ) {
					res.setContentType("application/json;");
					res.setHeader("Cache-Control", "no-store");
					System.out.println(result.toJSONString());
					//out.println(result.toJSONString());
					out.print(new String(result.toJSONString().getBytes("UTF-8"), "ISO-8859-1"));
					out.flush();
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			res = null;
			out = null;
		}
	}
	
	protected Map<String, Object> _getParamMap()
	{
		Map<String, Object> params = null;
		HttpServletRequest req = null;
		Enumeration<String> names = null;
		String name, value;
		
		params = new HashMap<String, Object>();
		req = ServletActionContext.getRequest();
	
		if( req != null ) {
			names = req.getParameterNames();
			while( names.hasMoreElements() ) {
				name = names.nextElement();
				value = req.getParameter(name);
				/*
				try {
					value = new String(req.getParameter(name).getBytes("ISO-8859-1"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					value = "";
				}
				*/
				params.put(name, value);
			}
		}
		
		return params;
	}
	
	public BaseActionImp()
	{
		Act = "";
	}

	public String getAct() {
		return Act;
	}

	public void setAct(String act) {
		Act = act;
	}
}
