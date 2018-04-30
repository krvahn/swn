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
curPage.checkAuthority(WebConst.AUTH_STAUTS_SUB_ADD, true, false); 
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
	var g_urlReport = "system.page.do?Act=status_sub.list";
	var oReport;
	
	$(document).ready(function() {
		var URL;
		
		URL = g_urlReport;
		
		// 데이터 초기화
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
			              {"sClass" : "center"}
			              ]
		}).fnFakeRowColspan();
	});
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
	//-----------------------------------------------------------------------------------------------
	function fnAdd()
	{
		var URL;
		
		URL = g_contextPath + "/status_sub_form.do";
		URL += "?MODE=add";
		
		document.location.href = URL;
	}
	
	function fnUpdate(topCode, subCode)
	{
		var URL;
		
		URL = g_contextPath + "/status_sub_form.do";
		URL += "?MODE=select"
		URL += "&TOP_STATUS_CODE=" + topCode;
		URL += "&STATUS_CODE=" + subCode;
		
		document.location.href = URL;
	}
	
	function fnDelete(topCode, subCode)
	{
		var nDel;
		var URL;		
		
		nDel = confirm("선택한 데이터를 삭제하시겠습니까?..\n\n 데이터를 삭제하면 해당 측정상태의 5분 측정값을 읽을수 없습니다.");
		
		if (nDel == true) {
			URL = g_contextPath + "/status_sub_form.do";
			URL += "?MODE=delete"
			URL += "&TOP_STATUS_CODE=" + topCode;
			URL += "&STATUS_CODE=" + subCode;
			
			document.location.href = URL;	
		}		
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090511_swn_stitle02.jpg">
		</td>
	</tr>
	<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<table width=100% height=100% cellspacing=1 cellpadding=0 id="report">
		<thead>
		<tr>
			<th align=center height=30 width=25% bgcolor="#EFEFEF">상태 정보 대분류</th>
			<th align=center width=15% bgcolor="#EFEFEF">상태 정보 코드</th>
			<th align=center width=40% bgcolor="#EFEFEF">상태 정보명</th>
			<th align=center width=10% bgcolor="#EFEFEF">상태 구분</th>
			<th align=center width=10% bgcolor="#EFEFEF">삭제</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="3" class="dataTables_empty" align=center>Loading data from server</td>
		</tr>
		</tbody>			
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
					<a href="javascript:fnAdd();"><img src="${pageContext.request.contextPath}/images/comm/20090506_swn_btn03.gif" border=0 ></a>
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