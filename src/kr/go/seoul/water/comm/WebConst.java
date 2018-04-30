package kr.go.seoul.water.comm;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;

public class WebConst {
	// HTML ������ Ÿ��Ʋ
	public static final String WEB_PAGE_TITLE = "Seoul Water Now 4.0";
	
	// ���� ������ ����� ����
	public static final String WEB_SESSION_USER_INFO = "SESSION.USER_INFO";
	
	// ��Ű �ð�
	public static final int WEB_COOKIE_AGE = 60 * 60 * 24 *365; // ��Ű �ð�
	
	// �������� �ִ� ���� ũ��
	public static final int WEB_PAGE_MAX_WIDTH = 1000;
	
	// ��Ű ������ ����� ���̵�
	public static final String WEB_COOKIE_USER_ID = "USER_ID";
	
	// ����Ʈ �������� �ڵ� (���°��)	
	public static final String SWQ_FIRST_PCODE = "PR0055";
	
	// ����Ʈ ��������� �ڵ� (���°��)
	public static final String SWQ_FIRST_WCODE = "WW0001";
	
	// ���� ����
	public static final int AUTH_LAB_MEASURE_VALUE = 5;
	//public static final int AUTH_LAB_MEASURE_VALUE = 0;
	public static final int AUTH_LAB_MEASURE_ITEM = 5;
	
	public static final int AUTH_DATA_SENDING_OFFICE = 3;
	public static final int AUTH_DATA_SENDING_TOTAL = 3;
	
	public static final int AUTH_USER_MANAGER = 9;
	 public static final int AUTH_GROUP_MANAGER = 9;
	public static final int AUTH_WATER_MANAGER = 9;
	
	public static final int AUTH_OFFICE_POINT = 9;
	
	public static final int AUTH_MEASURE_ITEM = 3;
	
	public static final int AUTH_ITEM_SET = 0;
	
	public static final int AUTH_STAUTS_SUB_ADD = 0;
	public static final int AUTH_STAUTS_TOP_ADD = 0;
	
	public static final int AUTH_BASE_LINE_EXEC_PLANT = 0;
	public static final int AUTH_BASE_LINE_EXEC_WATER = 0;
	
	public static final int AUTH_SMS_SEND_LIST = 0;
	
	public static final int AUTH_OPER_RESULT = 5;
	
	// ���� ���� ���� �ڵ�
	public static final String SWQ_FMT[][] = {
		{"TB", "#,##0.00"},
		{"PH", "#,##0.0"},
		{"SA", "#,##0.000"},
		{"NH", "#,##0.00"},
		{"PN", "#,##0.000"},
		{"AR", "#,##0.0"},
		{"TO", "#,##0.00"},
		{"CD", "#,##0"},
		{"TE", "#,##0.0"},
		{"VOC", "#,##0.000"},
		{"JD", "#,##0.0"},
		{"2MIB", "#,##0.0"}
		/*
		{"RC01", "#,##0.00"},
		{"NH01", "#,##0.00"},
		{"LT01", "#,##0.00"},
		{"LT02", "#,##0.00"},
		{"PT01", "#,##0.00"},		
		{"FTR1", "#,##0"}
		*/
	};
	
	// �ּ� �� �ִ밪 ����
	public static final String SWQ_RANGE[][] = {
		{"TB01", String.valueOf(Double.MIN_VALUE), "0.5"},
		{"PH01", "5.8", "8.5"},
		{"RC01", "0.1", "4.0"},
	};	
	
	// �Ƹ��� ���� ���� ����
	private static final String _SWQ_WW_INFO[][] = {
		{"", "", "", "", "", "", "", "", ""}
		, {"PR0055", "���ϾƸ�����������", "��⵵ �ϳ��� ���ϵ� 174����", "�޼ӿ���", "������ �����ȥ������ / ���м�", "��������", "���տ������� (������ --> ������)", "������ ����� / ���� ����", "400,000"}	
		, {"PR0065", "���ǾƸ�����������", "����� ������ ������� 531(���ǵ� ��37)", "�޼ӿ���", "���տ����� / ��������", "����ó��(��������)", "���տ������� (������ --> ������)", "������ ����� / ���� ����", "400,000"}
		, {"PR0183", "�ҵ��Ƹ�����������", "����� ������ ������� 531(���ǵ� ��37)", "�޼ӿ���", "���տ����� / ��������", "����ó��(��������)", "���տ������� (������ --> ������)", "������ ����� / ���� ����", "500,000"}
		, {"PR0407", "�������Ƹ�����������", "����� �������� ��ȭ�� 1����", "�޼ӿ���", "���տ����� / ��������", "����ó��(��������)", "������ ���Ժ�", "������ ����� / ���� ����", "750,000"}
		, {"PR0370", "�ϻ�Ƹ�����������", "����� ������ �Ƹ����� 131(�ϻ�3��)", "�޼ӿ������", "����������� / ��������", "���Ҽҵ� (��������)", "�����, ���������Ժ�", "������, ����������� / ��������", "1,600,000"}
		, {"PR0710", "���ϾƸ�����������", "��⵵ �����ֽ� ���� 171(���е� 397)", "�޼ӿ���", "�������� / ��������", "����ó��(��������)", "������", "������ ����� / ���� ����", "1,000,000"}
	};
	
