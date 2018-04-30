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
import kr.go.seoul.water.sql.dao.CodeDao;
import kr.go.seoul.water.sql.dao.PageHistoryDao;

public class PageHistoryJsonAction extends BaseActionImp {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1891725786991023531L;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String act;
		
		act = getAct();
		
		// Act�� ���� �б�
		if( act.equals("report.point.item") ) {
			// �����̷����� - ���� - ���������� - (������)
			_reportPointItem();
		} else if( act.equals("report.point.data") ) {
			// �����̷����� - ���� - ���������� - (������)
			_reportPointData();
		} else if( act.equals("report.range.item") ) {
			// �����̷����� - ���� - ���賻 ���������� - (������)
			_reportRangeItem();
		} else if( act.equals("report.range.data") ) {
			// �����̷����� - ���� - ���賻 ���������� - (������)
			_reportRangeData();
		} else if( act.equals("trend.point") ) {
			// �����̷����� - Ʈ���� - ����������
			_trendPoint();
		} else if( act.equals("trend.range") ) {
			// �����̷����� - Ʈ���� - ���賻 ����������
			_trendRange();
		} else if( act.equals("trend.plant") ) {
			// �����̷����� - Ʈ���� - �������Ͱ�
			_trendPlant();
		} else if( act.equals("trend.process") ) {
			// �����̷����� - Ʈ���� - ����ó��������
			_trendProcess();
		} else if( act.equals("trend.provider") ) {
			// �����̷����� - Ʈ���� - ���ް�����
			_trendProvider();
		} else if( act.equals("alert.history.plant") ) {
			// �����̷����� - �溸�̷� - �Ƹ�����������
			_alertHisotryPlant();
		} else if( act.equals("alert.history.water") ) {
			// �����̷����� - �溸�̷� - ���������
			_alertHistoryWater();
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private void _reportPointItem()
	{	
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		Iterator<Map<String, String>> it = null;
		Map<String, String> item = null;
				
		String sPointName, sWWName;
		String sItems, sItemName, sItemUnit;
		String sDataTable;
		boolean isData;		
		
		JSONObject result = new JSONObject();	
		JSONArray arrColumns = new JSONArray();
		
		Map<String, Object> params = null;
		String paramWWType;
		
		params = _getParamMap();
		
		paramWWType = String.valueOf(params.get("WW_TYPE"));
		if( paramWWType.equals("P") ) {
			// ��������
			list = dao.selectPlantPointItemCodeList(params);
		} else {
			// ���������
			list = dao.selectWaterPointItemCodeList(params);
		}
		sPointName = "-";
		sWWName = "-";
		sItems = "";
		sItemName = "-";
		sItemUnit = "-";
		sDataTable = "";
		isData = true;
		if( list != null && list.size() > 0 ) {
			String tmpName, sRowName, sRowUnit;
			
			tmpName = "";
			sRowName = "";
			sRowUnit = "";
			
			it = list.iterator();			
			while(it.hasNext()) {
				item = it.next();
				
				// �ΰ� ����
				sPointName = item.get("POINT_NAME");
				sWWName = item.get("WW_NAME");
				sItemName = item.get("NAME").substring(0, 2);
				sItemUnit = item.get("ITEM_UNIT");
				
				tmpName = String.valueOf(item.get("NAME"));
				if( sPointName.equals("������") ) {
					tmpName = tmpName.replaceAll("Ź��", "");
				}
				
				sRowName += "<th align=center bgcolor=#EFEFEF>";
				sRowName += "<a href=\"javascript:fnSelectItem('" + item.get("CODE") + "');\"><font color=#0000FF>";
				if( paramWWType.equals("W") ) {
					sRowName += tmpName;
				} else {
					if( item.get("REMARK") != null && item.get("REMARK").length() > 0 ) {
						sRowName += item.get("REMARK")+ "<br>" + tmpName;
					} else {
						sRowName += tmpName;
					}
					
				}
				sRowName += "</font></a>";
				sRowName += "</th>";
				sRowUnit += "<th align=center bgcolor=#EFEFEF>" + WebUtils.CheckNull(item.get("ITEM_UNIT"), "-") + "</th>";
				
				{
					JSONObject col = new JSONObject();
					col.put("sClass", "right");
					arrColumns.add(col);
				}
				
				sItems += (sItems.length() > 0 ? "," : "") + item.get("CODE");
			}
			
			{
				JSONObject col = new JSONObject();
				col.put("sClass", "center");
				arrColumns.add(0, col);
			}
			
			if( sPointName.equals("������") ) {
				sDataTable += "<thead>";
				sDataTable += "<tr><th height=25 align=center bgcolor=#EFEFEF>�����ð�</th>"+ sRowName + "</tr>";
				sDataTable += "</thead>";
			} else {
				sDataTable += "<thead>";
				sDataTable += "<tr><th rowspan=2 height=25 align=center bgcolor=#EFEFEF>�����ð�</th>"+ sRowName + "</tr>";
				sDataTable += "<tr>"+ sRowUnit + "</tr>";
				sDataTable += "</thead>";
			}
		} else {
			isData = false;
		}
		
		result.put("isData", isData);
		result.put("sPointName", sPointName);
		result.put("sWWName", sWWName);
		result.put("sItems", sItems);
		result.put("sItemName", sItemName);
		result.put("sItemUnit", sItemUnit);		
		result.put("sDataTable", sDataTable);
		result.put("aoColumns", arrColumns);
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		list = null;
		arrColumns = null;
		result = null;
		dao = null;		
	}
	
	@SuppressWarnings("unchecked")
	private void _reportPointData()
	{
		PageHistoryDao dao = new PageHistoryDao();
		List<Map<String, Object>> list = null;
		String fromDate, toDate;
		String tblName;
		List<String> items = null;
		List<List<String>> reports = null;
		Iterator<List<String>> repIt = null;
		List<String> repData = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String reportType;
		
		params = _getParamMap();
		
		reportType = String.valueOf(params.get("REPORT_TYPE"));
		
		// �˻� ����, ����Ʈ Ÿ��, ���̺�� ����		
		fromDate = "";
		toDate = "";
		tblName = "";

		if( reportType.equals("R")) {
			fromDate = String.valueOf(params.get("FROM_DATE")).substring(0, 8) + "00";
			toDate = String.valueOf(params.get("TO_DATE")).substring(0, 8) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("H")) {
			fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 10) + "0000";
			toDate = (WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH", "H", 1).substring(0, 10)) + "0000";
			tblName = "wb_data_minute_" + String.valueOf(params.get("WW_CODE"));
		} else if( reportType.equals("D")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "00";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("M")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 6)) + "01";
			toDate = (WebUtils.LastDayOfMonth(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH").substring(0, 8));
			tblName = "wb_data_day";
		} else if( reportType.equals("Y")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "01";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "12";
			tblName = "wb_data_month";
		}		
		
		// �˻��� ������ ����Ʈ ����
		items = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			while(st.hasMoreTokens()) {
				items.add(st.nextToken().trim());
			}
		}
		
		// ���� �˻� ������ ����
		params.put("TBL_NAME", tblName);
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		params.put("ITEM_CODES", items);
		
		list = dao.selectReportPointDataList(params);
		reports = WebConst.MakeReportData(WebUtils.CheckNull(params.get("POINT_CODE"), ""), reportType, fromDate, toDate, items, list);
		
		repIt = reports.iterator();
		while( repIt.hasNext() ) {
			repData = repIt.next();
			
			JSONArray js2;
			js2 = new JSONArray();
			for( int i = 0; i < repData.size(); i ++ ) {
				js2.add( repData.get(i) );
			}
			arrData.add(js2);
		}
		
		// �ִ�, �ּ�, ��� ���ϱ�
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> data = null;
		
		double[] aMin = new double[items.size()];
		double[] aMax = new double[items.size()];
		double[] aSum = new double[items.size()];
		int[] aCnt = new int[items.size()];
		double dValue;
		
		for(int iLoop = 0; iLoop < items.size(); iLoop ++) {
			it = list.iterator();
			while( it.hasNext() ) {
				data = it.next();
				
				if( data.get(items.get(iLoop)) != null ) {
					dValue = WebUtils.String2Double(WebUtils.CheckNull(data.get(items.get(iLoop)), ""));
					
					// �ּҰ� ���ϱ�
					if( aCnt[iLoop] == 0 ) {
						aMin[iLoop] = dValue;
					} else {
						aMin[iLoop] = (dValue < aMin[iLoop] ? dValue : aMin[iLoop]);
					}
					
					// �ִ밪 ���ϱ�
					if( aCnt[iLoop] == 0 ) {
						aMax[iLoop] = dValue;
					} else {
						aMax[iLoop] = (dValue > aMax[iLoop] ? dValue : aMax[iLoop]);
					}
					
					// �հ� ���ϱ�
					if( aCnt[iLoop] == 0 ) {
						aSum[iLoop] = dValue;
						aCnt[iLoop] = 1;
					} else {
						aSum[iLoop] += dValue;
						aCnt[iLoop] += 1;
					}
				}
			}
		}
		
		JSONArray js;
		
		// �ִ밪 ���		
		js = new JSONArray();
		js.add("�ִ밪");
		for(int iLoop = 0; iLoop < items.size(); iLoop ++) {
			if( aCnt[iLoop] != 0) {
				js.add( WebConst.FormatStandardValue((String) params.get("POINT_CODE"), items.get(iLoop), aMax[iLoop]));
			} else {
				js.add("-");
			}
		}
		arrData.add(js);
		
		// �ּҰ� ���		
		js = new JSONArray();
		js.add("�ּҰ�");
		for(int iLoop = 0; iLoop < items.size(); iLoop ++) {
			if( aCnt[iLoop] != 0) {
				js.add( WebConst.FormatStandardValue((String) params.get("POINT_CODE"), items.get(iLoop), aMin[iLoop]));
			} else {
				js.add("-");
			}
		}
		arrData.add(js);
		
		// ��հ� ���
		js = new JSONArray();
		js.add("��հ�");
		for(int iLoop = 0; iLoop < items.size(); iLoop ++) {
			if( aCnt[iLoop] != 0) {
				js.add( WebConst.FormatStandardValue((String) params.get("POINT_CODE"), items.get(iLoop), aSum[iLoop] / aCnt[iLoop]));
			} else {
				js.add("-");
			}
		}
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
	private void _reportRangeItem()
	{
		CodeDao dao = new CodeDao();
		List<Map<String, String>> list = null;
		Iterator<Map<String, String>> it = null;		
		Map<String, String> item = null;
		
		List<String> pointCodes = null;		
		String pointCode;
				
		String sDataTable;
		String sPointCodes;
		boolean isData;		
		
		JSONObject result = new JSONObject();	
		JSONArray arrColumns = new JSONArray();
		
		Map<String, Object> params = null;		
		params = _getParamMap();
		
		// �˻��� ������ ����Ʈ ����
		pointCodes = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			while(st.hasMoreTokens()) {
				pointCodes.add(st.nextToken().trim());
			}
		}
		
		// �ڵ� ����Ʈ ���� ����
		list = dao.selectPlantWaterPathPointCodeList(params);
		
		sDataTable = "";
		sPointCodes = "";
		isData = true;
		if( list != null && list.size() > 0 ) {
			String sTmp;
			String sRowName, sRowItem;
			
			sRowName = "";
			sRowItem = "";
			
			// Ÿ��Ʋ �߰�
			{
				sRowName += "<th height=25 align=center bgcolor=#EFEFEF width=100px>�������</th>";
				sRowItem += "<th height=25 align=center bgcolor=#EFEFEF>�����׸�</th>";
				
				JSONObject col = new JSONObject();
				col.put("sClass", "center");
				arrColumns.add(0, col);
			}
			
			// �ش� ���������� �������� �ڵ� �߰�
			sTmp = WebUtils.CheckNull((params.get("WW_CODE")), "");
			if( sTmp.length() > 0 ) {
				pointCode = WebConst.GetPCodeToPointCode(sTmp);
				sRowName += "<th colspan=3 align=center bgcolor=#EFEFEF width=240px>";
				sRowName += WebConst.GetWPShortName(sTmp) + "(��)<br>�ۼ�";
				sRowName += "</th>";
				
				sRowItem += "<th align=center bgcolor=#EFEFEF width=80px>Ź��</th>";
				sRowItem += "<th align=center bgcolor=#EFEFEF width=80px>�ܷ�<br>����</th>";
				sRowItem += "<th align=center bgcolor=#EFEFEF width=80px>����<br>������</th>";
				
				for(int i = 0; i < 3; i ++)
				{
					JSONObject col = new JSONObject();
					col.put("sClass", "right");
					arrColumns.add(col);
				}
				
				sPointCodes += pointCode;
			}
			
			// �ش� ���������� ���賻 �������� �ڵ� �߰�
			for(int loop = 0; loop < pointCodes.size(); loop ++) 
			{
				pointCode = pointCodes.get(loop);
				
				it = list.iterator();
				while(it.hasNext()) {
					item = it.next();				
					
					if( pointCode.equals(item.get("CODE")) ) {
						sRowName += "<th colspan=3 align=center bgcolor=#EFEFEF width=240px>";
						sRowName += WebConst.GetPointFullName(String.valueOf(item.get("NAME")), String.valueOf(item.get("TYPE_NAME")));
						sRowName += "</th>";
						
						sRowItem += "<th align=center bgcolor=#EFEFEF width=80px>Ź��</th>";
						sRowItem += "<th align=center bgcolor=#EFEFEF width=80px>�ܷ�<br>����</th>";
						sRowItem += "<th align=center bgcolor=#EFEFEF width=80px>����<br>������</th>";
						
						for(int i = 0; i < 3; i ++)
						{
							JSONObject col = new JSONObject();
							col.put("sClass", "right");
							arrColumns.add(col);
						}
						
						sPointCodes += (sPointCodes.length() > 0 ? "," : "") + pointCode;
						
						break;
					}
				}
			}
			
			sDataTable += "<thead>";
			sDataTable += "<tr>"+ sRowName + "</tr>";
			sDataTable += "<tr>"+ sRowItem + "</tr>";
			sDataTable += "</thead>";
			sDataTable += "<tbody>";
			sDataTable += "<tr><td colspan=" + String.valueOf((pointCodes.size() +  1) * 3) + " height=50></td></tr>";
			sDataTable += "</tbody";
			
			int iPagePerTotal;
			double dTotalWidth;
			
			dTotalWidth = 100 + (80 * 3) * (pointCodes.size() +  1);
			iPagePerTotal = (int) (dTotalWidth < WebConst.WEB_PAGE_MAX_WIDTH ? 100 : (dTotalWidth / WebConst.WEB_PAGE_MAX_WIDTH * 100.0) );
			
			result.put("sPointCodes", sPointCodes);
			result.put("sPagePerTotal", String.valueOf(iPagePerTotal) + "%");
			result.put("sDataTable", sDataTable);
			result.put("aoColumns", arrColumns);
		} else {
			isData = false;
		}
		
		result.put("isData", isData);
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		list = null;
		arrColumns = null;
		result = null;
		dao = null;		
	}
	
