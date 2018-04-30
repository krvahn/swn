package kr.go.seoul.water.action.json;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.CodeDao;
import kr.go.seoul.water.sql.dao.PageManualSearchEtcDao;

public class PageManualSearchEtcJsonAction extends BaseActionImp {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -370060489508368754L;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String act;
		
		act = getAct();
		
		// Act에 따른 분기
		if( act.equals("lab_inout_result_plant.item")) {
			// 정수센터입력정보 - 실험실 측정자료 조회 - 취정수수질검사결과 - 정수센터 - 아이템
			_labInOutResultPlantItem();
		} else if( act.equals("lab_inout_result_plant.list")) {
			// 정수센터입력정보 - 실험실 측정자료 조회 - 취정수수질검사결과 - 정수센터 - 데이터
			_labInOutResultPlantList();
		} else if( act.equals("lab_inout_result_water.list")) {
			// 정수센터입력정보 - 실험실 측정자료 조회 - 취정수수질검사결과 - 상수도연구원 - 개별항목
			_labInOutResultWaterList();
		} else if(act.equals("lab_inout_result_water_all_in.list")) {
			// 정수센터입력정보 - 실험실 측정자료 조회 - 취정수수질검사결과 - 상수도연구원 - 전체항목 - 원수
			_labInOutResultWaterAllInList();
		} else if(act.equals("lab_inout_result_water_all_out.list")) {
			// 정수센터입력정보 - 실험실 측정자료 조회 - 취정수수질검사결과 - 상수도연구원 - 전체항목 - 정수
			_labInOutResultWaterAllOutList();
		} else if( act.equals("lab_baseline_oper.list") ) {
			// 정수센터입력정보 - 실험실 측정자료 조회 - 정수처리기준 운영결과
			_labBaselineOperList();
		}
		