	public static final String[] GetWWInfo(String wwCode)
	{
		int nFind = -1;
		int nLoop;
		
		for(nLoop = 0; nLoop < WebConst._SWQ_WW_INFO.length; nLoop ++) {
			if( wwCode.equals(WebConst._SWQ_WW_INFO[nLoop][0]) ) {
				nFind = nLoop;
				break;
			}
		}
		
		return (nFind == -1 ? WebConst._SWQ_WW_INFO[0] : WebConst._SWQ_WW_INFO[nFind]);
	}
	
	/**
	 * ������ ���� ������ ����
	 * @param pointCode : �������� �ڵ�
	 * @param id : ������ 
	 * @param value : ��
	 * @return ���ڿ�
	 */
	public static final String FormatStandardValue(String pointCode, String id, Double value)
	{
		String retVal;
		boolean bCheck;
		int nLoop;
		
		if( value == null ) {
			return "-";
		}
		
		retVal = "";
		bCheck = false;
		
		pointCode = pointCode.trim();
		if( id.indexOf("TB") == 0 ) {
			// Ź���� ���� ���� �ڸ��� ���� ���
			if( pointCode.equals("001") 
				|| pointCode.equals("008")
				|| pointCode.equals("016")
				|| pointCode.equals("024")
				|| pointCode.equals("035")
				|| pointCode.equals("041")
				|| pointCode.equals("052")
					) {
				retVal = WebUtils.FormatNumber(value, "#,##0.0");;
				bCheck = true;
			}
		}
		
		if( bCheck == false ) {
			for(nLoop = 0; nLoop < WebConst.SWQ_FMT.length; nLoop ++) {
				if( id.indexOf(WebConst.SWQ_FMT[nLoop][0]) == 0 ) {
					retVal = WebUtils.FormatNumber(value, WebConst.SWQ_FMT[nLoop][1]);
					bCheck = true;
					break;
				}
			}
			
			if( bCheck == false ) {
				if( id.indexOf("CD") == 0 || id.indexOf("FTR") == 0 ) {
					retVal = WebUtils.FormatNumber(value, "#,##0");
				} else {
					retVal = WebUtils.FormatNumber(value, "#,##0.00");
				}
			}
		}
		
		return retVal;
	}
	
	public static final boolean CheckStandardRange(String id, Double value) 
	{
		boolean retVal = false;
		int nLoop;
		
		if( value == null ) {
			return true;
		}
		
		for(nLoop = 0; nLoop < WebConst.SWQ_RANGE.length; nLoop ++) {
			if( id.indexOf(WebConst.SWQ_RANGE[nLoop][0]) == 0 ) {
				if( Double.valueOf(WebConst.SWQ_RANGE[nLoop][1]) <= value && value <= Double.valueOf(WebConst.SWQ_RANGE[nLoop][2]) )
					retVal = true;
				break;
			}
		}
		
		return retVal;
	}
	
	public static final String CheckStandaradRangeString(String pointCode, String id, Double value, String status, String defValue, String preTag, String postTag) {
		String retData = defValue;
		
		// id�� ��� ���� ��� ����
		if( value == null || value < 0 ) {
			if( status.equals("B1") ) {
				retData = preTag + "������" + postTag;
			} else if( status.equals("B2") ) {
				retData = preTag + "������" + postTag;
			}
		} else {
			if( status.equals("B1") ) {
				retData = preTag + "������" + postTag;
			} else if( status.equals("B2") ) {
				retData = preTag + "������" + postTag;
			} else {
				retData = WebConst.FormatStandardValue(pointCode, id, value);
			}
		}
		
		return retData;
	}
	
	public static final String CheckStandaradRangeString(String pointCode, String id, Double value, String status) {
		return WebConst.CheckStandaradRangeString(pointCode, id, value, status, "-", "<cetner>", "</center>");
	}
	
	// ������ ����
	public static final boolean CheckStandardRangeCheck(String status)
	{
		if( status.equals("B1") || status.equals("B2") ) {
			return true;
		}
		
		return false;
	}
	
	public static final String GetWPShortName(String wpCode)
	{
		String retName = "";
		
		if( wpCode.equals("PR0055") )
		{
			retName = "����";
		} else if(wpCode.equals("PR0065")) {
			retName = "����";
		} else if(wpCode.equals("PR0183")) {
			retName = "�ҵ�";
		} else if(wpCode.equals("PR0370")) {
			retName = "�ϻ�";
		} else if(wpCode.equals("PR0407")) {
			retName = "������";		
		} else if(wpCode.equals("PR0710")) {
			retName = "����";
		} else if(wpCode.equals("WW0001")) {
			retName = "�ߺ�";
		} else if(wpCode.equals("WW0002")) {
			retName = "";
		} else if(wpCode.equals("WW0003")) {
			retName = "����";
		} else if(wpCode.equals("WW0004")) {
			retName = "";
		} else if(wpCode.equals("WW0005")) {
			retName = "�Ϻ�";
		} else if(wpCode.equals("WW0006")) {
			retName = "����";
		} else if(wpCode.equals("WW0007")) {
			retName = "����";
		} else if(wpCode.equals("WW0008")) {
			retName = "������";
		} else if(wpCode.equals("WW0009")) {
			retName = "����";
		} else if(wpCode.equals("WW0010")) {
			retName = "����";
		} else if(wpCode.equals("WW0011")) {
			retName = "����";
		}
		
		return retName;
	}
	
