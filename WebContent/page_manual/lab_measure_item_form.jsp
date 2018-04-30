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
curPage.checkAuthority(WebConst.AUTH_LAB_MEASURE_ITEM, true, false);

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
		
		document.location.href = g_contextPath + "/page_manual/lab_measure_item.jsp";
	}
	
	$(document).ready(function() {
		if( "${WW_TYPE}" != "" ) {
			$("#WW_TYPE").val('${WW_TYPE}');
		} else {
			$("#WW_TYPE option:eq(0)").attr("selected","selected");
		}
		
		if( "${CHECK_CYCLE}" != "" ) {
			$("#CHECK_CYCLE").val('${CHECK_CYCLE}');
		} else {
			$("#CHECK_CYCLE option:eq(0)").attr("selected","selected");
		}
		
		if( "${WATER_TYPE}" != "" ) {
			$("#WATER_TYPE").val('${WATER_TYPE}');
		} else {
			$("#WATER_TYPE option:eq(0)").attr("selected","selected");
		}
		
		if( "${ITEM_16}" == "Y" ) {
			$("#search_ITEM_16").attr("checked", true);			
		}
		
		if( "${ITEM_23}" == "Y" ) {
			$("#search_ITEM_23").attr("checked", true);
		}
		
		if( "${ITEM_47}" == "Y" ) {
			$("#search_ITEM_47").attr("checked", true);
		}
		
		if( "${ITEM_55}" == "Y" ) {
			$("#search_ITEM_55").attr("checked", true);
		}
		
		// �б��������� �����
		if( "${MODE}" == "update" ) {
			$("#ITEM_CODE").attr("readonly", true);
			
			$("#search_NewData").change(function() {				
				if( $("#search_NewData").is(":checked") == true ) {
					$("#ITEM_CODE").removeAttr("readonly");
				} else {
					$("#ITEM_CODE").attr("readonly", true);
				}
			});
		}
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSave()
	{
		var theForm;
		
		theForm = document.sendForm;
		
		if(theForm.ITEM_CODE.value.length != 4) {
			alert("�����׸��ڵ�� ���� �Ǵ� ���� 4�ڸ��Դϴ�.");
			theForm.ITEM_CODE.focus();
			return;
		}
		
		if( theForm.ITEM_KNAME.value == "" ) {
			alert("�����׸��(����)�� �Է��Ͻÿ�.");
			theForm.ITEM_KNAME.focus();
			return;
		}
		
		if( theForm.ITEM_ENAME.value == "" ) {
			alert("�����׸��(����)�� �Է��Ͻÿ�.");
			theForm.ITEM_ENAME.focus();
			return;
		}
		
		if( theForm.ITEM_UNIT.value == "" ) {
			alert("���������� �Է��Ͻÿ�.");
			theForm.ITEM_UNIT.focus();
			return;
		}
		
		if( theForm.ENV_HIGH.value == "" ) {
			alert("����ȯ�氪(����) �Է��Ͻÿ�.");
			theForm.ENV_HIGH.focus();
			return;
		}
		
		if( theForm.ENV_LOW.value == "" ) {
			alert("����ȯ�氪(����) �Է��Ͻÿ�.");
			theForm.ENV_LOW.focus();
			return;
		}
		
		if( theForm.EAT_HIGH.value == "" ) {
			alert("�Դ¹����ذ�(����) �Է��Ͻÿ�.");
			theForm.EAT_HIGH.focus();
			return;
		}
		
		if( theForm.EAT_LOW.value == "" ) {
			alert("�Դ¹����ذ�(����) �Է��Ͻÿ�.");
			theForm.EAT_LOW.focus();
			return;
		}
		
		if( theForm.OUTPUT_ORDER.value == "" ) {
			alert("��¼����� �Է��Ͻÿ�.");
			theForm.OUTPUT_ORDER.focus();
			return;
		}
		
		if( $("#search_NewData").is(":checked") == true ) {
			theForm.MODE.value = "append";
		}
		
		if( $("#search_ITEM_16").is(":checked") ) { theForm.ITEM_16.value = "Y"; } else { theForm.ITEM_16.value = ""; }
		if( $("#search_ITEM_23").is(":checked") ) { theForm.ITEM_23.value = "Y"; } else { theForm.ITEM_23.value = ""; }
		if( $("#search_ITEM_47").is(":checked") ) { theForm.ITEM_47.value = "Y"; } else { theForm.ITEM_47.value = ""; }
		if( $("#search_ITEM_55").is(":checked") ) { theForm.ITEM_55.value = "Y"; } else { theForm.ITEM_55.value = ""; }
		
		theForm.submit();
	}
	
	function fnList()
	{
		var URL;
		
		URL = g_contextPath + "/page_manual/lab_measure_item.jsp";
		
		document.location.href = URL;
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/manual/20081212_swn_stitle20.jpg">
		</td>
	</tr>
	<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<form name="sendForm" id="sendForm" method="POST" action="lab_measure_item_form.do">
	<input type="hidden" name="MODE" id="MODE" value="${MODE}"> 
	<input type="hidden" name="ITEM_16" id="ITEM_16" value="">
	<input type="hidden" name="ITEM_23" id="ITEM_23" value="">
	<input type="hidden" name="ITEM_47" id="ITEM_47" value="">
	<input type="hidden" name="ITEM_55" id="ITEM_55" value="">
	<table width=100% height=100% cellspacing=1 cellpadding=0 style="background-color: #666666;">
		<tr>
			<td class='swn_tbl_title' width=30%>�������</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="WW_TYPE" name="WW_TYPE" style="width:130px;">
					<option value="P">���������</option>
					<option value="W">�����������</option>
				</select>
			</td>
		</tr>			
		<tr>
			<td class='swn_tbl_title'>�����ֱ�</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="CHECK_CYCLE" name="CHECK_CYCLE" style="width:130px;">
					<option value="D">����</option>
					<option value="W">�ְ�</option>
					<option value="M">����</option>
					<option value="Q">�б�</option>
				</select>				
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�׸񱸺�</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="WATER_TYPE" name="WATER_TYPE" style="width:130px;">
					<option value="A">��ü�����׸�</option>
					<option value="O">���������׸�</option>
					<option value="P">���������׸�</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�����׸��ڵ� <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="ITEM_CODE" id="ITEM_CODE" value="${ITEM_CODE}" size=20 maxlength=4 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�����׸�з�</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='checkbox' name="search_ITEM_16" id="search_ITEM_16">�����׸�(16��)
				<input type='checkbox' name="search_ITEM_23" id="search_ITEM_23">23�׸�
				<input type='checkbox' name="search_ITEM_47" id="search_ITEM_47">47�׸�
				<input type='checkbox' name="search_ITEM_55" id="search_ITEM_55">55�׸�
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�����׸��(����) <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="ITEM_KNAME" id="ITEM_KNAME" value="${ITEM_KNAME}" size=20 maxlength=40 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�����׸��(����) <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="ITEM_ENAME" id="ITEM_ENAME" value="${ITEM_ENAME}" size=20 maxlength=40 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�������� <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="ITEM_UNIT" id="ITEM_UNIT" value="${ITEM_UNIT}" size=10 maxlength=10 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>����ȯ����ذ�(����) <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="ENV_HIGH" id="ENV_HIGH" value="${ENV_HIGH}" size=10 maxlength=10 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>����ȯ����ذ�(����) <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="ENV_LOW" id="ENV_LOW" value="${ENV_LOW}" size=10 maxlength=10 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�Դ¹����ذ�(����) <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="EAT_HIGH" id="EAT_HIGH" value="${EAT_HIGH}" size=10 maxlength=10 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�Դ¹����ذ�(����) <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="EAT_LOW" id="EAT_LOW" value="${EAT_LOW}" size=10 maxlength=10 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>��¼��� <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="OUTPUT_ORDER" id="OUTPUT_ORDER" value="${OUTPUT_ORDER}" size=4 maxlength=4 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>���</td>
			<td style="background-color:white; text-align:left; padding-left:5px; padding-top:5px; padding-bottom:5px;">
				<textarea name="REMARK" id="REMARK" cols=26 rows=3 style="width:400px; height:100px; vertical-align:middle; overflow:auto;">${REMARK}</textarea>
			</td>
		</tr>
<%if(paramMode.equals("update") || paramMode.equals("select")) {%>		
		<tr id="search_NewDataForm">
			<td class='swn_tbl_title'>�ű� �׸� �߰�</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type="checkbox" name="search_NewData" id="search_NewData">
			</td>
		</tr>		
<%}%>		
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