	@SuppressWarnings("unchecked")
	private void _reportRangeData()
	{
		CodeDao codeData = new CodeDao();
		PageHistoryDao dao = new PageHistoryDao();
		List<Map<String, Object>> list = null;
		String fromDate, toDate;
		String tblName;
		String pointCode;
		List<String> pointCodes = null;
		List<String> pointItems = null;
		List<String> pointNames = null;
		List<String[]> tableNames = null;
		List<List<String>> reports = null;
		Iterator<List<String>> repIt = null;
		List<String> repData = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String reportType;
		
		params = _getParamMap();
		
		reportType = String.valueOf(params.get("REPORT_TYPE"));
		
		// �˻� ����, ����Ʈ Ÿ��, ���̺�� ����		
		fromDate = "";
		toDate = "";
		tblName = "";

		if( reportType.equals("R")) {
			fromDate = String.valueOf(params.get("FROM_DATE")).substring(0, 8) + "00";
			toDate = String.valueOf(params.get("TO_DATE")).substring(0, 8) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("H")) {
			fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 10) + "0000";
			toDate = (WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH", "H", 1).substring(0, 10)) + "0000";
			tblName = "wb_data_minute_" + String.valueOf(params.get("WW_CODE"));
		} else if( reportType.equals("D")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "00";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("M")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 6)) + "01";
			toDate = (WebUtils.LastDayOfMonth(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH").substring(0, 8));
			tblName = "wb_data_day";
		} else if( reportType.equals("Y")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "01";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "12";
			tblName = "wb_data_month";
		}		
		
		// �˻��� ������ ����Ʈ ����
		tableNames = null;		
		pointCodes = new ArrayList<String>();
		pointItems = new ArrayList<String>();
		pointNames = new ArrayList<String>();
		if( reportType.equals("H") )
		{	
			tableNames = new ArrayList<String[]>();
			
			String[] tblNames;
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			while(st.hasMoreTokens()) {
				pointCode = st.nextToken().trim();
				
				pointCodes.add(pointCode);
				
				tblNames = new String[2];
				tblNames[0] = pointCode;
				tblNames[1] = codeData.selectOneWWCodeByPointCode(pointCode);
				
				tableNames.add(tblNames);
				
				pointNames.add("TB01_" + pointCode);
				pointNames.add("RC01_" + pointCode);
				pointNames.add("CD01_" + pointCode);
			}
			
			pointItems.add("TB01");
			pointItems.add("RC01");
			pointItems.add("CD01");			
		} else {
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			while(st.hasMoreTokens()) {
				pointCode = st.nextToken().trim();
				
				pointCodes.add(pointCode);
				
				pointNames.add("TB01_" + pointCode);
				pointNames.add("RC01_" + pointCode);
				pointNames.add("CD01_" + pointCode);
			}
			
			pointItems.add("TB01");
			pointItems.add("RC01");
			pointItems.add("CD01");
		}
		
		// ���� �˻� ������ ����		
		params.put("TBL_NAMES", tableNames);
		params.put("TBL_NAME", tblName);
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		params.put("POINT_CODES", pointCodes);
		params.put("ITEM_CODES", pointItems);
		
		list = dao.selectReportRangeDataList(params);
		reports = WebConst.MakeReportData(WebUtils.CheckNull(params.get("POINT_CODE"), ""), reportType, fromDate, toDate, pointNames, list);
		
		repIt = reports.iterator();
		while( repIt.hasNext() ) {
			repData = repIt.next();
			
			JSONArray js2;
			js2 = new JSONArray();
			for( int i = 0; i < repData.size(); i ++ ) {
				js2.add( repData.get(i) );
			}
			arrData.add(js2);
		}
		
		result.put("aaData", arrData);
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		list = null;
		arrData = null;
		result = null;
		dao = null;
		codeData = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _trendPoint()
	{
		PageHistoryDao dao = new PageHistoryDao();
		List<Map<String, Object>> list = null;
		String fromDate, toDate;
		String tblName;
		List<String> items = null;
		List<List<String>> reports = null;		
		
		Map<String, Object> params = null;
		String reportType;
		
		params = _getParamMap();
		
		reportType = String.valueOf(params.get("REPORT_TYPE"));
		
		// �˻� ����, ����Ʈ Ÿ��, ���̺�� ����		
		fromDate = "";
		toDate = "";
		tblName = "";

		if( reportType.equals("R")) {
			fromDate = String.valueOf(params.get("FROM_DATE")).substring(0, 8) + "00";
			toDate = String.valueOf(params.get("TO_DATE")).substring(0, 8) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("H")) {
			fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 10) + "0000";
			toDate = (WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH", "H", 1).substring(0, 10)) + "0000";
			tblName = "wb_data_minute_" + String.valueOf(params.get("WW_CODE"));
		} else if( reportType.equals("D")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "00";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("M")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 6)) + "01";
			toDate = (WebUtils.LastDayOfMonth(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH").substring(0, 8));
			tblName = "wb_data_day";
		} else if( reportType.equals("Y")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "01";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "12";
			tblName = "wb_data_month";
		}
		
		// �˻��� ������ ����Ʈ ����
		items = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			while(st.hasMoreTokens()) {
				items.add(st.nextToken().trim());
			}
		}
		
		// ���� �˻� ������ ����
		params.put("TBL_NAME", tblName);
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		params.put("ITEM_CODES", items);
		
		list = dao.selectTrendPointDataList(params);
		reports = WebConst.MakeReportData(WebUtils.CheckNull(params.get("POINT_CODE"), ""), reportType, fromDate, toDate, items, list);
		
		// íƮ �����
		Iterator<List<String>> repIt = null;
		List<String> repData = null;
		
		CodeDao codeDao = null;
		List<Map<String, String>> codeList = null;
		Iterator<Map<String, String>> codeIt = null;
		Map<String, String> codeData = null;
		Map<String, String> codeMap = null;
		
		JSONArray arrData = null;
		JSONArray jsArr = null;
		JSONObject jsObj = null;
		JSONObject result = new JSONObject();
		
		boolean dMinMaxCheck;
		double dTmp, dMin, dMax;
		
		dMinMaxCheck = false;
		dMin = 0.0;
		dMax = 0.0;
		
		// X-ticks ������ �����
		arrData = new JSONArray();
		repIt = reports.iterator();
		while( repIt.hasNext() ) {
			repData = repIt.next();
			arrData.add(repData.get(0));
		}
		result.put("aTicks", arrData);
		
		// ���� ������ �����
		arrData = new JSONArray();
		for(int i = 0; i < items.size(); i ++) {
			repIt = reports.iterator();
			jsArr = new JSONArray();
			while( repIt.hasNext() ) {
				repData = repIt.next();
				if( repData.get(i + 1).equals("-") ) {
					jsArr.add(null);
				} else {
					dTmp = Double.valueOf(repData.get(i + 1).replaceAll(",", ""));
					
					if( dMinMaxCheck == false ) {
						dMinMaxCheck = true;
						
						dMax = dTmp;
						dMin = dTmp;
					} else {
						dMax = (dTmp > dMax ? dTmp : dMax);
						dMin = (dTmp < dMin ? dTmp : dMin);
					}					
					jsArr.add(dTmp);
				}
			}
			arrData.add(jsArr);
		}
		result.put("aaData", arrData);
		
		// Serials �ֱ�
		codeDao = new CodeDao();
		codeList = codeDao.selectItemCodeList(null);
		codeIt = codeList.iterator();
		codeMap = new HashMap<String, String>();
				
		
		String tmpStr;
		while(codeIt.hasNext()) {
			codeData = codeIt.next();
			
			tmpStr = codeData.get("ITEM_UNIT");
			codeMap.put(codeData.get("CODE"), codeData.get("NAME") + (tmpStr != null && tmpStr.length() > 0 ? " (" + tmpStr + ")" : ""));
		}
		
		arrData = new JSONArray();
		for(int i = 0; i < items.size(); i ++) {
			jsObj = new JSONObject();
			
			tmpStr = codeMap.get(items.get(i));
			if( tmpStr != null ) {
				jsObj.put("label", tmpStr);
			} else {
				jsObj.put("label", "undefined");
			}
			arrData.add(jsObj);
		}
		result.put("aSeries", arrData);
		
		// �ִ� / �ּ� ������ ���ϱ�
		if( dMinMaxCheck == true ) {
			dMax += ((dMax - dMin) / 2.0);
			dMin -= ((dMax - dMin) / 2.0);
			if( dMax == dMin ) {
				dMax += 1;
				dMin -= 1;
			}
		} else {
			dMax = 1;
			dMin = 0;
		}
		
		result.put("dMin", dMin);
		result.put("dMax", dMax);
		
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		codeMap = null;
		codeList = null;
		codeDao = null;
		
		items = null;
		list = null;		
		arrData = null;
		reports = null;
		jsArr = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _trendRange()
	{
		CodeDao codeDao = new CodeDao();
		PageHistoryDao dao = new PageHistoryDao();
		List<Map<String, Object>> list = null;
		
		String fromDate, toDate;
		String tblName;
		String searchCode;
		List<String[]> searchTables = null;
		List<String> searchCodes = null;		
		List<String> searchItems = null;
		List<String> searchNames = null;
		List<List<String>> reports = null;
		Iterator<List<String>> repIt = null;
		List<String> repData = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String reportType;
		
		params = _getParamMap();
		
		reportType = String.valueOf(params.get("REPORT_TYPE"));
		
		// �˻� ����, ����Ʈ Ÿ��, ���̺�� ����		
		fromDate = "";
		toDate = "";
		tblName = "";

		if( reportType.equals("R")) {
			fromDate = String.valueOf(params.get("FROM_DATE")).substring(0, 8) + "00";
			toDate = String.valueOf(params.get("TO_DATE")).substring(0, 8) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("H")) {
			fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 10) + "0000";
			toDate = (WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH", "H", 1).substring(0, 10)) + "0000";
			tblName = "wb_data_minute_" + String.valueOf(params.get("WW_CODE"));
		} else if( reportType.equals("D")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "00";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("M")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 6)) + "01";
			toDate = (WebUtils.LastDayOfMonth(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH").substring(0, 8));
			tblName = "wb_data_day";
		} else if( reportType.equals("Y")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "01";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "12";
			tblName = "wb_data_month";
		}	
		
		// �˻��� ������ ����Ʈ ����
		searchCodes = new ArrayList<String>();
		searchItems = new ArrayList<String>();
		searchNames = new ArrayList<String>();
		
		if( reportType.equals("H") )
		{
			searchTables = new ArrayList<String[]>();
			
			String[] tblNames;
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			
			while(st.hasMoreTokens()) {				
				searchCode = st.nextToken().trim();								
				searchCodes.add(searchCode);
				
				tblNames = new String[2];
				tblNames[0] = searchCode;
				tblNames[1] = codeDao.selectOneWWCodeByPointCode(searchCode);
				searchTables.add(tblNames);
				
				searchNames.add(String.valueOf(params.get("ANAL_ITEM")) + "_" + searchCode);
			}
			
			searchItems.add(String.valueOf(params.get("ANAL_ITEM")));
		} else {
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			while(st.hasMoreTokens()) {
				searchCode = st.nextToken().trim();
				
				searchCodes.add(searchCode);
				searchNames.add(String.valueOf(params.get("ANAL_ITEM")) + "_" + searchCode);
			}
			
			searchItems.add(String.valueOf(params.get("ANAL_ITEM")));
		}	
		
		// ���� �˻� ������ ����
		params.put("TBL_NAMES", searchTables);
		params.put("TBL_NAME", tblName);
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		params.put("POINT_CODES", searchCodes);
		params.put("POINT_ITEMS", searchItems);
		
		list = dao.selectTrendRangeDataList(params);
		reports = WebConst.MakeReportData(WebUtils.CheckNull(params.get("POINT_CODE"), ""), reportType, fromDate, toDate, searchNames, list);
		
		// íƮ �����		
		List<Map<String, String>> codeList = null;
		Iterator<Map<String, String>> codeIt = null;
		Map<String, String> codeData = null;
		Map<String, String> codeMap = null;
		int i;
		String tmpStr;		
		
		JSONObject jsObj = null;
		JSONArray jsArr = null;
		
		boolean dMinMaxCheck;
		double dTmp, dMin, dMax;
		
		dMinMaxCheck = false;
		dMin = 0.0;
		dMax = 0.0;
		
		// X-ticks ������ �����
		arrData = new JSONArray();
		repIt = reports.iterator();		
		while( repIt.hasNext() ) {
			repData = repIt.next();
			arrData.add(repData.get(0));
		}
		result.put("aTicks", arrData);
		
		// ���� ������ �����
		arrData = new JSONArray();
		for( i = 0; i < searchCodes.size(); i ++) {
			repIt = reports.iterator();
			jsArr = new JSONArray();
			while( repIt.hasNext() ) {
				repData = repIt.next();
				if( repData.get(i + 1).equals("-") ) {
					jsArr.add(null);
				} else {
					dTmp = Double.valueOf(repData.get(i + 1).replaceAll(",", ""));
					
					if( dMinMaxCheck == false ) {
						dMinMaxCheck = true;
						
						dMax = dTmp;
						dMin = dTmp;
					} else {
						dMax = (dTmp > dMax ? dTmp : dMax);
						dMin = (dTmp < dMin ? dTmp : dMin);
					}					
					jsArr.add(dTmp);
				}
			}
			arrData.add(jsArr);
		}		
		result.put("aaData", arrData);
		
		// Serials �ֱ�
		codeMap = new HashMap<String, String>();
		codeList = codeDao.selectPlantWaterPathPointCodeList(params);
		codeIt = codeList.iterator();		
		while(codeIt.hasNext()) {
			codeData = codeIt.next();
			codeMap.put(codeData.get("CODE"), codeData.get("NAME"));
		}
		
		arrData = new JSONArray();
		for( i = 0; i < searchCodes.size(); i ++) {
			jsObj = new JSONObject();
			
			tmpStr = codeMap.get(searchCodes.get(i));
			if( tmpStr != null ) {
				jsObj.put("label", tmpStr);
			} else {
				jsObj.put("label", "undefined");
			}
			arrData.add(jsObj);
		}
		result.put("aSeries", arrData);
		
		// �ִ� / �ּ� ������ ���ϱ�
		if( dMinMaxCheck == true ) {
			dMax += ((dMax - dMin) / 2.0);
			dMin -= ((dMax - dMin) / 2.0);
			if( dMax == dMin ) {
				dMax += 1;
				dMin -= 1;
			}
		} else {
			dMax = 1;
			dMin = 0;
		}
		
		result.put("dMin", dMin);
		result.put("dMax", dMax);
			
		// JSON ������ ���
		_writeJsonResultPage(result);	
		
		// �Ҹ�
		codeMap = null;
		codeList = null;
		codeDao = null;
		
		searchNames = null;
		searchItems = null;
		searchCodes = null;
		reports = null;
		list = null;		
		arrData = null;
		reports = null;
		jsArr = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _trendPlant()
	{
		PageHistoryDao dao = new PageHistoryDao();
		List<Map<String, Object>> list = null;
		
		String fromDate, toDate;
		String tblName;
		String searchCode;
		List<String> searchCodes = null;		
		List<String> searchNames = null;
		List<List<String>> reports = null;
		Iterator<List<String>> repIt = null;
		List<String> repData = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String reportType;
		
		params = _getParamMap();
		
		reportType = String.valueOf(params.get("REPORT_TYPE"));
		
		// �˻� ����, ����Ʈ Ÿ��, ���̺�� ����		
		fromDate = "";
		toDate = "";
		tblName = "";

		if( reportType.equals("R")) {
			fromDate = String.valueOf(params.get("FROM_DATE")).substring(0, 8) + "00";
			toDate = String.valueOf(params.get("TO_DATE")).substring(0, 8) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("H")) {
			fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 10) + "0000";
			toDate = (WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH", "H", 1).substring(0, 10)) + "0000";
			tblName = "wb_data_minute_" + String.valueOf(params.get("WW_CODE"));
		} else if( reportType.equals("D")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "00";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("M")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 6)) + "01";
			toDate = (WebUtils.LastDayOfMonth(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH").substring(0, 8));
			tblName = "wb_data_day";
		} else if( reportType.equals("Y")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "01";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "12";
			tblName = "wb_data_month";
		}	
		
		// �˻��� ������ ����Ʈ ����
		searchCodes = new ArrayList<String>();
		searchNames = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			while(st.hasMoreTokens()) {
				searchCode = st.nextToken().trim();
				
				searchCodes.add(searchCode);
				searchNames.add(String.valueOf(params.get("ANAL_ITEM")) + "_" + searchCode);
			}
		}	
		
		// ���� �˻� ������ ����
		params.put("TBL_NAME", tblName);
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		params.put("WW_CODES", searchCodes);
		
		if( reportType.equals("H") ) {
			list = dao.selectTrendPlantHourDataList(params);
		} else {
			list = dao.selectTrendPlantDataList(params);
		}
		reports = WebConst.MakeReportData(WebUtils.CheckNull(params.get("POINT_CODE"), ""), reportType, fromDate, toDate, searchNames, list);
		
		// íƮ �����
		CodeDao codeDao = new CodeDao();
		List<Map<String, String>> codeList = null;
		Iterator<Map<String, String>> codeIt = null;
		Map<String, String> codeData = null;
		Map<String, String> codeMap = null;
		int i;
		String tmpStr;		
		
		JSONObject jsObj = null;
		JSONArray jsArr = null;
		
		boolean dMinMaxCheck;
		double dTmp, dMin, dMax;
		
		dMinMaxCheck = false;
		dMin = 0.0;
		dMax = 0.0;
		
		// X-ticks ������ �����
		arrData = new JSONArray();
		repIt = reports.iterator();		
		while( repIt.hasNext() ) {
			repData = repIt.next();
			arrData.add(repData.get(0));
		}
		result.put("aTicks", arrData);
		
		// ���� ������ �����
		arrData = new JSONArray();
		for( i = 0; i < searchCodes.size(); i ++) {
			repIt = reports.iterator();
			jsArr = new JSONArray();
			while( repIt.hasNext() ) {
				repData = repIt.next();
				if( repData.get(i + 1).equals("-") ) {
					jsArr.add(null);
				} else {
					dTmp = Double.valueOf(repData.get(i + 1).replaceAll(",", ""));
					
					if( dMinMaxCheck == false ) {
						dMinMaxCheck = true;
						
						dMax = dTmp;
						dMin = dTmp;
					} else {
						dMax = (dTmp > dMax ? dTmp : dMax);
						dMin = (dTmp < dMin ? dTmp : dMin);
					}					
					jsArr.add(dTmp);
				}
			}
			arrData.add(jsArr);
		}		
		result.put("aaData", arrData);		
		
		// Serials �ֱ�
		params.put("WW_TYPE", "P");
		
		codeMap = new HashMap<String, String>();
		codeList = codeDao.selectWallWaterCodeList(params);
		codeIt = codeList.iterator();		
		while(codeIt.hasNext()) {
			codeData = codeIt.next();
			codeMap.put(codeData.get("CODE"), codeData.get("NAME"));
		}
		
		arrData = new JSONArray();
		for( i = 0; i < searchCodes.size(); i ++) {
			jsObj = new JSONObject();
			
			tmpStr = codeMap.get(searchCodes.get(i));
			if( tmpStr != null ) {
				jsObj.put("label", tmpStr);
			} else {
				jsObj.put("label", "undefined");
			}
			arrData.add(jsObj);
		}
		result.put("aSeries", arrData);
		
		// �ִ� / �ּ� ������ ���ϱ�
		if( dMinMaxCheck == true ) {
			dMax += ((dMax - dMin) / 2.0);
			dMin -= ((dMax - dMin) / 2.0);
			if( dMax == dMin ) {
				dMax += 1;
				dMin -= 1;
			}
		} else {
			dMax = 1;
			dMin = 0;
		}
		
		result.put("dMin", dMin);
		result.put("dMax", dMax);
			
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		codeMap = null;
		codeList = null;
		codeDao = null;
		
		searchNames = null;
		searchCodes = null;
		reports = null;
		list = null;		
		arrData = null;
		reports = null;
		jsArr = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _trendProcess()
	{		
		PageHistoryDao dao = new PageHistoryDao();
		List<Map<String, Object>> list = null;
		
		String fromDate, toDate;
		String tblName;
		String searchCode;
		List<String> searchCodes = null;		
		List<String> searchNames = null;
		List<List<String>> reports = null;
		Iterator<List<String>> repIt = null;
		List<String> repData = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String reportType;
		
		params = _getParamMap();
		
		reportType = String.valueOf(params.get("REPORT_TYPE"));
		
		// �˻� ����, ����Ʈ Ÿ��, ���̺�� ����		
		fromDate = "";
		toDate = "";
		tblName = "";

		if( reportType.equals("R")) {
			fromDate = String.valueOf(params.get("FROM_DATE")).substring(0, 8) + "00";
			toDate = String.valueOf(params.get("TO_DATE")).substring(0, 8) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("H")) {
			fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 10) + "0000";
			toDate = (WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH", "H", 1).substring(0, 10)) + "0000";
			tblName = "wb_data_minute_" + String.valueOf(params.get("WW_CODE"));
		} else if( reportType.equals("D")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "00";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("M")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 6)) + "01";
			toDate = (WebUtils.LastDayOfMonth(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH").substring(0, 8));
			tblName = "wb_data_day";
		} else if( reportType.equals("Y")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "01";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "12";
			tblName = "wb_data_month";
		}	
		
		// �˻��� ������ ����Ʈ ����
		searchCodes = new ArrayList<String>();
		searchNames = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			while(st.hasMoreTokens()) {
				searchCode = st.nextToken().trim();
				
				searchCodes.add(searchCode);
				searchNames.add(String.valueOf(params.get("ANAL_ITEM")) + "_" + searchCode);
			}
		}	
		
		// ���� �˻� ������ ����
		params.put("TBL_NAME", tblName);
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		params.put("POINT_CLASS_CODES", searchCodes);
		
		list = dao.selectTrendProcessDataList(params);
		reports = WebConst.MakeReportData(WebUtils.CheckNull(params.get("POINT_CODE"), ""), reportType, fromDate, toDate, searchNames, list);
		
		// íƮ �����
		CodeDao codeDao = new CodeDao();
		List<Map<String, String>> codeList = null;
		Iterator<Map<String, String>> codeIt = null;
		Map<String, String> codeData = null;
		Map<String, String> codeMap = null;
		int i;
		String tmpStr;		
		
		JSONObject jsObj = null;
		JSONArray jsArr = null;
		
		boolean dMinMaxCheck;
		double dTmp, dMin, dMax;
		
		dMinMaxCheck = false;
		dMin = 0.0;
		dMax = 0.0;
		
		// X-ticks ������ �����
		arrData = new JSONArray();
		repIt = reports.iterator();		
		while( repIt.hasNext() ) {
			repData = repIt.next();
			arrData.add(repData.get(0));
		}
		result.put("aTicks", arrData);
		
		// ���� ������ �����
		arrData = new JSONArray();
		for( i = 0; i < searchCodes.size(); i ++) {
			repIt = reports.iterator();
			jsArr = new JSONArray();
			while( repIt.hasNext() ) {
				repData = repIt.next();
				if( repData.get(i + 1).equals("-") ) {
					jsArr.add(null);
				} else {
					dTmp = Double.valueOf(repData.get(i + 1).replaceAll(",", ""));
					
					if( dMinMaxCheck == false ) {
						dMinMaxCheck = true;
						
						dMax = dTmp;
						dMin = dTmp;
					} else {
						dMax = (dTmp > dMax ? dTmp : dMax);
						dMin = (dTmp < dMin ? dTmp : dMin);
					}					
					jsArr.add(dTmp);
				}
			}
			arrData.add(jsArr);
		}		
		result.put("aaData", arrData);		
		
		// Serials �ֱ�
		codeMap = new HashMap<String, String>();
		codeList = codeDao.selectPlantPointClassCodeList(params);
		codeIt = codeList.iterator();		
		while(codeIt.hasNext()) {
			codeData = codeIt.next();
			codeMap.put(codeData.get("CODE"), codeData.get("NAME"));
		}
		
		arrData = new JSONArray();
		for( i = 0; i < searchCodes.size(); i ++) {
			jsObj = new JSONObject();
			
			tmpStr = codeMap.get(searchCodes.get(i));
			if( tmpStr != null ) {
				jsObj.put("label", tmpStr);
			} else {
				jsObj.put("label", "undefined");
			}
			arrData.add(jsObj);
		}
		result.put("aSeries", arrData);
		
		// �ִ� / �ּ� ������ ���ϱ�
		if( dMinMaxCheck == true ) {
			dMax += ((dMax - dMin) / 2.0);
			dMin -= ((dMax - dMin) / 2.0);
			if( dMax == dMin ) {
				dMax += 1;
				dMin -= 1;
			}
		} else {
			dMax = 1;
			dMin = 0;
		}
		
		result.put("dMin", dMin);
		result.put("dMax", dMax);
			
		// JSON ������ ���
		_writeJsonResultPage(result);
		
		// �Ҹ�
		codeMap = null;
		codeList = null;
		codeDao = null;
		
		searchNames = null;
		searchCodes = null;
		reports = null;
		list = null;		
		arrData = null;
		reports = null;
		jsArr = null;
		result = null;
		dao = null;
	}
	
	@SuppressWarnings("unchecked")
	private void _trendProvider()
	{	
		PageHistoryDao dao = new PageHistoryDao();
		List<Map<String, Object>> list = null;
		
		String fromDate, toDate;
		String tblName;
		String wwCode, pointCode;
		List<String[]> searchCodes = null;		
		List<String> searchNames = null;
		List<List<String>> reports = null;
		Iterator<List<String>> repIt = null;
		List<String> repData = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String reportType;
		
		params = _getParamMap();
		
		reportType = String.valueOf(params.get("REPORT_TYPE"));
		
		// �˻� ����, ����Ʈ Ÿ��, ���̺�� ����		
		fromDate = "";
		toDate = "";
		tblName = "";

		if( reportType.equals("R")) {
			fromDate = String.valueOf(params.get("FROM_DATE")).substring(0, 8) + "00";
			toDate = String.valueOf(params.get("TO_DATE")).substring(0, 8) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("H")) {
			fromDate = String.valueOf(params.get("WORK_DATE")).substring(0, 10) + "0000";
			toDate = (WebUtils.DateTimeDiff(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH", "H", 1).substring(0, 10)) + "0000";
			tblName = "wb_data_minute_" + String.valueOf(params.get("WW_CODE"));
		} else if( reportType.equals("D")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "00";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 8)) + "24";
			tblName = "wb_data_hour";
		} else if( reportType.equals("M")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 6)) + "01";
			toDate = (WebUtils.LastDayOfMonth(String.valueOf(params.get("WORK_DATE")), "yyyyMMddHH").substring(0, 8));
			tblName = "wb_data_day";
		} else if( reportType.equals("Y")) {
			fromDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "01";
			toDate = (String.valueOf(params.get("WORK_DATE")).substring(0, 4)) + "12";
			tblName = "wb_data_month";
		}	
		