	public static final String GetWPName(String wpCode)
	{
		String retName = "";
		
		if( wpCode.equals("PR0055") )
		{
			retName = "����";
		} else if(wpCode.equals("PR0065")) {
			retName = "����";
		} else if(wpCode.equals("PR0183")) {
			retName = "�ҵ�";
		} else if(wpCode.equals("PR0370")) {
			retName = "�ϻ�(1������)";
		} else if(wpCode.equals("PR0407")) {
			retName = "������(3������)";		
		} else if(wpCode.equals("PR0710")) {
			retName = "����";
		} else if(wpCode.equals("WW0001")) {
			retName = "�ߺ�";
		} else if(wpCode.equals("WW0002")) {
			retName = "";
		} else if(wpCode.equals("WW0003")) {
			retName = "����";
		} else if(wpCode.equals("WW0004")) {
			retName = "";
		} else if(wpCode.equals("WW0005")) {
			retName = "�Ϻ�";
		} else if(wpCode.equals("WW0006")) {
			retName = "����";
		} else if(wpCode.equals("WW0007")) {
			retName = "����";
		} else if(wpCode.equals("WW0008")) {
			retName = "������";
		} else if(wpCode.equals("WW0009")) {
			retName = "����";
		} else if(wpCode.equals("WW0010")) {
			retName = "����";
		} else if(wpCode.equals("WW0011")) {
			retName = "����";
		}
		
		return retName;
	}
	
	public static final String GetWPImageURL(String wpCode)
	{
		String retURL = "";
		
		if( wpCode.equals("PR0055") )
		{
			retURL = "images/comm/20081212_swn_btitle02.jpg";
		} else if(wpCode.equals("PR0065")) {
			retURL = "images/comm/20081212_swn_btitle03.jpg";
		} else if(wpCode.equals("PR0183")) {
			retURL = "images/comm/20081212_swn_btitle04.jpg";
		} else if(wpCode.equals("PR0407")) {
			retURL = "images/comm/20081212_swn_btitle05.jpg";
		} else if(wpCode.equals("PR0370")) {
			retURL = "images/comm/20081212_swn_btitle06.jpg";
		} else if(wpCode.equals("PR0710")) {
			retURL = "images/comm/20081212_swn_btitle07.jpg";
			
		} else if(wpCode.equals("WW0001")) {
			retURL = "images/comm/20081212_swn_ctitle01.jpg";
		} else if(wpCode.equals("WW0002")) {
			retURL = "";
		} else if(wpCode.equals("WW0003")) {
			retURL = "images/comm/20081212_swn_ctitle02.jpg";
		} else if(wpCode.equals("WW0004")) {
			retURL = "";
		} else if(wpCode.equals("WW0005")) {
			retURL = "images/comm/20081212_swn_ctitle03.jpg";
		} else if(wpCode.equals("WW0006")) {
			retURL = "images/comm/20081212_swn_ctitle04.jpg";
		} else if(wpCode.equals("WW0007")) {
			retURL = "images/comm/20081212_swn_ctitle05.jpg";
		} else if(wpCode.equals("WW0008")) {
			retURL = "";
		} else if(wpCode.equals("WW0009")) {
			retURL = "images/comm/20081212_swn_ctitle06.jpg";
		} else if(wpCode.equals("WW0010")) {
			retURL = "images/comm/20081212_swn_ctitle07.jpg";
		} else if(wpCode.equals("WW0011")) {
			retURL = "images/comm/20081212_swn_ctitle08.jpg";
		} else {
			retURL = "";
		}
		
		return retURL;
	}
	
	public static final String GetDataSendingWPImageURL(String wpCode)
	{
		String retURL = "";
		
		if( wpCode.equals("PR0055") )
		{
			retURL = "20090506_swn_stitle02.jpg";
		} else if(wpCode.equals("PR0065")) {
			retURL = "20090506_swn_stitle03.jpg";
		} else if(wpCode.equals("PR0183")) {
			retURL = "20090506_swn_stitle04.jpg";
		} else if(wpCode.equals("PR0407")) {
			retURL = "20090506_swn_stitle05.jpg";
		} else if(wpCode.equals("PR0370")) {
			retURL = "20090506_swn_stitle06.jpg";
		} else if(wpCode.equals("PR0710")) {
			retURL = "20090506_swn_stitle07.jpg";
			
		} else if(wpCode.equals("WW0001")) {
			retURL = "20090506_swn_stitle08.jpg";
		} else if(wpCode.equals("WW0002")) {
			retURL = "";
		} else if(wpCode.equals("WW0003")) {
			retURL = "20090506_swn_stitle09.jpg";
		} else if(wpCode.equals("WW0004")) {
			retURL = "";
		} else if(wpCode.equals("WW0005")) {
			retURL = "20090506_swn_stitle10.jpg";
		} else if(wpCode.equals("WW0006")) {
			retURL = "20090506_swn_stitle11.jpg";
		} else if(wpCode.equals("WW0007")) {
			retURL = "20090506_swn_stitle12.jpg";
		} else if(wpCode.equals("WW0008")) {
			retURL = "";
		} else if(wpCode.equals("WW0009")) {
			retURL = "20090506_swn_stitle13.jpg";
		} else if(wpCode.equals("WW0010")) {
			retURL = "20090506_swn_stitle14.jpg";
		} else if(wpCode.equals("WW0011")) {
			retURL = "20090506_swn_stitle15.jpg";
		} else {
			retURL = "";
		}
		
		return retURL;
	}
	
