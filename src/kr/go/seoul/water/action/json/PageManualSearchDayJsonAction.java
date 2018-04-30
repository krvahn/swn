package kr.go.seoul.water.action.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.PageManualSearchDayDao;

public class PageManualSearchDayJsonAction extends BaseActionImp {
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
		if( act.equals("lab_day_op_water.list") ) {
			// ���������Է����� - ����� �����ڷ� ��ȸ - �����������Ͽ��Ȳ - ������Ȳ
			_labDayOpWaterList();
		} else if( act.equals("lab_day_op_send.list") ) {
			// ���������Է����� - ����� �����ڷ� ��ȸ - �����������Ͽ��Ȳ - ������Ȳ
			_labDayOpSendList();
		} else if( act.equals("lab_day_op_prod_day.list") ) {
			// ���������Է����� - ����� �����ڷ� ��ȸ - �����������Ͽ��Ȳ - ���귮��Ȳ - ���ϻ��귮����
			_labDayOpProdDayList();
		} else if( act.equals("lab_day_op_prod_year.list") ) {
			// ���������Է����� - ����� �����ڷ� ��ȸ - �����������Ͽ��Ȳ - ���귮��Ȳ - ������ ���� ���귮 ��Ȳ
			_labDayOpProdYearList();
		} else if( act.equals("lab_day_op_prod_inout.list") ) {
			// ���������Է����� - ����� �����ڷ� ��ȸ - �����������Ͽ��Ȳ - ���귮��Ȳ - �����庰 ����� �� ���귮 ��Ȳ
			_labDayOpProdInOutList();
		} else if( act.equals("lab_day_op_prod_fact.list") ) {
			// ���������Է����� - ����� �����ڷ� ��ȸ - �����������Ͽ��Ȳ - ���귮��Ȳ - ���庰 ���귮 ��Ȳ
			_labDayOpProdFactList();
		} else if( act.equals("lab_day_op_now_prod.list") ) {
			// ���������Է����� - ����� �����ڷ� ��ȸ - �����������Ͽ��Ȳ - ���� ���귮 ��Ȳ
			_labDayOpProdNowProdList();
		} else if( act.equals("lab_day_op_power.list") ) {
			// ���������Է����� - ����� �����ڷ� ��ȸ - �����������Ͽ��Ȳ - ���� ��뷮 ��Ȳ
			_labDayOpPowerList();
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private void _labDayOpWaterList()
	{
		PageManualSearchDayDao dao = new PageManualSearchDayDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		List<Map<String, Object>> list2 = null;
		Iterator<Map<String, Object>> it2 = null;
		Map<String, Object> item2 = null;
		String thisDate, lastDate;
		
		ArrayList<String> searchItems;
		
		Map<String, Object> params = _getParamMap();
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		String params1[][] = {
			// prefix, post fix, format, label, ....
			 {"C_", "_PROD"			,"#,##0"	,"#,##0.##"		,"���귮(�հ�)"				,"#colspan"		,"����"			,"<b>{SUM}</b>"}
			,{"P_", "_PROD"			,"#,##0"	,"#,##0.##"		,"#rowspan"				,"#colspan"		,"����"			,"<b>{SUM}</b>"}
			,{"C_", "_DRIVE"		,"#,##"		,"#,##0.##"		,"���� ���귮 ������(%)(���)"	,"#colspan"		,"#colspan"		,"<b>{AVG}</b>"}
			,{"C_", "_TAKE_WATER"	,"#,##0"	,"#,##0.##"		,"�����(�հ�)"					,"#colspan"		,"����"			,"<b>{SUM}</b>"}
			,{"P_", "_TAKE_WATER"	,"#,##0"	,"#,##0.##"		,"#rowspan"				,"#colspan"		,"����"			,"<b>{SUM}</b>"}
		};
/*		
		String params2[][] = {
			// prefix, post fix, format, label, ....
			 {"C_", "_FILTER_TIME"	,"#,#0"		,"#,##0"		,"�������ӽð�(hr)"			,"#colspan"	,"#colspan"		,"{SUM}"}
			,{"C_", "_PAC"			,"#,##0.##"	,"#,##0.##"		,"��ǰ������Ȳ"				,"������"		,"PAC(17%)"		,"{SUM}"}
			,{"C_", "_PACS"			,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"#rowspan"	,"PACS"			,""}
			,{"C_", "_PAHCS"		,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"#rowspan"	,"PAHCS(12%)"	,"{SUM}"}
			,{"C_", "_AL_GA"		,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"��Į����"		,"�����Ҵ�"			,"{SUM}"}
			,{"C_", "_AL_SO"		,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"#rowspan"	,"�Ҽ�ȸ"			,"{SUM}"}
			,{"C_", "_FRONT"		,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"����"		,"������"			,"{SUM}"}
			,{"C_", "_REAR"			,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"#rowspan"	,"�Ŀ���"			,"{SUM}"}
			,{"C_", "_POWDER"		,"#,##0"	,"#,##0.##"		,"#rowspan"				,"����"		,"#colspan"		,""}
			,{"C_", "_CD00"			,"#,##0"	,"#,##0.##"		,"#rowspan"				,"�̻�ȭź��"	,"#colspan"		,""}
		};
*/		
		String params2[][] = {
				// prefix, post fix, format, label, ....
				 {"C_", "_FILTER_TIME"	,"#,#0"		,"#,##0"		,"�������ӽð�(hr)(���)"		,"#colspan"	,"#colspan"		,"{AVG}"}
				,{"C_", "_PAC"			,"#,##0.##"	,"#,##0.##"		,"��ǰ������Ȳ(���)"			,"������"		,"PAC(17%)"		,"{AVG}"}
				,{"C_", "_PACS"			,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"#rowspan"	,"PACS"			,"{AVG}"}
				,{"C_", "_PAHCS"		,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"#rowspan"	,"PAHCS(12%)"	,"{AVG}"}
				,{"C_", "_AL_GA"		,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"��Į����"		,"�����Ҵ�"			,"{AVG}"}
				,{"C_", "_AL_SO"		,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"#rowspan"	,"�Ҽ�ȸ"			,"{AVG}"}
				,{"C_", "_FRONT"		,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"����"		,"������"			,"{AVG}"}
				,{"C_", "_REAR"			,"#,#0.##"	,"#,##0.##"		,"#rowspan"				,"#rowspan"	,"�Ŀ���"			,"{AVG}"}
				,{"C_", "_POWDER"		,"#,##0"	,"#,##0.##"		,"#rowspan"				,"����"		,"#colspan"		,"{AVG}"}
				,{"C_", "_CD00"			,"#,##0"	,"#,##0.##"		,"#rowspan"				,"�̻�ȭź��"	,"#colspan"		,"{AVG}"}
		};
		
		// �˻� ����, ����Ʈ Ÿ��, �������͸���Ʈ ���	
		thisDate = "";
		lastDate = "";
		
		thisDate = WebUtils.CheckNull(params.get("WORK_DATE"), WebUtils.GetCurrentDateTimeFormat("yyyyMMdd"));
		lastDate = WebUtils.DateTimeDiff(thisDate, "yyyyMMdd", "d", -1);
		
		searchItems = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull(params.get("ITEMS"),""), ",");
			String searchItem;
			while(st.hasMoreTokens()) {
				searchItem = st.nextToken().trim();
				
				searchItems.add(searchItem);
			}
		}
		
		// �˻� �Ķ���� �ֱ�
		params.put("THIS_DATE", thisDate);
		params.put("LAST_DATE", lastDate);
		params.put("SEARCH_ITEMS", searchItems);
		
