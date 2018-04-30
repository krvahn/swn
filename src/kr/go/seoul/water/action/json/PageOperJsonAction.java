package kr.go.seoul.water.action.json;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageOperDao;

public class PageOperJsonAction extends BaseActionImp {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 169175098777364281L;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String act;
		
		act = getAct();
		
		// Act에 따른 분기
		if( act.equals("oper_result_form.list") ) {
			_operResultFormList();
		} if( act.equals("oper_result.list") ) {
			// 일일 운영 / 일일운영결과 조회
			_operResultList();
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private void _operResultFormList()
	{
		PageOperDao dao = new PageOperDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
				
		JSONArray js;		
		JSONArray arrData = new JSONArray();
		JSONObject result = new JSONObject();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String html;
		String wwCode;
		String WW_CODE_LIST = "";
		
		list = dao.selectOperResultDataList(params);			
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				wwCode = WebUtils.CheckNull(item.get("WW_CODE"), "");
				WW_CODE_LIST += (WW_CODE_LIST.length() > 0 ? "," : "") +  wwCode;
				
				js = new JSONArray();
				js.add(WebUtils.CheckNull(item.get("WW_NAME"), ""));
				
				js.add(WebConst.GetOperItem(WebUtils.CheckNull(item.get("WW_CODE"), "")));
				
				html = "<input type='checkbox' name='CHECK_SEL1_" + wwCode + "' id='CHECK_SEL1_" + wwCode + "' onclick=\"fnCheckSel(1, '" + wwCode + " ');\">";
				js.add(html);
				
				html = "<input type='checkbox' name='CHECK_YN_" + wwCode + "' id='CHECK_YN_" + wwCode + "'" + (WebUtils.CheckNull(item.get("CHECK_YN"), "").equals("Y") ? " checked" : "") + " disabled>";
				js.add(html);
				
				html = "<input type='checkbox' name='UNUSUAL_YN_" + wwCode + "' id='UNUSUAL_YN_" + wwCode + "'" + (WebUtils.CheckNull(item.get("UNUSUAL_YN"), "").equals("Y") ? " checked" : "") + " disabled>";
				js.add(html);
				
				html = "<textarea name='UNUSUAL_CONTENT_" + wwCode + "' id='UNUSUAL_CONTENT_" + wwCode + "' cols=20 rows=4 style='width:100%; height:50px; vertical-align:middle; overflow:auto;' disabled>";
				html += WebUtils.CheckNull(item.get("UNUSUAL_CONTENT"), "");
				html += "</textarea>";
				js.add(html);
				
				js.add(WebUtils.CheckNull(item.get("CHECK_NAME"), ""));
				if( WebUtils.CheckNull(item.get("CHECK_DATE"), "").equals("") ) {
					js.add("");
				} else {
					js.add(WebUtils.String2DateTimeFormat(WebUtils.CheckNull(item.get("CHECK_DATE"), ""), "yyyyMMdd", "yyyy-MM-dd"));
				}				
				
				html = "<input type='checkbox' name='CHECK_SEL2_" + wwCode + "' id='CHECK_SEL2_" + wwCode + "' onclick=\"fnCheckSel(2, '" + wwCode + " ');\">";
				js.add(html);
				
				html = "<textarea name='CONFIRM_CONTENT_" + wwCode + "' id='CONFIRM_CONTENT_" + wwCode + "' cols=20 rows=4 style='width:100%; height:50px; vertical-align:middle; overflow:auto;' disabled>";
				html += WebUtils.CheckNull(item.get("CONFIRM_CONTENT"), "");
				html += "</textarea>";
				js.add(html);
				
				js.add(WebUtils.CheckNull(item.get("CONFIRM_NAME"), ""));
				if( WebUtils.CheckNull(item.get("CONFIRM_DATE"), "").equals("") ) {
					js.add("");
				} else {
					js.add(WebUtils.String2DateTimeFormat(WebUtils.CheckNull(item.get("CONFIRM_DATE"), ""), "yyyyMMdd", "yyyy-MM-dd"));
				}
				
				arrData.add(js);
			}
		} else {
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
		}
		
		result.put("aaData", arrData);
		result.put("sWW_CODE_LIST", WW_CODE_LIST);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _operResultList()
	{
		PageOperDao dao = new PageOperDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
				
		JSONArray js;		
		JSONArray arrData = new JSONArray();
		JSONObject result = new JSONObject();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// 조건 재설정
		String fromDate, toDate;
		
		fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 6) + "00";
		toDate = String.valueOf(params.get("WORK_DATE")).substring(0, 6) + "99";
		
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		
		// 문자열 분해하기
		List<String> wwCodeList = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull(params.get("ITEMS"),""), ",");
			while(st.hasMoreTokens()) {
				wwCodeList.add(st.nextToken().trim());
			}
		}
		params.put("ITEMS", wwCodeList);
		
		//		
		list = dao.selectOperResultConfirmDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				js = new JSONArray();
				js.add( WebUtils.String2DateTimeFormat(String.valueOf(item.get("WW_DATE")), "yyyyMMdd", "MM/dd"));
				
				for(int i = 0; i < wwCodeList.size(); i ++) {
					js.add(WebUtils.CheckNull(item.get("UNUSUAL_CONTENT_" + wwCodeList.get(i)), ""));
				}
				arrData.add(js);
				
				js = new JSONArray();
				js.add("#rowspan");
				for(int i = 0; i < wwCodeList.size(); i ++) {
					js.add(WebUtils.CheckNull(item.get("CONFIRM_CONTENT_" + wwCodeList.get(i)), ""));
				}
				arrData.add(js);
			}
		} else {
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			
			arrData.add(js);
		}
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		arrData = null;
		result = null;
		dao = null;
	}
}