	public static final String GetWPVolume(String pCode)
	{
		String retCode = "0";
		
		if( pCode.equals("PR0055") )
		{
			retCode = "400,000";
		} else if(pCode.equals("PR0065")) {
			retCode = "500,000";
		} else if(pCode.equals("PR0183")) {
			//retCode = "500,000";
			retCode = "700,000";
		} else if(pCode.equals("PR0370")) {
			retCode = "1,600,000";
		} else if(pCode.equals("PR0407")) {
			retCode = "600,000";
		} else if(pCode.equals("PR0710")) {
			retCode = "1,000,000";
		}
		
		return retCode;
	}
	
	public static final String GetPCodeToPointCode(String pCode)
	{
		String retCode = "";
		
		if( pCode.equals("PR0055") )
		{
			retCode = "007";
		} else if(pCode.equals("PR0065")) {
			retCode = "015";
		} else if(pCode.equals("PR0183")) {
			retCode = "028";
		} else if(pCode.equals("PR0370")) {
			retCode = "046";
		} else if(pCode.equals("PR0407")) {
			retCode = "040";
		} else if(pCode.equals("PR0710")) {
			retCode = "057";
		}
		
		return retCode;
	}
	
	public static final String GetPlantProcessCode(String pCode, int processType)
	{
		String retCode = "";
		
		if( pCode.equals("PR0055") )
		{
			if( processType == 1 ) { retCode = "001"; } 
			else if( processType == 2 ) { retCode = "002"; } 
			else if( processType == 3 ) { retCode = "004"; } 
			else if( processType == 4 ) { retCode = "005"; }
			else if( processType == 5 ) { retCode = "007"; }
		} else if(pCode.equals("PR0065")) {
			if( processType == 1 ) { retCode = "070"; } 
			else if( processType == 2 ) { retCode = "009"; } 
			else if( processType == 3 ) { retCode = "012"; } 
			else if( processType == 4 ) { retCode = "021"; }
			else if( processType == 5 ) { retCode = "071"; }
		} else if(pCode.equals("PR0183")) {
			if( processType == 1 ) { retCode = "024"; } 
			else if( processType == 2 ) { retCode = "025"; } 
			else if( processType == 3 ) { retCode = "026"; } 
			else if( processType == 4 ) { retCode = "027"; }
			else if( processType == 5 ) { retCode = "028"; }
		} else if(pCode.equals("PR0370")) {
			if( processType == 1 ) { retCode = "041"; } 
			else if( processType == 2 ) { retCode = "042"; } 
			else if( processType == 3 ) { retCode = "043"; } 
			else if( processType == 4 ) { retCode = "044"; }
			else if( processType == 5 ) { retCode = "046"; }
		} else if(pCode.equals("PR0407")) {
			if( processType == 1 ) { retCode = "035"; } 
			else if( processType == 2 ) { retCode = "036"; } 
			else if( processType == 3 ) { retCode = "037"; } 
			else if( processType == 4 ) { retCode = "038"; }
			else if( processType == 5 ) { retCode = "040"; }
		} else if(pCode.equals("PR0710")) {
			if( processType == 1 ) { retCode = "052"; } 
			else if( processType == 2 ) { retCode = "053"; } 
			else if( processType == 3 ) { retCode = "054"; } 
			else if( processType == 4 ) { retCode = "055"; }
			else if( processType == 5 ) { retCode = "057"; }
		}
		
		return retCode;
	}
	
	public static final String GetPlantProcessCodeImageURL(String pCode)
	{
		String retURL = "";
		
		if( pCode.equals("PR0055") )
		{
			retURL = "images/real/20151130_swn_dmap01.gif";
		} else if(pCode.equals("PR0065")) {
			retURL = "images/real/20151130_swn_dmap02.gif";
		} else if(pCode.equals("PR0183")) {
			retURL = "images/real/20151130_swn_dmap03.gif";
		} else if(pCode.equals("PR0407")) {
			retURL = "images/real/20151130_swn_dmap04.gif";
		} else if(pCode.equals("PR0370")) {
			retURL = "images/real/20151130_swn_dmap05.gif";
		} else if(pCode.equals("PR0710")) {
			retURL = "images/real/20151130_swn_dmap06.gif";
		} else {
			retURL = "";
		}
		
		return retURL;
	}
	
