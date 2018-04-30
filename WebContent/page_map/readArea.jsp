<%@ page import="java.util.*" %>
<%@ page import="kr.go.seoul.water.comm.*" %>
<%@ page import="kr.go.seoul.water.sql.dao.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//-----------------------------------------------------------------------------------------------
// 웹 페이지 캐쉬 삭제
//-----------------------------------------------------------------------------------------------
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
if( request.getProtocol() != null && request.getProtocol().equals("HTTP/1.1") ) {
	response.setHeader("Cache-Control", "no-cache");
}

//-----------------------------------------------------------------------------------------------
//초기화
//-----------------------------------------------------------------------------------------------
WebPage curPage = new WebPage(pageContext, request, response);

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
// code : 측정지점코드
// direct : 방향
//-----------------------------------------------------------------------------------------------
String paramCode = curPage.getParam("code", "");
String paramDirect = curPage.getParam("direct", "");

// 해당 데이터 가져 오기
PageMapDao dao = new PageMapDao();
List<Map<String, Object>> list;
Iterator<Map<String, Object>> it;
Map<String, Object> item;
String strAnalPointTitle, strAnalPointPos, strWellWaterTitle, strCorpWaterTtile;
String strPointCode, strPointName;
String strItem;
String strDate, strTB, strPH, strRC, strTE, strCD;
List<String[]> aCodeList = null;
%>
<table width="516" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="180">&nbsp;</td>
    </tr>
    <tr>
      <td><table width="474" border="0" align="right" cellpadding="0" cellspacing="1" bgcolor="#333333">
        <tr>
          <td><div id="map_scroll"><table width="454" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF">
            <tr>
              <td height="30" colspan="7" background="images/bg_infotop.gif" class="infotit"> &nbsp;<%=MapConst.GetCorpWaterName(paramCode)%></td>
              </tr>
            <tr>
              <td width="100" height="30" align="center" bgcolor="#b2bae9">명칭</td>
              <td align="center" bgcolor="#b2bae9"><strong>탁도</strong><br />
                (NTU)</td>
              <td align="center" bgcolor="#b2bae9"><strong>pH</strong></td>
              <td align="center" bgcolor="#b2bae9"><strong>잔류염소</strong><br />
                (mg/L)</td>
              <td align="center" bgcolor="#b2bae9"><strong>전기전도도</strong><br />
                (㎲/㎝)</td>
              <td align="center" bgcolor="#b2bae9"><strong>수온</strong><br />
                (℃)</td>
			  <td align="center" bgcolor="#b2bae9"><strong>시간</strong></td>
            </tr>
<%
aCodeList = MapConst.GetAnalPointList(paramCode);
if( aCodeList != null && aCodeList.size() > 0 ) {
	for( int i = 0; i < aCodeList.size(); i ++ ) {
		strDate = "-";
		strTB = "-";
		strPH = "-";
		strRC = "-";
		strTE = "-";
		strCD = "-";

		strPointCode = aCodeList.get(i)[0];
		strPointName = aCodeList.get(i)[1];
		
		list = dao.selectCurrentDataList(strPointCode);
		if( list != null && list.size() > 0 ) {
			it = list.iterator();
			while( it.hasNext() ) {
				item = it.next();
				
				strDate = WebUtils.String2DateTimeFormat(String.valueOf(item.get("ANAL_DATE")), "yyyyMMddHHmmSS", "yyyy-MM-dd HH:mm");
				
				strItem = String.valueOf(item.get("ITEM_CODE"));
				if( strItem.equals("TB01") ) {
					strTB = WebConst.FormatStandardValue(strPointCode, strItem, (Double) item.get("ITEM_VAL"));
				} else if( strItem.equals("PH01") ) {
					strPH = WebConst.FormatStandardValue(strPointCode, strItem, (Double) item.get("ITEM_VAL"));
				} else if( strItem.equals("RC01") ) {
					strRC = WebConst.FormatStandardValue(strPointCode, strItem, (Double) item.get("ITEM_VAL"));
				} else if( strItem.equals("TE01") ) {
					strTE = WebConst.FormatStandardValue(strPointCode, strItem, (Double) item.get("ITEM_VAL"));
				} else if( strItem.equals("CD01") ) {
					strCD = WebConst.FormatStandardValue(strPointCode, strItem, (Double) item.get("ITEM_VAL"));
				}
			}
		}
		
		// 화면 출력
		if(i % 2 == 1) {
			out.println("<tr  bgcolor=#EEEEEE>");
		} else {
			out.println("<tr>");
		}
		
		out.println("<td height=30 align=center class=txt12>" + strPointName + "</td>");
		out.println("<td align=center class=txt12>" + strTB + "</td>");
		out.println("<td align=center class=txt12>" + strPH + "</td>");
		out.println("<td align=center class=txt12>" + strRC + "</td>");
		out.println("<td align=center class=txt12>" + strCD + "</td>");
		out.println("<td align=center class=txt12>" + strTE + "</td>");
		out.println("<td align=center class=txt12>" + strDate + "</td>");
		out.println("</tr>");
	}
}

for(int i = (aCodeList == null ? 0 : aCodeList.size()); i <= 14; i ++)
{
	if(i % 2 == 1) {
		out.println("<tr  bgcolor=#EEEEEE>");
	} else {
		out.println("<tr>");
	}
	
	out.println("<td height=30 align=center class=txt12>&nbsp;</td>");
	out.println("<td align=center class=txt12>&nbsp;</td>");
	out.println("<td align=center class=txt12>&nbsp;</td>");
	out.println("<td align=center class=txt12>&nbsp;</td>");
	out.println("<td align=center class=txt12>&nbsp;</td>");
	out.println("<td align=center class=txt12>&nbsp;</td>");
	out.println("<td align=center class=txt12>&nbsp;</td>");
	out.println("</tr>");
}
%>
          </table></div></td>
        </tr>
      </table>
      </td>
    </tr>
</table>
<%
// 해제
curPage = null;
dao = null;
%>