		// �˻��� ������ ����Ʈ ����
		searchCodes = new ArrayList<String[]>();
		searchNames = new ArrayList<String>();
		{
			StringTokenizer st = new StringTokenizer(WebUtils.CheckNull((params.get("ITEMS")),""), ",");
			String aData[] = null;
			while(st.hasMoreTokens()) {
				wwCode = st.nextToken().trim();
				pointCode = st.nextToken().trim();
				
				aData = new String[2];
				aData[0] = wwCode;
				aData[1] = pointCode;
				
				searchCodes.add(aData);				
				searchNames.add(String.valueOf(params.get("ANAL_ITEM")) + "_" + wwCode + "_" + pointCode);

			}
		}	
		
		// ���� �˻� ������ ����
		params.put("TBL_NAME", tblName);
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		params.put("WW_POINT_CODES", searchCodes);
		
		if( reportType.equals("H") ) {
			list = dao.selectTrendProviderHourDataList(params);
		} else {
			list = dao.selectTrendProviderDataList(params);
		}
		reports = WebConst.MakeReportData(WebUtils.CheckNull(params.get("POINT_CODE"), ""), reportType, fromDate, toDate, searchNames, list);
		
		// íƮ �����
		int i; 		
		
		JSONObject jsObj = null;
		JSONArray jsArr = null;
		
