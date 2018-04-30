package kr.go.seoul.water.action.json;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageManualItemDao;

public class PageManualItemJsonAction extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -370060489508368754L;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String act;
		
		act = getAct();
		
		// Act�� ���� �б�
		if( act.equals("lab_measure_item.list") ) {
			// ���������Է����� - ����� �����׸� ���� - ����Ʈ
			_labMeasureItemList();
		}
		
		return null;
	}

	@SuppressWarnings("unchecked")
	private void _labMeasureItemList()
	{
		PageManualItemDao dao = new PageManualItemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// �ѱ��̹Ƿ� ĳ���� �� ��ȯ
		{	
			try {
				String paramSearchKeyword;
				
				paramSearchKeyword = new String(String.valueOf(params.get("SEARCH_KEYWORD")).getBytes("ISO-8859-1"));
				params.put("SEARCH_KEYWORD", paramSearchKeyword);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				
				params.put("SEARCH_KEYWORD", "");
			}
		}
		
		String strTmp, scriptLink;
		String itemCode, wwType;
		int index;
		
		index = 1;
		list = dao.selectLabMeasureItemDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				itemCode = WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				wwType = WebUtils.CheckNull(item.get("WW_TYPE"), "");
				
				JSONArray js;
				js = new JSONArray();
				
				js.add(String.valueOf(index));
				js.add(WebUtils.CheckNull(item.get("WATER_TEXT"), ""));
				js.add(WebUtils.CheckNull(item.get("CHECK_TEXT"), ""));
				scriptLink = "";
				scriptLink += "<a href=\"javascript:fnUpdate('" + itemCode + "', '" + wwType + "');\">";
				scriptLink += WebUtils.CheckNull(item.get("ITEM_KNAME"), "");
				scriptLink += "</a>";
				js.add(scriptLink);
				js.add(WebUtils.CheckNull(item.get("ITEM_UNIT"), ""));
				
				strTmp = "";
				if( WebUtils.CheckNull(item.get("ITEM_16"), "").equals("Y") ) {
					strTmp += (strTmp.length() > 0 ? "<br>" : "") + "�����׸�(16��)";
				}
				if( WebUtils.CheckNull(item.get("ITEM_23"), "").equals("Y") ) {
					strTmp += (strTmp.length() > 0 ? "<br>" : "") + "23�׸�";
				}
				if( WebUtils.CheckNull(item.get("ITEM_47"), "").equals("Y") ) {
					strTmp += (strTmp.length() > 0 ? "<br>" : "") + "47�׸�";
				}
				if( WebUtils.CheckNull(item.get("ITEM_55"), "").equals("Y") ) {
					strTmp += (strTmp.length() > 0 ? "<br>" : "") + "55�׸�";
				}
				js.add(strTmp);
				js.add(WebUtils.CheckNull(item.get("ENV_HIGH"), ""));
				js.add(WebUtils.CheckNull(item.get("ENV_LOW"), ""));
				js.add(WebUtils.CheckNull(item.get("EAT_HIGH"), ""));
				js.add(WebUtils.CheckNull(item.get("EAT_LOW"), ""));
				
				scriptLink = "";
				scriptLink += "<a href=\"javascript:fnDelete('" + itemCode + "', '" + wwType + "');\">";
				scriptLink += "<img src='" + ServletActionContext.getServletContext().getContextPath() + "/images/comm/20081212_swn_btn_delete02.gif' border=0>";
				scriptLink += "</a>";
				js.add(scriptLink);
				
				index ++;
				
				arrData.add(js);
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� �������� �ʽ��ϴ�.</center>");
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
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
}
