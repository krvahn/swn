<%@ page import="kr.go.seoul.water.comm.*" %>
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

//권한 검사
curPage.checkAuthority(WebConst.AUTH_LAB_MEASURE_ITEM, true, false);

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------
// WW_TYPE : 측정대상 (A:전체, P:정류센터, W:상수도연구원)
// WATER_TYPE : 항목구분(전체, 원수, 정수)
// CHECK_CYCLE : 측정주기 (전체, 일일, 주간, 월간, 분기)
// ITEM_KIND : 측정 항목 분류 (전체, 16항목, 23항목, 47항목, 55항목)
// SEARCH_TXT : 검색 문자열
//-----------------------------------------------------------------------------
String paramWWType = curPage.getParam("WW_TYPE", "P");
String paramWaterType = curPage.getParam("WATER_TYPE", "");
String paramCheckCycle = curPage.getParam("CHECK_CYCLE", "");
String paramItemKind = curPage.getParam("ITEM_KIND", "");
String paramSearchKeyWord = curPage.getParam("SEARCH_KEYWORD", "");
//-----------------------------------------------------------------------------
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Expires" content ="-1">
<meta http-equiv="Prgama" content ="no-cache">
<meta http-equiv="Cache-Control" content ="No-Cache">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%=WebConst.WEB_PAGE_TITLE%></title>
</head>
<!-- jQuery 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.js"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui-ko.js"></script>

<!-- Water Now 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/script.do"></script>

<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/water_now.css");
-->
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<!-- DataTabele 관련 CSS 및 자바스크립트 포함 -->
<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/jquery.dataTables.none.css");
-->	
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/jquery.dataTables.none.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.fnReloadAjax.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.fnFakeRowColspan.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.FixedColumns.js"></script>