		boolean dMinMaxCheck;
		double dTmp, dMin, dMax;
		
		dMinMaxCheck = false;
		dMin = 0.0;
		dMax = 0.0;
		
		// X-ticks ������ �����
		arrData = new JSONArray();
		repIt = reports.iterator();		
		while( repIt.hasNext() ) {
			repData = repIt.next();
			arrData.add(repData.get(0));
		}
		result.put("aTicks", arrData);
		
		// ���� ������ �����
		arrData = new JSONArray();
		for( i = 0; i < searchCodes.size(); i ++) {
			repIt = reports.iterator();
			jsArr = new JSONArray();
			while( repIt.hasNext() ) {
				repData = repIt.next();
				if( repData.get(i + 1).equals("-") ) {
					jsArr.add(null);
				} else {
					dTmp = Double.valueOf(repData.get(i + 1).replaceAll(",", ""));
					
					if( dMinMaxCheck == false ) {
						dMinMaxCheck = true;
						
						dMax = dTmp;
						dMin = dTmp;
					} else {
						dMax = (dTmp > dMax ? dTmp : dMax);
						dMin = (dTmp < dMin ? dTmp : dMin);
					}					
					jsArr.add(dTmp);
				}
			}
			arrData.add(jsArr);
		}		
		result.put("aaData", arrData);
		
