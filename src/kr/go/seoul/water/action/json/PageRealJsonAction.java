package kr.go.seoul.water.action.json;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.go.seoul.water.action.BaseActionImp;
import kr.go.seoul.water.comm.WebConst;
import kr.go.seoul.water.comm.WebUtils;
import kr.go.seoul.water.sql.dao.CodeDao;
import kr.go.seoul.water.sql.dao.PageRealDao;

public class PageRealJsonAction extends BaseActionImp {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 169175098777364281L;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String act;
		
		act = getAct();
		
		// Act�� ���� �б�
		if( act.equals("total.summary.water") ) {
			// �ǽð� �������� - ���տ�� ���� (��������Һ�)
			_totalSummaryWater();
		} else if( act.equals("total.summary.plant") ) {
			// �ǽð� �������� - ���տ�� ���� (��ü ��������)
			_totalSummaryPlant();
		} else if( act.equals("total.summary.points")) {
			// �ǽð� �������� - ���տ�� ���� (�������)
			_totalSummaryPoints();
		} else if( act.equals("total.plant.summary.in") ) {
			// �ǽð� �������� - �Ƹ����������� - ���
			_totalPlantSummaryIn();
		} else if( act.equals("total.plant.summary.out") ) {
			// �ǽð� �������� - �Ƹ����������� - ����
			_totalPlantSummaryOut();
		} else if( act.equals("plant.summary.process") ) {
			// �ǽð� �������� - �Ƹ����������� - �������ͺ� �������� - �����׸� �� ��Ÿ�׸�
			_plantSummaryProcess();
		}  else if( act.equals("plant.summary.etc") ) {
			// �ǽð� �������� - �Ƹ����������� - �������ͺ� �������� - ��Ÿ�׸�
			_plantSummaryEtc();
		} else if( act.equals("plant.summary.provider") ) {
			// �ǽð� �������� - �Ƹ����������� - �������ͺ� ������ް���
			_plantSummaryProvider();
		} else if( act.equals("water.summary") ) {
			// �ǽð� �������� - ���������
			_waterSummay();
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private void _totalSummaryWater()
	{
		PageRealDao dao = new PageRealDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
				
		JSONArray js;		
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		
		list = dao.selectTotalSummaryWaterList(_getParamMap());
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				js = new JSONArray();
				js.add(WebConst.GetPointFullName(String.valueOf(item.get("POINT_NAME")), String.valueOf(item.get("TYPE_NAME"))));
				
				String status;
				status = String.valueOf(item.get("STATUE_TB01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {					
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TB01", (Double) item.get("TB01")));
				}
				
				status = String.valueOf(item.get("STATUE_PH01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PH01", (Double) item.get("PH01")));
				}
				
				status = String.valueOf(item.get("STATUE_RC01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "RC01", (Double) item.get("RC01")));
				}
				
				status = String.valueOf(item.get("STATUE_TE01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TE01", (Double) item.get("TE01")));
				}
				
				status = String.valueOf(item.get("STATUE_CD01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "CD01", (Double) item.get("CD01")));
				}
				array.add(js);
			}
		} else {
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� ���� ���� �ʽ��ϴ�.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			array.add(js);
		}		
		
		result.put("aaData", array);
		
		// ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		array = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _totalSummaryPlant()
	{
		PageRealDao dao = new PageRealDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONArray js;		
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		
		list = dao.selectTotalSummaryPlantList(_getParamMap());
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				js = new JSONArray();
				js.add(String.valueOf(item.get("WW_NAME")) + "�Ƹ�����������");
				String status;
				status = String.valueOf(item.get("STATUE_TB01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TB01", (Double) item.get("TB01")));
				}
				
				status = String.valueOf(item.get("STATUE_PH01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PH01", (Double) item.get("PH01")));
				}
				
				status = String.valueOf(item.get("STATUE_RC01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "RC01", (Double) item.get("RC01")));
				}
				
				status = String.valueOf(item.get("STATUE_TE01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TE01", (Double) item.get("TE01")));
				}
				
