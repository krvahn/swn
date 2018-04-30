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
curPage.checkAuthority(WebConst.AUTH_USER_MANAGER, true, false);

String g_USERID = (String)session.getAttribute("USER_ID");

if(g_USERID == null || !g_USERID.equals("dkryu100"))
{
%>
<script type="text/javascript" language="javascript">
	alert('�˼��մϴ�. �ش� ��ɿ� ���� ���ٱ����� �����ϴ�.');
	history.back();
</script>
<% 
}

//-----------------------------------------------------------------------------------------------
//�Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
//MODE : �۾� ���
//-----------------------------------------------------------------------------------------------
String paramMode = curPage.getParam("MODE", "");
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
		
		document.location.href = g_contextPath + "/page_system/user_manager_list.jsp";
	}
	
	function updateGrupAuthCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=group.list";	
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#GROUP_AUTH").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#GROUP_CODE").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateSelectPointCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=point.list";	
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_UnselectPointCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_UnselectPointCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
		
		URL = "code.list.do?Act=user.select.point.list";
		URL += "&USER_ID=" + $("#USER_ID").val();
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_SelectPointCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_SelectPointCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateWWCodeList()
	{		
		var URL;
		
		URL = "code.list.do?Act=wellwater.all.list";
		URL += "&WW_TYPE=" + $("#WW_TYPE").val();
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#WW_CODE").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#WW_CODE").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	$(document).ready(function() {
		updateGrupAuthCodeList();
		if( "${GROUP_CODE}" != "" ) {
			$("#GROUP_CODE").val('${GROUP_CODE}');
		} else {
			$("#GROUP_CODE option:eq(0)").attr("selected","selected");
		}
		
		if( "${CELL_NUM1}" != "" ) {
			$("#CELL_NUM1").val('${CELL_NUM1}');
		} else {
			$("#CELL_NUM1 option:eq(0)").attr("selected","selected");
		}
		
		if( "${WW_TYPE}" != "" ) {
			$("#WW_TYPE").val('${WW_TYPE}');
		} else {
			$("#WW_TYPE option:eq(0)").attr("selected","selected");
		}
		
		updateWWCodeList();
		if( "${WW_CODE}" != "" ) {
			$("#WW_CODE").val('${WW_CODE}');
		} else {
			$("#WW_CODE option:eq(0)").attr("selected","selected");
		}
		
		if( "${ALARM_TYPE1}" == "Y" ) {
			$("#search_ALARM_TYPE1").attr("checked", true);			
		}
		
		if( "${ALARM_TYPE2}" == "Y" ) {
			$("#search_ALARM_TYPE2").attr("checked", true);			
		}
		
		if( "${ALARM_TYPE3}" == "Y" ) {
			$("#search_ALARM_TYPE3").attr("checked", true);			
		}
		
		if( "${SMS_WD}" == "Y" ) {
			$("#search_SMS_WD").attr("checked", true);			
		}
		
		if( "${SMS_WN}" == "Y" ) {
			$("#search_SMS_WN").attr("checked", true);			
		}
		
		if( "${SMS_HD}" == "Y" ) {
			$("#search_SMS_HD").attr("checked", true);			
		}
		
		if( "${SMS_HN}" == "Y" ) {
			$("#search_SMS_HN").attr("checked", true);			
		}
		
		if( "${USER_LEVEL}" != "" ) {
			$("#USER_LEVEL").val('${USER_LEVEL}');
		} else {
			$("#USER_LEVEL option:eq(0)").attr("selected","selected");
		}
		
		if( "${EXPIRE_FLAG}" != "" ) {
			$("#EXPIRE_FLAG").val('${EXPIRE_FLAG}');
		} else {
			$("#EXPIRE_FLAG option:eq(0)").attr("selected","selected");
		}
		
		if( "${USER_AUTH}" != "" ) {
			$("#USER_AUTH").val('${USER_AUTH}');
		} else {
			$("#USER_AUTH option:eq(0)").attr("selected","selected");
		}
		
		updateSelectPointCodeList();
		
		// �б��������� �����
		if( "${MODE}" == "update" ) {
			$("#USER_ID").attr("readonly", true);
		}
		
		// �̺�Ʈ ����
		$("#WW_TYPE").change( function() {
			updateWWCodeList();
		});
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSave()
	{
		var theForm;
		var i, items;
		
		theForm = document.sendForm;
		
		if(theForm.USER_ID.value.length < 6) {
			alert("����� ���̵�� �ּ� 6�� �̻� �Ǿ�� �մϴ�.");
			theForm.USER_ID.focus();
			return;
		}
		
		if( theForm.USER_NAME.value == "" ) {
			alert("����ڸ��� �Է��Ͻÿ�.");
			theForm.USER_NAME.focus();
			return;
		}
		
		if( theForm.PWD.value.length < 9 ) {
			alert("��й�ȣ�� ����, ����, Ư�������� ���� 9�� �̻��Դϴ�.");
			theForm.PWD.focus();
			return;
		}
		
		if(!theForm.PWD.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/))
		{
			alert("��й�ȣ�� ����, ����, Ư�������� ���� 9�� �̻��Դϴ�.");
			theForm.PWD.focus();
			return;
		}
		
		if( theForm.USER_ID.value == theForm.PWD.value ) {
			alert("��й�ȣ�� ���̵�� ���� ����Ҽ� �����ϴ�.");
			theForm.PWD.focus();
			return;
		}
		
		if( theForm.PWD.value != theForm.PWD_CONFIRM.value ) {
			alert("��й�ȣȮ���� ���� �ʽ��ϴ�.\n\n��Ȯ�ϰ� �ٽ� �Է����ֽʽÿ�.");
			theForm.PWD_CONFIRM.focus();
			return;
		}
		
		
		if( $("#search_ALARM_TYPE1").is(":checked") ) { theForm.ALARM_TYPE1.value = "Y"; } else { theForm.ALARM_TYPE1.value = "N"; }
		if( $("#search_ALARM_TYPE2").is(":checked") ) { theForm.ALARM_TYPE2.value = "Y"; } else { theForm.ALARM_TYPE2.value = "N"; }
		if( $("#search_ALARM_TYPE3").is(":checked") ) { theForm.ALARM_TYPE3.value = "Y"; } else { theForm.ALARM_TYPE3.value = "N"; }
		
		if( $("#search_SMS_WD").is(":checked") ) { theForm.SMS_WD.value = "Y"; } else { theForm.SMS_WD.value = "N"; }
		if( $("#search_SMS_WN").is(":checked") ) { theForm.SMS_WN.value = "Y"; } else { theForm.SMS_WN.value = "N"; }
		if( $("#search_SMS_HD").is(":checked") ) { theForm.SMS_HD.value = "Y"; } else { theForm.SMS_HD.value = "N"; }
		if( $("#search_SMS_HN").is(":checked") ) { theForm.SMS_HN.value = "Y"; } else { theForm.SMS_HN.value = "N"; }
		
		items = "";
		for(i = 0; i < $("#search_SelectPointCode option").size(); i ++) {
			if( items.length > 0 ) {
				items += ",";
			}
			
			items += $("#search_SelectPointCode option:eq(" + i + ")").val();
		}
		theForm.ITEMS.value = items;
		
		theForm.submit();
	}
	
	function fnDelete(user_id)
	{
		var nDel;
		var URL;		
		
		nDel = confirm("������ �����͸� �����Ͻðڽ��ϱ�?");
		
		if (nDel == true) {
			URL = g_contextPath + "/user_manager_form.do";
			URL += "?MODE=delete";
			URL += "&USER_ID=${USER_ID}";
			
			document.location.href = URL;	
		}
	}
	
	function fnList()
	{
		var URL;
		
		URL = g_contextPath + "/page_system/user_manager_list.jsp";
		
		document.location.href = URL;
	}
	
	function fnRemoveItem()
	{
		$("#search_SelectPointCode option:selected").each(function() {
			$(this).remove();
		});
	}
	
	function fnAppendItem()
	{
		$("#search_UnselectPointCode option:selected").each(function() {
			if( $("#search_SelectPointCode").find("option[value='" + $(this).val() + "']").length < 1 ) {
				$("#search_SelectPointCode").append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
			}
		});
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
	<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<form name="sendForm" id="sendForm" method="POST" action="user_manager_form.do">
	<input type="hidden" name="MODE" id="MODE" value="${MODE}">
	<input type="hidden" name="ALARM_TYPE1" id="ALARM_TYPE1" value="">
	<input type="hidden" name="ALARM_TYPE2" id="ALARM_TYPE2" value="">
	<input type="hidden" name="ALARM_TYPE3" id="ALARM_TYPE3" value="">
	<input type="hidden" name="SMS_WD" id="SMS_WD" value="">
	<input type="hidden" name="SMS_WN" id="SMS_WM" value="">
	<input type="hidden" name="SMS_HD" id="SMS_HD" value="">
	<input type="hidden" name="SMS_HN" id="SMS_HN" value=""> 
	<input type="hidden" name="ITEMS" id="ITEMS" value="">
	<table width=100% height=100% cellspacing=1 cellpadding=0 style="background-color: #666666;">
		<tr>
			<td class='swn_tbl_title' width=30%>����� �׷� ��� <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="GROUP_CODE" name="GROUP_CODE" style="width:130px;">
				</select>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>����� ID <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="USER_ID" id="USER_ID" value="${USER_ID}" size=20 maxlength=12 style="width:200px;vertical-align:middle;">
			</td>
		</tr>			
		<tr>
			<td class='swn_tbl_title'>����ڸ� <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="USER_NAME" id="USER_NAME" value="${USER_NAME}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>��й�ȣ <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="PWD" id="PWD" value="" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>��й�ȣȮ�� <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="PWD_CONFIRM" id="PWD_CONFIRM" value="" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>��ȭ��ȣ</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="TEL_NUM1" id="TEL_NUM1" value="${TEL_NUM1}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
				-&nbsp;<input type='text' name="TEL_NUM2" id="TEL_NUM2" value="${TEL_NUM2}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
				-&nbsp;<input type='text' name="TEL_NUM3" id="TEL_NUM3" value="${TEL_NUM3}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�޴�����ȣ</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="CELL_NUM1" name="CELL_NUM1" style="width:50px;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">018</option>
					<option value="017">018</option>
					<option value="019">019</option>
				</select>
				-&nbsp;<input type='text' name="CELL_NUM2" id="CELL_NUM2" value="${CELL_NUM2}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
				-&nbsp;<input type='text' name="CELL_NUM3" id="CELL_NUM3" value="${CELL_NUM3}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>���һ����</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="WW_TYPE" name="WW_TYPE" style="width:130px;">
					<option value="M">������������</option>
					<option value="P">�Ƹ�����������</option>
					<option value="W">���������</option>
					<option value="R">�����������</option>
				</select>&nbsp;
				<select id="WW_CODE" name="WW_CODE" style="width:130px;">
				</select>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�溸 ���ſɼ�</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='checkbox' name="search_ALARM_TYPE1" id="search_ALARM_TYPE1">����ġ �ʰ�
				&nbsp;<input type='checkbox' name="search_ALARM_TYPE2" id="search_ALARM_TYPE2">�������� �̻�
				&nbsp;<input type='checkbox' name="search_ALARM_TYPE3" id="search_ALARM_TYPE3">���ۻ��� �̻�
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>SMS ���ſɼ�</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='checkbox' name="search_SMS_WD" id="search_SMS_WD">�����ְ�
				&nbsp;<input type='checkbox' name="search_SMS_WN" id="search_SMS_WN">���Ͼ߰�
				&nbsp;<input type='checkbox' name="search_SMS_HD" id="search_SMS_HD">�����ְ�
				&nbsp;<input type='checkbox' name="search_SMS_HN" id="search_SMS_HN">���Ͼ߰�
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>SMS ���� �����</td>
			<td style="background-color:white; text-align:left; padding-left:5px;padding-top:5px;padding-bottom:5px">
				<table cellspacing="0" cellpadding="0" style="background-color: white;">
					<tr>
						<td width=200px align=center>
							<select name="search_SelectPointCode" id="search_SelectPointCode" multiple style="width:250px;" size=15 ondblclick="fnRemoveItem()">
							</select>
						</td>
						<td width=70px align="center"><input type="button" name="add" id="add" value = " => " onclick="fnRemoveItem()"><br>
							<br><input type="button" name="remove" id="remove" value = " <= " onclick="fnAppendItem()">
						</td>
						<td width=200px align=center>
							<select name="search_UnselectPointCode" id="search_UnselectPointCode" multiple style="width:250px;" size=15 ondblclick="fnAppendItem()">
							</select>
						</td>
					</tr>
					</table>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>������ ����</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="USER_LEVEL" name="USER_LEVEL" style="width:60px;">
					<option value="1">���</option>
					<option value="2">������</option>
				</select>&nbsp;&nbsp;(��� : �Ϲݴ����, ������ : ����, ����, ����)				
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�ٺο���</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="EXPIRE_FLAG" name="EXPIRE_FLAG" style="width:60px;">
					<option value="1">������</option>
					<option value="2">����</option>
					<option value="3">����</option>
					<option value="8">��Ÿ</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>����� ���Ѱ�</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="USER_AUTH" name="USER_AUTH" style="width:60px;">
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
<%if(paramMode.equals("update") || paramMode.equals("select")) {%>
					<a href="javascript:fnDelete();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_delete.gif" border=0 ></a>&nbsp;&nbsp;
<%}%>							
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