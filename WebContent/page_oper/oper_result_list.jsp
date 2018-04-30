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
curPage.checkAuthority(WebConst.AUTH_OPER_RESULT, true, false);

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// WORK_DATE : �۾� ����
//-----------------------------------------------------------------------------------------------
String paramWorkDate = curPage.getParam("WORK_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMdd"));

String searchReportM_Y, searchReportM_M;
searchReportM_Y = WebUtils.GetCurrentDateTimeFormat("yyyy");
searchReportM_M = WebUtils.GetCurrentDateTimeFormat("MM");
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
	var g_reportDataURL = "oper.page.do?Act=oper_result.list";
	var oReport;
	
	function updateReport()
	{	
		var URL;
		var workDate;
		
		// ��û ���� �����
		workDate = $('#search_ReportM_Y').val() + $('#search_ReportM_M').val();
		
		// ������ ��û URL �����
		URL = g_reportDataURL
			+ "&WORK_DATE=" + workDate
			+ "&ITEMS=WW0000,PR0055,PR0065,PR0183,PR0407,PR0370,PR0710,WW0001,WW0003,WW0005,WW0006,WW0007,WW0009,WW0010,WW0011";
		
		oReport.fnReloadAjax(URL);
		
		// ��¥ �ֱ�
		$("#list_date").html("(" + workDate.substr(0, 4) + "�� " + workDate.substr(4, 2) + "�� " + workDate.substr(6, 2) + "��)");
		
		// ���ϸ� �� �μ� ����Ʈ Ÿ��Ʋ �ֱ�
		$("#titleFileName").val("���Ͽ���"
				+ "_" + workDate);
		$("#titlePrintPage").val("���Ͽ���"
				+ "(" + workDate.substr(0, 4) + "�� " + workDate.substr(4, 2) + "��)");
	}
	
	$(document).ready(function() {
		// �޷� ����
		$('#search_ReportYMD').datepicker();
		
		// �� �����
		var URL;

		URL = "code.list.do?Act=none&COLSPAN=16";
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
			"sAjaxSource": URL,
			"aoColumns": [
							{"sClass" : "center", "sHeight" : "50px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"},
							{"sClass" : "left", "sHeight" : "25px"}
			              ],
			"bServerSide": true,
          	"sScrollX": "100%",
 			"sScrollXInner": "200%",
 	        "bScrollCollapse": true,
 			
 			"fnInitComplete": function() {
 				new FixedColumns(oReport, {"iLeftColumns": 0});
 			}
		} ).fnFakeRowColspan();
		
		updateReport();
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
			<img src="${pageContext.request.contextPath}/images/oper/20130829_swn_stitle62.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" cellspacing="1" cellpadding="0" style="background-color: #666666;">
			<tr>
				<td width=10% height=30 class='swn_tbl_title'>�˻��Ⱓ</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<table cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<select name="search_ReportM_Y" id="search_ReportM_Y">
							<%
								for(int iLoop = 2000; iLoop <= Integer.parseInt(WebUtils.GetCurrentDateTimeFormat("yyyy")) + 2; iLoop ++)
								{
									String sTmp = String.valueOf(iLoop);
									if( iLoop == Integer.parseInt(searchReportM_Y) ) {
										out.println("<option value='" + sTmp + "' selected>" + sTmp + "</option>");	
									} else {
										out.println("<option value='" + sTmp + "'>" + sTmp + "</option>");
									}
								}
							%>
							</select>&nbsp;��
						</td>
						<td width=20px></td>
						<td>
							<select name="search_ReportM_M" id="search_ReportM_M">
							<%
								for( int iLoop = 1; iLoop <= 12; iLoop ++)
								{
									String sTmp = WebUtils.FormatNumber(iLoop, "00");
									if( iLoop == Integer.parseInt(searchReportM_M) ) {
										out.println("<option value='" + sTmp + "' selected>" + sTmp + "</option>");	
									} else {
										out.println("<option value='" + sTmp + "'>" + sTmp + "</option>");
									}
								}
							%>
							</select>&nbsp;��
						</td>
					</tr>
					</table>
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
				<th height=50 width=5% rowspan=2 align=center bgcolor=#EFEFEF>��¥</th>
				<th height=25 colspan=15 align=center bgcolor=#EFEFEF>���ϸ���͸� Ȯ�� �� ��ġ���</th>
			</tr>
			<tr>
				<th align=center bgcolor=#EFEFEF>���� �޼����</th>
				<th align=center bgcolor=#EFEFEF>���ϾƸ�����������</th>
				<th align=center bgcolor=#EFEFEF>���ǾƸ�����������</th>
				<th align=center bgcolor=#EFEFEF>�ҵ��Ƹ�����������</th>
				<th align=center bgcolor=#EFEFEF>�������Ƹ�����������</th>
				<th align=center bgcolor=#EFEFEF>�ϻ�Ƹ�����������</th>
				<th align=center bgcolor=#EFEFEF>���ϾƸ�����������</th>
				<th align=center bgcolor=#EFEFEF>�ߺμ��������</th>
				<th align=center bgcolor=#EFEFEF>���μ��������</th>
				<th align=center bgcolor=#EFEFEF>�Ϻμ��������</th>
				<th align=center bgcolor=#EFEFEF>���μ��������</th>
				<th align=center bgcolor=#EFEFEF>�������������</th>
				<th align=center bgcolor=#EFEFEF>���μ��������</th>
				<th align=center bgcolor=#EFEFEF>�������������</th>
				<th align=center bgcolor=#EFEFEF>�������������</th>
			</tr>
			</thead>
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