		// Serials �ֱ�
		arrData = new JSONArray();
		for( i = 0; i < searchCodes.size(); i ++) {
			jsObj = new JSONObject();
			
			jsObj.put("label", "�������� " + String.valueOf(i + 1));
			arrData.add(jsObj);
		}
		result.put("aSeries", arrData);
		
		// �ִ� / �ּ� ������ ���ϱ�
		if( dMinMaxCheck == true ) {
			dMax += ((dMax - dMin) / 2.0);
			dMin -= ((dMax - dMin) / 2.0);
			if( dMax == dMin ) {
				dMax += 1;
				dMin -= 1;
			}
		} else {
			dMax = 1;
			dMin = 0;
		}
		
		result.put("dMin", dMin);
		result.put("dMax", dMax);
			
		// JSON ������ ���
		_writeJsonResultPage(result);		
	}
	
	@SuppressWarnings("unchecked")
	private void _alertHisotryPlant()
	{
		PageHistoryDao dao = new PageHistoryDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String fromDate, toDate;
		
		params = _getParamMap();
		
		// ���� �� �ð� ����
		fromDate = String.valueOf(params.get("FROM_DATE")) + "00";
		toDate = String.valueOf(params.get("TO_DATE")) + "00";
		
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		
		list = dao.selectAlertHistoryPlantDataList(params);
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
				js.add(String.valueOf(item.get("ALARM_TYPE")));
				
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
	private void _alertHistoryWater()
	{
		PageHistoryDao dao = new PageHistoryDao();
		List<Map<String, Object>> list = null;
		Iterator<Map<String, Object>> it = null;
		Map<String, Object> item = null;
		
		JSONObject result = new JSONObject();
		JSONArray arrData = new JSONArray();
		
		Map<String, Object> params = null;
		String fromDate, toDate;
		
		params = _getParamMap();
		
		// ���� �� �ð� ����
		fromDate = String.valueOf(params.get("FROM_DATE")) + "00";
		toDate = String.valueOf(params.get("TO_DATE")) + "00";
		
		params.put("FROM_DATE", fromDate);
		params.put("TO_DATE", toDate);
		
		list = dao.selectAlertHistoryWaterDataList(params);
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
				js.add(String.valueOf(item.get("ALARM_TYPE")));
				
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