	public static final String GetOperItem(String wpCode)
	{
		String retStr;
		
		retStr = "";
		
		if( wpCode.equals("WW0000") ) {
			retStr = "�������� 200����, ���μ��� ��";
		} else if( wpCode.equals("PR0055") ) {
			retStr = "��� 7�׸�, �ۼ� 5�׸�";
		} else if(wpCode.equals("PR0065")) {
			retStr = "��� 7�׸�, �ۼ� 5�׸�";
		} else if(wpCode.equals("PR0183")) {
			retStr = "��� 7�׸�, 1�ۼ� 2�׸�,<br>2�ۼ� 2�׸�, 3�ۼ� 5�׸�";
		} else if(wpCode.equals("PR0370")) {
			retStr = "��� 7�׸�, 1�ۼ� 5�׸�,<br>2�ۼ� 3�׸�";
		} else if(wpCode.equals("PR0407")) {
			retStr = "��� 7�׸�, 1�ۼ� 5�׸�,<br>2�ۼ� 5�׸�";
		} else if(wpCode.equals("PR0710")) {
			retStr = "��� 7�׸�, �ۼ� 5�׸�";
		} else if(wpCode.equals("WW0001")) {
			retStr = "���ް��� 32���� 34��";
		} else if(wpCode.equals("WW0002")) {
			retStr = "";
		} else if(wpCode.equals("WW0003")) {
			retStr = "���ް��� 21���� 24��";
		} else if(wpCode.equals("WW0004")) {
			retStr = "";
		} else if(wpCode.equals("WW0005")) {
			retStr = "���ް��� 20���� 22��";
		} else if(wpCode.equals("WW0006")) {
			retStr = "���ް��� 30���� 32��";
		} else if(wpCode.equals("WW0007")) {
			retStr = "���ް��� 19���� 22��";
		} else if(wpCode.equals("WW0008")) {
			retStr = "";
		} else if(wpCode.equals("WW0009")) {
			retStr = "���ް��� 33���� 36��";
		} else if(wpCode.equals("WW0010")) {
			retStr = "���ް��� 18���� 22��";
		} else if(wpCode.equals("WW0011")) {
			retStr = "���ް��� 14���� 15��";
		}
		
		return retStr;
	}
	
	public static final String GetPointFullName(String pointName, String typeName)
	{
		return WebConst.GetPointFullName(pointName, typeName, "");
	}
	
	public static final String GetPointFullName(String pointName, String typeName, String sepator)
	{
		String retName = "";
		
		if( typeName.length() > 0 ) {
			retName = pointName.replaceAll("\\(" + typeName.substring(0, 1) + "\\)", "");
		} else {
			retName = pointName;
		}
		
		if( retName.length() > 0 && typeName.length() > 0) {retName += sepator;}
		retName += typeName;
		
		
		return retName;
	}
	
	public static final String GetPointShortFullName(String pointName, String typeName)
	{
		String retName = "";
		
		if( typeName.length() > 0 ) {
			retName = pointName.replaceAll("\\(" + typeName.substring(0, 1) + "\\)", "");
		} else {
			retName = pointName;
		}
		
		if( typeName.length() > 0 ) {
			retName += "(" + typeName.substring(0, 1) + ")";
		}
		
		return retName;
	}
	
	public static final String GetRemark(String status, double value, double upper, double lower, String contextPath)
	{
		String retVal = "";
		if( status.equals("OK") ) {
			if( value > upper || value < lower ) {
				retVal = "<img src='" + contextPath + "/images/comm/bullet_11.gif'>";
			}
		} else {
			if( status.equals("A1")) {
				retVal = "�ܼ��Ǵ� �����������";
			} else if( status.equals("B1")) {
				retVal = "�������, ���� �� ��ô";
			} else if( status.equals("C1")) {
				retVal = "������� ���ۺҷ�";
			} else if( status.equals("D1")) {
				retVal = "������� ���ۿ���";
			} else if( status.equals("D2")) {
				retVal = "����ȸ�� ����̻�";
			} else {
				retVal = "�����;���";
			}
		}
		
		return retVal;
	}
	
	public static final String GetHorse(String sCode)
	{
		String ret = "";
		
		if(sCode.equals("001")) {
			ret = "";
		} else if(sCode.equals("002")) {
			ret = "";
		} else if(sCode.equals("011")) {
			ret = "800<br>750<br>400";
		} else if(sCode.equals("013")) {
			ret = "800<br>750";
		} else if(sCode.equals("014")) {
			ret = "500";	
		} else if(sCode.equals("015")) {
			ret = "950";	
		} else if(sCode.equals("021")) {
			ret = "1,700<br>1,550<br>900";	
		} else if(sCode.equals("022")) {
			ret = "1,550<br>760";
		} else if(sCode.equals("042")) {
			ret = "800<br>576<br>400";
		} else if(sCode.equals("043")) {
			ret = "2,500<br>1,300<br>650";
		} else if(sCode.equals("044")) {
			ret = "1,400<br>700";
		} else if(sCode.equals("031")) {
			ret = "1000<br>700";
		} else if(sCode.equals("032")) {
			ret = "400";	
		} else if(sCode.equals("033")) {
			ret = "1,050<br>550<br>500<br>300";
		} else if(sCode.equals("034")) {
			ret = "1,200<br>600";
		} else if(sCode.equals("051")) {
			ret = "2,400<br>1,200";
		}
		
		return ret;
	}
	