<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/extra/TableTools_JUI.css");
-->
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/extra/TableTools_JUI.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/extra/TableTools.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/extra/ZeroClipboard.js"></script>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	var g_urlReportData = "manual_item.page.do?Act=lab_measure_item.list";
	
	function updateReport()
	{
		var URL;
		
		// 요청 URL 만들기
		URL = g_urlReportData
			+ "&WW_TYPE=" + $("#search_WWType").val()
			+ "&WATER_TYPE=" + $("#search_WaterType").val()
			+ "&CHECK_CYCLE=" + $("#search_CheckCycle").val()
			+ "&ITEM_KIND=" + $("#search_ItemKind").val()
			+ "&SEARCH_KEYWORD=" + $("#search_KeyWord").val();
		
		oReport.fnReloadAjax(URL);
	}
	
	$(document).ready(function() {
		var URL;		
		
		if( "<%=paramWWType%>" != "" ) {
			$("#search_WWType").val('<%=paramWWType%>');
		} else {
			$("#search_WWType option:eq(0)").attr("selected","selected");
		}
		
		if( "<%=paramWaterType%>" != "" ) {
			$("#search_WaterType").val('<%=paramWaterType%>');
		} else {
			$("#search_WaterType option:eq(0)").attr("selected","selected");
		}
		
		if( "<%=paramCheckCycle%>" != "" ) {
			$("#search_CheckCycle").val('<%=paramCheckCycle%>');
		} else {
			$("#search_CheckCycle option:eq(0)").attr("selected","selected");
		}
		
		if( "<%=paramItemKind%>" != "" ) {
			$("#search_ItemKind").val('<%=paramItemKind%>');
		} else {
			$("#search_ItemKind option:eq(0)").attr("selected","selected");
		}
		
		// 요청 URL 만들기
		URL = g_urlReportData
			+ "&WW_TYPE=" + $("#search_WWType").val()
			+ "&WATER_TYPE=" + $("#search_WaterType").val()
			+ "&CHECK_CYCLE=" + $("#search_CheckCycle").val()
			+ "&ITEM_KIND=" + $("#search_ItemKind").val()
			+ "&SEARCH_KEYWORD=" + $("#search_KeyWord").val();

		// 테이블 설정
		oReport = $('#report').dataTable( {
			"bProcessing": true,
			"bPaginate": false,
			"bSort": false,
			"bInfo": false,
			"bFilter": false,
			"oLanguage": {
				"sProcessing" : "자료를 검색 중입니다."
			},
			"sAjaxSource": URL,
			"aoColumns": [
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"}
			              ]
		} ).fnFakeRowColspan();
	});
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
	//-----------------------------------------------------------------------------------------------
	function fnSearch()
	{
		updateReport();
	}
	
	function fnAdd()
	{		
		var URL;
		
		URL = g_contextPath + "/lab_measure_item_form.do";
		URL += "?MODE=add";
		
		document.location.href = URL;
	}
	
	function fnDelete(itemCode, wwType)
	{
		var nDel;
		var URL;		
		
		nDel = confirm("선택한 데이터를 삭제하시겠습니까?");
		
		if (nDel == true) {
			URL = g_contextPath + "/lab_measure_item_form.do";
			URL += "?MODE=delete";
			URL += "&ITEM_CODE=" + itemCode;
			URL += "&WW_TYPE=" + wwType;
			
			document.location.href = URL;	
		}		
	}
	
	function fnUpdate(itemCode, wwType)
	{		
		var URL;
		
		URL = g_contextPath + "/lab_measure_item_form.do";
		URL += "?MODE=select";
		URL += "&ITEM_CODE=" + itemCode;
		URL += "&WW_TYPE=" + wwType;
		
		document.location.href = URL;
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/manual/20081212_swn_stitle19.jpg">
		</td>
	</tr>	
	<tr>
		<td>
			<table width="100%" cellspacing="1" cellpadding="0" style="background-color: #666666;">
			<tr>
				<td width=10% height=30 class='swn_tbl_title'>측정대상</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WWType" style="width:130px;">
						<option value=''>전체</option>
						<option value='P'>아리수정수센터</option>
						<option value='W'>상수도연구원</option>
					</select>					
				</td>
				<td width=10% height=30 class='swn_tbl_title'>항목구분</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WaterType" style="width:130px;">
						<option value='A'>전체측정항목</option>
						<option value='O'>원수측정항목</option>
						<option value='P'>정수측정항목</option>
					</select>					
				</td>
			</tr>
			<tr>
				<td height=30 class='swn_tbl_title'>측정주기</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_CheckCycle" style="width:130px;">
						<option value=''>전체</option>
						<option value='D'>일일</option>
						<option value='W'>주간</option>
						<option value='M'>월간</option>
						<option value='Q'>분기</option>
					</select>					
				</td>
				<td height=30 class='swn_tbl_title'>항목명</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<input type="text" id="search_KeyWord" size="40" value="<%=paramSearchKeyWord%>"/>
				</td>
			</tr>
			<tr>
				<td height=30 class='swn_tbl_title'>측정항목분류</td>
				<td colspan=3 style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_ItemKind" style="width:130px;">
						<option value=''>전체</option>
						<option value='item_16'>16항목</option>
						<option value='item_23'>23항목</option>
						<option value='item_47'>47항목</option>
						<option value='item_55'>55항목</option>
					</select>					
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr><td height=5></td></tr>
	<tr>
		<td align=right><a href="javascript:fnSearch();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_search03.gif" border=0 ></a></td>
	</tr>
	<tr><td height=30></td></tr>
	</table>
	</div>
	<div id="report_form">	
		<table width=100% cellspacing=1 cellpadding=0 id='report'>
		<thead>
		<tr>
			<th width="6%" align=center rowspan=2 bgcolor=#EFEFEF>NO</th>
			<th width="8%" align=center rowspan=2 bgcolor=#EFEFEF>항목구분</th>
			<th width="8%" align=center rowspan=2 bgcolor=#EFEFEF>측정주기</th>
			<th width="15%" align=center rowspan=2 bgcolor=#EFEFEF>측정항목</th>
			<th width="8%" align=center rowspan=2 bgcolor=#EFEFEF>측정단위</th>
			<th width="13%" align=center rowspan=2 bgcolor=#EFEFEF>항목구분</th>
			<th width="16%" align=center colspan=2 bgcolor=#EFEFEF>수질환경 기준</th>
			<th width="16%" align=center colspan=2 bgcolor=#EFEFEF>먹는물 수질 기준</th>
			<th width="10%" align=center rowspan=2 bgcolor=#EFEFEF>항목 삭제</th>
		</tr>
		<tr>
			<th width="8%" align=center bgcolor=#EFEFEF style="font-weight:normal;">상한</th>
			<th width="8%" align=center bgcolor=#EFEFEF style="font-weight:normal;">하한</th>
			<th width="8%" align=center bgcolor=#EFEFEF style="font-weight:normal;">상한</th>
			<th width="8%" align=center bgcolor=#EFEFEF style="font-weight:normal;">하한</th>
		</tr>
		</thead>
		</table>
	</div>
	<div id="footer_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr><td height=5></td></tr>
	<tr>
		<td>
			<table width=100% height=100% cellspacing=0 cellpadding=0>
			<tr>
				<td align=right>
					<a href="javascript:fnAdd();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_add.gif" border=0 ></a>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
	</table>
	</div>
</body>
</html>
<%
// 해제
curPage = null;
%>