				status = String.valueOf(item.get("STATUE_CD01"));
				if( WebConst.CheckStandardRangeCheck(status) ) {
					js.add(status);
				} else {
					js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "CD01", (Double) item.get("CD01")));
				}
				array.add(js);
			}
		} else {
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� ���� ���� �ʽ��ϴ�.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			array.add(js);
		}
		
		result.put("aaData", array);
		
		// ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		array = null;
		result = null;		
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _totalSummaryPoints()
	{
		PageRealDao dao = new PageRealDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		int iTotCnt = 0;
		int iOkCnt = 0;
		int iWarnCnt = 0;
		int iInvalidCnt = 0;
		int iStopCnt = 0;
		int iCheckCnt = 0;
		String maxDateTime = "";
		String analDateTime;
		
		String sTB01Status, sPH01Status, sRC01Status, sTE01Status, sCD01Status;
		
		JSONObject result = new JSONObject();
		
		list = dao.selectTotalSummaryPointsList(_getParamMap());
		if( list != null ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				analDateTime = String.valueOf(item.get("ANAL_DATE"));
				if(maxDateTime.compareTo(analDateTime) < 0 ) {
					maxDateTime = analDateTime;
				}
				
				// ������ ����
				sTB01Status = String.valueOf(item.get("STATUE_TB01"));
				sPH01Status = String.valueOf(item.get("STATUE_PH01"));
				sRC01Status = String.valueOf(item.get("STATUE_RC01"));
				sTE01Status = String.valueOf(item.get("STATUE_TE01"));
				sCD01Status = String.valueOf(item.get("STATUE_CD01"));
				
				if( WebConst.CheckStandardRangeCheck(sTB01Status) 
					|| WebConst.CheckStandardRangeCheck(sPH01Status)
					|| WebConst.CheckStandardRangeCheck(sRC01Status)
					|| WebConst.CheckStandardRangeCheck(sTE01Status)
					|| WebConst.CheckStandardRangeCheck(sCD01Status) )
				{
					iCheckCnt ++;
				} else {
					if( WebConst.CheckStandardRange("TB01", (Double) item.get("TB01"))
						&& WebConst.CheckStandardRange("PH01", (Double) item.get("PH01"))
						&& WebConst.CheckStandardRange("RC01", (Double) item.get("RC01")) )
					{
						iOkCnt ++;
					} else {
						iWarnCnt ++;
					}	
				}
				
				iTotCnt ++;
			}
		}
		
		// ���� ���
		iTotCnt = 186;
		iStopCnt = 5;
		
		// ���� ����
		if( iWarnCnt > iStopCnt ) {
			iWarnCnt = iWarnCnt - iStopCnt;
		} else {
			iWarnCnt = 0;
		}
		iOkCnt = iTotCnt - iWarnCnt - iInvalidCnt - iStopCnt - iCheckCnt;
		
		
		result.put("sCurrDate", WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd hh:mm"));
		if( maxDateTime.length() > 12 ) {
			result.put("sWorkDate", WebUtils.String2DateTimeFormat(maxDateTime, "yyyyMMddhhmmss", "yyyy-MM-dd hh:mm"));
		} else {
			result.put("sWorkDate", "----");
		}
		
		result.put("iTotalCnt", iTotCnt); // �� ����
		
		result.put("iOkCnt", iOkCnt); // ���� ����
		result.put("iWarnCnt", iWarnCnt); // �溸 ����
		result.put("iInvalidCnt", iInvalidCnt); // ���� �̻� ����
		result.put("iStopCnt", iStopCnt); // � �ߴ� ����
		result.put("iCheckCnt", iCheckCnt); // ������ ����
		
		// ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		result = null;		
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _totalPlantSummaryIn()
	{
		PageRealDao dao = new PageRealDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONArray js;		
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		
		list = dao.selectTotalPlantSummaryInList(_getParamMap());
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();

				js = new JSONArray();
				js.add(WebConst.GetWPName(String.valueOf(item.get("WW_CODE"))));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TB01", (Double) item.get("TB01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PH01", (Double) item.get("PH01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TE01", (Double) item.get("TE01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PN01", (Double) item.get("PN01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "SA01", (Double) item.get("SA01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TO01", (Double) item.get("TO01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "NH01", (Double) item.get("NH01")));
				array.add(js);
			}
		} else {
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� ���� ���� �ʽ��ϴ�.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			array.add(js);
		}
		
		result.put("aaData", array);
		
		// ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		array = null;
		result = null;		
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _totalPlantSummaryOut()
	{
		PageRealDao dao = new PageRealDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONArray js;		
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		
		list = dao.selectTotalPlantSummaryOutList(_getParamMap());
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				js = new JSONArray();
				js.add(WebConst.GetWPName(String.valueOf(item.get("WW_CODE"))));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TB01", (Double) item.get("TB01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PH01", (Double) item.get("PH01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "RC01", (Double) item.get("RC01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TE01", (Double) item.get("TE01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "CD01", (Double) item.get("CD01")));
				array.add(js);
			}
		} else {
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� ���� ���� �ʽ��ϴ�.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			array.add(js);
		}
		
		result.put("aaData", array);
		
		// ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		array = null;
		result = null;		
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _plantSummaryProcess()
	{
		PageRealDao dao = new PageRealDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONArray js;		
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		
		Map<String, Object> params = _getParamMap();
		String pointType;
		String tmp, tmp2;		
		Double val;
		//String fmt;
		
		pointType = String.valueOf(params.get("ANAL_POINT_TYPE"));
		if( pointType.equals("1") ) {params.put("ANAL_POINT_NAME", "�����");}
		else if( pointType.equals("2") ) {params.put("ANAL_POINT_NAME", "������");}
		else if( pointType.equals("3") ) {params.put("ANAL_POINT_NAME", "ħ����");}
		else if( pointType.equals("4") ) {params.put("ANAL_POINT_NAME", "������");}
		else if( pointType.equals("5") ) {params.put("ANAL_POINT_NAME", "�ۼ�");}
		
		String itemKind, curItemKind;
		list = dao.selectPlantSummaryProcessList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			
			itemKind = "";
			while( it.hasNext() ) {
				item = it.next();
				
				js = new JSONArray();
				
				curItemKind = WebUtils.CheckNull(item.get("ITEM_KIND"), "");
				if( itemKind.equals(curItemKind) ) {
					js.add("#rowspan");
				} else {
					if( curItemKind.equals("1") ) {
						js.add("�����׸�");
					} else {
						js.add("��Ÿ�׸�");
					}
				}
				
				js.add(String.valueOf(item.get("FACTORY_NAME")).trim());
				js.add(WebUtils.String2DateTimeFormat(String.valueOf(item.get("ANAL_DATE")), "yyyyMMddhhmmss", "yyyy-MM-dd HH:mm"));
				if( item.get("POINT_REMARK") != null ) {
					tmp = String.valueOf(item.get("POINT_REMARK")).trim();
					if( tmp.length() > 0 ) {
						js.add(tmp + " " + String.valueOf(item.get("ANAL_ITEM_NAME")).trim());
					} else {
						js.add(String.valueOf(item.get("ANAL_ITEM_NAME")).trim());
					}
					
				} else {
					js.add(String.valueOf(item.get("ANAL_ITEM_NAME")).trim());
				}
				js.add(String.valueOf(item.get("ANAL_UNIT")).trim());
				tmp = String.valueOf(item.get("ITEM_CODE")).trim();
				if( item.get("ITEM_VAL") == null ) {
					val = null;
				} else {
					val = Double.valueOf(String.valueOf(item.get("ITEM_VAL")));
				}
				if( tmp.indexOf("FT") == 0 || tmp.indexOf("CD") == 0) {
					tmp2 = String.valueOf(item.get("ITEM_STATUS")).trim();
					if( tmp2.indexOf("B1") == 0 ) {
						js.add("<center>������</center>");
					} else if( tmp2.indexOf("B2") == 0 ) {
						js.add("<center>������</center>");
					} else {
						if( val == null ) {
							js.add("-");
						} else {						
							//js.add(WebUtils.FormatNumber(val, fmt));
							js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), String.valueOf(item.get("ITEM_CODE")), val));
						}
					}
				} else {
					if( val == null ) {
						js.add("-");
					} else {						
						//js.add(WebUtils.FormatNumber(val, fmt));
						js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), String.valueOf(item.get("ITEM_CODE")), val));
					}
					
				}
				js.add(WebConst.GetRemark(
						String.valueOf(item.get("ITEM_STATUS")).trim()
						, Double.valueOf(String.valueOf(item.get("ITEM_VAL")))
						, Double.valueOf(String.valueOf(item.get("LAW_UPPER1")))
						, Double.valueOf(String.valueOf(item.get("LAW_LOWER1")))
						, ServletActionContext.getRequest().getContextPath()
					)
				);
				array.add(js);
				
				itemKind = curItemKind;
			}
		} else {
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� ���� ���� �ʽ��ϴ�.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			array.add(js);
		}		
		
		result.put("aaData", array);
		
		// ������ ���
		_writeJsonResultPage(result);

		// �Ҹ�
		array = null;
		result = null;		
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _plantSummaryEtc()
	{
		PageRealDao dao = new PageRealDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONArray js;		
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		
		Map<String, Object> params = _getParamMap();
		String pointType;
		String tmp, tmp2;
		//String fmt;
		Double val;
		boolean isData = false;
		
		pointType = String.valueOf(params.get("ANAL_POINT_TYPE"));
		if( pointType.equals("1") ) {params.put("ANAL_POINT_NAME", "�����");}
		else if( pointType.equals("2") ) {params.put("ANAL_POINT_NAME", "������");}
		else if( pointType.equals("3") ) {params.put("ANAL_POINT_NAME", "ħ����");}
		else if( pointType.equals("4") ) {params.put("ANAL_POINT_NAME", "������");}
		else if( pointType.equals("5") ) {params.put("ANAL_POINT_NAME", "�ۼ�");}
		
		isData = false;
		list = dao.selectPlantSummaryProcessList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				if( String.valueOf(item.get("ITEM_KIND")).equals("1") == true ) {
					continue;
				}
				
				isData = true;
				
				//fmt = "#,##0.0";				
				
				js = new JSONArray();
				js.add(String.valueOf(item.get("FACTORY_NAME")).trim());
				js.add(WebUtils.String2DateTimeFormat(String.valueOf(item.get("ANAL_DATE")), "yyyyMMddhhmmss", "yyyy-MM-dd HH:mm"));
				if( pointType.equals("1") || pointType.equals("5") ) {
					if( item.get("POINT_REMARK") != null ) {
						tmp = String.valueOf(item.get("POINT_REMARK")).trim();
						if( tmp.length() > 0 ) {
							js.add(tmp + " " + String.valueOf(item.get("ANAL_ITEM_NAME")).trim());
						} else {
							js.add(String.valueOf(item.get("ANAL_ITEM_NAME")).trim());
						}
						
					} else {
						js.add(String.valueOf(item.get("ANAL_ITEM_NAME")).trim());
					}
				} else {
					js.add("");
				}				
				js.add(String.valueOf(item.get("ANAL_UNIT")).trim());
				tmp = String.valueOf(item.get("ITEM_CODE")).trim();
				if( item.get("ITEM_VAL") == null ) {
					val = null;
				} else {
					val = Double.valueOf(String.valueOf(item.get("ITEM_VAL")));
				}
				if( tmp.indexOf("FT") == 0 || tmp.indexOf("CD") == 0) {
					tmp2 = String.valueOf(item.get("ITEM_STATUS")).trim();
					if( tmp2.indexOf("B1") == 0 ) {
						js.add("<center>������</center>");
					} else if( tmp2.indexOf("B2") == 0 ) {
						js.add("<center>������</center>");
					} else {
						if( val == null ) {
							js.add("-");
						} else {		
							js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), String.valueOf(item.get("ITEM_CODE")), val));
							//js.add(WebUtils.FormatNumber(val, fmt));
						}
					}
				} else {
					if( val == null ) {
						js.add("-");
					} else {						
						js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), String.valueOf(item.get("ITEM_CODE")), val));
						//js.add(WebUtils.FormatNumber(val, fmt));
					}
					
				}
				js.add(WebConst.GetRemark(
						String.valueOf(item.get("ITEM_STATUS")).trim()
						, Double.valueOf(String.valueOf(item.get("ITEM_VAL")))
						, Double.valueOf(String.valueOf(item.get("LAW_UPPER1")))
						, Double.valueOf(String.valueOf(item.get("LAW_LOWER1")))
						, ServletActionContext.getRequest().getContextPath()
					)
				);
				array.add(js);
			}
		}
		
		if( isData == false ) {			
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� ���� ���� �ʽ��ϴ�.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			array.add(js);
		}
		
		result.put("isData", isData);
		result.put("aaData", array);
		
		// ������ ���
		_writeJsonResultPage(result);

		// �Ҹ�
		array = null;
		result = null;		
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _plantSummaryProvider()
	{
		CodeDao codeDao = new CodeDao();
		List<Map<String, String>> codeList;
		Iterator<Map<String, String>> codeIt;
		Map<String, String> codeItem;
		List<String> codeArr  = new ArrayList<String>();
		
		PageRealDao dao = new PageRealDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		
		JSONArray js;		
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		
		Map<String, Object> params = _getParamMap();
		String analDate, fromDate, toDate;
		
		// ���� �ڵ� ����Ʈ ���� ����
		params.put("WW_TYPE", "W");
		codeList = codeDao.selectWellWaterPathWWCodeList(params);
		if( codeList != null && codeList.size() > 0 ) {
			codeIt = codeList.iterator();
			while( codeIt.hasNext() ) {
				codeItem = codeIt.next();
				
				codeArr.add(codeItem.get("CODE"));
			}
			
			params.put("ITEM_CODES", codeArr);
			
			System.out.println(params);
		}
		
		// ��¥ ����
		analDate = String.valueOf(params.get("ANAL_DATE"));
		fromDate = WebUtils.String2DateTimeFormat(analDate, "yyyyMMddHHmmss", "yyyyMMdd") + "000000";
		toDate = WebUtils.DateTimeDiff(fromDate, "yyyyMMddHHmmss", "d", 1) + "000000";
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		
		list = dao.selectPlantSummaryProviderList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				js = new JSONArray();
				js.add(WebConst.GetPointFullName(String.valueOf(item.get("POINT_NAME")), String.valueOf(item.get("TYPE_NAME")), "&nbsp;"));
				js.add(WebUtils.String2DateTimeFormat(String.valueOf(item.get("ANAL_DATE")), "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm"));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TB02", (Double) item.get("TB02")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TB01", (Double) item.get("TB01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PH01", (Double) item.get("PH01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "RC01", (Double) item.get("RC01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TE01", (Double) item.get("TE01")));
				js.add(WebConst.FormatStandardValue(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "CD01", (Double) item.get("CD01")));
				array.add(js);
			}
		} else {
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� ���� ���� �ʽ��ϴ�.</center>");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			js.add("#colspan");
			array.add(js);
		}
		
		result.put("aaData", array);
		
		// ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		array = null;
		result = null;		
		codeDao = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _waterSummay()
	{
		PageRealDao dao = new PageRealDao();
		List<Map<String, Object>> list;
		Iterator<Map<String, Object>> it;
		Map<String, Object> item;
		String script;
		String pointCode, pointName;
		String fromDate, toDate;
		String analDate;
		Map<String, Object> params;
		
		params = _getParamMap();
		
		JSONArray js;		
		JSONArray array = new JSONArray();
		JSONObject result = new JSONObject();
		
		analDate = String.valueOf(params.get("ANAL_DATE"));
		fromDate = analDate.substring(0, 8) + "000000";
		toDate = WebUtils.DateTimeDiff(analDate.substring(0, 8), "yyyyMMdd", "d", 1) + "000000";
		
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		
		list = dao.selectWaterSummaryList(params);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				pointCode = String.valueOf(item.get("POINT_CODE"));
				pointName = WebConst.GetPointFullName(String.valueOf(item.get("POINT_NAME")), String.valueOf(item.get("TYPE_NAME")));
				// Link ��ũ��Ʈ
				script = "<a href=\"javascript:fnSelectPoint('" + params.get("WW_CODE") + "', '" + pointCode + "');\" style='color:#0000FF;'>" + pointName + "</a>";
				
				// 12�� �ֱ�
				if( pointCode.equals("211") ) {
					js = new JSONArray();
					
					// ����������� ��� ������ ǥ��
					js.add(script);
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
					
					array.add(js);
				} else {
					if( pointCode.equals("112")
							|| pointCode.equals("121") 
							|| pointCode.equals("122") 
							|| pointCode.equals("123") 
							|| pointCode.equals("132") 
							|| pointCode.equals("141") 
							|| pointCode.equals("143") 
							|| pointCode.equals("151") 
							|| pointCode.equals("161") 
							|| pointCode.equals("162") 
							|| pointCode.equals("174") 
							|| pointCode.equals("183") 
							|| pointCode.equals("193") 
							|| pointCode.equals("195") 
							|| pointCode.equals("204") ) {
						// ���� ����
						js = new JSONArray();
						
						js.add(script);
						js.add(item.get("WW_NAME"));
						
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TB02", (Double) item.get("TB02"), String.valueOf(item.get("STATUS_TB02"))));
						js.add("-");
						js.add("-");
						if( pointCode.equals("132")
								|| pointCode.equals("143") 
								|| pointCode.equals("174") 
								|| pointCode.equals("193") ) {
							js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "RC01", (Double) item.get("RC01"), String.valueOf(item.get("STATUS_RC01"))));
						} else {
							js.add("-");
						}
						js.add("-");
						js.add("-");
						js.add("-");
						js.add("-");
						js.add("-");
						js.add("<center>����</center>");
						
						array.add(js);
						
						// ���� ���
						js = new JSONArray();
						
						js.add("#rowspan");
						js.add("#rowspan");
						
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TB01", (Double) item.get("TB01"), String.valueOf(item.get("STATUS_TB01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PH01", (Double) item.get("PH01"), String.valueOf(item.get("STATUS_PH01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TE01", (Double) item.get("TE01"), String.valueOf(item.get("STATUS_TE01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "RC01", (Double) item.get("RC01"), String.valueOf(item.get("STATUS_RC01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "CD01", (Double) item.get("CD01"), String.valueOf(item.get("STATUS_CD01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "LT01", (Double) item.get("LT01"), String.valueOf(item.get("STATUS_LT01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "LT02", (Double) item.get("LT02"), String.valueOf(item.get("STATUS_LT02"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PT01", (Double) item.get("PT01"), String.valueOf(item.get("STATUS_PH01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "VOC5", (Double) item.get("VOC5"), String.valueOf(item.get("STATUS_VOC5"))));
						js.add("-");
						
						array.add(js);
						
						
					} else {
						js = new JSONArray();
						
						js.add(script);
						js.add(item.get("WW_NAME"));
						
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TB01", (Double) item.get("TB01"), String.valueOf(item.get("STATUS_TB01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PH01", (Double) item.get("PH01"), String.valueOf(item.get("STATUS_PH01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "TE01", (Double) item.get("TE01"), String.valueOf(item.get("STATUS_TE01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "RC01", (Double) item.get("RC01"), String.valueOf(item.get("STATUS_RC01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "CD01", (Double) item.get("CD01"), String.valueOf(item.get("STATUS_CD01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "LT01", (Double) item.get("LT01"), String.valueOf(item.get("STATUS_LT01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "LT02", (Double) item.get("LT02"), String.valueOf(item.get("STATUS_LT02"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "PT01", (Double) item.get("PT01"), String.valueOf(item.get("STATUS_PH01"))));
						js.add(WebConst.CheckStandaradRangeString(WebUtils.CheckNull(item.get("POINT_CODE"), ""), "VOC5", (Double) item.get("VOC5"), String.valueOf(item.get("STATUS_VOC5"))));
						js.add("-");
						
						array.add(js);
					}
				}
			}
		} else {
			js = new JSONArray();
			js.add("<center>�˻��� �����Ͱ� ���� ���� �ʽ��ϴ�.</center>");
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
			array.add(js);
		}		

		result.put("aaData", array);
		
		// ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		array = null;
		result = null;		
		dao = null;
	}
}
