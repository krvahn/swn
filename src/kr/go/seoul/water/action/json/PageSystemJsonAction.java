package kr.go.seoul.water.action.json;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageSystemDao;

public class PageSystemJsonAction extends BaseActionImp {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1524393605449597016L;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String act;
		
		act = getAct();
		
		// Act에 따른 분기
		if( act.equals("status_manager.list") ) {
			// opensyste - 측정상태 목록 조회
			_statusManagerList();
		} else if( act.equals("status_manager.save") ) {
			// opensyste - 측정상태 저장
			_statusManagerSave();
		} else if( act.equals("data_sending.total") ) {
			// 시스템 관리 - 자료전송현황 - 종합요약
			_dataSendingSummary();
		} else if( act.equals("data_sending.office") ) {
			// 시스템 관리 - 자료전송현황 - (정수센터, 사업소별)
			_dataSendingOffice();
		} else if( act.equals("group_manager.list") ) {
			// 시스템 관리 - 사용자 관리 - 사용자 그룹 관리
			_groupManagerList();
		} else if( act.equals("user_manager.list") ) {
			// 시스템 관리 - 사용자 관리 - 사용자 정보 관리
			_userManagerList();
		} else if( act.equals("water_manager.list") ) {
			// 시스템 관리 - 사용자 관리 - 사업소 담당자 정보
			_waterManagerList();
		} else if( act.equals("point_office.list") ) {
			// 시스템 관리 - 측정포인트관리 - (정수센터, 사업소별)
			_pointOfficeList();
		} else if( act.equals("measure_item.list") ) {
			// 시스템 관리 - 측정항목관리 - 측정항목리스트
			_measureItemList();
		} else if( act.equals("item_set_unselect.list")) {
			// 시스템 관리 - 측정항목설정 - 미선택
			_itemSetUnselectList();		
		} else if( act.equals("item_set_select.list")) {
			// 시스템 관리 - 측정항목설정 - 선택
			_itemSetSelectList();
		} else if( act.equals("item_set_select.save")) {
			// 시스템 관리 - 측정항목설정 - 저장
			_itemSetSelectSave();
		} else if( act.equals("status_sub.list") ) {
			// 시스템 관리 - 상태정보 소분류 - 리스트
			_statusSubList();
		} else if( act.equals("status_top.list") ) {
			// 시스템 관리 - 상태정보 대분류 - 리스트
			_statusTopList();
		} else if( act.equals("base_line_exec.plant") ) {
			// 시스템 관리 - 기준치초과이력 - 정수센터
			_baseLineExecPlant();
		} else if( act.equals("base_line_exec.water") ) {
			// 시스템 관리 - 기준치초과이력 - 수도사업소
			_baseLineExecWater();
		} else if( act.equals("sms_send.list") ) {
			// 시스템 관리 - SMS 전송 이력 조회 - (정수센터, 사업소별)
			_smsSendList();
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private void _statusManagerList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String wwCode, pointCode;
		String curWWCode, curPointCode, curItemCode;
		String statCode, statName, strTmp;
		int index;
		
		list = dao.selectStatusManagerList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			
			index = 0;
			wwCode = "";
			pointCode = "";
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				
				curWWCode = WebUtils.CheckNull(item.get("WW_CODE"), "");
				curPointCode = WebUtils.CheckNull(item.get("ANAL_POINT_CODE"), "");
				curItemCode = WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				
				statCode = WebUtils.CheckNull(item.get("STATUS_CODE"), "");
				statName = "";
				if( statCode.equals("00") ) {
					statName = "정상";
				} else if( statCode.equals("01") ) {
					statName = "수질이상";
				} else if( statCode.equals("02") ) {
					statName = "전송이상";
				} else if( statCode.equals("03") ) {
					statName = "미수신";
				} else if( statCode.equals("04") ) {
					statName = "점검중";
				} else if( statCode.equals("05") ) {
					statName = "정상";
				}
				
				if( curWWCode.equals(wwCode) ) {
					js.add("#rowspan");
				} else {
					js.add(WebUtils.CheckNull(item.get("WW_NAME"), ""));
				}
				if( curWWCode.equals(wwCode) && curPointCode.equals(pointCode)) {
					js.add("#rowspan");
				} else {
					js.add(WebUtils.CheckNull(item.get("ANAL_POINT_NAME"), ""));
				}
				js.add(WebUtils.CheckNull(item.get("ITEM_NAME"), ""));
				js.add(statName);
				
				strTmp = WebUtils.CheckNull(item.get("SET_DATE"), "");
				if( strTmp.length() >= 12 ) {
					strTmp = WebUtils.String2DateTimeFormat(strTmp.substring(0, 12), "yyyyMMddHHmm", "yyyy-MM-dd HH:mm");
				}
				js.add(strTmp);
				
				strTmp = "";
				strTmp += "<input type=radio name='status_code_" + String.valueOf(index) + "' value='05'" + (statCode.equals("00") || statCode.equals("05") ? " checked" : "") + ">정상<br>";
				strTmp += "<input type=radio name='status_code_" + String.valueOf(index) + "' value='01'" + (statCode.equals("01") ? " checked" : "") + ">수질이상<br>";
				strTmp += "<input type=radio name='status_code_" + String.valueOf(index) + "' value='02'" + (statCode.equals("02") ? " checked" : "") + ">전송이상<br>";
				strTmp += "<input type=radio name='status_code_" + String.valueOf(index) + "' value='04'" + (statCode.equals("04") ? " checked" : "") + ">점검중";
				js.add(strTmp);
				
				strTmp = "";
				strTmp += "<a href=\"javascript:fnChange('status_code_" + String.valueOf(index) + "', '" + curWWCode + "', '" + curPointCode + "', '" + curItemCode + "');\">";
				strTmp += "<img src='" + ServletActionContext.getServletContext().getContextPath() + "/images/comm/20090514_swn_btn01.gif' border=0>";
				strTmp += "</a>";
				js.add(strTmp);
				
				arrData.add(js);
				
				index ++;
				wwCode = curWWCode;
				pointCode = curPointCode;
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
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
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _statusManagerSave()
	{
		PageSystemDao dao = new PageSystemDao();
		
		JSONObject result = new JSONObject();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		int nRet = dao.updateStatusMangerItem(params);
		if( nRet > 0 ) {
			result.put("isOk", true);
		} else {
			result.put("isOk", false);
		}
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		result = null;
		dao = null;
	}

	@SuppressWarnings("unchecked")
	private void _dataSendingSummary()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		int nNo;
		String wpName, wpCode, message, analDate, cmpDate;
		
		nNo = 1;
		cmpDate = WebUtils.DateTimeDiff(WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd HH:mm:ss"), "yyyy-MM-dd HH:mm:ss", "h", -1);
				 
		list = dao.selectDataSendingTotalList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				wpName = "";
				wpCode = String.valueOf(item.get("WW_CODE"));
				if( wpCode != null && wpCode.length() > 0 ) {
					wpName = WebConst.GetWPShortName(wpCode);
					if( wpCode.indexOf("P") == 0 ) {
						wpName += "아리수정수센터";
					} else if( wpCode.indexOf("W") == 0 ) {
						wpName += "수도사업소";
					}
				} 
				
				message = "";
				if( item.get("ANAL_DATE") != null ) {
					analDate = String.valueOf(item.get("ANAL_DATE"));
					analDate = WebUtils.String2DateTimeFormat(analDate, "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss");
					if( analDate.compareTo(cmpDate) < 0 ) {
						message = "<font color=red>점검요망</font>";
					} else {
						message = "OK";
					}
				} else {
					analDate = "";
				}
				
				JSONArray js;
				js = new JSONArray();
				js.add(nNo);
				js.add(wpName);
				js.add(message);
				js.add(analDate);
				
				arrData.add(js);
				
				nNo ++;
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			
			arrData.add(js);
		}
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _dataSendingOffice()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		int nNo;
		String pointName, pointType, message, analDate, cmpDate;
		
		nNo = 1;
		cmpDate = WebUtils.DateTimeDiff(WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd HH:mm:ss"), "yyyy-MM-dd HH:mm:ss", "h", -1);
		
		pointType = String.valueOf(params.get("WW_TYPE"));
		list = dao.selectDataSendingOfficeList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				pointName = "";
				if( pointType != null && pointType.length() > 0 ) {
					if( pointType.equals("P")) {
						pointName = String.valueOf(item.get("ANAL_POINT_NAME"));
						pointName += "(" + String.valueOf(item.get("POINT_NAME")) + ")";
					} else {
						pointName = WebConst.GetPointFullName(String.valueOf(item.get("ANAL_POINT_NAME")), String.valueOf(item.get("TYPE_NAME")), " ");
					}
				} 
				
				message = "";
				if( item.get("ANAL_DATE") != null ) {
					analDate = String.valueOf(item.get("ANAL_DATE"));
					analDate = WebUtils.String2DateTimeFormat(analDate, "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss");
					if( analDate.compareTo(cmpDate) < 0 ) {
						message = "<font color=red>점검요망</font>";
					} else {
						message = "OK";
					}
				} else {
					message = "자료가 없습니다.";
					analDate = "--";
				}
				
				JSONArray js;
				js = new JSONArray();
				js.add(nNo);
				js.add(pointName);
				js.add(message);
				js.add(analDate);
				
				arrData.add(js);
				
				nNo ++;
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			
			arrData.add(js);
		}
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _groupManagerList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String scriptLink;
		
		list = dao.seletGroupManagerDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("GROUP_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("GROUP_CODE"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("GROUP_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("GROUP_NAME"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("GROUP_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("GROUP_AUTH"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnDelete('" + String.valueOf(item.get("GROUP_CODE")) + "', '" + String.valueOf(item.get("GROUP_AUTH")) + "');\">";
				scriptLink += "<img src='" + ServletActionContext.getServletContext().getContextPath() + "/images/comm/20081212_swn_btn_delete02.gif'>";
				scriptLink += "</a>";
				js.add(scriptLink);	
				
				arrData.add(js);
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			
			arrData.add(js);
		}
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _userManagerList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String scriptLink;
		
		// 한글이므로 캐릭터 셋 변환
		{	
			try {
				String paramSearchKeyword;
				
				paramSearchKeyword = new String(String.valueOf(params.get("SEARCH_KEYWORD")).getBytes("ISO-8859-1"));
				params.put("SEARCH_KEYWORD", paramSearchKeyword);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				params.put("SEARCH_KEYWORD", "");
			}
		}
		
		list = dao.seletUserManagerDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("USER_ID")) + "');\">";
				scriptLink += String.valueOf(item.get("GROUP_NAME"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("USER_ID")) + "');\">";
				scriptLink += String.valueOf(item.get("USER_NAME"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("USER_ID")) + "');\">";
				scriptLink += String.valueOf(item.get("USER_ID"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("USER_ID")) + "');\">";
				scriptLink += String.valueOf(item.get("WW_NAME"));				
				scriptLink += "</a>";
				js.add(scriptLink);
				
				arrData.add(js);
			}
			
			result.put("sEcho", 1);
			result.put("iTotalRecords", list.size());
			result.put("iTotalDisplayRecords", 12);
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			
			arrData.add(js);
			
			result.put("sEcho", 1);
			result.put("iTotalRecords", 1);
			result.put("iTotalDisplayRecords", 1);
		}
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _waterManagerList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String scriptLink;
		
		list = dao.seletWaterManagerDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("WW_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("WW_NAME"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("WW_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("MANAGER_NAME"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("WW_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("TELNUM"));
				scriptLink += "</a>";
				js.add(scriptLink);	
				
				arrData.add(js);
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			
			arrData.add(js);
		}
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _pointOfficeList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// 한글이므로 캐릭터 셋 변환
		{	
			try {
				String paramPointName;
				
				paramPointName = new String(String.valueOf(params.get("POINT_NAME")).getBytes("ISO-8859-1"));
				params.put("POINT_NAME", paramPointName);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				params.put("POINT_NAME", "");
			}
		}
		
		String scriptLink, scriptParam;
		String sTemp;
		String curWWType, curWWCode, curFactoryCode;
		String wwType, wwCode, factoryCode;
		
		list = dao.seletPointOfficeDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			
			wwType = "";
			wwCode = "";
			factoryCode = "";
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				
				curWWType = String.valueOf(item.get("WW_TYPE"));
				curWWCode = String.valueOf(item.get("WW_CODE"));
				curFactoryCode = String.valueOf(item.get("FACTORY_CODE"));
				
				if( curWWType.equals(wwType) ) {
					js.add("#rowspan");
				} else {
					scriptLink = "<a href=\"javascript:fnReSelect('WW_TYPE', '" + String.valueOf(item.get("WW_TYPE")) + "');\">";
					scriptLink += String.valueOf(item.get("WW_TYPE_NAME"));
					scriptLink += "</a>";
					js.add(scriptLink);
				}
				
				if( curWWCode.equals(wwCode) ) {
					js.add("#rowspan");
				} else {
					scriptLink = "<a href=\"javascript:fnReSelect('WW_CODE', '" + String.valueOf(item.get("WW_CODE")) + "');\">";
					scriptLink += String.valueOf(item.get("WW_NAME"));
					scriptLink += "</a>";
					js.add(scriptLink);
				}
				
				if( curWWType.equals("P") ) {
					if( curWWCode.equals(wwCode) && curFactoryCode.equals(factoryCode) ) {
						js.add("#rowspan");
					} else {
						scriptLink = "<a href=\"javascript:fnReSelect('FACTORY_CODE', '" + String.valueOf(item.get("FACTORY_CODE")) + "');\">";
						scriptLink += String.valueOf(item.get("FACTORY_NAME"));
						scriptLink += "</a>";						
						js.add(scriptLink);
					}
					
					scriptLink = "<a href=\"javascript:fnReSelect('POINT_NAME', '" + String.valueOf(item.get("POINT_NAME")) + "');\">";
					scriptLink += String.valueOf(item.get("POINT_NAME"));
					scriptLink += "</a>";					
					js.add(scriptLink);
				} else {
					sTemp = WebConst.GetPointShortFullName(String.valueOf(item.get("POINT_NAME")), String.valueOf(item.get("TYPE_NAME")));
					scriptLink = "<a href=\"javascript:fnReSelect('POINT_CODE', '" + String.valueOf(item.get("POINT_CODE")) + "');\">";
					scriptLink += sTemp;
					scriptLink += "</a>";					
					js.add(scriptLink);
					
					scriptLink = "<a href=\"javascript:fnReSelect('WATER_PATH_CODE', '" + String.valueOf(item.get("WATER_PATH_CODE")) + "');\">";
					scriptLink += String.valueOf(item.get("WATER_PATH_NAME"));
					scriptLink += "</a>";						
					js.add(scriptLink);
				}
				
				scriptParam = "'" + String.valueOf(item.get("WW_TYPE")) + "', '" + String.valueOf(item.get("WW_CODE")) + "', '" + String.valueOf(item.get("POINT_CODE")) + "'";
				scriptLink = "<a href=\"javascript:fnUpdate(" + scriptParam + ");\">";
				scriptLink += "<img src='" + ServletActionContext.getServletContext().getContextPath() + "/images/comm/20090506_swn_btn04.gif'>";
				scriptLink += "</a>";
				js.add(scriptLink);	
				
				wwType = curWWType;
				wwCode = curWWCode;
				factoryCode = curFactoryCode;
				
				arrData.add(js);
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
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
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _measureItemList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String scriptLink;
		
		list = dao.selectMeasureItemDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				
				js.add(String.valueOf(item.get("TYPE_NAME")));
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("ITEM_CODE")) + "', '" + String.valueOf(item.get("POINT_CLASS")) + "');\">";
				scriptLink += String.valueOf(item.get("ITEM_CODE"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				js.add(String.valueOf(item.get("ANAL_ITEM_NAME")));
				if( item.get("ANAL_UNIT") != null ) {
					js.add(String.valueOf(item.get("ANAL_UNIT")));
				} else {
					js.add("");
				}
				if( item.get("HIGH_HIGH") != null ) {
					js.add(String.valueOf(item.get("HIGH_HIGH")));
				} else {
					js.add("");
				}
				if( item.get("HIGH") != null ) {
					js.add(String.valueOf(item.get("HIGH")));
				} else {
					js.add("");
				}
				if( item.get("LOW_LOW") != null ) {
					js.add(String.valueOf(item.get("LOW_LOW")));
				} else {
					js.add("");
				}
				if( item.get("LOW") != null ) {
					js.add(String.valueOf(item.get("LOW")));
				} else {
					js.add("");
				}
				js.add(String.valueOf(item.get("USE_TEXT")));
				
				arrData.add(js);
			}
		} else {
			JSONArray js;
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
			
			arrData.add(js);
		}
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _itemSetUnselectList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		list = dao.selectItemSetUnselectList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				String itemCode, itemName, itemRemark;
				
				JSONArray js;
				js = new JSONArray();
				
				itemCode = "";
				if( item.get("ITEM_CODE") != null ) {
					itemCode = String.valueOf(item.get("ITEM_CODE"));
				}
				
				itemName = "";
				if( item.get("ITEM_NAME") != null ) {
					itemName = String.valueOf(item.get("ITEM_NAME"));
				}
				
				itemRemark = "";
				if( item.get("ITEM_REMARK") != null ) {
					itemRemark = String.valueOf(item.get("ITEM_REMARK")).trim();
				}
				
				if( itemRemark.length() == 0 ) {
					itemName += "(" + itemRemark + ")";
				}
				
				js.add(itemCode);
				js.add(itemName);
				
				arrData.add(js);
			}
		}
		
		result.put("aaItems", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _itemSetSelectList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		list = dao.selectItemSetSelectList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				String itemCode, itemName, itemRemark;
				
				JSONArray js;
				js = new JSONArray();
				
				itemCode = "";
				if( item.get("ITEM_CODE") != null ) {
					itemCode = String.valueOf(item.get("ITEM_CODE"));
				}
				
				itemName = "";
				if( item.get("ITEM_NAME") != null ) {
					itemName = String.valueOf(item.get("ITEM_NAME"));
				}
				
				itemRemark = "";
				if( item.get("ITEM_REMARK") != null ) {
					itemRemark = String.valueOf(item.get("ITEM_REMARK")).trim();
				}
				
				if( itemRemark.length() == 0 ) {
					itemName += "(" + itemRemark + ")";
				}
				
				js.add(itemCode);
				js.add(itemName);
				
				arrData.add(js);
			}
		}
		
		result.put("aaItems", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _itemSetSelectSave()
	{
		PageSystemDao dao = new PageSystemDao();
		
		JSONObject result = new JSONObject();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// 문자열 분해하기
		List<String> items = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull(params.get("ITEMS"),""), ",");
			while(st.hasMoreTokens()) {
				items.add(st.nextToken().trim());
			}
		}
		params.put("ITEMS", items);
		
		int nRet = dao.updateItemSetList(params);
		if( nRet >= 0 ) {
			result.put("isOk", true);
		} else {
			result.put("isOk", false);
		}
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _statusSubList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String scriptLink;
		
		list = dao.selectStatusSubDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				js.add(String.valueOf(item.get("TOP_STATUS_NAME")) + " (" + String.valueOf(item.get("TOP_STATUS_CODE")) + ")");
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("TOP_STATUS_CODE")) + "', '" + String.valueOf(item.get("STATUS_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("STATUS_CODE"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("TOP_STATUS_CODE")) + "', '" + String.valueOf(item.get("STATUS_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("STATUS_NAME"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("TOP_STATUS_CODE")) + "', '" + String.valueOf(item.get("STATUS_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("STATUS_TYPE_NAME"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnDelete('" + String.valueOf(item.get("TOP_STATUS_CODE")) + "', '" + String.valueOf(item.get("STATUS_CODE")) + "');\">";
				scriptLink += "<img src='" + ServletActionContext.getServletContext().getContextPath() + "/images/comm/20081212_swn_btn_delete02.gif'>";
				scriptLink += "</a>";
				js.add(scriptLink);
				
				arrData.add(js);
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
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
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _statusTopList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String scriptLink;
		
		list = dao.selectStatusTopDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("TOP_STATUS_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("TOP_STATUS_CODE"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("TOP_STATUS_CODE")) + "');\">";
				scriptLink += String.valueOf(item.get("TOP_STATUS_NAME"));
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnUpdate('" + String.valueOf(item.get("TOP_STATUS_CODE")) + "');\">";
				if( String.valueOf(item.get("USE_FLAG")).equals("U") ) {
					scriptLink += "사용";
				} else {
					scriptLink += "<font color=red>사용하지 않음</font>";
				}
				scriptLink += "</a>";
				js.add(scriptLink);
				
				scriptLink = "<a href=\"javascript:fnDelete('" + String.valueOf(item.get("TOP_STATUS_CODE")) + "');\">";
				scriptLink += "<img src='" + ServletActionContext.getServletContext().getContextPath() + "/images/comm/20081212_swn_btn_delete02.gif'>";
				scriptLink += "</a>";
				js.add(scriptLink);
				
				arrData.add(js);
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			
			arrData.add(js);
		}
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _baseLineExecPlant()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String fromDate, toDate;
		
		params = _getParamMap();
		
		// 날싸 및 시간 셋팅
		fromDate = String.valueOf(params.get("FROM_DATE")) + "00";
		toDate = String.valueOf(params.get("TO_DATE")) + "00";
		
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		
		list = dao.selectBaseLineExecPlantDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				js.add(String.valueOf(item.get("WW_NAME")));
				js.add(String.valueOf(item.get("POINT_NAME")) + " (" + String.valueOf(item.get("FACTORY_NAME")) + ")");
				js.add(WebUtils.String2DateTimeFormat(String.valueOf(item.get("START_DATE")), "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm"));
				js.add(String.valueOf(item.get("ITEM_NAME")));
				if( item.get("HIGH_HIGH") == null ) {
					js.add("-");
				} else {
					js.add(WebUtils.FormatNumber((Double) item.get("HIGH_HIGH"), "0.00"));
				}
				if( item.get("LOW_LOW") == null ) {
					js.add("-");
				} else {
					js.add(WebUtils.FormatNumber((Double) item.get("LOW_LOW"), "0.00"));
				}
				js.add(String.valueOf((Double) item.get("START_ITEM_VAL")) + (String.valueOf(item.get("ITEM_UNIT")).equals("") ? "" : " " + String.valueOf(item.get("ITEM_UNIT"))) );
				
				arrData.add(js);
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
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
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _baseLineExecWater()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String fromDate, toDate;
		
		params = _getParamMap();
		
		// 날싸 및 시간 셋팅
		fromDate = String.valueOf(params.get("FROM_DATE")) + "00";
		toDate = String.valueOf(params.get("TO_DATE")) + "00";
		
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		
		list = dao.selectBaseLineExecWaterDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				js.add(String.valueOf(item.get("WW_NAME")));
				js.add(WebConst.GetPointShortFullName(String.valueOf(item.get("POINT_NAME")), String.valueOf(item.get("FACTORY_NAME"))));
				js.add(WebUtils.String2DateTimeFormat(String.valueOf(item.get("START_DATE")), "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm"));
				js.add(String.valueOf(item.get("ITEM_NAME")));
				if( item.get("HIGH_HIGH") == null ) {
					js.add("-");
				} else {
					js.add(WebUtils.FormatNumber((Double) item.get("HIGH_HIGH"), "0.00"));
				}
				if( item.get("LOW_LOW") == null ) {
					js.add("-");
				} else {
					js.add(WebUtils.FormatNumber((Double) item.get("LOW_LOW"), "0.00"));
				}
				js.add(String.valueOf((Double) item.get("START_ITEM_VAL")) + (String.valueOf(item.get("ITEM_UNIT")).equals("") ? "" : " " + String.valueOf(item.get("ITEM_UNIT"))) );
				
				arrData.add(js);
			}
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
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
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _smsSendList()
	{
		PageSystemDao dao = new PageSystemDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		list = dao.selectSmsSendList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				JSONArray js;
				js = new JSONArray();
				js.add(String.valueOf(item.get("ALARM_MSG")));
				js.add(String.valueOf(item.get("RECEIVE_COUNT")));
				js.add(String.valueOf(item.get("MSG")));
				
				arrData.add(js);
			}
			
			result.put("sEcho", 1);
			result.put("itotalRecords", list.size());
			result.put("iTotalDisplayRecords", 12);
		} else {
			JSONArray js;
			js = new JSONArray();
			js.add("<center>검색된 데이터가 존재하지 않습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			
			result.put("sEcho", 1);
			result.put("itotalRecords", 1);
			result.put("iTotalDisplayRecords", 1);
			
			arrData.add(js);
		}
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
}