		if( searchItems.size() > 0 ) {
			// ������ ���
			
			// �ü��뷮
			js = new JSONArray();
			js.add("�ü��뷮(�հ�)");
			js.add("#colspan");
			js.add("#colspan");
			js.add("<b>4,450,000</b>");
			for(int i = 0; i < searchItems.size(); i++) {
				js.add(WebConst.GetWPVolume(searchItems.get(i)));
			}
			arrData.add(js);
			
			list = dao.selectLabDayOpWaterDataList(params);
			
			item = null;
			if( list != null && list.size() > 0 ) {
				it = list.iterator();
				if( it.hasNext() ) {
					item = it.next();
				}
			}
			
			for(int i = 0; i < params1.length; i ++) {
				WebConst.MakeReportDataRow(arrData, params1[i], searchItems, item);
			}
			
			list2 = dao.selectLabDayOpWaterDataList2(params);
			item2 = null;
			if( list2 != null && list2.size() > 0 ) {
				it2 = list2.iterator();
				
				String[] datas = new String[8];
				String titleDepth1 = "",titleDepth2 = "",titleDepth3 = "";   
				while( it2.hasNext() ) {
					item2 = it2.next();
					
					//,{"C_", "_CD00"			,"#,##0"	,"#,##0.##"		,"#rowspan"					,"�̻�ȭź��"	,"#colspan"		,""}
					datas[0] = "C_";
					datas[1] = "";
					datas[2] = "#,##0.###";
					datas[3] = "#,##0.###";
					
					if( titleDepth1.equals("") ) {
						//titleDepth1 = "��<br>��<br>��<br>Ȳ";
						titleDepth1 = "������Ȳ<br>(���)";
					} else {
						titleDepth1 = "#rowspan";
					}
					datas[4] = titleDepth1;					
					
					if( titleDepth2.equals(item2.get("WATER_TEXT")) ) {
						datas[5] = "#rowspan";
					} else {
						titleDepth2 = String.valueOf(item2.get("WATER_TEXT"));
						datas[5] = titleDepth2;
					}
					
					//datas[1] = String.valueOf(item2.get("WATER_TEXT"))+"_"+String.valueOf(item2.get("ITEM_NAME"));
					
					
					titleDepth3 = String.valueOf(item2.get("ITEM_NAME"));
					if( item2.get("LOW") != null && item2.get("HIGH") != null ) {
						titleDepth3 += "<br>(" + String.valueOf(item2.get("LOW")) + " ~ " + String.valueOf(item2.get("HIGH")) + ")"; 
					} else if( item2.get("LOW") != null && item2.get("HIGH") == null ) {
						titleDepth3 += "<br>(" + String.valueOf(item2.get("LOW")) + " ~ " + ")"; 
					} else if( item2.get("LOW") == null && item2.get("HIGH") != null ) {
						titleDepth3 += "<br>( ~ " + String.valueOf(item2.get("HIGH")) + ")"; 
					}
					datas[6] = titleDepth3;
					
					//datas[7] = "<b>{SUM}</b>";
					if(String.valueOf(item2.get("ITEM_NAME")).equals("�����߻�����") ) {
						datas[3] = "";
						datas[7] = "";						

						Map<String, Object> repItem = new HashMap<String, Object>();
						String name;
						for(int i = 0; i < searchItems.size(); i ++ ) {
							name = "C_" + searchItems.get(i);
							if( item2.get(name) == null || String.valueOf(item2.get(name)).equals("0") ) {
								repItem.put(name, "");
							} else if( String.valueOf(item2.get(name)).equals("9") ) {
								repItem.put(name, "��");
							} else if( String.valueOf(item2.get(name)).equals("1") ) {
								repItem.put(name, "��");
							} else {
								repItem.put(name, "");
							}
						}
						
						item2.clear();
						item2.putAll(repItem);
					}
					else{
						datas[7] = "<b>{AVG}</b>";
					}
					WebConst.MakeReportDataRow(arrData, datas, searchItems, item2);
				}
			}
			
			// ���⵵ �������
			js = new JSONArray();
			js.add("���⵵ �������");
			js.add("#colspan");
			js.add("#colspan");
			js.add("<b></b>");
			for(int i = 0; i < searchItems.size(); i++) {
				js.add("&nbsp;");
			}
			arrData.add(js);
			
			for(int i = 0; i < params2.length; i ++) {
				WebConst.MakeReportDataRow(arrData, params2[i], searchItems, item);
			}
		} else {			
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� �������� �ʽ��ϴ�.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			for(int i = 0; i < searchItems.size(); i++) {
				js.add("#colspan");
			}
			arrData.add(js);
		}
		result.put("aaData", arrData);
			
