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
curPage.checkAuthority(WebConst.AUTH_LAB_MEASURE_VALUE, true, false);

//-----------------------------------------------------------------------------------------------
//�Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// WORK_DATE : �۾� ����
// WATER_TYPE : �׸񱸺�(����, ����)
// CHECK_CYCLE : �����ֱ� (�ְ�, ����, �б�)
//-----------------------------------------------------------------------------
String paramWaterType = curPage.getParam("WATER_TYPE", "");
String paramCheckCycle = curPage.getParam("CHECK_CYCLE", "");
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
	var g_reportDataURL = "manual_value.page.do?Act=lab_manual_value_water.list";
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
		// �˻� ���� �ֱ�
		$("#search_text").html($("#search_CheckCycle option:selected").text());
		
		var URL;
		
		URL = g_reportDataURL;
		URL += "&WATER_TYPE=" + $("#search_WaterType").val();
		URL += "&CHECK_CYCLE=" + $("#search_CheckCycle").val();
		URL += "&WORK_DATE=" + fnDateTrim($('#search_ReportYMD').val());
		alert(URL);
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
	  	                	$("#WATER_TYPE").val($("#search_WaterType").val());
	  	                	$("#CHECK_CYCLE").val($("#search_CheckCycle").val());
	  	                	$("#WORK_DATE").val(fnDateTrim($('#search_ReportYMD').val()));
	  	                	$("#ITEM_LIST").val(data.sITEM_LIST);
	  	                	
	  	                	if( data.bEXIST ) {
	  	                		$("#delete_btn").css("display", "");
	  	                	} else {
	  	                		$("#delete_btn").css("display", "none");
	  	                	}
	  	                	
	  	                	fnCallback(data, textStatus, jqXHR);
	  	               }
	  	            } );
	  	        }
			}).fnFakeRowColspan();
		}
	}
	
	$(document).ready(function() {
		// �޷� ����
		$('#search_ReportYMD').datepicker();

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
		
		// �̺�Ʈ ����
		$('#search_ReportYMD').change(function() {
			updateReport();
		});
		
		$('#search_WaterType').change(function() {
			updateReport();
		});	
		
		$('#search_CheckCycle').change(function() {
			updateReport();
		});
		
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
		var URL;
		var theForm;
		
		theForm = document.sendForm;
		theForm.MODE.value = "";
		theForm.submit();
	}
	
	function fnDelete()
	{
		var URL;
		var theForm;
		
		theForm = document.sendForm;
		theForm.MODE.value = "delete";
		theForm.submit();
	}
	
	function fnCancel()
	{		
		var theForm;
		
		theForm = document.sendForm;
		theForm.reset();
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/manual/20081212_swn_stitle18.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table cellspacing=0 cellpadding=0>
			<tr>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '2', '1', '', '${pageContext.request.contextPath}');"><font color=blue><b>��������</b></font></a></td>
				<td width=2></td>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02_ov.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '2', '2', '', '${pageContext.request.contextPath}');"><font color=white><b>�����������</b></font></a></td>
			</tr>
			</table>
		</td>		
	</tr>
	<tr><td height=2 bgcolor=#00375D></td></tr>
	<tr><td height=10></td></tr>
	<tr>
		<td>
			<table width="100%" cellspacing="1" cellpadding="0" style="background-color: #666666;">
			<tr>
				<td width=10% class='swn_tbl_title'>�Է�����</td>
				<td colspan=3 style="background-color:white; text-align:left; padding-left:5px">
					<table>
					<tr height=30>
						<td>
							<input type="text" name="search_ReportYMD" id="search_ReportYMD" class="inputbox"  readonly
                            	style="width:100px; ime-mode:disabled;" maxlength="10" 
                            	value="<%=searchReportYMD%>" onkeypress="key_NumberOnly();">		                        
						</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width=10% class='swn_tbl_title'>�˻���</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">�����������</td>
				<td width=10% class='swn_tbl_title'>����</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WaterType" style="width:150px;">
						<option value='O'>����</option>
						<option value='P'>����</option>
					</select>					
				</td>
			</tr>			
			<tr>
				<td class='swn_tbl_title'>�Է��׸�</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_CheckCycle" style="width:150px;">
						<option value='W'>�ְ��˻��׸�</option>
						<option value='M'>�����˻��׸�</option>
						<option value='Q'>�б�˻��׸�</option>
					</select>					
				</td>
				<td class='swn_tbl_title'>�Է���</td>
				<td style="background-color:white; text-align:left; padding-left:5px"><%=curPage.getUserName()%></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr><td height=30></td></tr>
	</table>
	</div>
	<form name="sendForm" method="POST" action="${pageContext.request.contextPath}/page_manual/lab_measure_value_water_form.do">
	<input type=hidden name="MODE" id="MODE" value="">
	<input type=hidden name="WORK_DATE" id="WORK_DATE" value="">
	<input type=hidden name="WATER_TYPE" id="WATER_TYPE" value="">
	<input type=hidden name="CHECK_CYCLE" id="CHECK_CYCLE" value="">
	<input type=hidden name="ITEM_LIST" id="ITEM_LIST" value="">
	<div id="report_form">
	<table width=100% height=100% cellspacing=0 cellpadding=0>	
	<tr>
		<td>
			<img src='${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif' style='margin-bottom:2px; margin-right:4px;'><b><font color=#003750><span id="search_text"></span></font></b>
		</td>
	</tr>
	</table>
	<table width=100% height=100% cellspacing=1 cellpadding=0 id='report'>
		<thead>
		<tr>	
			<th rowspan=2 height=50 align=center bgcolor=#EFEFEF>����</th>
			<th rowspan=2 align=center bgcolor=#EFEFEF>�����׸�</th>
			<th colspan=2 height=25 align=center bgcolor=#EFEFEF>����ȯ�� ����</th>
			<th colspan=2 align=center bgcolor=#EFEFEF>�Դ¹� ��������</th>
			<th colspan=6 align=center bgcolor=#EFEFEF>������</th>
		</tr>
		<tr>
			<th height=25 align=center bgcolor=#EFEFEF>����</th>
			<th align=center bgcolor=#EFEFEF>����</th>
			<th align=center bgcolor=#EFEFEF>����</th>
			<th align=center bgcolor=#EFEFEF>����</th>				
			<th align=center bgcolor=#EFEFEF>����</th>
			<th align=center bgcolor=#EFEFEF>����</th>
			<th align=center bgcolor=#EFEFEF>�ҵ�</th>
			<th align=center bgcolor=#EFEFEF>������</th>
			<th align=center bgcolor=#EFEFEF>�ϻ�</th>
			<th align=center bgcolor=#EFEFEF>����</th>
		</tr>
		</thead>
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
					<a href="javascript:fnDelete();" id="delete_btn" style="display:none;"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_delete.gif" border=0 ></a>&nbsp;&nbsp;
					<a href="javascript:fnSave();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_save.gif" border=0 ></a>&nbsp;&nbsp;
					<a href="javascript:fnCancel();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_cancel.gif" border=0 ></a>
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