	public static final String GetQty(String sCode)
	{
		String ret = "";
		
		if(sCode.equals("001")) {
			ret = "";
		} else if(sCode.equals("002")) {
			ret = "";
		} else if(sCode.equals( "011")) {
			ret = "6<br>2<br>1";
		} else if(sCode.equals( "013")) {
			ret = "2<br>1";
		} else if(sCode.equals( "014")) {
			ret = "1";
		} else if(sCode.equals( "015")) {
			ret = "4";
		} else if(sCode.equals( "021")) {
			ret = "4<br>1<br>1";
		} else if(sCode.equals( "022")) {
			ret = "3<br>1";
		} else if(sCode.equals( "042")) {
			ret = "5<br>1<br>1";
		} else if(sCode.equals( "043")) {
			ret = "1<br>4<br>1";
		} else if(sCode.equals( "044")) {
			ret = "4<br>1";
		} else if(sCode.equals( "031")) {
			ret = "1<br>5";
		} else if(sCode.equals( "032")) {
			ret = "1";
		} else if(sCode.equals( "033")) {
			ret = "1<br>1<br>2<br>1";
		} else if(sCode.equals( "034")) {
			ret = "4<br>2";
		} else if(sCode.equals( "051")) {
			ret = "2<br>2";
		}
		
		return ret;
	}
	
	public static final int GetHorseCnt(String sCode)
	{
		int ret = 0;
		
		if( sCode.equals("011") ) {
			ret = 3;
		} else if( sCode.equals("013") ) {
			ret = 2;
		} else if( sCode.equals("021") ) {
			ret = 2;
		} else if( sCode.equals("022") ) {
			ret = 2;
		} else if( sCode.equals("031") ) {
			ret = 2;
		} else if( sCode.equals("032") ) {
			ret = 2;
		} else if( sCode.equals("033") ) {
			ret = 2;
		} else if( sCode.equals("042") ) {
			ret = 3;
		} else if( sCode.equals("043") ) {
			ret = 3;
		} else if( sCode.equals("044") ) {
			ret = 2;
		} else if( sCode.equals("051") ) {
			ret = 2;
		}
		
		return ret;
	}
	
	public static final String GetHorseSize(String sCode)
	{
		String ret = "";
		
		if( sCode.equals("001") ) {
			ret = "";
		} else if( sCode.equals("002") ) {
			ret = "";
		} else if(sCode.equals("0111") ) {
			ret = "���¼�:800&nbsp;���:4";			
		} else if(sCode.equals("0112") ) {
			ret = "���¼�:750&nbsp;���:2";			
		} else if(sCode.equals("0113") ) {
			ret = "���¼�:400&nbsp;���:1";			
		} else if(sCode.equals("0131") ) {
			ret = "���¼�:800&nbsp;���:4";			
		} else if(sCode.equals("0132") ) {
			ret = "���¼�:750&nbsp;���:1";			
		} else if(sCode.equals("0141") ) {
			ret = "���¼�:500&nbsp;���:1";			
		} else if(sCode.equals("0151") ) {
			ret = "���¼�:950&nbsp;���:1";			
		} else if(sCode.equals("0211") ) {
			ret = "���¼�:1,700&nbsp;���:4";			
		} else if(sCode.equals("0212") ) {
			ret = "���¼�:900&nbsp;���:1";
		} else if(sCode.equals("0213") ) {
			ret = "���¼�:900&nbsp;���:2";			
		} else if(sCode.equals("0221") ) {
			ret = "���¼�:1,550&nbsp;���:3";		
		} else if(sCode.equals("0222") ) {
			ret = "���¼�:760&nbsp;���:1";		
		} else if(sCode.equals("0311") ) {
			ret = "���¼�:900&nbsp;���:2";		
		} else if(sCode.equals("0312") ) {
			ret = "���¼�:500&nbsp;���:2";		
		} else if(sCode.equals("0321") ) {
			ret = "���¼�:900&nbsp;���:3";		
		} else if(sCode.equals("0322") ) {
			ret = "���¼�:500&nbsp;���:2";		
		} else if(sCode.equals("0331") ) {
			ret = "���¼�:1,200&nbsp;���:4";		
		} else if(sCode.equals("0332") ) {
			ret = "���¼�:600&nbsp;���:2";			
		} else if(sCode.equals("0412") ) {
			ret = "���¼�:800&nbsp;���:5";			
		} else if(sCode.equals("0413") ) {
			ret = "���¼�:576&nbsp;���:1";			
		} else if(sCode.equals("0414") ) {
			ret = "���¼�:400&nbsp;���:1";			
		} else if(sCode.equals("0421") ) {
			ret = "���¼�:800&nbsp;���:5";			
		} else if(sCode.equals("0422") ) {
			ret = "���¼�:576&nbsp;���:1";			
		} else if(sCode.equals("0423") ) {
			ret = "���¼�:400&nbsp;���:1";			
		} else if(sCode.equals("0431") ) {
			ret = "���¼�:2500&nbsp;���:1";			
		} else if(sCode.equals("0432") ) {
			//ret = "���¼�:1,300&nbsp;���:4";			
			ret = "���¼�:1,300&nbsp;���:5";
		} else if(sCode.equals("0433") ) {
			ret = "���¼�:650&nbsp;���:1";			
		} else if(sCode.equals("0441") ) {
			ret = "���¼�:1,400&nbsp;���:4";			
		} else if(sCode.equals("0442") ) {
			ret = "���¼�:700&nbsp;���:1";			
		} else if(sCode.equals("0511") ) {
			ret = "���¼�:2,400&nbsp;���:7";			
		} else if(sCode.equals("0512") ) {
			ret = "���¼�:1,200&nbsp;���:2";			
		} else {
			ret = "";
		}		
		
		return ret;
	}
	
