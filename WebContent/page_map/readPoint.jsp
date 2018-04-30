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
String strPointCode, strAnalPointTitle, strAnalPointPos, strWellWaterTitle, strCorpWaterTtile;
String strItem;
String strDate, strTB, strPH, strRC, strTE, strCD;
String aData[];

strPointCode = "";
strAnalPointTitle = "-";
strAnalPointPos = "-";
strWellWaterTitle = "-";
strCorpWaterTtile = "-";
aData = MapConst.GetAnalPointInfo(paramCode);
if( aData != null ) {
	strPointCode = aData[0];
	strAnalPointTitle = aData[1];
	strAnalPointPos = aData[2];
	strWellWaterTitle = aData[3];
	strCorpWaterTtile = aData[4];
}

strDate = "-";
strTB = "-";
strPH = "-";
strRC = "-";
strTE = "-";
strCD = "-";

list = dao.selectCurrentDataList(paramCode);
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
%>
<table width=287 border=0 cellspacing=0 cellpadding=0 style="left:0; top:0; width:287px; height:232px; background:url('./images/bg_info.png'); _background:none; _filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true, src='./images/bg_info.png', sizingMethod='image');" onclick="MM_showHideLayers('info_t','','hide');">
	<tr>
		<td height=232 valign=top>
			<table width=273 border=0 align=center cellpadding=0 cellspacing=0>
<%if(paramDirect.equals("0") ) {%>
				<tr>
					<td height=19 align=center><img src="./images/trans_clos.gif" width=14 height=18 style="left:0; top:0; width:14; height:18px; background:url('./images/img_info_arrowt.png'); _background:none; _filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true, src='./images/img_info_arrowt.png', sizingMethod='image');"/></td>
				</tr>
<%} else {%>		
				<tr>
					<td height=19 align=center></td>
				</tr>
<%}%>
				<tr>
					<td height=32 align=right class=infotit>
						<table width=270 border=0 cellspacing=0 cellpadding=0>
							<tr>
								<td align=left><%=strAnalPointTitle%></td>
								<td width=21 align=right><a href="#"><img src="./images/trans_clos.gif" width=21 height=21 align=middle onclick="MM_showHideLayers('info_t','','hide');"/></a></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height=60>
						<table width=260 border=0 align=right cellpadding=0 cellspacing=0>
							<tr>
								<td height=16>설치장소 : <%=strAnalPointPos%></td>
							</tr>
							<tr>
								<td height=16>공급자 : <%=strWellWaterTitle%></td>
							</tr>
							<tr>
								<td height=16>관리자 : <%=strCorpWaterTtile%></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height=102>
						<table width=257 border=0 align=right cellpadding=0 cellspacing=0>
							<tr>
								<td height=16>탁도 : <strong><%=strTB%></strong> NTU (<%=strDate%>)</td>
							</tr>
							<tr>
								<td height=16>pH : <strong><%=strPH%></strong></td>
							</tr>
							<tr>
								<td height=16>잔류염소 : <strong><%=strRC%></strong> mg/L</td>
							</tr>
							<tr>
								<td height=16>전기전도도 : <strong><%=strCD%></strong> ㎲/㎝<br /></td>
							</tr>
							<tr>
								<td height=16>수온 : <strong><%=strTE%></strong> ℃</td>
							</tr>
						</table>
					</td>
				</tr>
<%if( paramDirect.equals("0") ) {%>
				<tr>
					<td height=19 align=center></td>
				</tr>
<%} else {%>	
				<tr>
					<td height=19 align=center><img src="./images/trans_clos.gif" width=14 height=18 style="left:0; top:0; width:14; height:18px; background:url('./images/img_info_arrowb.png'); _background:none; _filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true, src='./images/img_info_arrowb.png', sizingMethod='image');"/></td>
				</tr>			
<%}%>				
			</table>
		</td>
	</tr>
</table>
<%
// 해제
curPage = null;
dao = null;
%>