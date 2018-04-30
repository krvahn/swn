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
curPage.checkAuthority(WebConst.AUTH_MEASURE_ITEM, true, false);

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
		
		document.location.href = g_contextPath + "/page_system/measure_item_list.jsp";
	}
	
	function updatePointTypeCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=pointclass.list";
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_PointTypeCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_PointTypeCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	$(document).ready(function() {
		// ���� ����Ʈ ���� �ֱ�
		updatePointTypeCodeList();
		if( "${POINT_CLASS}" != "" ) {
			$("#search_PointTypeCode").val('${POINT_CLASS}');
		} else {
			$("#search_PointTypeCode option:eq(0)").attr("selected","selected");
		}
		
		if( "${USE_FLAG}" == "U" ) {
			$("#search_USE_FLAG").attr("checked", true);
		} else {
			$("#search_USE_FLAG").attr("checked", false);
		}
		
		// �б��������� �����
		if( "${MODE}" == "update" ) {
			$("#ITEM_CODE").attr("readonly", true);
			$("#search_PointTypeCode").attr("disabled", true);
			
			$("#search_NewData").change(function() {				
				if( $("#search_NewData").is(":checked") == true ) {
					$("#search_PointTypeCode").removeAttr("disabled");
				} else {
					$("#search_PointTypeCode").val('${POINT_CLASS}');
					$("#search_PointTypeCode").attr("disabled", true);
				}
			});
		}
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnList()
	{
		var URL;
		
		URL = g_contextPath + "/page_system/measure_item_list.jsp";
		
		document.location.href = URL;
	}
	
	function fnSave()
	{
		var theForm
		theForm = document.sendForm;
		
		if(theForm.ITEM_CODE.value == "") {
			alert("�����׸��ڵ�� �ݵ�� �Է��ϼž� �մϴ�.");
			theForm.ITEM_CODE.focus();
			return;
		}
		
		if(theForm.ITEM_NAME.value == "") {
			alert("�����׸���� �ݵ�� �Է��ϼž� �մϴ�.");
			theForm.ITEM_NAME.focus();
			return;
		}
		
		if( $("#search_NewData").is(":checked") == true ) {
			theForm.MODE.value = "append";
		}
		
		theForm.POINT_CLASS.value = ($("#search_PointTypeCode").val());
		
		if( $("#search_USE_FLAG").is(":checked") == true ) {
			$("#USE_FLAG").val("U");
		} else {
			$("#USE_FLAG").val("D");
		}
		
		theForm.submit();
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090506_swn_stitle23.jpg">
		</td>
	</tr>
	<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<form name="sendForm" id="sendForm" method="POST" action="measure_item_form.do">
	<input type="hidden" name="MODE" id="MODE" value="${MODE}"> 
	<input type="hidden" name="POINT_CLASS" id="POINT_CLASS" value="">
	<input type="hidden" name="USE_FLAG" id="USE_FLAG" value="">
	<input type="hidden" name="USER_ID" id="USER_ID" value="<%=curPage.getUserID()%>">
	<span style="text-align:left;">* �ʼ� �Է� �׸�</span>
	<table width=100% height=100% cellspacing=1 cellpadding=0 style="background-color: #666666;">
		<tr>
			<td class='swn_tbl_title' width=30%>* ���� �׸� �ڵ�</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="ITEM_CODE" id="ITEM_CODE" value="${ITEM_CODE}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>* ���� �׸��</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="ITEM_NAME" id="ITEM_NAME" value="${ITEM_NAME}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>���� ����</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="ANAL_UNIT" id="ANAL_UNIT" value="${ANAL_UNIT}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>���� ����Ʈ ����</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="search_PointTypeCode" style="width:130px;">
				</select>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�׸� ���ذ�(�ֻ���)</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="HIGH_HIGH" id="HIGH_HIGH" value="${HIGH_HIGH}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�׸� ���ذ�(����)</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="HIGH" id="HIGH" value="${HIGH}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�׸� ���ذ�(������)</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="LOW_LOW" id="LOW_LOW" value="${LOW_LOW}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>�׸� ���ذ�(����)</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="LOW" id="LOW" value="${LOW}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>���� �׸� ��뿩��</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type="checkbox" name="search_USE_FLAG" id="search_USE_FLAG">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>���</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<textarea name="ITEM_REMARK" id="ITEM_REMARK" rows=3 cols=36>${REMARK}</textarea>
			</td>
		</tr>
<%if(paramMode.equals("update") || paramMode.equals("select")) {%>		
		<tr id="search_NewDataForm">
			<td class='swn_tbl_title'>�ű� ����ġ �߰�</td>
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
<script type="text/javascript" language="javascript">
	// ���� �޼��� ���
	if( "${fieldErrors.validate_HIGH_HIGH}" != "" ) {
		alert("${fieldErrors.validate_HIGH_HIGH}");
		$("#HIGH_HIGH").focus();
	} else if( "${fieldErrors.validate_HIGH}" != "" ) {
		alert("${fieldErrors.validate_HIGH}");		
		$("#HIGH").focus();
	} else if( "${fieldErrors.validate_LOW_LOW}" != "" ) {
		alert("${fieldErrors.validate_LOW_LOW}");
		$("#LOW_LOW").focus();
	} else if( "${fieldErrors.validate_LOW}" != "" ) {
		alert("${fieldErrors.validate_LOW}");
		$("#LOW").focus();
	}
</script>
</html>
<%
// ����
curPage = null;
%>