	public static List<List<String>> MakeReportData(String pointCode, String reportType, String fromDate, String toDate, List<String> items, List<Map<String, Object>> list)
	{
		List<List<String>> report = null;
		List<String> item = null;
		Iterator<Map<String, Object>> it;
		Map<String, Object> data = null;
		String loopDate;
		String nextDate;
		String id;
		Double value;
		
		if( list == null ) {
			list = new ArrayList<Map<String, Object>>();
		}
		
		report = new ArrayList<List<String>>();
		
		data = null;
		loopDate = fromDate;
		it = list.iterator();
		if( it.hasNext() ) {
			data = it.next(); 
		}
		
		nextDate = "";
		while(loopDate.compareTo(toDate) <= 0 ) {
			item = new ArrayList<String>();
			
			// ���� Ÿ�Կ� ���� ���� ����
			if( reportType.equals("R") ) {
				// ��¥ ���� �� ��¥ �ֱ�
				nextDate = WebUtils.DateTimeDiff(loopDate, "yyyyMMddHH", "H", 1);				
				item.add(WebUtils.String2DateTimeFormat(loopDate, "yyyyMMddHH", "yyyy-MM-dd HH��"));
			} else if( reportType.equals("H") ) {
				// ��¥ ���� �� ��¥ �ֱ�
				nextDate = WebUtils.DateTimeDiff(loopDate, "yyyyMMddHHmmss", "m", 5);
				item.add(WebUtils.String2DateTimeFormat(loopDate, "yyyyMMddHHmmss", "HH�� mm��"));
			} else if( reportType.equals("D") ) {
				// ��¥ ���� �� ��¥ �ֱ�
				nextDate = WebUtils.DateTimeDiff(loopDate, "yyyyMMddHH", "H", 1);				
				item.add(WebUtils.String2DateTimeFormat(loopDate, "yyyyMMddHH", "HH��"));
			} else if( reportType.equals("M") ) {
				// ��¥ ���� �� ��¥ �ֱ�
				nextDate = WebUtils.DateTimeDiff(loopDate, "yyyyMMdd", "d", 1);
				item.add(WebUtils.String2DateTimeFormat(loopDate, "yyyyMMdd", "dd��"));
			} else if( reportType.equals("Y") ) {
				// ��¥ ���� �� ��¥ �ֱ�
				nextDate = WebUtils.DateTimeDiff(loopDate, "yyyyMM", "M", 1);
				item.add(WebUtils.String2DateTimeFormat(loopDate, "yyyyMM", "yyyy�� MM��"));
			} else {				
				break;
			}
			
			
			if( data != null ) {
				if( loopDate.equals(data.get("ANAL_DATE")) ) {
					for(int i = 0; i < items.size(); i ++ ) {
						id = items.get(i);
						value = (Double) data.get(id);
						if( value == null ) {
							item.add("-");
						} else {
							item.add( WebConst.FormatStandardValue(pointCode, id, value.doubleValue()));
						}
					}
					
					if( it.hasNext() ) {						
						data = it.next();
					} else {
						data = null;
					}
				} else {
					for(int i = 0; i < items.size(); i ++ ) {
						item.add("-");
					}
				}
			} else {
				for(int i = 0; i < items.size(); i ++ ) {
					item.add("-");
				}
			}
			
			report.add(item);
			
			loopDate = nextDate;
		}
		
		return report;
	}
	
	public static String ToCheckWord(String content)
	{
		content = content.replace("&", "&amp;");
		content = content.replace("<", "&lt;");
		content = content.replace(">", "&gt;");
		content = content.replace("'", "&#39;");
		content = content.replace("\n", "<br>");
		
		return content;
	}
	
	public static String ToReCheckWord(String content)
	{
		content = content.replace("&amp;", "&");
		content = content.replace("&lt;", "<");
		content = content.replace("&gt;", ">");
		content = content.replace("&#39;", "'");
		content = content.replace("''", "'");
		content = content.replace("<br>", "\n");
		
		return content;
	}
	
