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
curPage.checkAuthority(WebConst.AUTH_BASE_LINE_EXEC_PLANT, true, false);

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// WW_CODE : �������� �ڵ�
// FACTORY_CODE : ���� �ڵ�
// POINT_CODE : ������ �������� �ڵ�
// FROM_DATE : �˻� �Ⱓ ������ (yyyyMMddHHmm ����)
// TO_DATE : �˻� �Ⱓ ������ (yyyyMMddHHmm ����)
//-----------------------------------------------------------------------------------------------
String paramWWCode = curPage.getParam("WW_CODE", "");
String paramFactoryCode = curPage.getParam("FACTORY_CODE", "");
String paramPointCode = curPage.getParam("POINT_CODE", "");
String paramFromDate = WebUtils.DateTrim(curPage.getParam("FROM_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMdd0000")));
String paramToDate = WebUtils.DateTrim(curPage.getParam("TO_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMddHHmm")));

boolean bUpdate;
String searchReportR_FromYMD, searchReportR_ToYMD;
String searchReportR_FromHour, searchReportR_ToHour;
String searchReportR_FromMin, searchReportR_ToMin;

searchReportR_FromYMD = WebUtils.String2DateTimeFormat(paramFromDate, "yyyyMMddHHmm", "yyyy-MM-dd");
searchReportR_FromHour = WebUtils.String2DateTimeFormat(paramFromDate, "yyyyMMddHHmm", "HH");
searchReportR_FromMin = WebUtils.String2DateTimeFormat(paramFromDate, "yyyyMMddHHmm", "mm");

searchReportR_ToYMD = WebUtils.String2DateTimeFormat(paramToDate, "yyyyMMddHHmm", "yyyy-MM-dd");
searchReportR_ToHour = WebUtils.String2DateTimeFormat(paramToDate, "yyyyMMddHHmm", "HH");
searchReportR_ToMin = WebUtils.String2DateTimeFormat(paramToDate, "yyyyMMddHHmm", "mm");