		// JSON ������ ���
		super._writeJsonResultPage(result);		
	}
	
	@SuppressWarnings("unchecked")
	private void _labDayOpSendList()
	{
		PageManualSearchDayDao dao = new PageManualSearchDayDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		List<Map<String, Object>> list2 = null;
		Iterator<Map<String, Object>> it2 = null;
		Map<String, Object> item2 = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String prevDate = WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMdd", "d", -1);
		params.put("PREV_DATE", prevDate);
		
		String sKey, sTmp;
		String wwCode, equipQty;
		String curWWCode, curEquipQty;
		String pumpCnt, pumpTime;
		
		JSONArray js;
		double dTotTsupp, dTotLsupp, dTotTpress, dTotLpress, dTotTpressMax, dTotTpressMin;
		double dSubTsupp, dSubLsupp, dSubTpress, dSubLpress, dSubTpressMax, dSubTpressMin;
		double dSumTsupp, dSumLsupp, dSumTpress, dSumLpress, dSumTpressMax, dSumTpressMin;
		double dTsupp, dLsupp, dTpress, dLpress, dTpressMax, dTpressMin;
		list = dao.selectLabDayOpSendDataList(params);
		if( list != null && list.size() > 0 ) {
			
			it = list.iterator();
			
			dTotTsupp = 0;
			dTotLsupp = 0;
			dTotTpress = 0;
			dTotLpress = 0;
			dTotTpressMax = 0;
			dTotTpressMin = 0;
			
			dSubTsupp = 0;
			dSubLsupp = 0;
			dSubTpress = 0;
			dSubLpress = 0;
			dSubTpressMax = 0;
			dSubTpressMin = 0;
			
			dSumTsupp = 0;
			dSumLsupp = 0;
			dSumTpress = 0;
			dSumLpress = 0;
			dSumTpressMax = 0;
			dSumTpressMin = 0;
			
			wwCode = "";
			equipQty = "";
			while( it.hasNext() ) {
				item = it.next();
				
				sKey = WebUtils.CheckNull(item.get("UNIT"), "");
				sTmp = "";
				if( sKey.indexOf("9") != 0 ) {
					sTmp = WebUtils.CheckNull(item.get("UNIT"), "");
				}
					
				if( WebUtils.CheckNull(item.get("EQUIP_QTY"), "").equals("") == false ) {
					sTmp += (sTmp.equals("") ? "" : "<br>") + WebUtils.CheckNull(item.get("EQUIP_QTY"), "");
				}
				
				curWWCode = WebUtils.CheckNull(item.get("WW_CODE"), "");
				curEquipQty = sTmp;
				
				dTsupp = WebUtils.String2Double(WebUtils.CheckNull(item.get("L_SUPP"), ""));
				dLsupp = WebUtils.String2Double(WebUtils.CheckNull(item.get("T_PRESS"), ""));
				dTpress = WebUtils.String2Double(WebUtils.CheckNull(item.get("T_PRESS"), ""));
				dLpress = WebUtils.String2Double(WebUtils.CheckNull(item.get("L_PRESS"), ""));
				dTpressMax = WebUtils.String2Double(WebUtils.CheckNull(item.get("T_PRESS_MAX"), ""));
				dTpressMin = WebUtils.String2Double(WebUtils.CheckNull(item.get("T_PRESS_MIN"), ""));
				
				if( wwCode.equals("") == false && equipQty.equals("") == false ) {
					if( curWWCode.equals(wwCode) && curEquipQty.equals(equipQty)) {
						dSubTsupp += dTsupp;
						dSubLsupp += dLsupp;
						dSubTpress += dTpress;
						dSubLpress += dLpress;
						dSubTpressMax += dTpressMax;
						dSubTpressMin += dTpressMin;
					} else {
						js = new JSONArray();
						js.add("#rowspan");
						js.add("#rowspan");
						js.add("<center>��</center>");
						js.add(WebUtils.FormatNumber(dSubTsupp, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubLsupp, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubTpress, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubLpress, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubTpressMax, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubTpressMin, "#,##0.##"));
						js.add("");
						js.add("");
						js.add("");
						js.add("");
						js.add("");						
						arrData.add(js);
						
						dSubTsupp = dTsupp;
						dSubLsupp = dLsupp;
						dSubTpress = dTpress;
						dSubLpress = dLpress;
						dSubTpressMax = dTpressMax;
						dSubTpressMin = dTpressMin;
					}
					
					if( curWWCode.equals(wwCode) ) {
						dSumTsupp += dTsupp;
						dSumLsupp += dLsupp;
						dSumTpress += dTpress;
						dSumLpress += dLpress;
						dSumTpressMax += dTpressMax;
						dSumTpressMin += dTpressMin;
					} else {
						js = new JSONArray();
						js.add("#rowspan");
						js.add("<center>�Ұ�</center>");						
						js.add("#colspan");
						js.add(WebUtils.FormatNumber(dSumTsupp, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSumLsupp, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSumTpress, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSumLpress, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSumTpressMax, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSumTpressMin, "#,##0.##"));
						js.add("");
						js.add("");
						js.add("");
						js.add("");
						js.add("");						
						arrData.add(js);
						
						dSumTsupp = dTsupp;
						dSumLsupp = dLsupp;
						dSumTpress = dTpress;
						dSumLpress = dLpress;
						dSumTpressMax = dTpressMax;
						dSumTpressMin = dTpressMin;
					}
				} else {
					dSubTsupp += dTsupp;
					dSubLsupp += dLsupp;
					dSubTpress += dTpress;
					dSubLpress += dLpress;
					dSubTpressMax += dTpressMax;
					dSubTpressMin += dTpressMin;
					
					dSumTsupp += dTsupp;
					dSumLsupp += dLsupp;
					dSumTpress += dTpress;
					dSumLpress += dLpress;
					dSumTpressMax += dTpressMax;
					dSumTpressMin += dTpressMin;
				}
				
				js = new JSONArray();
				
				pumpCnt = WebUtils.CheckNull(item.get("T_PUMP_CNT"), "");
				pumpTime = WebUtils.CheckNull(item.get("T_PUMP_TIME"), "");
				if( curWWCode.equals(wwCode) ) {
					js.add("#rowspan");
				} else {
					js.add(WebConst.GetWPShortName(curWWCode));
				}
				if( curWWCode.equals(wwCode) && curEquipQty.equals(equipQty)) {
					js.add("#rowspan");
				} else {
					js.add(sTmp);
				}
				
				js.add(WebUtils.CheckNull(item.get("POINT_NAME"), ""));				
				js.add(WebUtils.FormatNumber(dTsupp, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dLsupp, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dTpress, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dLpress, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dTpressMax, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dTpressMin, "#,###"));
				js.add(WebConst.GetHorse(WebUtils.CheckNull(item.get("POINT_CODE"), "")));
				js.add(WebConst.GetQty(WebUtils.CheckNull(item.get("POINT_CODE"), "")));
				
				params.put("WW_CODE", item.get("WW_CODE"));
				params.put("POINT_CODE", item.get("POINT_CODE"));
				list2 = dao.selectLabDayOpSendPointDataList(params);
				if( list2 != null && list2.size() > 0 ) {
					it2 = list2.iterator();
					
					while( it2.hasNext() ) {
						item2 = it2.next();
						
						if( WebUtils.CheckNull(item2.get("ITEM_VAL1"), "").equals("") == false ) {
							pumpCnt += (pumpCnt.length() > 0 ? "<br>" : "") + "&nbsp" + WebUtils.CheckNull(item2.get("ITEM_VAL1"), "");
						}
						
						if( WebUtils.CheckNull(item2.get("ITEM_VAL2"), "").equals("") == false ) {
							pumpTime += (pumpCnt.length() > 0 ? "<br>" : "") + "&nbsp" + WebUtils.CheckNull(item2.get("ITEM_VAL2"), "");
						}
					}
				}
				
				js.add(pumpCnt);
				js.add(pumpTime);
				js.add("");
				
				arrData.add(js);
				
				dTotTsupp += dTsupp;
				dTotLsupp += dLsupp;
				dTotTpress += dTpress;
				dTotLpress += dLpress;
				dTotTpressMax += dTpressMax;
				dTotTpressMin += dTpressMin;
				
				wwCode = curWWCode;
				equipQty = curEquipQty;
			}

			js = new JSONArray();
			js.add("#rowspan");
			js.add("#rowspan");
			js.add("<center>��</center>");
			js.add(WebUtils.FormatNumber(dSubTsupp, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubLsupp, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubTpress, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubLpress, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubTpressMax, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubTpressMin, "#,##0.##"));
			js.add("");
			js.add("");
			js.add("");
			js.add("");
			js.add("");			
			arrData.add(js);
			
			js = new JSONArray();
			js.add("#rowspan");
			js.add("<center>�Ұ�</center>");						
			js.add("#colspan");
			js.add(WebUtils.FormatNumber(dSumTsupp, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSumLsupp, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSumTpress, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSumLpress, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSumTpressMax, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSumTpressMin, "#,##0.##"));
			js.add("");
			js.add("");
			js.add("");
			js.add("");
			js.add("");			
			arrData.add(js);
			
			js = new JSONArray();
			js.add("<center>�հ�</center>");						
			js.add("#colspan");
			js.add("#colspan");
			js.add(WebUtils.FormatNumber(dTotTsupp, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotLsupp, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotTpress, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotLpress, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotTpressMax, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotTpressMin, "#,##0.##"));
			js.add("");
			js.add("");
			js.add("");
			js.add("");
			js.add("");			
			arrData.add(js);
		} else {
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
		list2 = null;
		arrData = null;
		result = null;
		dao = null;
	}

	@SuppressWarnings("unchecked")
	private void _labDayOpProdDayList()
	{
		PageManualSearchDayDao dao = new PageManualSearchDayDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();		
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// ���� ����
		String workYear;
		String workMonth;
		String prevDate;
		
		workYear = String.valueOf(params.get("WORK_DATE")).substring(0, 4);
		workMonth = String.valueOf(params.get("WORK_DATE")).substring(4, 6);
		prevDate = WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMdd", "d", -1);
		params.put("TOP_LAST_FROM_YEAR", WebUtils.DateTimeDiff(workYear, "yyyy", "y", -1) + "0000");
		params.put("TOP_LAST_TO_YEAR", WebUtils.DateTimeDiff(workYear, "yyyy", "y", -1) + "9999");
		params.put("TOP_LAST_FROM_MONTH", WebUtils.DateTimeDiff(workYear, "yyyy", "y", -1) + workMonth + "00");		
		params.put("TOP_LAST_TO_MONTH", WebUtils.DateTimeDiff(workYear, "yyyy", "y", -1) + workMonth + "99");
		params.put("PREV_DATE", prevDate);		
		
		// �ü� �뷮
		js = new JSONArray();
		js.add("�ü� �뷮");
		js.add("#colspan");
		js.add("<b>5,100,000</b>");
		js.add("800,000");
		js.add("650,000");
		js.add("750,000");
		js.add("300,000");
		js.add("1,600,000");
		js.add("1,000,000");
		js.add("");
		js.add("");
		arrData.add(js);
		
		double dYpr0055_prod, dYpr0065_prod, dYpr0183_prod, dYpr0407_prod, dYpr0370_prod, dYpr0710_prod;
		double dMpr0055_prod, dMpr0065_prod, dMpr0183_prod, dMpr0407_prod, dMpr0370_prod, dMpr0710_prod;
		double dYtemp_max, dYtemp_min;
		double dMtemp_max, dMtemp_min;
		double dYtotal, dMtotal;
		
		dYpr0055_prod = 0.0;
		dYpr0065_prod = 0.0;
		dYpr0183_prod = 0.0;
		dYpr0407_prod = 0.0;
		dYpr0370_prod = 0.0;
		dYpr0710_prod = 0.0;
		dYtemp_max = 0.0;
		dYtemp_min = 0.0;
		dYtotal = 0.0;
		
		dMpr0055_prod = 0.0;
		dMpr0065_prod = 0.0;
		dMpr0183_prod = 0.0;
		dMpr0407_prod = 0.0;
		dMpr0370_prod = 0.0;
		dMpr0710_prod = 0.0;
		dMtemp_max = 0.0;
		dMtemp_min = 0.0;
		dMtotal = 0.0;
		
		list = dao.selectLabDayOpProdDayDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				dYpr0055_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("YPR0055_PROD"), ""));
				dYpr0065_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("YPR0065_PROD"), ""));
				dYpr0183_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("YPR0183_PROD"), ""));
				dYpr0407_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("YPR0407_PROD"), ""));
				dYpr0370_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("YPR0370_PROD"), ""));
				dYpr0710_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("YPR0710_PROD"), ""));
				dYtemp_max = WebUtils.String2Double(WebUtils.CheckNull(item.get("YTEMP_MAX"), ""));
				dYtemp_min = WebUtils.String2Double(WebUtils.CheckNull(item.get("YTEMP_MIN"), ""));
				dYtotal = dYpr0055_prod + dYpr0065_prod + dYpr0183_prod + dYpr0407_prod + dYpr0370_prod + dYpr0710_prod;
				
				dMpr0055_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("MPR0055_PROD"), ""));
				dMpr0065_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("MPR0065_PROD"), ""));
				dMpr0183_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("MPR0183_PROD"), ""));
				dMpr0407_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("MPR0407_PROD"), ""));
				dMpr0370_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("MPR0370_PROD"), ""));
				dMpr0710_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("MPR0710_PROD"), ""));
				dMtemp_max = WebUtils.String2Double(WebUtils.CheckNull(item.get("MTEMP_MAX"), ""));
				dMtemp_min = WebUtils.String2Double(WebUtils.CheckNull(item.get("MTEMP_MIN"), ""));
				dMtotal = dMpr0055_prod + dMpr0065_prod + dMpr0183_prod + dMpr0407_prod + dMpr0370_prod + dMpr0710_prod;
			}
		}
		
		// ���� �����
		js = new JSONArray();
		js.add("��<br><br>��<br><br>��");
		js.add("���� �����");
		js.add("<b>" + WebUtils.FormatNumber(dYtotal, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dYpr0055_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0065_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0183_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0407_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0370_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0710_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYtemp_max, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYtemp_min, "#,##0.###"));
		arrData.add(js);
		
		// ���� ���� �����
		js = new JSONArray();
		js.add("#rowspan");
		js.add("���� ���� �����");
		js.add("<b>" + WebUtils.FormatNumber(dMtotal, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dMpr0055_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0065_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0183_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0407_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0370_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0710_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMtemp_max, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMtemp_min, "#,##0.###"));
		arrData.add(js);
		
		dYpr0055_prod = 0.0;
		dYpr0065_prod = 0.0;
		dYpr0183_prod = 0.0;
		dYpr0407_prod = 0.0;
		dYpr0370_prod = 0.0;
		dYpr0710_prod = 0.0;
		dYtemp_max = 0.0;
		dYtemp_min = 0.0;
		dYtotal = 0.0;
		
		dMpr0055_prod = 0.0;
		dMpr0065_prod = 0.0;
		dMpr0183_prod = 0.0;
		dMpr0407_prod = 0.0;
		dMpr0370_prod = 0.0;
		dMpr0710_prod = 0.0;
		dMtemp_max = 0.0;
		dMtemp_min = 0.0;
		dMtotal = 0.0;
		
		list = dao.selectLabDayOpProdDayDataList2(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				dYpr0055_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_PROD1"), ""));
				dYpr0065_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_PROD1"), ""));
				dYpr0183_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_PROD1"), ""));
				dYpr0407_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_PROD1"), ""));
				dYpr0370_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_PROD1"), ""));
				dYpr0710_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_PROD1"), ""));
				dYtemp_max = WebUtils.String2Double(WebUtils.CheckNull(item.get("TEMP_MAX1"), ""));
				dYtemp_min = WebUtils.String2Double(WebUtils.CheckNull(item.get("TEMP_MIN1"), ""));
				dYtotal = dYpr0055_prod + dYpr0065_prod + dYpr0183_prod + dYpr0407_prod + dYpr0370_prod + dYpr0710_prod;
				
				dMpr0055_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_PROD2"), ""));
				dMpr0065_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_PROD2"), ""));
				dMpr0183_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_PROD2"), ""));
				dMpr0407_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_PROD2"), ""));
				dMpr0370_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_PROD2"), ""));
				dMpr0710_prod = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_PROD2"), ""));
				dMtemp_max = WebUtils.String2Double(WebUtils.CheckNull(item.get("TEMP_MAX2"), ""));
				dMtemp_min = WebUtils.String2Double(WebUtils.CheckNull(item.get("TEMP_MIN2"), ""));
				dMtotal = dMpr0055_prod + dMpr0065_prod + dMpr0183_prod + dMpr0407_prod + dMpr0370_prod + dMpr0710_prod;
			}
		}
		
		// ����
		js = new JSONArray();
		js.add("#rowspan");
		js.add("����");
		js.add("<b>" + WebUtils.FormatNumber(dYtotal, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dYpr0055_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0065_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0183_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0407_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0370_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYpr0710_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYtemp_max, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dYtemp_min, "#,##0.###"));
		arrData.add(js);
		
		// ����
		js = new JSONArray();
		js.add("#rowspan");
		js.add("����");
		js.add("<b>" + WebUtils.FormatNumber(dMtotal, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dMpr0055_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0065_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0183_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0407_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0370_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0710_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMtemp_max, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMtemp_min, "#,##0.###"));
		arrData.add(js);		
		result.put("aaData", arrData);
		
		// ������
		js = new JSONArray();
		js.add("#rowspan");
		js.add("������");
		js.add("<b>" + WebUtils.FormatNumber(dMtotal - dYtotal, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dMpr0055_prod - dYpr0055_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0065_prod - dYpr0065_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0183_prod - dYpr0183_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0407_prod - dYpr0407_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0370_prod - dYpr0370_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMpr0710_prod - dYpr0710_prod, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMtemp_max - dYtemp_max, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dMtemp_min - dYtemp_min, "#,##0.###"));
		arrData.add(js);		
		result.put("aaData", arrData);
		
		// ���ϴ��������
		js = new JSONArray();
		js.add("#rowspan");
		js.add("���ϴ��������");
		if( dMtotal != 0.0 ) { js.add("<b>" + WebUtils.FormatNumber((dMtotal - dYtotal) / dMtotal, "#,##0.###%") + "</b>"); } else { js.add("-"); }
		if( dMpr0055_prod != 0.0 ) { js.add(WebUtils.FormatNumber((dMpr0055_prod - dYpr0055_prod) / dMpr0055_prod, "#,##0.###%")); } else { js.add("-"); }
		if( dMpr0065_prod != 0.0 ) { js.add(WebUtils.FormatNumber((dMpr0065_prod - dYpr0065_prod) / dMpr0065_prod, "#,##0.###%")); } else { js.add("-"); }
		if( dMpr0183_prod != 0.0 ) { js.add(WebUtils.FormatNumber((dMpr0183_prod - dYpr0183_prod) / dMpr0183_prod, "#,##0.###%")); } else { js.add("-"); }
		if( dMpr0407_prod != 0.0 ) { js.add(WebUtils.FormatNumber((dMpr0407_prod - dYpr0407_prod) / dMpr0407_prod, "#,##0.###%")); } else { js.add("-"); }
		if( dMpr0370_prod != 0.0 ) { js.add(WebUtils.FormatNumber((dMpr0370_prod - dYpr0370_prod) / dMpr0370_prod, "#,##0.###%")); } else { js.add("-"); }
		if( dMpr0710_prod != 0.0 ) { js.add(WebUtils.FormatNumber((dMpr0710_prod - dYpr0710_prod) / dMpr0710_prod, "#,##0.###%")); } else { js.add("-"); }
		if( dMtemp_max != 0.0 ) { js.add(WebUtils.FormatNumber((dMtemp_max - dYtemp_max) / dMtemp_max, "#,##0.###%")); } else { js.add("-"); }
		if( dMtemp_min != 0.0 ) { js.add(WebUtils.FormatNumber((dMtemp_min - dYtemp_min) / dMtemp_min, "#,##0.###%")); } else { js.add("-"); }
		arrData.add(js);		
		result.put("aaData", arrData);
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _labDayOpProdYearList()
	{
		PageManualSearchDayDao dao = new PageManualSearchDayDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();		
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// ���� ����
		String workYear;
		String workMonth;
		
		workYear = String.valueOf(params.get("WORK_DATE")).substring(0, 4);
		workMonth = String.valueOf(params.get("WORK_DATE")).substring(4, 6);
		params.put("THIS_FROM_DATE", workYear + workMonth + "00");
		params.put("THIS_TO_DATE", workYear + workMonth + "99");
		params.put("PREV_FROM_DATE", WebUtils.DateTimeDiff(workYear, "yyyy", "y", -1) + workMonth + "00");		
		params.put("PREV_TO_DATE", WebUtils.DateTimeDiff(workYear, "yyyy", "y", -1) + workMonth + "99");
		params.put("FAT_FROM_DATE", WebUtils.DateTimeDiff(workYear, "yyyy", "y", -2) + workMonth + "00");		
		params.put("FAT_TO_DATE", WebUtils.DateTimeDiff(workYear, "yyyy", "y", -2) + workMonth + "99");
		params.put("THIS_YEAR", workYear);		
		params.put("THIS_MONTH", workMonth);
		params.put("PREV_YEAR", WebUtils.DateTimeDiff(workYear, "yyyy", "y", -1));		
		params.put("PREV_MONTH", workMonth);
		
		double dThisSum, dThisAvg, dPrevSum, dPrevAvg, dFarAvg, dLfSum, dTlSum, dLfAvg, dTlAvg;
		
		dThisSum = 0.0;
		dThisAvg = 0.0;
		dPrevSum = 0.0;
		dPrevAvg = 0.0;
		dFarAvg = 0.0;
		dLfSum = 0.0;
		dTlSum = 0.0;
		dLfAvg = 0.0;
		dTlAvg = 0.0;
		
		list = dao.selectLabDayOpProdYearDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				dThisSum = WebUtils.String2Double(WebUtils.CheckNull(item.get("THIS_SUM"), "")); // �ݳ� �ѻ���
				dThisAvg = WebUtils.String2Double(WebUtils.CheckNull(item.get("THIS_AVG"), "")) * 6; // �ݸ� ��ջ��귮
				dPrevSum = WebUtils.String2Double(WebUtils.CheckNull(item.get("PREV_SUM"), "")); // ���� �ѻ���
				dPrevAvg = WebUtils.String2Double(WebUtils.CheckNull(item.get("PREV_AVG"), "")) * 6; // ���� ��ջ��귮
				//dFarSum = WebUtils.String2Double(WebUtils.CheckNull(item.get("FAR_SUM"), "")); // ������ �ѻ��귮
				dFarAvg = WebUtils.String2Double(WebUtils.CheckNull(item.get("FAR_AVG"), "")); // ������ ��ջ��귮
				dLfSum = WebUtils.String2Double(WebUtils.CheckNull(item.get("LF_SUM"), "")); // ������ ������������
				dTlSum = WebUtils.String2Double(WebUtils.CheckNull(item.get("TL_SUM"), "")); // �ݳ��� ������������
				dLfAvg = WebUtils.String2Double(WebUtils.CheckNull(item.get("LF_AVG"), "")); // ������ ��ջ��귮�� ����������
				dTlAvg = WebUtils.String2Double(WebUtils.CheckNull(item.get("TL_AVG"), "")); // �ݳ��� ��ջ��귮�� ����������
			}
		}
		
		// �ѻ��귮
		js = new JSONArray();
		js.add("�������");
		js.add("�� ���귮");
		js.add("#colspan");
		js.add("#colspan");
		js.add(WebUtils.FormatNumber(dPrevSum, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dLfSum, "#,##0.###"));
		js.add("�� ���귮");
		js.add("#colspan");
		js.add("#colspan");
		js.add(WebUtils.FormatNumber(dThisSum, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dTlSum, "#,##0.###"));
		arrData.add(js);		
		
		// �� ��� ���귮
		js = new JSONArray();
		js.add("#rowspan");
		js.add("�� ��� ���귮");
		js.add("#colspan");
		js.add("#colspan");
		js.add(WebUtils.FormatNumber(dPrevAvg, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dLfAvg, "#,##0.###"));
		js.add("�� ��� ���귮");
		js.add("#colspan");
		js.add("#colspan");
		js.add(WebUtils.FormatNumber(dThisAvg, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dTlAvg, "#,##0.###"));
		arrData.add(js);		
		
		// �� ��� ������
		js = new JSONArray();
		js.add("#rowspan");
		js.add("�� ��� ������");
		js.add("#colspan");
		js.add("#colspan");
		js.add("");
		if( dFarAvg != 0.0 ) { js.add(WebUtils.FormatNumber(dLfAvg / dFarAvg, "#,##0.##")); } else { js.add("-"); }
		js.add("�� ��� ������");
		js.add("#colspan");
		js.add("#colspan");
		js.add("");
		if( dPrevAvg != 0.0 ) { js.add(WebUtils.FormatNumber(dTlAvg / dPrevAvg, "#,##0.##")); } else { js.add("-"); }
		arrData.add(js);	
		
		list = dao.selectLabDayOpProdYearDataList2(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				js = new JSONArray();
				js.add(WebUtils.CheckNull(item.get("ANAL_DATE1"), ""));
				js.add(WebUtils.CheckNull(item.get("ANAL_WEEK2"), ""));
				js.add(WebUtils.CheckNull(item.get("TEMP_MIN2"), ""));
				js.add(WebUtils.CheckNull(item.get("TEMP_MAX2"), ""));
				js.add(WebUtils.CheckNull(item.get("PROD_WATER2"), ""));
				js.add(WebUtils.CheckNull(item.get("PROD_WATER4"), ""));
				js.add(WebUtils.CheckNull(item.get("ANAL_WEEK1"), ""));
				js.add(WebUtils.CheckNull(item.get("TEMP_MIN1"), ""));
				js.add(WebUtils.CheckNull(item.get("TEMP_MAX1"), ""));
				js.add(WebUtils.CheckNull(item.get("PROD_WATER1"), ""));
				js.add(WebUtils.CheckNull(item.get("PROD_WATER5"), ""));
				arrData.add(js);
			}
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
	
	@SuppressWarnings("unchecked")
	private void _labDayOpProdInOutList()
	{
		PageManualSearchDayDao dao = new PageManualSearchDayDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();		
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// ���� ����
		String fromDate, toDate;
		
		fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 6) + "00";
		toDate = String.valueOf(params.get("WORK_DATE")).substring(0, 6) + "99";
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		
		list = dao.selectLabDayOpProdInOutDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				String analDate;			
								
				analDate = WebUtils.CheckNull(item.get("ANAL_DATE"), "");
				
				js = new JSONArray();
				if( analDate.length() >= 8 ) {
					js.add(analDate.substring(6, 8));
				} else {
					js.add(analDate);
				}
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("TAKE_WATER"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_WATER"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_TAKE"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_TAKE"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_TAKE"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_TAKE"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_TAKE"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_TAKE"), "")), "#,##0.##"));
				arrData.add(js);
			}
		} else {
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
	
	@SuppressWarnings("unchecked")
	private void _labDayOpProdFactList()
	{
		PageManualSearchDayDao dao = new PageManualSearchDayDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();		
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// ���� ����
		String fromDate, toDate;
		
		fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 6) + "00";
		toDate = String.valueOf(params.get("WORK_DATE")).substring(0, 6) + "99";
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		
		list = dao.selectLabDayOpProdFactDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			
			double dTotalSum, dDriveSum;
			double dPr0055Sum, dPr0065Sum, dPr0183Sum, dPr0407Sum, dPr0370Sum, dPr0710Sum;
			double dProd001Sum, dProd002Sum, dProd011Sum , dProd012Sum, dProd013Sum, dProd014Sum, dProd015Sum;
			double dProd021Sum, dProd022Sum, dProd030Sum, dProd033Sum, dProd034Sum, dProd041Sum, dProd042Sum, dProd043Sum, dProd044Sum;
			
			dTotalSum = 0.0;
			dDriveSum = 0.0;
			
			dPr0055Sum = 0.0;
			dPr0065Sum = 0.0;
			dPr0183Sum = 0.0;
			dPr0407Sum = 0.0;
			dPr0370Sum = 0.0;
			dPr0710Sum = 0.0;
			
			dProd001Sum = 0.0;
			dProd002Sum = 0.0;
			dProd011Sum = 0.0;
			dProd012Sum = 0.0;
			dProd013Sum = 0.0;
			dProd014Sum = 0.0;
			dProd015Sum = 0.0;
			dProd021Sum = 0.0;
			dProd022Sum = 0.0;
			dProd030Sum = 0.0;
			dProd033Sum = 0.0;
			dProd034Sum = 0.0;
			dProd041Sum = 0.0;
			dProd042Sum = 0.0;
			dProd043Sum = 0.0;
			dProd044Sum = 0.0;
			while( it.hasNext() ) {
				item = it.next();
			
				String analDate;
				double dTmp1, dTmp2;
				
				analDate = WebUtils.CheckNull(item.get("ANAL_DATE"), "");
				js = new JSONArray();
				if( analDate.length() >= 8 ) {
					js.add(analDate.substring(6, 8));
				} else {
					js.add(analDate);
				}				
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("TOTAL_WATER"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("DRIVE"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_001"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_002"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_011"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_012"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_013"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_014"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_015"), "")), "#,##0.##"));				
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_021"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_022"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_PROD"), "")), "#,##0.##"));
				dTmp1 = WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_031"), ""));
				dTmp2 = WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_032"), ""));
				js.add(WebUtils.FormatNumber(dTmp1 + dTmp2, "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_033"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_034"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_PROD"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_041"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_042"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_043"), "")), "#,##0.##"));
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_044"), "")), "#,##0.##"));				
				js.add(WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_PROD"), "")), "#,##0.##"));
				arrData.add(js);
				
				dTotalSum += WebUtils.String2Double(WebUtils.CheckNull(item.get("TOTAL_WATER"), ""));
				dDriveSum += WebUtils.String2Double(WebUtils.CheckNull(item.get("DRIVE"), ""));
				
				dPr0055Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_PROD"), ""));
				dPr0065Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_PROD"), ""));
				dPr0183Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_PROD"), ""));
				dPr0407Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_PROD"), ""));
				dPr0370Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_PROD"), ""));
				dPr0710Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_PROD"), ""));
				
				dProd001Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_001"), ""));
				dProd002Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_002"), ""));
				dProd011Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_011"), ""));
				dProd012Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_012"), ""));
				dProd013Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_013"), ""));
				dProd014Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_014"), ""));
				dProd015Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_015"), ""));
				dProd021Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_021"), ""));
				dProd022Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_022"), ""));
				dProd030Sum += (dTmp1 + dTmp2);
				dProd033Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_033"), ""));
				dProd034Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_034"), ""));
				dProd041Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_041"), ""));
				dProd042Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_042"), ""));
				dProd043Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_043"), ""));
				dProd044Sum += WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_044"), ""));
			}
			
			js = new JSONArray();
			js.add("��");
			js.add(WebUtils.FormatNumber(dTotalSum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dDriveSum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dPr0055Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd001Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd002Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dPr0065Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd011Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd012Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd013Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd014Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd015Sum, "#,##0.##"));				
			js.add(WebUtils.FormatNumber(dPr0183Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd021Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd022Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dPr0407Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd030Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd033Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd034Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dPr0370Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd041Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd042Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd043Sum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd044Sum, "#,##0.##"));				
			js.add(WebUtils.FormatNumber(dPr0710Sum, "#,##0.##"));
			arrData.add(js);
			
			js = new JSONArray();
			js.add("���");
			js.add(WebUtils.FormatNumber(dTotalSum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dDriveSum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dPr0055Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd001Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd002Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dPr0065Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd011Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd012Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd013Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd014Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd015Sum / list.size(), "#,##0.##"));				
			js.add(WebUtils.FormatNumber(dPr0183Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd021Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd022Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dPr0407Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd030Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd033Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd034Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dPr0370Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd041Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd042Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd043Sum / list.size(), "#,##0.##"));
			js.add(WebUtils.FormatNumber(dProd044Sum / list.size(), "#,##0.##"));				
			js.add(WebUtils.FormatNumber(dPr0710Sum / list.size(), "#,##0.##"));
			arrData.add(js);
		} else {
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
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}

	@SuppressWarnings("unchecked")
	private void _labDayOpProdNowProdList()
	{
		PageManualSearchDayDao dao = new PageManualSearchDayDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();		
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();		
		
		// �ü� �뷮
		js = new JSONArray();
		js.add("�ü� �뷮");
		js.add("#colspan");
		js.add("<b>5,100,000</b>");
		js.add("800,000");
		js.add("650,000");
		js.add("750,000");
		js.add("300,000");
		js.add("1,600,000");
		js.add("1,000,000");
		arrData.add(js);
		
		double dWater_prod_t, dWater_take_t;
		double dPr0055_prod_t, dPr0065_prod_t, dPr0183_prod_t, dPr0407_prod_t, dPr0370_prod_t, dPr0710_prod_t;
		double dPr0055_take_t, dPr0065_take_t, dPr0183_take_t, dPr0407_take_t, dPr0370_take_t, dPr0710_take_t;
		//double dPr0055_drive_t, dPr0065_drive_t, dPr0183_drive_t, dPr0407_drive_t, dPr0370_drive_t, dPr0710_drive_t;
		double dWater_prod_l, dWater_take_l;
		double dPr0055_prod_l, dPr0065_prod_l, dPr0183_prod_l, dPr0407_prod_l, dPr0370_prod_l, dPr0710_prod_l;
		double dPr0055_take_l, dPr0065_take_l, dPr0183_take_l, dPr0407_take_l, dPr0370_take_l, dPr0710_take_l;		
		
		dWater_prod_t = 0.0;
		dWater_take_t = 0.0;
		
		dPr0055_prod_t = 0.0;
		dPr0065_prod_t = 0.0;
		dPr0183_prod_t = 0.0;
		dPr0407_prod_t = 0.0;
		dPr0370_prod_t = 0.0;
		dPr0710_prod_t = 0.0;
		
		dPr0055_take_t = 0.0;
		dPr0065_take_t = 0.0;
		dPr0183_take_t = 0.0;
		dPr0407_take_t = 0.0;
		dPr0370_take_t = 0.0;
		dPr0710_take_t = 0.0;
		
		/*
		dPr0055_drive_t = 0.0;
		dPr0065_drive_t = 0.0;
		dPr0183_drive_t = 0.0;
		dPr0407_drive_t = 0.0;
		dPr0370_drive_t = 0.0;
		dPr0710_drive_t = 0.0;
		*/
		
		dWater_prod_l = 0.0;
		dWater_take_l = 0.0;
		
		dPr0055_prod_l = 0.0;
		dPr0065_prod_l = 0.0;
		dPr0183_prod_l = 0.0;
		dPr0407_prod_l = 0.0;
		dPr0370_prod_l = 0.0;
		dPr0710_prod_l = 0.0;
		
		dPr0055_take_l = 0.0;
		dPr0065_take_l = 0.0;
		dPr0183_take_l = 0.0;
		dPr0407_take_l = 0.0;
		dPr0370_take_l = 0.0;
		dPr0710_take_l = 0.0;
		
		// ���� ��Ȳ �˻�
		list = dao.selectLabDayOpProdNowProdDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				dWater_prod_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("WATER_PROD"), ""));
				dWater_take_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("WATER_TAKE"), ""));
				
				dPr0055_prod_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_PROD"), ""));
				dPr0065_prod_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_PROD"), ""));
				dPr0183_prod_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_PROD"), ""));
				dPr0407_prod_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_PROD"), ""));
				dPr0370_prod_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_PROD"), ""));
				dPr0710_prod_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_PROD"), ""));
				
				dPr0055_take_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_TAKE"), ""));
				dPr0065_take_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_TAKE"), ""));
				dPr0183_take_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_TAKE"), ""));
				dPr0407_take_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_TAKE"), ""));
				dPr0370_take_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_TAKE"), ""));
				dPr0710_take_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_TAKE"), ""));
				/*
				dPr0055_drive_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_DRIVE"), ""));
				dPr0065_drive_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_DRIVE"), ""));
				dPr0183_drive_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_DRIVE"), ""));
				dPr0407_drive_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_DRIVE"), ""));
				dPr0370_drive_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_DRIVE"), ""));
				dPr0710_drive_t = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_DRIVE"), ""));
				*/
			}
		}
		
		// ���� ��Ȳ �˻�
		String prevDate;		

		prevDate = WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMdd", "d", -1);
		params.put("WORK_DATE", prevDate);
		
		list = dao.selectLabDayOpProdNowProdDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				dWater_prod_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("WATER_PROD"), ""));
				dWater_take_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("WATER_TAKE"), ""));
				
				dPr0055_prod_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_PROD"), ""));
				dPr0065_prod_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_PROD"), ""));
				dPr0183_prod_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_PROD"), ""));
				dPr0407_prod_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_PROD"), ""));
				dPr0370_prod_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_PROD"), ""));
				dPr0710_prod_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_PROD"), ""));
				
				dPr0055_take_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0055_TAKE"), ""));
				dPr0065_take_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0065_TAKE"), ""));
				dPr0183_take_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0183_TAKE"), ""));
				dPr0407_take_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0407_TAKE"), ""));
				dPr0370_take_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0370_TAKE"), ""));
				dPr0710_take_l = WebUtils.String2Double(WebUtils.CheckNull(item.get("PR0710_TAKE"), ""));
			}
		}
		
		// ���� ���귮
		js = new JSONArray();
		js.add("���귮");
		js.add("����");
		js.add("<b>" + WebUtils.FormatNumber(dWater_prod_t, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dPr0055_prod_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0065_prod_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0183_prod_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0407_prod_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0370_prod_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0710_prod_t, "#,##0.###"));
		arrData.add(js);
		
		// ���� ���귮
		js = new JSONArray();
		js.add("#rowspan");
		js.add("����");
		js.add("<b>" + WebUtils.FormatNumber(dWater_prod_l, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dPr0055_prod_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0065_prod_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0183_prod_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0407_prod_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0370_prod_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0710_prod_l, "#,##0.###"));
		arrData.add(js);
		
		// ���� ���� ������
		js = new JSONArray();
		js.add("���� ���� ������(%)");
		js.add("#colspan");
		js.add("<b>" + WebUtils.FormatNumber(dWater_prod_t / 5100000 * 100, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dPr0055_prod_t / 800000 * 100, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0065_prod_t / 650000 * 100, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0183_prod_t / 750000 * 100, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0407_prod_t / 300000 * 100, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0370_prod_t / 1600000 * 100, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0710_prod_t / 1000000 * 100, "#,##0.###"));
		arrData.add(js);
		
		// ���� �����
		js = new JSONArray();
		js.add("�����");
		js.add("����");
		js.add("<b>" + WebUtils.FormatNumber(dWater_take_t, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dPr0055_take_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0065_take_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0183_take_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0407_take_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0370_take_t, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0710_take_t, "#,##0.###"));
		arrData.add(js);
		
		// ���� �����
		js = new JSONArray();
		js.add("#rowspan");
		js.add("����");
		js.add("<b>" + WebUtils.FormatNumber(dWater_take_l, "#,##0.###") + "</b>");
		js.add(WebUtils.FormatNumber(dPr0055_take_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0065_take_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0183_take_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0407_take_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0370_take_l, "#,##0.###"));
		js.add(WebUtils.FormatNumber(dPr0710_take_l, "#,##0.###"));
		arrData.add(js);
		
		// ���� ȿ��(%)
		js = new JSONArray();
		js.add("���� ȿ��(%)");
		js.add("#colspan");
		if( dWater_take_t > 0 ) { js.add("<b>" + WebUtils.FormatNumber(dWater_prod_t / dWater_take_t * 100, "#,##0.###") + "</b>"); } else { js.add(""); }
		if( dPr0055_take_t > 0 ) { js.add(WebUtils.FormatNumber(dPr0055_prod_t / dPr0055_take_t * 100, "#,##0.###")); } else { js.add(""); }
		if( dPr0065_take_t > 0 ) { js.add(WebUtils.FormatNumber(dPr0065_prod_t / dPr0065_take_t * 100, "#,##0.###")); } else { js.add(""); }
		if( dPr0183_take_t > 0 ) { js.add(WebUtils.FormatNumber(dPr0183_prod_t / dPr0183_take_t * 100, "#,##0.###")); } else { js.add(""); }
		if( dPr0407_take_t > 0 ) { js.add(WebUtils.FormatNumber(dPr0407_prod_t / dPr0407_take_t * 100, "#,##0.###")); } else { js.add(""); }
		if( dPr0370_take_t > 0 ) { js.add(WebUtils.FormatNumber(dPr0370_prod_t / dPr0370_take_t * 100, "#,##0.###")); } else { js.add(""); }
		if( dPr0710_take_t > 0 ) { js.add(WebUtils.FormatNumber(dPr0710_prod_t / dPr0710_take_t * 100, "#,##0.###")); } else { js.add(""); }
		arrData.add(js);
			
		result.put("aaData", arrData);
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		list = null;
		arrData = null;
		result = null;
		dao = null;
	}

	@SuppressWarnings("unchecked")
	private void _labDayOpPowerList()
	{
		PageManualSearchDayDao dao = new PageManualSearchDayDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();		
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		// ���� ����
		String thisDate, prevDate;
		
		thisDate = String.valueOf(params.get("WORK_DATE")).substring(0, 6);
		prevDate = WebUtils.DateTimeDiff(thisDate, "yyyyMM", "M", -1);

		params.put("THIS_DATE", thisDate);
		params.put("PREV_DATE", prevDate);
		
		list = dao.selectLabDayOpPowerDataList(params);
		if( list != null && list.size() > 0 ) {
			String curWWCode, wwCode;
			String unitName;
			double dProdPrice, dTpeak, dLpeak, dAllSum, dMor, dEve, dNig;
			double dSubProdPrice, dSubTpeak, dSubLpeak, dSubAllSum, dSubMor, dSubEve, dSubNig;
			double dTotProdPrice, dTotTpeak, dTotLpeak, dTotAllSum, dTotMor, dTotEve, dTotNig;
			
			wwCode = "";
			
			dProdPrice = 0.0;
			dTpeak = 0.0;
			dLpeak = 0.0;
			dAllSum = 0.0;
			dMor = 0.0;
			dEve = 0.0;
			dNig = 0.0;
			
			dSubProdPrice = 0.0;
			dSubTpeak = 0.0;
			dSubLpeak = 0.0;
			dSubAllSum = 0.0;
			dSubMor = 0.0;
			dSubEve = 0.0;
			dSubNig = 0.0;
			
			dTotProdPrice = 0.0;
			dTotTpeak = 0.0;
			dTotLpeak = 0.0;
			dTotAllSum = 0.0;
			dTotMor = 0.0;
			dTotEve = 0.0;
			dTotNig = 0.0;
			
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				unitName = WebUtils.CheckNull(item.get("UNIT"), "");
				unitName = unitName.replace("9", "");
				unitName = unitName + (unitName.length() > 0 ? " " : "" );
				
				curWWCode = String.valueOf(item.get("WW_CODE"));
				dProdPrice = WebUtils.String2Double(WebUtils.CheckNull(item.get("PROD_PRICE"), ""));
				dTpeak = WebUtils.String2Double(WebUtils.CheckNull(item.get("T_PEAK"), ""));
				dLpeak = WebUtils.String2Double(WebUtils.CheckNull(item.get("L_PEAK"), ""));
				dAllSum = WebUtils.String2Double(WebUtils.CheckNull(item.get("ALL_SUM"), ""));
				dMor = WebUtils.String2Double(WebUtils.CheckNull(item.get("MOR"), ""));
				dEve = WebUtils.String2Double(WebUtils.CheckNull(item.get("EVE"), ""));
				dNig = WebUtils.String2Double(WebUtils.CheckNull(item.get("NIG"), ""));
				
				dTotProdPrice += dProdPrice;
				dTotTpeak += dTpeak;
				dTotLpeak += dLpeak;
				dTotAllSum += dAllSum;
				dTotMor += dMor;
				dTotEve += dEve;
				dTotNig += dNig;
				
				if( wwCode.equals("") ) {
					dSubProdPrice += dProdPrice;
					dSubTpeak += dTpeak;
					dSubLpeak += dLpeak;
					dSubAllSum += dAllSum;
					dSubMor += dMor;
					dSubEve += dEve;
					dSubNig += dNig;
				} else {
					if( wwCode.equals(curWWCode) ) {
						dSubProdPrice += dProdPrice;
						dSubTpeak += dTpeak;
						dSubLpeak += dLpeak;
						dSubAllSum += dAllSum;
						dSubMor += dMor;
						dSubEve += dEve;
						dSubNig += dNig;
					} else {
						js = new JSONArray();
						js.add("#rowspan");
						js.add("��");						
						js.add(WebUtils.FormatNumber(dSubProdPrice, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubTpeak, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubLpeak, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubAllSum, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubMor, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubEve, "#,##0.##"));
						js.add(WebUtils.FormatNumber(dSubNig, "#,##0.##"));
						arrData.add(js);
						
						dSubProdPrice = dProdPrice;
						dSubTpeak = dTpeak;
						dSubLpeak = dLpeak;
						dSubAllSum = dAllSum;
						dSubMor = dMor;
						dSubEve = dEve;
						dSubNig = dNig;
					}
				}
				
				js = new JSONArray();
				if( wwCode.equals(curWWCode) ) {
					js.add("#rowspan");
				} else {
					js.add(WebConst.GetWPShortName(curWWCode));
				}
				js.add(unitName + WebUtils.CheckNull(item.get("POINT_NAME"), ""));
				js.add(WebUtils.FormatNumber(dProdPrice, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dTpeak, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dLpeak, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dAllSum, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dMor, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dEve, "#,##0.##"));
				js.add(WebUtils.FormatNumber(dNig, "#,##0.##"));
				arrData.add(js);
				
				wwCode = curWWCode;
			}
			
			js = new JSONArray();
			js.add("#rowspan");
			js.add("��");			
			js.add(WebUtils.FormatNumber(dSubProdPrice, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubTpeak, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubLpeak, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubAllSum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubMor, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubEve, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dSubNig, "#,##0.##"));
			arrData.add(js);
			
			js = new JSONArray();
			js.add("�հ�");
			js.add("#colspan");
			js.add(WebUtils.FormatNumber(dTotProdPrice, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotTpeak, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotLpeak, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotAllSum, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotMor, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotEve, "#,##0.##"));
			js.add(WebUtils.FormatNumber(dTotNig, "#,##0.##"));
			arrData.add(js);
		} else {
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
