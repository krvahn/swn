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
	
	// 에러 메세지 출력
	if( "${fieldErrors.message}" != "" ) {
		alert("${fieldErrors.message}");
		
		document.location.href = g_contextPath + "/page_system/status_sub_list.jsp";
	}
	
	function updateTopStatusCodeList()
	{
		URL = "code.list.do?Act=status.topcode.list";
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_TOP_STATUS_CODE").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_TOP_STATUS_CODE").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	$(document).ready(function() {
		// 상태 정보 대분류 넣기
		updateTopStatusCodeList();
		if( "$TOP_STATUS_CODE" != "" ) {
			$("#search_TOP_STATUS_CODE").val('${TOP_STATUS_CODE}');
		} else {
			$("#search_TOP_STATUS_CODE option:eq(0)").attr("selected","selected");
		}
		
		// 상태구분 넣기
		if( "$STATUS_TYPE" != "" ) {
			$("#STATUS_TYPE").val('${STATUS_TYPE}');
		} else {
			$("#STATUS_TYPE option:eq(0)").attr("selected","selected");
		}
		
		// 읽기전용으로 만들기
		if( "${MODE}" == "update" ) {
			$("#search_TOP_STATUS_CODE").attr("disabled", true);
			$("#STATUS_CODE").attr("readonly", true);
		}
	});
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
	//-----------------------------------------------------------------------------------------------
	function fnSave()
	{
		var theForm
		theForm = document.sendForm;
		
		if(theForm.STATUS_CODE.value.length!=2) {
			alert("상태코드는 영문 또는 숫자 2자리입니다.");
			theForm.STATUS_CODE.focus();
			return;
		}
		
		if( theForm.STATUS_NAME.value == "" ) {
			alert("상태명을 입력하세요.");
			theForm.STATUS_NAME.focus();
			return;
		}
		
		theForm.TOP_STATUS_CODE.value = $("#search_TOP_STATUS_CODE").val();
		theForm.submit();
	}
	
	function fnList()
	{
		var URL;
		
		URL = g_contextPath + "/page_system/status_sub_list.jsp";
		
		document.location.href = URL;
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
	<form name="sendForm" id="sendForm" method="POST" action="status_sub_form.do">
	<input type="hidden" name="MODE" id="MODE" value="${MODE}"> 
	<input type="hidden" name="TOP_STATUS_CODE" id="TOP_STATUS_CODE" value="">
	<table width=100% height=100% cellspacing=1 cellpadding=0 style="background-color: #666666;">
		<tr>
			<td class='swn_tbl_title' width=30%>상태 정보 대분류</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="search_TOP_STATUS_CODE" name="search_TOP_STATUS_CODE" style="width:130px;">
				</select>
			</td>
		</tr>			
		<tr>
			<td class='swn_tbl_title'>상태 정보 코드</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="STATUS_CODE" id="STATUS_CODE" value="${STATUS_CODE}" size=2 maxlength=2 style="width:100px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>상태 정보명</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="STATUS_NAME" id="STATUS_NAME" value="${STATUS_NAME}" size=50 maxlength=50 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>상태 구분</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select name="STATUS_TYPE" id="STATUS_TYPE" style="width:130px;">
					<option value="A">자동</option>
					<option value="S">수동</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>비고</td>
			<td style="background-color:white; text-align:left; padding-left:5px; padding-top:5px; padding-bottom:5px;">
				<textarea name="STATUS_DESC" id="STATUS_DESC" cols=45 rows=5 style="width:400px; height:200px; vertical-align:middle; overflow:auto;">${STATUS_DESC}</textarea>
			</td>
		</tr>
	</table>
	</form>
	</div>
	<div id="footer_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr><td height=5></td></tr>
	<tr>
		<td>
			<table width=100% height=100% cellspacing=0 cellpadding=0>
			<tr>
				<td align=right>
					<a href="javascript:fnList();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_list.gif" border=0 ></a>&nbsp;&nbsp;
					<a href="javascript:fnSave();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_save.gif" border=0 ></a>
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