bUpdate = true;
if( paramWWCode.equals("") || paramFactoryCode.equals("") || paramPointCode.equals("") ) {
	bUpdate = false;
	
	paramWWCode = "";
	paramFactoryCode = "";
	paramPointCode = "";
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
	var g_urlReportData = "system.page.do?Act=base_line_exec.plant";
	var oReport;	
	
	function updateWWCodeList()
	{	
		var URL;
		
		URL = "code.list.do?Act=pcode.list";	
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_WWCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_WWCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateFactoryCodeList()
	{
		URL = "code.list.do?Act=pcode.factory.list&WW_CODE=" + $("#search_WWCode").val();
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_FactoryCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_FactoryCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updatePointCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=pcode.factory.analpoint.list&WW_CODE=" + $("#search_WWCode").val() + "&FACTORY_CODE=" + $("#search_FactoryCode").val();
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_PointCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_PointCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateReport()
	{
		var URL;
		var fromDate, toDate;
		
		fromDate = "";
		toDate = "";
		

		// ��û ���� �����
		fromDate = fnDateTrim($('#search_ReportR_FromYMD').val());		
		fromDate += fnStrRight("0000" + fnStrTrim($('#search_ReportR_FromHour').val()), 2);
		fromDate += fnStrRight("0000" + fnStrTrim($('#search_ReportR_FromMin').val()), 2);
				
		toDate = fnDateTrim($('#search_ReportR_ToYMD').val());	
		toDate += fnStrRight("0000" + fnStrTrim($('#search_ReportR_ToHour').val()), 2);
		toDate += fnStrRight("0000" + fnStrTrim($('#search_ReportR_ToMin').val()), 2);
		
		// ������ ��û URL �����
		URL = g_urlReportData
			+ "&FROM_DATE=" + fromDate
			+ "&TO_DATE=" + toDate	
			+ "&POINT_CODE=" + $('#search_PointCode').val();
		
		oReport.fnReloadAjax(URL);
		
		// ���ϸ� �� �μ� ����Ʈ Ÿ��Ʋ �ֱ�
		$("#titleFileName").val("�溸�̷�_" 
				+ $('#search_WWCode option:selected').text() 
				+ "_" + $('#search_PointCode option:selected').text() 

				+ "_" + fromDate + "_" + toDate);
		$("#titlePrintPage").val("�溸�̷� " 
				+ $('#search_WWCode option:selected').text() 
				+ " " + $('#search_PointCode option:selected').text() 
				+ "(" + fromDate + "~" + fromDate + ")");
	}
	
	$(document).ready(function() {
		// ����� �ڵ� �ֱ�
		updateWWCodeList();
		if( "<%=paramWWCode%>" != "" ) {
			$("#search_WWCode").val('<%=paramWWCode%>');
		} else {
			$("#search_WWCode option:eq(0)").attr("selected","selected");
		}
		
		// ���� �ڵ� �ֱ�
		updateFactoryCodeList();
		if( "<%=paramFactoryCode%>" != "" ) {
			$("#search_FactoryCode").val('<%=paramFactoryCode%>');
		} else {
			$("#search_FactoryCode option:eq(0)").attr("selected","selected");
		}
		
		// ������ ���� ��ġ �ڵ� �ֱ�
		updatePointCodeList();
		if( "<%=paramPointCode%>" != "" ) {
			$("#search_PointCode").val('<%=paramPointCode%>');
		} else {
			$("#search_PointCode option:eq(0)").attr("selected","selected");
		}
		
		// �޷� ����
		$('#search_ReportR_FromYMD').datepicker();
		$('#search_ReportR_ToYMD').datepicker();
		
		// �̺�Ʈ ����
		$('#search_WWCode').change(function() {
			// �����ڵ� ����Ʈ ����
			updateFactoryCodeList();
			$("#search_FactoryCode option:eq(0)").attr("selected","selected");
			
			// ������ �������� ����Ʈ ����
			updatePointCodeList();
			$("#search_PointCode option:eq(0)").attr("selected","selected");
		});
		
		$("#search_FactoryCode").change(function() {
			// ������ �������� ����Ʈ ����
			updatePointCodeList();
			$("#search_PointCode option:eq(0)").attr("selected","selected");
		});
		
		// ���̺� ����
		oReport = $('#report').dataTable( {
			// EXCEL ����, ����Ʈ ��� ���
			"sDom": '<"clear">lfrtipT',
			"oTableTools": {
				"sSwfPath": "${pageContext.request.contextPath}/import/extra/copy_csv_xls_pdf.swf",
				"aButtons": [ 
				             {
				            	 "sExtends": "xls",
				            	 "sButtonText": "���� ���� ����",
				            	 "fnClick": function(nButton, oConfig, oFlash) {
				            		 if( $("#titleFileName").val() == "" ) {
				            			 alert("�ڷ� �˻��� ���Ϸ� �����ϼ���.");
				            			 return;
				            		 }
				            		 
				            		 oFlash.setFileName($("#titleFileName").val() + ".xls");
				            		 this.fnSetText(oFlash, this.fnGetTableDataForXLS(oConfig));
				            	 }
				             }, {
				            	 "sExtends": "print",
				            	 "sButtonText": "������ ���",
				            	 "fnClick": function(nButton, oConfig ) {
				            		 if( $("#titlePrintPage").val() == "" ) {
				            			 alert("�ڷ� �˻��� �����ͷ� ����ϼ���.");
				            			 return;
				            		 }
				            		 
				            		 oConfig.sMessage = "<center><font style='font-size: 12pt;'>" + $("#titlePrintPage").val() + "</font></center><br><br>";
				            		 this.fnPrint(true, oConfig);
				            		 window.print();
				            		 this._fnPrintEnd(null);
				            	 }
				             }
				             ]
         	},
         	
			"bProcessing": true,
			"bPaginate": false,
			"bSort": false,
			"bInfo": false,
			"bFilter": false,
			"oLanguage": {
				"sProcessing" : "�ڷḦ �˻� ���Դϴ�."
			},
			"sAjaxSource": "code.list.do?Act=none&COLSPAN=7",
			"aoColumns": [
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "right"}
			              ]
		} ).fnFakeRowColspan();
		
		<%if( bUpdate ) {%>
		// ������ ���� ����		
		updateReport();
		<%}%>
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSearch()
	{
		updateReport();
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090511_swn_stitle04.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table cellspacing=0 cellpadding=0>
			<tr>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02_ov.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('99', '6', '1', '', '${pageContext.request.contextPath}');"><font color=white><b>��������</b></font></a></td>
				<td width=2></td>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('99', '6', '2', '', '${pageContext.request.contextPath}');"><font color=blue><b>���������</b></font></a></td>
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
				<td width=10% class='swn_tbl_title'>�˻��Ⱓ</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<table>
					<tr height=30>
						<td>
							<input type="text" name="search_ReportR_FromYMD" id="search_ReportR_FromYMD" class="inputbox"  readonly
                            	style="width:100px; ime-mode:disabled;" maxlength="10" 
                            	value="<%=searchReportR_FromYMD%>" onkeypress="key_NumberOnly();">
                            <input type="text" name="search_ReportR_FromHour" id="search_ReportR_FromHour" class="inputbox"
                            	style="width:20px; ime-mode:disabled;" maxlength="2" 
                            	value="<%=searchReportR_FromHour%>" onkeypress="key_NumberOnly();">
                            :&nbsp;<input type="text" name="search_ReportR_FromMin" id="search_ReportR_FromMin" class="inputbox"
                            	style="width:20px; ime-mode:disabled;" maxlength="2" 
                            	value="<%=searchReportR_FromMin%>" onkeypress="key_NumberOnly();">
		                    &nbsp;~&nbsp;
		                    <input type="text" name="search_ReportR_ToYMD" id="search_ReportR_ToYMD" class="inputbox" readonly 
		                        style="width:100px; ime-mode:disabled;" maxlength="10" 
		                        value="<%=searchReportR_ToYMD%>" onkeypress="key_NumberOnly();">
							<input type="text" name="search_ReportR_ToHour" id="search_ReportR_ToHour" class="inputbox"
                            	style="width:20px; ime-mode:disabled;" maxlength="2" 
                            	value="<%=searchReportR_ToHour%>" onkeypress="key_NumberOnly();">
                            :&nbsp;<input type="text" name=search_ReportR_ToMin id="search_ReportR_ToMin" class="inputbox"
                            	style="width:20px; ime-mode:disabled;" maxlength="2" 
                            	value="<%=searchReportR_ToMin%>" onkeypress="key_NumberOnly();">		                        
						</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class='swn_tbl_title'>����Ҹ�</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WWCode" style="width:130px;">
					</select>
				</td>
			</tr>			
			<tr>
				<td class='swn_tbl_title'>������ġ��</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_FactoryCode" style="width:130px;">
					</select>&nbsp;					
					<select id="search_PointCode" style="width:130px;">
					</select>					
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
	<div id="report_form">
	<table width=100% height=100% cellspacing=1 cellpadding=0 id='report'>
		<thead>
		<tr>
			<th rowspan=2 align=center bgcolor=#EFEFEF>����Ҹ�</th>
			<th rowspan=2 align=center bgcolor=#EFEFEF>������ġ��</th>
			<th rowspan=2 align=center bgcolor=#EFEFEF>�����ð�</th>
			<th rowspan=2 align=center bgcolor=#EFEFEF>�����׸�</th>
			<th colspan=2 height=25 align=center bgcolor=#EFEFEF>����ġ</th>
			<th rowspan=2 align=center bgcolor=#EFEFEF>����ġ</th>
		</tr>
		<tr>
			<th height=25 align=center bgcolor=#EFEFEF>�ֻ���</th>
			<th align=center bgcolor=#EFEFEF>������</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan=8>��ȸ ������ �����Ͻʽÿ�.</td>
		</tr>
		</tbody>
	</table>
	</div>
	<div id="footer_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td height=30></td>
	</tr>
	</table>
	</div>
	<input type="hidden" name="titleFileName" id="titleFileName" value="">
	<input type="hidden" name="titlePrintPage" id="titlePrintPage" value="">
</body>
</html>
<%
// ����
curPage = null;
%>