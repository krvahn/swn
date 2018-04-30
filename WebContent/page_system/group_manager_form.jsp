<%@ page import="kr.go.seoul.water.comm.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//-----------------------------------------------------------------------------------------------
// �� ������ ĳ�� ����
//-----------------------------------------------------------------------------------------------
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
if( request.getProtocol() != null && request.getProtocol().equals("HTTP/1.1") ) {
	response.setHeader("Cache-Control", "no-cache");
}

//-----------------------------------------------------------------------------------------------
//�ʱ�ȭ
//-----------------------------------------------------------------------------------------------
WebPage curPage = new WebPage(pageContext, request, response);

//���� �˻�
curPage.checkAuthority(WebConst.AUTH_GROUP_MANAGER, true, false); 

String g_USERID = (String)session.getAttribute("USER_ID");

if(g_USERID == null || !g_USERID.equals("dkryu100"))
{
%>
<script language="javascript">
	alert('�˼��մϴ�. �ش� ��ɿ� ���� ���ٱ����� �����ϴ�.');
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
<!-- jQuery ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.js"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui-ko.js"></script>

<!-- Water Now ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/script.do"></script>

<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/water_now.css");
-->
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<!-- DataTabele ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
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
	
	// ���� �޼��� ���
	if( "${fieldErrors.message}" != "" ) {
		alert("${fieldErrors.message}");
		
		document.location.href = g_contextPath + "/page_system/group_manager_list.jsp";
	}
	
	$(document).ready(function() {
		// �׷���� �ֱ�
		if( "$GROUP_AUTH" != "" ) {
			$("#GROUP_AUTH").val('${GROUP_AUTH}');
		} else {
			$("#GROUP_AUTH option:eq(0)").attr("selected","selected");
		}
		
		// �б��������� �����
		if( "${MODE}" == "update" ) {
			$("#GROUP_CODE").attr("readonly", true);
		}
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSave()
	{
		var theForm
		theForm = document.sendForm;
		
		if(theForm.GROUP_CODE.value.length!=2) {
			alert("�׷��ڵ�� ���� �Ǵ� ���� 2�ڸ��Դϴ�.");
			theForm.GROUP_CODE.focus();
			return;
		}
		
		if( theForm.GROUP_NAME.value == "" ) {
			alert("����� �׷���� �Է��ϼ���.");
			theForm.GROUP_NAME.focus();
			return;
		}
		
		theForm.submit();
	}
	
	function fnList()
	{
		var URL;
		
		URL = g_contextPath + "/page_system/group_manager_list.jsp";
		
		document.location.href = URL;
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090506_swn_stitle17.jpg">
		</td>
	</tr>
	<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<form name="sendForm" id="sendForm" method="POST" action="group_manager_form.do">
	<input type="hidden" name="MODE" id="MODE" value="${MODE}"> 
	<table width=100% height=100% cellspacing=1 cellpadding=0 style="background-color: #666666;">
		<tr>
			<td class='swn_tbl_title' width=30%>����� �׷� �ڵ�(����Ұ�)</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="GROUP_CODE" id="GROUP_CODE" value="${GROUP_CODE}" size=2 maxlength=2 style="width:100px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>����� �׷� ��</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="GROUP_NAME" id="GROUP_NAME" value="${GROUP_NAME}" size=50 maxlength=50 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>����� �׷� ����</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select name="GROUP_AUTH" id="GROUP_AUTH" style="width:130px;">
					<option value="9">9</option>
					<option value="5">5</option>
					<option value="3">3</option>
					<option value="1">1</option>
				</select>
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
// ����
curPage = null;
%>