package kr.go.seoul.water.action.json;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.CodeDao;
import kr.go.seoul.water.sql.dao.PageManualValueDao;

public class PageManualValueJsonAction extends BaseActionImp {
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
		if( act.equals("lab_measure_value_plant.list") ) {
			_labManualValuePlanList();
		} else if( act.equals("lab_manual_value_inout_result.list") ) {
			_labManualValueInOutResultList();
		} else if( act.equals("lab_manual_value_baseline.list") ) {
			_labManualValueBaseLineList();
		} else if( act.equals("lab_manual_value_power.list")) {
			_labManualValuePowerList();
		} else if( act.equals("lab_manual_value_water.list")) {
			_labManualValueWaterList();
		}
		
		return null;
	}	
	
	@SuppressWarnings("unchecked")
	private void _labManualValuePlanList()
	{
		PageManualValueDao dao = new PageManualValueDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String sPSPointCodes, sSSPointCodes, sRSPointCodes, sASPointCodes, sASPointValCnt, sItemCodes;
		boolean bExist;
		boolean bInit;		
		String html;
		
		sPSPointCodes = "";
		sSSPointCodes = "";
		sRSPointCodes = "";
		sASPointCodes = "";
		sASPointValCnt = "";
		
		Map<String, Object> mitem = dao.selectOneManualValuePlantData(params);
		if( mitem == null ) {
			mitem = new HashMap<String, Object>();
		}
		
		// 생산현황
		js = new JSONArray();
		js.add("<center>생산현황</center>");
		js.add("<center>취수량</center>");
		html = "<input type='text' name='TAKE_WATER' id='TAKE_WATER' maxlength=10";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("TAKE_WATER"), "") + "'";
		html += "> [m3/일]";
		js.add(html);
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		arrData.add(js);

		String curUnit, unit, pointCode;
		
		bInit = true;
		curUnit = "";
		unit = "";
		
		params.put("ITEM_TYPE", "P");
		params.put("POINT_TYPE", "S");
		list = dao.selectManualValuePlantPointDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				pointCode = WebUtils.CheckNull(item.get("POINT_CODE"), "");
				curUnit = WebUtils.CheckNull(item.get("UNIT"), "");
				
				js = new JSONArray();
				js.add("#rowspan");
				if( bInit ) {
					bInit = false;					
					js.add("<center>생산량</center>");
				} else {
					js.add("#rowspan");
				}
				
				if( curUnit.equals(unit) ) {
					js.add("#rowspan");
				} else {
					if( curUnit.indexOf("9") == 0 ) {
						js.add("<center>수계</center>");
					} else {
						js.add("<center>" + curUnit + (curUnit.length() > 0 ? " " : "") + "정수장</center>");
					}
				}
				js.add("<center>" + WebUtils.CheckNull(item.get("POINT_NAME"), "")+ "</center>");
				html = "<input type='text' name='PS_ITEM_VAL1_" + pointCode + "'  id='PS_ITEM_VAL1_" + pointCode + "'";
				html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.CheckNull(item.get("ITEM_VAL1"), "") + "'";
				html += " onchange='fnCalc(\"PS\");'> [m3/일]";	
				js.add(html);
				js.add("#colspan");
				js.add("#colspan");
				js.add("#colspan");				
				arrData.add(js);
				
				unit = curUnit;
				
				sPSPointCodes += (sPSPointCodes.length() > 0 ? "," : "") + pointCode;
			}
			
			js = new JSONArray();
			js.add("#rowspan");
			js.add("#rowspan");
			js.add("<center>계</center>");
			js.add("#colspan");
			html = "<input type='text' name='PROD_WATER'  id='PROD_WATER'";
			html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
			html += " value='" + WebUtils.CheckNull(mitem.get("PROD_WATER"), "") + "'";
			html += " readonly> [m3/일] <b><font color=red>* 자동계산되므로 임의 수정하지 마세요.</font></b>";	
			js.add(html);
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");				
			arrData.add(js);
		}
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<center>가동률</center>");
		html = "<input type='text' name='DRIVE_RATE' id='DRIVE_RATE' maxlength=10";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("DRIVE_RATE"), "") + "'";
		//html += " value='" + WebUtils.CheckNull(item.get("DATA_VAL"), "") + "'";			
		html += " readonly> [%] <b><font color=red>* 자동계산되므로 임의 수정하지 마세요.</font></b>";
		js.add(html);
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		arrData.add(js);
		
		// 송수 현황 - 송수량
		if( WebUtils.CheckNull(params.get("WW_CODE"), "").equals("PR0055") == false )
		{
			bExist = false;
			
			sSSPointCodes = "";		
			bInit = true;
			curUnit = "";
			unit = "";
			
			// 송수 현황 - 송수량
			params.put("ITEM_TYPE", "S");
			params.put("POINT_TYPE", "S");
			list = dao.selectManualValuePlantPointDataList(params);
			if( list != null && list.size() > 0 ) {
				if( bExist == false ) {
					js = new JSONArray();
					js.add("<center>송수현황</center>");
					js.add("<center>측정항목</center>");
					js.add("<center>측정값(송수량 재계산)</center>");
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");
					arrData.add(js);
					
					bExist = true;
				}
				
				it = list.iterator();
				while( it.hasNext() ) {
					item = it.next();
					
					pointCode = WebUtils.CheckNull(item.get("POINT_CODE"), "");
					curUnit = WebUtils.CheckNull(item.get("UNIT"), "");
					
					js = new JSONArray();
					js.add("#rowspan");
					if( bInit ) {
						bInit = false;					
						js.add("<center>송수량</center>");
					} else {
						js.add("#rowspan");
					}
					
					if( curUnit.equals(unit) ) {
						js.add("#rowspan");
					} else {
						if( curUnit.indexOf("9") == 0 ) {
							js.add("<center>수계</center>");
						} else {
							js.add("<center>" + curUnit + (curUnit.length() > 0 ? " " : "") + "정수장</center>");
						}
					}
					js.add("<center>" + WebUtils.CheckNull(item.get("POINT_NAME"), "")+ "</center>");
					html = "<input type='text' name='SS_ITEM_VAL1_" + pointCode + "'  id='SS_ITEM_VAL1_" + pointCode + "'";
					html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
					html += " value='" + WebUtils.CheckNull(item.get("ITEM_VAL1"), "") + "'";
					html += " onchange='fnCalc(\"SS\");'> [m3/일]";	
					js.add(html);
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");				
					arrData.add(js);
					
					unit = curUnit;
					
					sSSPointCodes += (sSSPointCodes.length() > 0 ? "," : "") + pointCode;
				}
				
				js = new JSONArray();
				js.add("#rowspan");
				js.add("#rowspan");
				js.add("<center>계</center>");
				js.add("#colspan");
				html = "<input type='text' name='SEND_WATER'  id='SEND_WATER'";
				html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.CheckNull(mitem.get("SEND_WATER"), "") + "'";
				html += " readonly> [m3/일] <b><font color=red>* 자동계산되므로 임의 수정하지 마세요.</font></b>";	
				js.add(html);
				js.add("#colspan");
				js.add("#colspan");
				js.add("#colspan");				
				arrData.add(js);
			}
			
			// 송수 현황 - 관압
			sRSPointCodes = "";		
			bInit = true;
			curUnit = "";
			unit = "";
			
			params.put("ITEM_TYPE", "R");
			params.put("POINT_TYPE", "S");
			list = dao.selectManualValuePlantPointDataList(params);
			if( list != null && list.size() > 0 ) {
				if( bExist == false ) {
					js = new JSONArray();
					js.add("<center>송수현황</center>");
					js.add("<center>측정항목</center>");
					js.add("<center>측정값(송수량 재계산)</center>");
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");
					arrData.add(js);
					
					bExist = true;
				}
				
				it = list.iterator();
				while( it.hasNext() ) {
					item = it.next();
					
					pointCode = WebUtils.CheckNull(item.get("POINT_CODE"), "");
					curUnit = WebUtils.CheckNull(item.get("UNIT"), "");
					
					js = new JSONArray();
					js.add("#rowspan");
					if( bInit ) {
						bInit = false;					
						js.add("<center>관압</center>");
					} else {
						js.add("#rowspan");
					}
					
					if( curUnit.equals(unit) ) {
						js.add("#rowspan");
					} else {
						if( curUnit.indexOf("9") == 0 ) {
							js.add("<center>수계</center>");
						} else {
							js.add("<center>" + curUnit + (curUnit.length() > 0 ? " " : "") + "정수장</center>");
						}
					}
					js.add("<center>" + WebUtils.CheckNull(item.get("POINT_NAME"), "")+ "</center>");
					if( pointCode.equals("013")) {
						html = "";
					} else {
						html = "일평균&nbsp;<input type='text' name='RS_ITEM_VAL1_" + pointCode + "'  id='RS_ITEM_VAL1_" + pointCode + "'";
						html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
						html += " value='" + WebUtils.CheckNull(item.get("ITEM_VAL1"), "") + "'";
						html += ">&nbsp;&nbsp;";	
						html += "일최고&nbsp;<input type='text' name='RS_ITEM_VAL2_" + pointCode + "'  id='RS_ITEM_VAL2_" + pointCode + "'";
						html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
						html += " value='" + WebUtils.CheckNull(item.get("ITEM_VAL2"), "") + "'";
						html += ">&nbsp;&nbsp;";
						html += "일최저&nbsp;<input type='text' name='RS_ITEM_VAL3_" + pointCode + "'  id='RS_ITEM_VAL3_" + pointCode + "'";
						html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
						html += " value='" + WebUtils.CheckNull(item.get("ITEM_VAL3"), "") + "'";
						html += ">&nbsp;[kg/cm2]";
					}
					js.add(html);
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");				
					arrData.add(js);
					
					unit = curUnit;
					
					if( pointCode.equals("013") == false ) {
						sRSPointCodes += (sRSPointCodes.length() > 0 ? "," : "") + pointCode;
					}
				}
			}
			
			// 송수 현황 - 펌프 가동
			sASPointCodes = "";		
			bInit = true;
			curUnit = "";
			unit = "";
			
			params.put("ITEM_TYPE", "A");
			params.put("POINT_TYPE", "S");
			list = dao.selectManualValuePlantPointDataList(params);
			if( list != null && list.size() > 0 ) {
				if( bExist == false ) {
					js = new JSONArray();
					js.add("<center>송수현황</center>");
					js.add("<center>측정항목</center>");
					js.add("<center>측정값(송수량 재계산)</center>");
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");
					arrData.add(js);
					
					bExist = true;
				}
				
				it = list.iterator();
				while( it.hasNext() ) {
					item = it.next();
					
					pointCode = WebUtils.CheckNull(item.get("POINT_CODE"), "");
					curUnit = WebUtils.CheckNull(item.get("UNIT"), "");
					
					js = new JSONArray();
					js.add("#rowspan");
					if( bInit ) {
						bInit = false;					
						js.add("<center>펌프가동<br><br><font color=red>* 펌프가동시간은<br>콜론(:)으로<br>입력하세요<br>ex) 30:55</font></center>");
					} else {
						js.add("#rowspan");
					}
					
					if( curUnit.equals(unit) ) {
						js.add("#rowspan");
					} else {
						if( curUnit.indexOf("9") == 0 ) {
							js.add("<center>수계</center>");
						} else {
							js.add("<center>" + curUnit + (curUnit.length() > 0 ? " " : "") + "정수장</center>");
						}
					}
					js.add("<center>" + WebUtils.CheckNull(item.get("POINT_NAME"), "")+ "</center>");
					if( ! pointCode.equals("043") ) {
						html = WebConst.GetHorseSize(pointCode + "1") + "&nbsp;&nbsp;가동시간&nbsp;<input type='text' name='AS_ITEM_VAL3_" + pointCode + "'  id='AS_ITEM_VAL3_" + pointCode + "'";
						html += " style='width:80px; height:14px; left-padding:5px; right-padding:10px;'";
						html += " value='" + WebUtils.CheckNull(item.get("ITEM_VAL3"), "") + "'";
						html += ">&nbsp;&nbsp;";	
						html += "운영대수&nbsp;<input type='text' name='AS_ITEM_VAL2_" + pointCode + "'  id='AS_ITEM_VAL2_" + pointCode + "'";
						html += " style='width:80px; height:14px; left-padding:5px; right-padding:10px;'";
						html += " value='" + WebUtils.CheckNull(item.get("ITEM_VAL2"), "") + "'";
						html += ">";
					}
					else {
						html = "";
					}
					int nHorseCnt = WebConst.GetHorseCnt(pointCode);
					String itemVal1, itemVal2;
					Map<String, Object> horseItem;
					
					sASPointValCnt += (sASPointValCnt.length() > 0 ? "," : "") + String.valueOf(nHorseCnt);
					for( int i = 0; i < nHorseCnt - 1; i ++) {
						params.put("POINT_CODE", pointCode);
						params.put("ORDER_NUM", i + 1);
						horseItem = dao.selectOneManualValuePlantHorseDataList(params);
						if( horseItem != null && horseItem.size() > 0 ) {
							itemVal1 = WebUtils.CheckNull(horseItem.get("ITEM_VAL1"), "");
							itemVal2 = WebUtils.CheckNull(horseItem.get("ITEM_VAL2"), "");
						} else {
							itemVal1 = "";
							itemVal2 = "";
						}
						
						if( !html.equals("") ) {
							html += "<br>";
						}
						html += WebConst.GetHorseSize(pointCode + String.valueOf(i + 2)) + "&nbsp;&nbsp;가동시간&nbsp;<input type='text' name='AS_POINT_VAL2_" + pointCode + "_" + String.valueOf(i) + "'  id='AS_POINT_VAL2_" + pointCode + "_" + String.valueOf(i) + "'";
						html += " style='width:80px; height:14px; left-padding:5px; right-padding:10px;'";
						html += " value='" + itemVal2 + "'";
						html += ">&nbsp;&nbsp;";	
						html += "운영대수&nbsp;<input type='text' name='AS_POINT_VAL1_" + pointCode + "_" + String.valueOf(i) + "'  id='AS_POINT_VAL1_" + pointCode + "_" + String.valueOf(i) + "'";
						html += " style='width:80px; height:14px; left-padding:5px; right-padding:10px;'";
						html += " value='" + itemVal1 + "'";
						html += ">";
					}
					js.add(html);
					js.add("#colspan");
					js.add("#colspan");
					js.add("#colspan");				
					arrData.add(js);
					
					unit = curUnit;
					
					sASPointCodes += (sASPointCodes.length() > 0 ? "," : "") + pointCode;
				}
			}
		}
		
		// 약품투입현황
		js = new JSONArray();
		js.add("<center>약품투입현황</center>");
		js.add("<center>응집제</center>");
		js.add("<center>PAC(17%)</center>");
		html = "<input type='text' name='PAC' id='PAC' maxlength=10";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("PAC"), "") + "'";
		html += "> [mg/l]";
		js.add(html);
		js.add("<center>PAHCS (12%)</center>");
		html = "<input type='text' name='PAHCS' id='PAHCS' maxlength=10";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("PAHCS"), "") + "'";
		html += "> [mg/l]";
		js.add(html);
		//PACS 숨기기
		//js.add("<center>PACS</center>");
		//html = "<input type='hidden' name='PACS' id='PACS' maxlength=10";
		//html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		//html += " value='" + WebUtils.CheckNull(mitem.get("PACS"), "") + "'";
		//html += "> [mg/l]";
		//js.add(html);		
		
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<center>알카리제</center>");
		js.add("<center>가성소다</center>");
		html = "<input type='text' name='AL_GA' id='AL_GA' maxlength=10";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("AL_GA"), "") + "'";
		html += "> [mg/l]";
		js.add(html);
		js.add("<center>소석회</center>");
		html = "<input type='text' name='AL_SO' id='AL_SO' maxlength=10";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("AL_SO"), "") + "'";
		html += "> [mg/l]";
		js.add(html);
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<center>염소</center>");
		js.add("<center>전염소</center>");
		html = "<input type='text' name='FRONT' id='FRONT' maxlength=10";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("FRONT"), "") + "'";
		html += "> [mg/l]";
		js.add(html);
		js.add("<center>후염소</center>");
		html = "<input type='text' name='REAR' id='REAR' maxlength=10";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("REAR"), "") + "'";
		html += "> [mg/l]";
		js.add(html);
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<center>오존</center>");
		html = "<input type='text' name='POWDER' id='POWDER' maxlength=20";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("POWDER"), "") + "'";
		html += "> [mg/l]";
		js.add(html);
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<center>이산화탄소</center>");
		html = "<input type='text' name='CD00' id='CD00' maxlength=20";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("CD00"), "") + "'";
		html += "> [mg/l]";
		js.add(html);
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		arrData.add(js);
		
		// 수질현황
		String itemCode;
		String curWaterType, waterType;
		
		sItemCodes = "";		
		curWaterType = "";
		waterType = "";
		bInit = true;
		list = dao.selectManualValuePlantItemDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				curWaterType = WebUtils.CheckNull(item.get("WATER_TYPE"), "");
				itemCode = WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				
				if( bInit ) {
					js = new JSONArray();
					js.add("<center>수질현황</center>");
					js.add("<center>항목</center>");
					js.add("#colspan");
					js.add("<center>측정값</center>");
					js.add("#colspan");
					js.add("#colspan");
					js.add("<center>상한값</center>");
					js.add("<center>하한값</center>");
					
					bInit = false;
					arrData.add(js);
				}
				
				js = new JSONArray();
				js.add("#rowspan");
			
				if( curWaterType.equals(waterType) ) {
					js.add("#rowspan");
				} else {
					js.add("<center>" + WebUtils.CheckNull(item.get("WATER_TEXT"), "") + "</center>");
				}
				js.add("<center>" + WebUtils.CheckNull(item.get("ITEM_NAME"), "") + "</center>");
				
				html = "";
				if( WebUtils.CheckNull(item.get("ITEM_NAME"), "").equals("냄새발생여부") ) {
					html = "<select name='ITEM_" + itemCode + "'  id='ITEM_" + itemCode + "'>";
					html += "  <option value='1'" + (WebUtils.CheckNull(item.get("ITEM_VAL1"), "").equals("1") ? " selected" : "") + ">유</option>";
					html += "  <option value='9'" + (WebUtils.CheckNull(item.get("ITEM_VAL1"), "").equals("9") ? " selected" : "") + ">무</option>";
					html += "</select>";
				} else {
					html = "<input type='text' name='ITEM_" + itemCode + "'  id='ITEM_" + itemCode + "'";
					html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
					html += " value='" + WebUtils.CheckNull(item.get("ITEM_VAL1"), "") + "'";
					html += ">";	
				}
				if( WebUtils.CheckNull(item.get("ITEM_UNIT"), "").equals("") == false ) {
					html += " [" + WebUtils.CheckNull(item.get("ITEM_UNIT"), "") + "]";
				}
				js.add(html);
				js.add("#colspan");
				js.add("#colspan");
				
				if( item.get("HIGH") != null && item.get("LOW") != null ) {
					js.add("<center>" + WebUtils.CheckNull(item.get("HIGH"), "") + "</center>");
					js.add("<center>" + WebUtils.CheckNull(item.get("LOW"), "") + "</center>");						
				} else if( item.get("HIGH") != null && item.get("LOW") == null ) {
					js.add("<center>" + WebUtils.CheckNull(item.get("HIGH"), "") + "</center>");
					js.add("");
				} else if( item.get("HIGH") == null && item.get("LOW") != null ) {
					js.add("");
					js.add("<center>" + WebUtils.CheckNull(item.get("LOW"), "") + "</center>");
				} else {
					js.add("");
					js.add("");
				}
				
				sItemCodes += (sItemCodes.length() > 0 ? "," : "") + WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				
				waterType = curWaterType;
				
				arrData.add(js);
			}
		}
		
		// 여과지속시간
		js = new JSONArray();
		js.add("<center>여과지속시간</center>");
		js.add("#colspan");
		html = "<input type='text' name='FILTER_TIME' id='FILTER_TIME' maxlength=20";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("FILTER_TIME"), "") + "'";
		html += "> [hr] <b><font color=red>* 숫자만 입력하시기 바랍니다. ex) 36(O) / 36:34 (X)<font></b>";
		js.add(html);
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		arrData.add(js);
		
		// 기타
		js = new JSONArray();
		js.add("<center>기타</center>");
		js.add("<center>팔당댐 방류량</center>");
		html = "<input type='text' name='DISCHARGE' id='DISCHARGE' maxlength=20";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("DISCHARGE"), "") + "'";
		html += "> CMS";
		js.add(html);
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<center>기온</center>");
		js.add("<center>일최고</center>");
		html = "<input type='text' name='TEMP_MAX' id='TEMP_MAX' maxlength=20";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("TEMP_MAX"), "") + "'";
		html += "> [℃]";
		js.add(html);		
		js.add("#colspan");
		js.add("<center>일최저</center>");
		html = "<input type='text' name='TEMP_MIN' id='TEMP_MIN' maxlength=20";
		html += " style='width:80px; height:100%; left-padding:5px; right-padding:10px;'";
		html += " value='" + WebUtils.CheckNull(mitem.get("TEMP_MIN"), "") + "'";
		html += "> [℃]";
		js.add(html);
		js.add("#colspan");
		arrData.add(js);
		
		result.put("sPS_POINT_CODES", sPSPointCodes);
		result.put("sSS_POINT_CODES", sSSPointCodes);
		result.put("sRS_POINT_CODES", sRSPointCodes);
		result.put("sAS_POINT_CODES", sASPointCodes);
		result.put("sAS_POINT_VAL_CNT", sASPointValCnt);
		result.put("sITEM_CODES", sItemCodes);
		result.put("aaData", arrData);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		dao = null;
		result = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _labManualValueInOutResultList()
	{
		PageManualValueDao dao = new PageManualValueDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String sItemList = "";
		String itemCode;
		String html;
		int index;
		
		boolean bExist = false;
		
		index = 1;		
		list = dao.selectManualValueInOutResultExistDataList(params);
		if( list != null && list.size() > 0 ) {
			bExist = true;
		} else {
			list = dao.selectManualValueInOutResultDataList(params);
			bExist = false;
		}
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				itemCode = WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				sItemList += (sItemList.length() > 0 ? "," : "") + itemCode;

				
				js = new JSONArray();

				js.add(String.valueOf(index));
				js.add(WebUtils.CheckNull(item.get("ITEM_KNAME"), ""));
				
				html = "<input type='text' name='DATA_VAL_" + itemCode + "_" + String.valueOf(index - 1) + "' id='DATA_VAL_" + itemCode + "_" + String.valueOf(index - 1) + "' maxlength=10";
				html += " style='width:100%; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.CheckNull(item.get("DATA_VAL"), "") + "'";			
				html += ">";
				js.add(html);
				if( params.get("WATER_TYPE").equals("O")) {
					js.add(WebUtils.CheckNull(item.get("ENV_HIGH"), ""));
					js.add(WebUtils.CheckNull(item.get("ENV_LOW"), ""));
				} else {
					js.add(WebUtils.CheckNull(item.get("EAT_HIGH"), ""));
					js.add(WebUtils.CheckNull(item.get("EAT_LOW"), ""));
				}
				arrData.add(js);
				
				index ++;
			}
		} else {
			js = new JSONArray();
			js.add("설정된 항목이 없습니다. 관리자에게 문의하세요.");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			arrData.add(js);
		}
		
		// 소멸
		list = null;
		dao = null;
		
		result.put("aaData", arrData);
		result.put("sITEM_LIST", sItemList);
		result.put("bEXIST", bExist);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		list = null;
		dao = null;
		result = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _labManualValueBaseLineList()
	{
		CodeDao codeDao = new CodeDao();
		Map<String, String> info = null;
		
		PageManualValueDao dao = new PageManualValueDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();	
		
		String sItemList = "";
		String sTelNum = "";
		String html;
				
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
			
			sTelNum = strTelNum;
		}
		
		js = new JSONArray(); js.add("<b>정수센터명</b>"); 
		js.add("#colspan");
		js.add("#colspan"); 
		js.add(data[1]);
		js.add("#colspan");
		arrData.add(js);	
		
		js = new JSONArray(); js.add("<b>위치</b>");
		js.add("#colspan");
		js.add("#colspan"); 
		js.add(data[2]);
		js.add("#colspan");
		arrData.add(js);	
		
		js = new JSONArray();
		js.add("<b>담당자명 (전화번호)</b>");
		js.add("#colspan");
		js.add("#colspan");
		js.add(strManager + " (" + strTelNum + ")");		
		js.add("#colspan");
		arrData.add(js);	
		
		js = new JSONArray();
		js.add("<b>여과공정</b>");
		js.add("<b>여과방식</b>");
		js.add("#colspan");
		js.add(data[3]);
		js.add("#colspan");
		arrData.add(js);	
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<b>측정지점/방법</b>");
		js.add("#colspan");
		js.add(data[4]);		
		js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("<b>소독공정</b>");
		js.add("<b>소독방식(소독제 종류)</b>");
		js.add("#colspan");
		js.add(data[5]);
		js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<b>소독지점</b>");
		js.add("#colspan");
		js.add(data[6]);		
		js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("#rowspan");
		js.add("<b>측정지점/방법</b>");
		js.add("#colspan");
		js.add(data[7]);
		js.add("#colspan");
		arrData.add(js);
		
		js = new JSONArray();
		js.add("<b>시설용량 (㎥/일)</b>");		
		js.add("#colspan");
		js.add("#colspan");
		js.add(data[8]);		
		js.add("#colspan");
		arrData.add(js);
		
		// 
		String curItemCode, itemCode, sUnit, sTmp, pointCode;
		double dItemVal1, dItemVal2, dItemVal3;
		boolean bCheck;
		
		curItemCode = "";
		itemCode = "";
		
		list = dao.selectLabManualValueBaselineStanrdPointValDataList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				if( WebUtils.CheckNull(item.get("ITEM_TYPE"), "").equals("P") == false ) {
					continue;
				}
					
				curItemCode = WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				pointCode = WebUtils.CheckNull(item.get("POINT_CODE"), "");
				sUnit = WebUtils.CheckNull(item.get("UNIT"), "");
				sUnit = sUnit.replaceAll("9", "");
				dItemVal1 = WebUtils.String2Double(WebUtils.CheckNull(item.get("ITEM_VAL1"), ""));
				
				sItemList += (sItemList.length() > 0 ? "," : "") +  "S," + pointCode + "," + curItemCode;
		
				js = new JSONArray();
				if( curItemCode.equals(itemCode) && itemCode.equals("") == false) {
					js.add("#rowspan");
				} else {
					js.add("<b>" + WebUtils.CheckNull(item.get("ITEM_NAME"), "") + "</b>");
				}				
				js.add("<b>" + sUnit + WebUtils.CheckNull(item.get("POINT_NAME"), "") + "</b>");
				js.add("#colspan");
				sTmp = "";				
				if( item.get("ITEM_VAL1") != null ) {
					sTmp = WebUtils.FormatNumber(dItemVal1, "#,##0.##");
				}
				html = "<input type='text' name='ITEM_VAL1_" + pointCode + "_" + curItemCode + "' id='ITEM_VAL1_" + pointCode + "_" + curItemCode + "' maxlength=9";
				html += " style='width:100px; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + sTmp + "'";
				html += ">";
				js.add(html);
				js.add("#colspan");
				arrData.add(js);
				
				itemCode = curItemCode;
			}
		}
		
		curItemCode = "";
		itemCode = "";
		bCheck = false;
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				if( WebUtils.CheckNull(item.get("ITEM_TYPE"), "").equals("P") == true ) {
					continue;
				}
					
				curItemCode = WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				pointCode = WebUtils.CheckNull(item.get("POINT_CODE"), "");
				sUnit = WebUtils.CheckNull(item.get("UNIT"), "");
				sUnit = sUnit.replaceAll("9", "");
				dItemVal1 = WebUtils.String2Double(WebUtils.CheckNull(item.get("ITEM_VAL1"), ""));
				dItemVal2 = WebUtils.String2Double(WebUtils.CheckNull(item.get("ITEM_VAL2"), ""));
				dItemVal3 = WebUtils.String2Double(WebUtils.CheckNull(item.get("ITEM_VAL3"), ""));
				
				sItemList += (sItemList.length() > 0 ? "," : "") +  "P," + pointCode + "," + curItemCode;
				
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
				if( item.get("ITEM_VAL2") != null ) {
					sTmp = WebUtils.FormatNumber(dItemVal2, "#,##0.##");
				}
				html = "<input type='text' name='ITEM_VAL2_" + pointCode + "_" + curItemCode + "' id='ITEM_VAL2_" + pointCode + "_" + curItemCode + "' maxlength=9";
				html += " style='width:100px; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + sTmp + "'";
				html += ">";
				
				html += " ~ ";
				
				sTmp = "";
				if( item.get("ITEM_VAL3") != null ) {
					sTmp = WebUtils.FormatNumber(dItemVal3, "#,##0.##");
				}
				html += "<input type='text' name='ITEM_VAL3_" + pointCode + "_" + curItemCode + "' id='ITEM_VAL3_" + pointCode + "_" + curItemCode + "' maxlength=9";
				html += " style='width:100px; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + sTmp + "'";
				html += ">";				
				js.add(html);				
				
				html = "<select name='REMARK_" + pointCode + "_" + curItemCode + "' id='ITEM_VAL3_" + pointCode + "_" + curItemCode + "'>";
				html += "<option value='해당없음'>해당없음</option>";
				html += "<option value='기준치초과'" + (WebUtils.CheckNull(item.get("REMARK"), "").equals("기준치초과") ? " selected" : "") + ">기준치초과</option>";
				html += "</select>";
				js.add(html);
				
				arrData.add(js);
				
				itemCode = curItemCode;
				bCheck = true;
			}
		}
		
		result.put("aaData", arrData);
		result.put("sTEL_NUM", sTelNum);
		result.put("sITEM_LIST", sItemList);		
		
		// JSON 데이터 출력
		super._writeJsonResultPage(result);		
		
		list = null;
		result = null;
		arrData = null;
		codeDao = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _labManualValuePowerList()
	{
		PageManualValueDao dao = new PageManualValueDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String sPointCodeList = "";
		String pointCode, unitName;
		String html;
		String curPointCode;
		
		
		pointCode = "";
		curPointCode = "";
		list = dao.selectManualValuePowerDataList(params);			
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				curPointCode = WebUtils.CheckNull(item.get("POINT_CODE"), "");
				
				unitName = WebUtils.CheckNull(item.get("UNIT"), "");
				unitName = unitName.replace("9", "");
				unitName = unitName + (unitName.length() > 0 ? " " : "" );
				
				sPointCodeList += (sPointCodeList.length() > 0 ? "," : "") +  curPointCode;

				
				js = new JSONArray();
				if( curPointCode.equals(pointCode) ) {
					js.add("#rowspan");
				} else {
					js.add(unitName + WebUtils.CheckNull(item.get("POINT_NAME"), ""));
				}
				
				html = "<input type='text' name='PEAK_" + curPointCode + "' id='PEAK_" + curPointCode + "' maxlength=13";
				html += " style='width:100%; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("PEAK"), "")), "#.##") + "'";		
				html += ">";
				js.add(html);
				
				html = "<input type='text' name='MORNING_" + curPointCode + "' id='MORNING_" + curPointCode + "' maxlength=13";
				html += " style='width:100%; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("MORNING"), "")), "#.##") + "'";
				html += ">";
				js.add(html);
				
				html = "<input type='text' name='EVENING_" + curPointCode + "' id='EVENING_" + curPointCode + "' maxlength=13";
				html += " style='width:100%; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("EVENING"), "")), "#.##") + "'";
				html += ">";
				js.add(html);
				
				html = "<input type='text' name='NIGHT_" + curPointCode + "' id='NIGHT_" + curPointCode + "' maxlength=13";
				html += " style='width:100%; height:100%; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.FormatNumber(WebUtils.String2Double(WebUtils.CheckNull(item.get("NIGHT"), "")), "#.##") + "'";
				html += ">";
				js.add(html);
				
				arrData.add(js);
				
				pointCode = curPointCode;
			}
		}
		
		// 소멸
		list = null;
		dao = null;
		
		result.put("aaData", arrData);
		result.put("sPOINT_CODE_LIST", sPointCodeList);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		result = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _labManualValueWaterList()
	{
		PageManualValueDao dao = new PageManualValueDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		JSONArray js;
		
		Map<String, Object> params = null;
		params = _getParamMap();
		
		String sItemList = "";
		String itemCode;
		String html;
		int index;
		boolean bExist = false;
		
		index = 1;		
		list = dao.selectManualValueWaterExistDataList(params);
		if( list != null && list.size() > 0 ) {
			bExist = true;
		} else {
			list = dao.selectManualValueWaterDataList(params);
			bExist = false;
		}
		
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				itemCode = WebUtils.CheckNull(item.get("ITEM_CODE"), "");
				sItemList += (sItemList.length() > 0 ? "," : "") + itemCode;
				
				js = new JSONArray();

				js.add(String.valueOf(index));
				js.add(WebUtils.CheckNull(item.get("ITEM_KNAME"), ""));
				js.add(WebUtils.CheckNull(item.get("ENV_HIGH"), ""));
				js.add(WebUtils.CheckNull(item.get("ENV_LOW"), ""));
				js.add(WebUtils.CheckNull(item.get("EAT_HIGH"), ""));
				js.add(WebUtils.CheckNull(item.get("EAT_LOW"), ""));
				
				html = "<input type='text' name='DATA_VAL_PR0055_" + itemCode + "_" + String.valueOf(index - 1) + "' id='DATA_VAL_PR0055_" + itemCode + "_" + String.valueOf(index - 1) + "' maxlength=10";
				html += " style='width:100%; height:15px; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.CheckNull(item.get("PR0055"), "") + "'";			
				html += ">";
				js.add(html);
				
				html = "<input type='text' name='DATA_VAL_PR0065_" + itemCode + "_" + String.valueOf(index - 1) + "' id='DATA_VAL_PR0065_" + itemCode + "_" + String.valueOf(index - 1) + "' maxlength=10";
				html += " style='width:100%; height:15px; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.CheckNull(item.get("PR0065"), "") + "'";			
				html += ">";
				js.add(html);
				
				html = "<input type='text' name='DATA_VAL_PR0183_" + itemCode + "_" + String.valueOf(index - 1) + "' id='DATA_VAL_PR0183_" + itemCode + "_" + String.valueOf(index - 1) + "' maxlength=10";
				html += " style='width:100%; height:15px; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.CheckNull(item.get("PR0183"), "") + "'";			
				html += ">";
				js.add(html);
				
				html = "<input type='text' name='DATA_VAL_PR0370_" + itemCode + "_" + String.valueOf(index - 1) + "' id='DATA_VAL_PR0370_" + itemCode + "_" + String.valueOf(index - 1) + "' maxlength=10";
				html += " style='width:100%; height:15px; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.CheckNull(item.get("PR0370"), "") + "'";			
				html += ">";
				js.add(html);
				
				html = "<input type='text' name='DATA_VAL_PR0407_" + itemCode + "_" + String.valueOf(index - 1) + "' id='DATA_VAL_PR0407_" + itemCode + "_" + String.valueOf(index - 1) + "' maxlength=10";
				html += " style='width:100%; height:15px; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.CheckNull(item.get("PR0407"), "") + "'";			
				html += ">";
				js.add(html);
				
				html = "<input type='text' name='DATA_VAL_PR0710_" + itemCode + "_" + String.valueOf(index - 1) + "' id='DATA_VAL_PR0710_" + itemCode + "_" + String.valueOf(index - 1) + "' maxlength=10";
				html += " style='width:100%; height:15px; left-padding:5px; right-padding:10px;'";
				html += " value='" + WebUtils.CheckNull(item.get("PR0710"), "") + "'";			
				html += ">";
				js.add(html);
				
				arrData.add(js);
				
				index ++;
			}
		} else {
			js = new JSONArray();
			js.add("설정된 항목이 없습니다. 관리자에게 문의하세요.");
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
		
		// 소멸
		list = null;
		dao = null;
		
		result.put("aaData", arrData);
		result.put("sITEM_LIST", sItemList);
		result.put("bEXIST", bExist);
		
		// JSON 데이터 출력
		_writeJsonResultPage(result);
		
		// 소멸
		result = null;
	}
}
