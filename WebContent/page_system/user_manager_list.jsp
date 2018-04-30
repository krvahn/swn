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
curPage.checkAuthority(WebConst.AUTH_USER_MANAGER, true, false);

String g_USERID = (String)session.getAttribute("USER_ID");

if(g_USERID == null || !g_USERID.equals("dkryu100"))
{
%>
<script language="javascript">
	alert('죄송합니다. 해당 기능에 대한 접근권한이 없습니다.');
	history.back();
</script>
<% 
}

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
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
	var g_urlReportData = "system.page.do?Act=user_manager.list";
	//var g_urlReportData = "code.list.do?Act=none&COLSPAN=4";
	var oReport;
	
	$(document).ready(function() {
		var URL;
		
		URL = g_urlReportData;
		
		// 테이블 설정
		oReport = $('#report').dataTable( {
			"bFilter" : true,
			"bProcessing": true,
			"bPaginate": true,
			"bSort": false,
			"bInfo": true,
			"bFilter": false,
			"sPaginationType" : "full_numbers",
			"oLanguage": {
				"sLengthMenu": "한 페이지당 _MENU_ 레코드 표시",
				"sInfo": "전체 : _TOTAL_ 레코드 [ _START_ to _END_ ]",
	            "sInfoEmpty": "해당 레코드 없음",
				"sProcessing" : "자료를 검색 중입니다.",
				"sSearch" : "모든 컬럼에서 검색",
				"oPaginate" : {
					"sFirst": "처음으로",	            
		            "sLast": "마지막으로",
		            "sPrevious": "앞으로",
		            "sNext": "다음으로"
				}
			},
			"sAjaxSource": URL,
			"aoColumns": [
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"}
			              ]
		} ).fnFakeRowColspan();
		
		$("tfoot input").keyup( function () {
	        /* Filter on the column (the index) of this element */
	        oReport.fnFilter( this.value, $("tfoot input").index(this) );
	    } );
	});
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
	//-----------------------------------------------------------------------------------------------
	function fnAdd()
	{
		var URL;
		
		// 데이터 요청 URL 만들기
		URL = g_contextPath + "/user_manager_form.do";
		URL += "?MODE=add";
		
		document.location.href = URL;
	}
	
	function fnUpdate(user_id)
	{
		var URL;
		
		// 데이터 요청 URL 만들기
		URL = g_contextPath + "/user_manager_form.do";
		URL += "?MODE=select";
		URL += "&USER_ID=" + user_id;
		
		document.location.href = URL;
	}
	
	function fnSearch()
	{
		var URL;
		
		// 데이터 요청 URL 만들기
		URL = g_urlReportData
			+ "&SEARCH_ITEM=" + $("#search_method").val()
			+ "&SEARCH_KEYWORD=" + $("#search_keyword").val();
		
		oReport.fnReloadAjax(URL);
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090506_swn_stitle16.jpg">
		</td>
	</tr>
	</table>
	</div>
	<div id="content_form">
	<table width=100% height=100% cellspacing=1 cellpadding=0 id="report">
		<thead>
		<tr>
			<th align=center height=30 width=25% bgcolor="#EFEFEF">사용자 그룹명</th>
			<th align=center width=20% bgcolor="#EFEFEF">사용자명</th>
			<th align=center width=25% bgcolor="#EFEFEF">사용자 아이디</th>
			<th align=center width=30% bgcolor="#EFEFEF">소속</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="4" class="dataTables_empty" align=center>Loading data from server</td>
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
					<a href="javascript:fnAdd();"><img src="${pageContext.request.contextPath}/images/comm/20090506_swn_btn01.jpg" border=0 ></a>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height=25 align=center>
			<form name="searchForm" action="javascript:fnSearch();">
			<select name="search_method" id="search_method" style="width:110px;vertical-align:middle;">
				<option value='search_group' >그룹명</option>
				<option value='search_user' >사용자명</option>
				<option value='search_id' >사용자 아이디</option>
				<option value='search_wwname' >소속명</option>
			</select>
			<input type="text" name="search_keyword" id="search_keyword" size=20 value="" style="width:200px;vertical-align:middle;">&nbsp;
			<input type="image" src="${pageContext.request.contextPath}/images/comm/20090514_swn_btn_search.gif" border=0 style="vertical-align:middle;" onClick="fnSearch();">
			</form>
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