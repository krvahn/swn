<%@ page import="java.util.*" %>
<%@ page import="kr.go.seoul.water.comm.*" %>
<%@ page import="kr.go.seoul.water.sql.vo.*" %>
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
curPage.checkAuthority(WebConst.AUTH_OPER_RESULT, true, false);

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// WORK_DATE : �۾� ����
//-----------------------------------------------------------------------------------------------
String paramWorkDate = curPage.getParam("WORK_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMdd"));

String searchReportYMD;
searchReportYMD = WebUtils.String2DateTimeFormat(paramWorkDate, "yyyyMMdd", "yyyy-MM-dd");
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
	var g_reportDataURL = "oper.page.do?Act=oper_result_form.list";
	var oReport = null;
	
	// ���� �޼��� ���
	if( "${fieldErrors.message}" != "" ) {
		alert("${fieldErrors.message}");
	}
	
	// datatable HTML ����
	jQuery.fn.dataTableExt.aTypes.push( function(sData) {
		return 'html';
	});
	
	function updateReport()
	{		
		var URL;
		
		URL = g_reportDataURL;
		URL += "&WORK_DATE=" + fnDateTrim($('#search_ReportYMD').val());
		
		if( oReport != null ) {
			oReport.fnReloadAjax(URL);
		} else {
			oReport = $('#report').dataTable( {	         	
				"bProcessing": true,
				"bPaginate": false,
				"bSort": false,
				"bInfo": false,
				"bFilter": false,
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
								{"sClass" : "center"},
								{"sClass" : "center"}
				              ],
	             "fnServerData": function(sSource, aoData, fnCallback ) {
	  	            $.ajax( {
	  	                "dataType": 'json',
	  	                "url": sSource,
	  	                "data": aoData,
	  	                "success": function(data, textStatus, jqXHR) {
	  	                	$("#WORK_DATE").val(fnDateTrim($('#search_ReportYMD').val()));
	  	                	$("#WW_CODE_LIST").val(data.sWW_CODE_LIST);
	  	                	
	  	                	fnCallback(data, textStatus, jqXHR);
	  	               }
	  	            } );
	  	        }
			}).fnFakeRowColspan();
		}
	}
	
	$(document).ready(function() {
		// �޷� ����
		$("#search_ReportYMD").datepicker();
		
		updateReport();
	});

	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSearch()
	{
		updateReport();
	}
	
	function fnSave()
	{		
		var theForm;
		
		theForm = document.sendForm;
		theForm.submit();
	}
	
	function fnCheckSel(id, wwCode)
	{
		var checked;
		
		if( id == 1 ) {
			checked = $("#CHECK_SEL1_" + wwCode).is(":checked");
			if( checked ) {
				$("#CHECK_YN_" + wwCode).attr("disabled", false);
				$("#UNUSUAL_YN_" + wwCode).attr("disabled", false);
				$("#UNUSUAL_CONTENT_" + wwCode).attr("disabled", false);				
			} else {
				$("#CHECK_YN_" + wwCode).attr("disabled", true);
				$("#UNUSUAL_YN_" + wwCode).attr("disabled", true);
				$("#UNUSUAL_CONTENT_" + wwCode).attr("disabled", true);
			}
		} else {
			checked = $("#CHECK_SEL2_" + wwCode).is(":checked");
			if( checked ) {
				$("#CONFIRM_CONTENT_" + wwCode).attr("disabled", false);
			} else {
				$("#CONFIRM_CONTENT_" + wwCode).attr("disabled", true);
			}
		}
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/oper/20130829_swn_stitle61.jpg">
		</td>
	</tr>
	<tr>
		<td>
		<table width="100%" cellspacing="1" cellpadding="0" style="background-color: #666666;">
			<tr>
				<td width=10% class='swn_tbl_title'>��ȸ����</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<input type="text" id="search_ReportYMD" class="inputbox"  readonly
                            	style="width:100px; ime-mode:disabled;" maxlength="10" 
                            	value="<%=searchReportYMD%>" onkeypress="key_NumberOnly();">
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr><td height=5></td></tr>
	<tr>
		<td align=right><a href="javascript:fnSearch();"><img src="${pageContext.request.contextPath}/images/comm/20090514_swn_btn_search.gif" border=0 ></a></td>
	</tr>
	<tr><td height=30></td></tr>
	</table>
	</div>	
	<form name="sendForm" method="POST" action="${pageContext.request.contextPath}/page_oper/oper_result_form.do">
	<input type="hidden" name="WORK_DATE" id="WORK_DATE" value="">
	<input type="hidden" name="WW_CODE_LIST" id="WW_CODE_LIST" value="">
	<input type="hidden" name="USER_ID" id="USER_ID" value="<%=curPage.getUserID()%>">
	<div id="report_form">
	<table width=100% height=100% cellspacing=1 cellpadding=0 id='report' bgcolor=#666666>
		<thead>
		<tr>
			<th height=50 width=10% rowspan=2 align=center bgcolor=#EFEFEF>�����</th>
			<th width=20% rowspan=2 align=center bgcolor=#EFEFEF>���˴��</th>
			<th height=25 width=40% colspan=6 align=center bgcolor=#EFEFEF>���ϸ���͸����</th>
			<th width=30% colspan=4 align=center bgcolor=#EFEFEF>Ȯ�ι���ġ���</th>
		</tr>
		<tr>
			<th width=5% align=center bgcolor=#EFEFEF>�Է¿���</th>
			<th height=25 width=5% align=center bgcolor=#EFEFEF>����</th>			
			<th width=5% align=center bgcolor=#EFEFEF>Ư�̻���</th>
			<th width=15% align=center bgcolor=#EFEFEF>Ư�̻��׳���</th>
			<th width=5% align=center bgcolor=#EFEFEF>������</th>
			<th width=5% align=center bgcolor=#EFEFEF>�Է��Ͻ�</th>
			<th width=5% align=center bgcolor=#EFEFEF>�Է¿���</th>
			<th width=15% align=center bgcolor=#EFEFEF>Ȯ�� �� ��ġ����</th>
			<th width=5% align=center bgcolor=#EFEFEF>Ȯ����</th>
			<th width=5% align=center bgcolor=#EFEFEF>Ȯ���Ͻ�</th>
		</tr>
		</thead>
		<tbody>
		</tbody>
	</table>	
	</div>
	</form>
	<div id="footer_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr><td height=5></td></tr>
	<tr>
		<td>
			<table width=100% height=100% cellspacing=0 cellpadding=0>
			<tr>
				<td align=right>
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