		return null;
	}	
	
	@SuppressWarnings("unchecked")
	private void _labInOutResultPlantItem()
	{
		JSONObject result = new JSONObject();
		JSONArray arrColumns = new JSONArray();
		JSONObject col;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String sTable;
		int nLoop, nLastDay;
		
		nLastDay = Integer.valueOf(WebUtils.LastDayOfMonth(String.valueOf(params.get("WORK_DATE"))+ "01", "yyyyMMdd").substring(6, 8));
		sTable = "";
		sTable += "<table width=100% height=100% cellspacing=1 cellpadding=0 id='report' class='display'>";
		sTable += "<thead>";
		sTable += "<tr>";
		sTable += " <th rowspan=2 height=50 width=100 class='swn_tbl_title'>구분</th>";
		sTable += " <th rowspan=2 width=100 class='swn_tbl_title'>연번</th>";
		sTable += " <th rowspan=2 width=100 class='swn_tbl_title'>측정항목</th>";
		sTable += " <th rowspan=2 width=100 class='swn_tbl_title'>최대</th>";
		sTable += " <th rowspan=2 width=100 class='swn_tbl_title'>최소</th>";
		sTable += " <th rowspan=2 width=100 class='swn_tbl_title'>평균</th>";
		sTable += " <th colspan=" + String.valueOf(nLastDay) + " height=25 class='swn_tbl_title'>측정일자</th>";
		sTable += "</tr>";
		sTable += "<tr>";
		for(nLoop = 0; nLoop < nLastDay; nLoop ++) {
			sTable += "<th class='swn_tbl_title'>" + WebUtils.FormatNumber(nLoop + 1, "00")+ "</th>";
		}
		sTable += "</tr>";
		sTable += "</table>";
				
		col = new JSONObject();
		col.put("sClass", "center");
		arrColumns.add(col);
		
		col = new JSONObject();
		col.put("sClass", "center");
		arrColumns.add(col);
		
		col = new JSONObject();
		col.put("sClass", "center");
		arrColumns.add(col);
		
		col = new JSONObject();
		col.put("sClass", "center");
		arrColumns.add(col);
		
		col = new JSONObject();
		col.put("sClass", "center");
		arrColumns.add(col);
		
		col = new JSONObject();
		col.put("sClass", "center");
		arrColumns.add(col);
		
		for(nLoop = 0; nLoop < nLastDay; nLoop ++)
		{
			col = new JSONObject();
			col.put("sClass", "right");
			arrColumns.add(col);
		}
		
		result.put("aoColumns", arrColumns);
		result.put("sHTML", sTable);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		result = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _labInOutResultPlantList()
	{
		PageManualSearchEtcDao dao = new PageManualSearchEtcDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		int nLoop, nLastDay;
		
		nLastDay = Integer.valueOf(WebUtils.LastDayOfMonth(String.valueOf(params.get("WORK_DATE"))+ "01", "yyyyMMdd").substring(6, 8));		
		List<String> searchItems = null;
		
		searchItems = new ArrayList<String>();
		for(nLoop = 0; nLoop < nLastDay; nLoop ++) {
			searchItems.add(WebUtils.FormatNumber(nLoop + 1, "00"));
		}
		params.put("ITEM_DATAS", searchItems);
		params.put("FROM_DATE", String.valueOf(params.get("WORK_DATE")) + "00");
		params.put("TO_DATE", String.valueOf(params.get("WORK_DATE")) + "99");

		int index;		
		String tmpName, tmpMaxData, tmpMinData, tmpAvgData, tmpData;
		String curCheckCycle, checkCycle;
		list = dao.selectLabInOutResultPlantDataList(params);
		if( list != null && list.size() > 0 ) {
			index = 1;
			curCheckCycle = "";
			checkCycle = "";
			
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				curCheckCycle = WebUtils.CheckNull(item.get("CHECK_CYCLE"), "");
				JSONArray js;
				js = new JSONArray();
				if( curCheckCycle.equals(checkCycle) ) {
					js.add("#rowspan");
				} else {
					index = 1;
					if( curCheckCycle.equals("D") ) {
						js.add("일일<br>검사항목");
					} else {
						js.add("주간<br>검사항목");
					}
				}
				js.add(String.valueOf(index));
				js.add(WebUtils.CheckNull(item.get("ITEM_KNAME"), ""));
				tmpMaxData = WebUtils.CheckNull(item.get("MAX_1"), "");
				tmpMinData = WebUtils.CheckNull(item.get("MIN_1"), "");
				tmpAvgData = WebUtils.CheckNull(item.get("AVG_1"), "");
				
				if( tmpMaxData.indexOf("99999") >= 0 ) {
					js.add("적합");
				} else {
					js.add(tmpMaxData);
				}
				
				if( tmpMaxData.equals("") || tmpMinData.equals("") ) {
					js.add("");
				} else {
					if( tmpMinData.indexOf("99999") >= 0 ) {
						js.add("적합");
					} else {
						js.add(tmpMinData);
					}
				}
				
				if( tmpAvgData.equals("") ) {
					js.add("");
				} else {
					if( tmpAvgData.indexOf("99999") >= 0 ) {
						js.add("적합");
					} else {
						js.add(tmpAvgData);
					}
				}

				for(nLoop = 0; nLoop < nLastDay; nLoop ++) {
					tmpName = "DATA_" + WebUtils.FormatNumber(nLoop + 1, "00");
					tmpData = WebUtils.CheckNull(item.get(tmpName), "");
					
					if( tmpData.indexOf("99999") >= 0 ) {
						js.add("적합");
					} else {
						js.add(tmpData);
					}
				}
				arrData.add(js);
				index ++;
				
				checkCycle = curCheckCycle;
			}
		} else {
			JSONArray js;
			
			js = new JSONArray();
			js.add("<center>검색된 데이터가 없습니다.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			for(nLoop = 0; nLoop < nLastDay; nLoop ++) {
				js.add("#colspan");
			}					
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
	private void _labInOutResultWaterList()
	{
		PageManualSearchEtcDao dao = new PageManualSearchEtcDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();

		String curDataMonth, dataMonth;
		double dPr0055, dPr0065, dPr0183, dPr0407, dPr0370, dPr0710;
		double dAvg, dAvgMin, dAvgMax;
		double dPr0055Sum, dPr0065Sum, dPr0183Sum, dPr0407Sum, dPr0370Sum, dPr0710Sum;
		double dPr0055Sub, dPr0065Sub, dPr0183Sub, dPr0407Sub, dPr0370Sub, dPr0710Sub;
		double dPr0055Min, dPr0065Min, dPr0183Min, dPr0407Min, dPr0370Min, dPr0710Min;
		double dPr0055Max, dPr0065Max, dPr0183Max, dPr0407Max, dPr0370Max, dPr0710Max;
		int iCnt;
		
		curDataMonth = "";
		dataMonth = "";
		
		dPr0055 = 0.0;
		dPr0065 = 0.0;
		dPr0183 = 0.0;
		dPr0407 = 0.0;
		dPr0370 = 0.0;
		dPr0710 = 0.0;
		
		dPr0055Sub = 0.0;
		dPr0065Sub = 0.0;
		dPr0183Sub = 0.0;
		dPr0407Sub = 0.0;
		dPr0370Sub = 0.0;
		dPr0710Sub = 0.0;
		
		dPr0055Sum = 0.0;
		dPr0065Sum = 0.0;
		dPr0183Sum = 0.0;
		dPr0407Sum = 0.0;
		dPr0370Sum = 0.0;
		dPr0710Sum = 0.0;
		
		dPr0055Min = 0.0;
		dPr0065Min = 0.0;
		dPr0183Min = 0.0;
		dPr0407Min = 0.0;
		dPr0370Min = 0.0;
		dPr0710Min = 0.0;
		
		dPr0055Max = 0.0;
		dPr0065Max = 0.0;
		dPr0183Max = 0.0;
		dPr0407Max = 0.0;
		dPr0370Max = 0.0;
		dPr0710Max = 0.0;
		
		dAvg = 0.0;
		dAvgMin = 0.0;
		dAvgMax = 0.0;
		
		iCnt = 0;
		
		list = dao.selectLabInOutResultWaterDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				curDataMonth = WebUtils.CheckNull(item.get("DATA_MONTH"), "");
				
				dPr0055 = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055"), ""));
				dPr0065 = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065"), ""));
				dPr0183 = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183"), ""));
				dPr0407 = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370"), ""));
				dPr0370 = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407"), ""));
				dPr0710 = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710"), ""));
				
				dPr0055Sum += dPr0055;
				dPr0065Sum += dPr0065;
				dPr0183Sum += dPr0183;
				dPr0407Sum += dPr0407;
				dPr0370Sum += dPr0370;
				dPr0710Sum += dPr0710;
				
				dAvg = (dPr0055 + dPr0065 + dPr0183 + dPr0407 + dPr0370 + dPr0710) / 6.0;
				
				if( dataMonth.equals("") ) {
					dPr0055Min = dPr0055;
					dPr0065Min = dPr0065;
					dPr0183Min = dPr0183;
					dPr0407Min = dPr0407;
					dPr0370Min = dPr0370;
					dPr0710Min = dPr0710;
					
					dPr0055Max = dPr0055;
					dPr0065Max = dPr0065;
					dPr0183Max = dPr0183;
					dPr0407Max = dPr0407;
					dPr0370Max = dPr0370;
					dPr0710Max = dPr0710;
					
					dAvgMin = dAvg;
					dAvgMax = dAvg;
				} else {
					dPr0055Min = Math.min(dPr0055Min, dPr0055);
					dPr0065Min = Math.min(dPr0065Min, dPr0065);
					dPr0183Min = Math.min(dPr0183Min, dPr0183);
					dPr0407Min = Math.min(dPr0407Min, dPr0407);
					dPr0370Min = Math.min(dPr0370Min, dPr0370);
					dPr0710Min = Math.min(dPr0710Min, dPr0710);
					
					dPr0055Max = Math.max(dPr0055Min, dPr0055);
					dPr0065Max = Math.max(dPr0065Max, dPr0065);
					dPr0183Max = Math.max(dPr0183Max, dPr0183);
					dPr0407Max = Math.max(dPr0407Max, dPr0407);
					dPr0370Max = Math.max(dPr0370Max, dPr0370);
					dPr0710Max = Math.max(dPr0710Max, dPr0710);
					
					dAvgMin = Math.min(dAvgMin, dAvg);
					dAvgMax = Math.max(dAvgMax, dAvg);
				}
				
				if( dataMonth.equals("") || curDataMonth.equals(dataMonth) ) {
					iCnt ++;
					
					dPr0055Sub += dPr0055;
					dPr0065Sub += dPr0065;
					dPr0183Sub += dPr0183;
					dPr0407Sub += dPr0407;
					dPr0370Sub += dPr0370;
					dPr0710Sub += dPr0710;
				} else {
					js = new JSONArray();
					js.add("월 평균");
					js.add("#colspan");
					js.add(WebUtils.FormatNumber(dPr0055Sub / iCnt, "#,##0.###"));
					js.add(WebUtils.FormatNumber(dPr0065Sub / iCnt, "#,##0.###"));
					js.add(WebUtils.FormatNumber(dPr0183Sub / iCnt, "#,##0.###"));
					js.add(WebUtils.FormatNumber(dPr0407Sub / iCnt, "#,##0.###"));
					js.add(WebUtils.FormatNumber(dPr0370Sub / iCnt, "#,##0.###"));
					js.add(WebUtils.FormatNumber(dPr0710Sub / iCnt, "#,##0.###"));
					js.add(WebUtils.FormatNumber((dPr0055Sub + dPr0065Sub + dPr0183Sub + dPr0407Sub + dPr0370Sub + dPr0710Sub) / iCnt / 6.0, "#,##0.##"));
					arrData.add(js);
					
					dPr0055Sub = dPr0055;
					dPr0065Sub = dPr0065;
					dPr0183Sub = dPr0183;
					dPr0407Sub = dPr0407;
					dPr0370Sub = dPr0370;
					dPr0710Sub = dPr0710;
					
					iCnt = 1;
				}
				
				js = new JSONArray();
				if( curDataMonth.equals(dataMonth) ) {
					js.add("#rowspan");
				} else {
					js.add(curDataMonth);
				}
				
				js.add(WebUtils.CheckNull(item.get("DATA_DAY"), ""));
				
				if( WebUtils.CheckNull(item.get("PR0055"), "").equals("") ) {
					js.add("");
				} else {
					js.add(WebUtils.FormatNumber(dPr0055, "#,##0.###"));
				}
				
				if( WebUtils.CheckNull(item.get("PR0065"), "").equals("") ) {
					js.add("");
				} else {
					js.add(WebUtils.FormatNumber(dPr0065, "#,##0.###"));
				}
				
				if( WebUtils.CheckNull(item.get("PR0183"), "").equals("") ) {
					js.add("");
				} else {
					js.add(WebUtils.FormatNumber(dPr0183, "#,##0.###"));
				}
				
				if( WebUtils.CheckNull(item.get("PR0370"), "").equals("") ) {
					js.add("");
				} else {
					js.add(WebUtils.FormatNumber(dPr0370, "#,##0.###"));
				}
				
				if( WebUtils.CheckNull(item.get("PR0407"), "").equals("") ) {
					js.add("");
				} else {
					js.add(WebUtils.FormatNumber(dPr0407, "#,##0.###"));
				}
				
				if( WebUtils.CheckNull(item.get("PR0710"), "").equals("") ) {
					js.add("");
				} else {
					js.add(WebUtils.FormatNumber(dPr0710, "#,##0.###"));
				}
				
				js.add(WebUtils.FormatNumber(dAvg, "#,##0.##"));
				arrData.add(js);
				
				dataMonth = curDataMonth;
			}
			
			js = new JSONArray();
			js.add("월 평균");
			js.add("#colspan");
			js.add(WebUtils.FormatNumber(dPr0055Sub / iCnt, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0065Sub / iCnt, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0183Sub / iCnt, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0407Sub / iCnt, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0370Sub / iCnt, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0710Sub / iCnt, "#,##0.###"));
			js.add(WebUtils.FormatNumber((dPr0055Sub + dPr0065Sub + dPr0183Sub + dPr0407Sub + dPr0370Sub + dPr0710Sub) / iCnt / 6.0, "#,##0.##"));
			arrData.add(js);
			
			js = new JSONArray();
			js.add("년 평균");
			js.add("#colspan");
			js.add(WebUtils.FormatNumber(dPr0055Sum / list.size(), "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0065Sum / list.size(), "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0183Sum / list.size(), "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0407Sum / list.size(), "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0370Sum / list.size(), "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0710Sum / list.size(), "#,##0.###"));
			js.add(WebUtils.FormatNumber((dPr0055Sum + dPr0065Sum + dPr0183Sum + dPr0407Sum + dPr0370Sum + dPr0710Sum) / list.size() / 6.0, "#,##0.##"));
			arrData.add(js);
			
			js = new JSONArray();
			js.add("최소값");
			js.add("#colspan");
			js.add(WebUtils.FormatNumber(dPr0055Min, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0065Min, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0183Min, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0407Min, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0370Min, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0710Min, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dAvgMin, "#,##0.##"));
			arrData.add(js);
			
			js = new JSONArray();
			js.add("최대값");
			js.add("#colspan");
			js.add(WebUtils.FormatNumber(dPr0055Max, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0065Max, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0183Max, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0407Max, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0370Max, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dPr0710Max, "#,##0.###"));
			js.add(WebUtils.FormatNumber(dAvgMax, "#,##0.##"));
			arrData.add(js);
		} else {
			js = new JSONArray();
			js.add("<center>검색된 데이터가 없습니다.</center>");
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
	private void _labInOutResultWaterAllInList()
	{
		PageManualSearchEtcDao dao = new PageManualSearchEtcDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		int index;	
		String curCheckCycle, checkCycle;
		
		curCheckCycle = "";
		checkCycle = "";
		list = dao.selectLabInOutResultWaterAllInDataList(params);
		if( list != null && list.size() > 0 ) {
			index = 1;
			
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				curCheckCycle = WebUtils.CheckNull(item.get("CHECK_CYCLE"), "");
				
				js = new JSONArray();				
				if( curCheckCycle.equals(checkCycle) ) {
					js.add("#rowspan");
				} else {
					js.add(WebUtils.CheckNull(item.get("CHECK_CYCLE_TEXT"), "") + "<br>검사<br>항목");
				}
				js.add(String.valueOf(index));
				js.add(WebUtils.CheckNull(item.get("ITEM_KNAME"), ""));
				js.add(WebUtils.CheckNull(item.get("ENV_HIGH"), ""));
				js.add(WebUtils.CheckNull(item.get("ENV_LOW"), ""));
				js.add(WebUtils.CheckNull(item.get("EAT_HIGH"), ""));
				js.add(WebUtils.CheckNull(item.get("EAT_LOW"), ""));				
				if( item.get("PR0055") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0055"), "")); }				
				if( item.get("PR0065") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0065"), "")); }				
				if( item.get("PR0183") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0183"), "")); }				
				if( item.get("PR0407") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0407"), "")); }				
				if( item.get("PR0370") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0370"), "")); }
				if( item.get("PR0710") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0710"), "")); }
				arrData.add(js);
				
				checkCycle = curCheckCycle;
				index ++;
			}
			
			result.put("mode", "update");
		} else {
			js = new JSONArray();
			js.add("<center>검색된 데이터가 없습니다.</center>");
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
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _labInOutResultWaterAllOutList()
	{
		PageManualSearchEtcDao dao = new PageManualSearchEtcDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		int index;	
		String curCheckCycle, checkCycle;
		
		curCheckCycle = "";
		checkCycle = "";		
		list = dao.selectLabInOutResultWaterAllOutDataList(params);
		if( list != null && list.size() > 0 ) {
			index = 1;
			
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				curCheckCycle = WebUtils.CheckNull(item.get("CHECK_CYCLE"), "");
				
				js = new JSONArray();				
				if( curCheckCycle.equals(checkCycle) ) {
					js.add("#rowspan");
				} else {
					js.add(WebUtils.CheckNull(item.get("CHECK_CYCLE_TEXT"), "") + "<br>검사<br>항목");
				}
				js.add(String.valueOf(index));
				js.add(WebUtils.CheckNull(item.get("ITEM_KNAME"), ""));
				js.add(WebUtils.CheckNull(item.get("ENV_HIGH"), ""));
				js.add(WebUtils.CheckNull(item.get("ENV_LOW"), ""));
				js.add(WebUtils.CheckNull(item.get("EAT_HIGH"), ""));
				js.add(WebUtils.CheckNull(item.get("EAT_LOW"), ""));				
				if( item.get("PR0055") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0055"), "")); }
				if( item.get("PR0065_3") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0065_3"), "")); }
				if( item.get("PR0065_4") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0065_4"), "")); }
				if( item.get("PR0183_2") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0183_2"), "")); }
				if( item.get("PR0183_3") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0183_3"), "")); }
				if( item.get("PR0183_4") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0183_4"), "")); }
				if( item.get("PR0407_1") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0407_1"), "")); }				
				if( item.get("PR0407_2") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0407_2"), "")); }
				if( item.get("PR0407_3") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0407_3"), "")); }
				if( item.get("PR0370_1") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0370_1"), "")); }
				if( item.get("PR0370_2") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0370_2"), "")); }
				if( item.get("PR0710") == null ) { js.add(""); } else { js.add(WebUtils.CheckNull(item.get("PR0710"), "")); }
				arrData.add(js);
				
				checkCycle = curCheckCycle;
				index ++;
			}
			
			result.put("mode", "update");
		} else {
			js = new JSONArray();
			js.add("<center>검색된 데이터가 없습니다.</center>");
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
	private void _labBaselineOperList()
	{
		CodeDao codeDao = new CodeDao();
		Map<String, String> info = null;
		
		PageManualSearchEtcDao dao = new PageManualSearchEtcDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();	
		
				
		// 정수장 정보 가져 오기
		String[] data;
		String strTelNum, strManager;
		data = WebConst.GetWWInfo(String.valueOf(params.get("WW_CODE")));
		
		strTelNum = "";
		strManager = "";
		info = codeDao.selectOneWallWaterRecord(params);
		if( info != null ) {
			strTelNum = WebUtils.CheckNull(info.get("TELNUM"), "");
			strManager = WebUtils.CheckNull(info.get("MANAGER_NAME"), "");
		}
		
		js = new JSONArray(); js.add("<b>정수센터명</b>"); 
		js.add("#colspan");
		//js.add("#colspan"); 
		js.add(data[1]);
		//js.add("#colspan");
		arrData.add(js);	
		
		js = new JSONArray(); js.add("<b>위치</b>");
		js.add("#colspan");
		//js.add("#colspan"); 
		js.add(data[2]);
		//js.add("#colspan");
		arrData.add(js);	
		
		js = new JSONArray();
		js.add("<b>담당자명 (전화번호)</b>");
		js.add("#colspan");
		//js.add("#colspan");
		js.add(strManager + " (" + strTelNum + ")");		
		//js.add("#colspan");
		arrData.add(js);	
		
		js = new JSONArray();
		js.add("<b>여과공정</b>");
		js.add("<b>여과방식</b>");
		//js.add("#colspan");
		js.add(data[3]);
		//js.add("#colspan");
		arrData.add(js);	
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<b>측정지점/방법</b>");
		//js.add("#colspan");
		js.add(data[4]);		
		//js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("<b>소독공정</b>");
		js.add("<b>소독방식(소독제 종류)</b>");
		//js.add("#colspan");
		js.add(data[5]);
		//js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<b>소독지점</b>");
		//js.add("#colspan");
		js.add(data[6]);		
		//js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<b>측정지점/방법</b>");
		//js.add("#colspan");
		js.add(data[7]);
		//js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("<b>시설용량 (㎥/일)</b>");		
		js.add("#colspan");
		//js.add("#colspan");
		js.add(data[8]);		
		//js.add("#colspan");
		arrData.add(js);
		
		// 
		String curItemCode, itemCode, sUnit, sTmp;
		double dItemVal1, dItemVal2, dItemVal3;
		boolean bCheck;
		
		curItemCode = "";
		itemCode = "";
		list = dao.selectLabBaselineStanrdPointValDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				if( WebUtils.CheckNull(item.get("ITEM_TYPE"), "").equals("P") == false ) {
					continue;
				}
					
				curItemCode = WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				sUnit = WebUtils.CheckNull(item.get("UNIT"), "");
				sUnit = sUnit.replaceAll("9", "");
				dItemVal1 = WebUtils.String2Double(WebUtils.CheckNull(item.get("ITEM_VAL1"), ""));
		
				js = new JSONArray();
				if( curItemCode.equals(itemCode) && itemCode.equals("") == false) {
					js.add("#rowspan");
				} else {
					js.add("<b>" + WebUtils.CheckNull(item.get("ITEM_NAME"), "") + "</b>");
				}				
				js.add("<b>" + sUnit + WebUtils.CheckNull(item.get("POINT_NAME"), "") + "</b>");
				//js.add("#colspan");
				sTmp = "";
				if( item.get("ITEM_VAL1") != null ) {
					sTmp = WebUtils.FormatNumber(dItemVal1, "#,##0.##");
				}
				js.add(sTmp);				
				//js.add("#colspan");
				arrData.add(js);
				
				itemCode = curItemCode;
			}
		}		
		
		
		/*
		curItemCode = "";
		itemCode = "";
		bCheck = false;
		list = dao.selectLabBaselineStanrdPointValDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				if( WebUtils.CheckNull(item.get("ITEM_TYPE"), "").equals("P") == true ) {
					continue;
				}
					
				curItemCode = WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				sUnit = WebUtils.CheckNull(item.get("UNIT"), "");
				sUnit = sUnit.replaceAll("9", "");
				dItemVal1 = WebUtils.String2Double(WebUtils.CheckNull(item.get("ITEM_VAL1"), ""));
				dItemVal2 = WebUtils.String2Double(WebUtils.CheckNull(item.get("ITEM_VAL2"), ""));
				dItemVal3 = WebUtils.String2Double(WebUtils.CheckNull(item.get("ITEM_VAL3"), ""));
				
				if( bCheck == false ) {
					js = new JSONArray();
					js.add("<b>탁도 및 불활성화비</b>");					
					js.add("<b>항목</b>");
					js.add("#colspan");
					js.add("<b><center>수질검사결과</center></b>");
					js.add("#colspan");					
					arrData.add(js);
					
					js = new JSONArray();
					js.add("#rowspan");					
					js.add("#rowspan");
					js.add("#colspan");
					js.add("<center>평균 (최대 ~ 최소)</center>");
					js.add("<center>기준초과여부</center>");
					arrData.add(js);
				}
				
				js = new JSONArray();
				js.add("#rowspan");
				if( curItemCode.equals(itemCode) && itemCode.equals("") == false) {
					js.add("#rowspan");
				} else {
					js.add("<b>" + WebUtils.CheckNull(item.get("ITEM_NAME"), "") + "</b>");
				}				
				js.add("<b>" + sUnit + WebUtils.CheckNull(item.get("POINT_NAME"), "") + "</b>");
				sTmp = "";
				if( item.get("ITEM_VAL1") != null ) {
					sTmp = WebUtils.FormatNumber(dItemVal1, "#,##0.##");
				}
				if( item.get("ITEM_VAL2") != null && item.get("ITEM_VAL3") != null ) {
					sTmp = sTmp + "( " + WebUtils.FormatNumber(dItemVal2, "#,##0.##") + " ~ " + WebUtils.FormatNumber(dItemVal3, "#,##0.##") + " )";
				} else if( item.get("ITEM_VAL2") != null && item.get("ITEM_VAL3") == null ) {
					sTmp = sTmp + "( " + WebUtils.FormatNumber(dItemVal2, "#,##0.##") + " ~ )";
				} else if( item.get("ITEM_VAL2") == null && item.get("ITEM_VAL3") != null ) {
					sTmp = sTmp + "( ~ " + WebUtils.FormatNumber(dItemVal3, "#,##0.##") + " )";
				}
				js.add(sTmp);
				js.add("<b>" + WebUtils.CheckNull(item.get("REMARK"), "") + "</b>");
				arrData.add(js);
				
				itemCode = curItemCode;
				bCheck = true;
			}
		}
		*/
		
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		super._writeJsonResultPage(result);		
		
		list = null;
		result = null;
		arrData = null;
		codeDao = null;
		dao = null;
	}
}
