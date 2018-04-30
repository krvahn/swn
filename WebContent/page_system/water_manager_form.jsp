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
curPage.checkAuthority(WebConst.AUTH_WATER_MANAGER, true, false); 

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
		
		document.location.href = g_contextPath + "/page_system/water_manager_list.jsp";
	}
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
	//-----------------------------------------------------------------------------------------------
	function fnSave()
	{
		var theForm
		theForm = document.sendForm;
		
		if(theForm.MANAGER_NAME.value == "") {
			alert("사업소 담당자명을 입력하세요.");
			theForm.MANAGER_NAME.focus();
			return;
		}
		
		if( theForm.TELNUM.value == "" ) {
			alert("담당자 전화번호를 입력하세요.");
			theForm.TELNUM.focus();
			return;
		}
		
		theForm.submit();
	}
	
	function fnList()
	{
		var URL;
		
		URL = g_contextPath + "/page_system/water_manager_list.jsp";
		
		document.location.href = URL;
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090506_swn_stitle18.jpg">
		</td>
	</tr>
	<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<form name="sendForm" id="sendForm" method="POST" action="water_manager_form.do">
	<input type="hidden" name="MODE" id="MODE" value="${MODE}"> 
	<input type="hidden" name="WW_CODE" id="MODE" value="${WW_CODE}">
	<table width=100% height=100% cellspacing=1 cellpadding=0 style="background-color: #666666;">
		<tr>
			<td class='swn_tbl_title' width=30%>사업소 담당자명</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="MANAGER_NAME" id="MANAGER_NAME" value="${MANAGER_NAME}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>전화번호</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="TELNUM" id="TELNUM" value="${TELNUM}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>관할 사무소</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<span>${WW_NAME}</span>
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