	@SuppressWarnings("unchecked")
	public static final void MakeReportDataRow(JSONArray arrData, String[] labels, List<String> searchCodes, Map<String, Object> data)
	{
		int iLoop, labelIndex;
		Double val;
		String str;
		JSONArray js;
		String preFix, postFix, colFmt, dataFmt;
		String tmp;
		int cnt;
		boolean bCalc;
		
		preFix = labels[0];
		postFix = labels[1];
		colFmt = labels[2];
		dataFmt = labels[3];
		labelIndex = 4;
		
		bCalc = false;
		
		// SUM, AVG ���� ����
		for(iLoop = labelIndex; iLoop < labels.length; iLoop ++) {
			if( labels[iLoop].indexOf("{SUM}") >= 0 || labels[iLoop].indexOf("{AVG}") >= 0 ) {
				bCalc = true;
				break;
			}
		}
		
		// �հ� ���ϱ�
		double sum = 0;		
		
		cnt = 0;
		if( data != null && bCalc) {
			for(iLoop = 0; iLoop < searchCodes.size(); iLoop ++) {				
				//System.out.println("======>" + preFix + searchCodes.get(iLoop) + postFix);
				try {
					val = (Double) data.get(preFix + searchCodes.get(iLoop) + postFix);
				} catch(Exception e) {
					try {
						val = Double.valueOf(String.valueOf(data.get(preFix + searchCodes.get(iLoop) + postFix)));
					} catch(Exception e1) {
						val = 0.0;
					}
				}
				sum += (val == null ? 0 : val);
				cnt += (val == null ? 0 : 1);
			}
		}
		
		int nFind = 0;
		String strT, strItem;
		
		// ���� �ֱ�
		js = new JSONArray();
		for(iLoop = labelIndex; iLoop < labels.length; iLoop ++) {
			nFind = 0;
			if( data != null ) {
				strT = String.valueOf(data.get("WATER_TEXT"));
				strItem = String.valueOf(data.get("ITEM_NAME"));
				if(strT.equals("����") && (strItem.equals("Ź��")|| strItem.equals("pH")|| strItem.equals("�ϸ�ϾƼ�����")))
				{
					nFind = 1;
				}
				if(strT.equals("����") && (strItem.equals("Ź��")|| strItem.equals("pH")|| strItem.equals("�ܷ�����")))
				{
					nFind = 1;
				}
				if(strT.equals("������") && (strItem.equals("������(Synedra)")|| strItem.equals("������(������)")))
				{
					nFind = 1;
				}
			}
			if( labels[iLoop].indexOf("{SUM}") >= 0 ) {
				tmp = labels[iLoop];
				tmp = tmp.replaceAll("\\{SUM\\}", WebUtils.FormatNumber(sum, colFmt));
				if( postFix.equals("_PROD") )
					js.add("<span style='color:blue'>"+tmp+"</span>");
				else if(nFind == 1)
					js.add("<span style='color:blue'>"+tmp+"</span>");
				else
					js.add(tmp);
			} else if( labels[iLoop].indexOf("{AVG}") >= 0 ) {
				tmp = labels[iLoop];
				tmp = tmp.replaceAll("\\{AVG\\}", WebUtils.FormatNumber((cnt == 0 ? 0 : sum / cnt), colFmt));
				if(postFix.equals("_PROD"))
					js.add("<span style='color:blue'>"+tmp+"</span>");
				else if(nFind == 1)
						js.add("<span style='color:blue'>"+tmp+"</span>");
				else
					js.add(tmp);
			} else if( labels[iLoop].equals("") ) {				
				js.add("&nbsp;");
			} else {
				js.add(labels[iLoop]);
			}
		}
		
		// ������ �ֱ�
		for( iLoop = 0; iLoop < searchCodes.size(); iLoop ++ ) {
			nFind =0;
			if( data != null ) {
				strT = String.valueOf(data.get("WATER_TEXT"));
				strItem = String.valueOf(data.get("ITEM_NAME"));
				if(strT.equals("����") && (strItem.equals("Ź��")|| strItem.equals("pH")|| strItem.equals("�ϸ�ϾƼ�����")))
				{
					nFind = 1;
				}
				if(strT.equals("����") && (strItem.equals("Ź��")|| strItem.equals("pH")|| strItem.equals("�ܷ�����")))
				{
					nFind = 1;
				}
				if(strT.equals("������") && (strItem.equals("������(Synedra)")|| strItem.equals("������(������)")))
				{
					nFind = 1;
				}
				if( dataFmt.equals("") ) {
					// ������
					str = String.valueOf(data.get(preFix + searchCodes.get(iLoop) + postFix));
					if( str == null ) {
						if(postFix.equals("_PROD") )
							js.add("<span style='color:blue'><b>"+"-"+"</b></span>");
						else if(nFind == 1)
							js.add("<span style='color:blue'><b>"+"-"+"</b></span>");
						else
							js.add("-");
					} else {
						if(postFix.equals("_PROD"))
							js.add("<span style='color:blue'><b>"+str+"</b></span>");
						else if(nFind == 1)
							js.add("<span style='color:blue'><b>"+str+"</b></span>");
						else
							js.add(str);
					}
				} else {
					// ������
					try {
						val = (Double) data.get(preFix + searchCodes.get(iLoop) + postFix);
					} catch(Exception e) {
						try {
							val = Double.valueOf(String.valueOf(data.get(preFix + searchCodes.get(iLoop) + postFix)));
						} catch(Exception e1) {
							val = 0.0;
						}
					}
					if( val == null ) {
						if(postFix.equals("_PROD"))
							js.add("<span style='color:blue'><b>"+"-"+"</b></span>");
						else if(nFind == 1)
							js.add("<span style='color:blue'><b>"+"-"+"</b></span>");
						else
							js.add("-");
					} else {
						if(postFix.equals("_PROD"))
							js.add("<span style='color:blue'><b>"+WebUtils.FormatNumber(val, dataFmt)+"</b></span>");
						else if(nFind == 1)
							js.add("<span style='color:blue'><b>"+WebUtils.FormatNumber(val, dataFmt)+"</b></span>");
						else
							js.add(WebUtils.FormatNumber(val, dataFmt));
					}
				}
			} else {
				if(postFix.equals("_PROD"))
					js.add("<span style='color:blue'><b>"+"-"+"</b></span>");
				else if(nFind == 1)
					js.add("<span style='color:blue'><b>"+"-"+"</b></span>");
				else
					js.add("-");
			}
		}
		arrData.add(js);	
	}
}
