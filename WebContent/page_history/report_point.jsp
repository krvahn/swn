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

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// WW_TYPE : ��������/��������� ����(P:��������, W:���������)
// WW_CODE : ��������/��������� �ڵ�
// POINT_CODE : �������� �ڵ�
// REPORT_TYPE : ����Ʈ Ÿ��(R:�Ⱓ,H:�ú�,D:�Ϻ�, M:����,Y:����)
// FROM_DATE : �Ⱓ ����Ʈ�� ��� ������ (yyyyMMdd ����)
// TO_DATE : �Ⱓ ����Ʈ�� ��� ������ (yyyyMMdd ����)
// WORK_DATE : �Ⱓ �̿��� ����Ʈ�� ����� ���� (yyyyMMddHH ����)
//-----------------------------------------------------------------------------------------------
String paramWWType = curPage.getParam("WW_TYPE", "");
String paramWWCode = curPage.getParam("WW_CODE", "");
String paramPointCode = curPage.getParam("POINT_CODE", "");
String paramReportType = curPage.getParam("REPORT_TYPE", "H");
String paramFromDate = WebUtils.DateTrim(curPage.getParam("FROM_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMdd")));
String paramToDate = WebUtils.DateTrim(curPage.getParam("TO_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMdd")));
String paramWorkDate = WebUtils.DateTrim(curPage.getParam("WORK_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMddHH")));

boolean bUpdate;
String searchReportR_FromYMD, searchReportR_ToYMD;
String searchReportH_YMD, searchReportH_H;
String searchReportD_YMD;
String searchReportM_Y, searchReportM_M;
String searchReportY_Y;

paramWorkDate = (paramWorkDate + "0000000000").substring(0, 10);

searchReportR_FromYMD = WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd");
searchReportR_ToYMD = WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd");

searchReportH_YMD = WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd");
searchReportH_H = WebUtils.GetCurrentDateTimeFormat("HH");

searchReportD_YMD = WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd");

searchReportM_Y = WebUtils.GetCurrentDateTimeFormat("yyyy");
searchReportM_M = WebUtils.GetCurrentDateTimeFormat("MM");	

searchReportY_Y = WebUtils.GetCurrentDateTimeFormat("yyyy");

if( paramReportType.equals("R") ) {
	searchReportR_FromYMD = WebUtils.String2DateTimeFormat(paramFromDate, "yyyyMMdd", "yyyy-MM-dd");
	searchReportR_ToYMD = WebUtils.String2DateTimeFormat(paramToDate, "yyyyMMdd", "yyyy-MM-dd");
} else if( paramReportType.equals("H") ) {
	searchReportH_YMD = WebUtils.String2DateTimeFormat(paramWorkDate, "yyyyMMddHH", "yyyy-MM-dd");
	searchReportH_H = WebUtils.String2DateTimeFormat(paramWorkDate, "yyyyMMddHH", "HH");
} else if( paramReportType.equals("D") ) {
	searchReportD_YMD = WebUtils.String2DateTimeFormat(paramWorkDate, "yyyyMMddHH", "yyyy-MM-dd");
} else if( paramReportType.equals("M") ) {
	searchReportM_Y = WebUtils.String2DateTimeFormat(paramWorkDate, "yyyyMMddHH", "yyyy");
	searchReportM_M = WebUtils.String2DateTimeFormat(paramWorkDate, "yyyyMMddHH", "MM");
} else if( paramReportType.equals("Y") ) {
	searchReportY_Y = WebUtils.String2DateTimeFormat(paramWorkDate, "yyyyMMddHH", "yyyy");
}

bUpdate = true;
if( paramWWType.equals("") || paramWWCode.equals("") || paramPointCode.equals("") ) {
	bUpdate = false;
	
	paramWWType = "";
	paramWWCode = "";
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
	var g_urlReportItem = "history.page.do?Act=report.point.item";
	var g_urlReportData = "history.page.do?Act=report.point.data";
	var g_param = "";
	var g_items = "";
	var oReport;	
	
	function updateWWTypeList()
	{		
		$("#search_WWType").empty().data('option');
		
		$("#search_WWType").append("<option value='P'>�Ƹ�����������</option>");
		$("#search_WWType").append("<option value='W'>���������</option>");
	}
	
	function updateWWCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=pcode.list";
		if(  $("#search_WWType").val() == "W" ) {
			URL = "code.list.do?Act=wcode.list";
		}
	
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
	
	function updatePointCodeList()
	{	
		var URL;

		URL = "code.list.do?Act=pcode.analpoint.list&WW_CODE=" + $("#search_WWCode").val();
		if(  $("#search_WWType").val() == "W" ) {
			URL = "code.list.do?Act=wcode.analpoint.list&WW_CODE=" + $("#search_WWCode").val();
		}
	
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
	
	function updateReportTypeList()
	{
		var reportType;
		
		reportType = $("#search_ReportType").val();
		
		$("#select_report_range").css("display", "none");
		$("#select_report_hour").css("display", "none");
		$("#select_report_day").css("display", "none");
		$("#select_report_month").css("display", "none");
		$("#select_report_year").css("display", "none");
		
		if(reportType == "R") {
			$("#select_report_range").css("display", "");
		} else if(reportType == "H") {
			$("#select_report_hour").css("display", "");
		} else if(reportType == "M") {
			$("#select_report_month").css("display", "");
		} else if(reportType == "Y") {
			$("#select_report_year").css("display", "");
		} else {
			$("#select_report_day").css("display", "");
		}
	}
	
	function updateReport()
	{		
		var URL;
		
		// ITEM ��û URL �����
		URL = g_urlReportItem 
				+ "&WW_TYPE=" + $('#search_WWType').val()
				+ "&WW_CODE=" + $('#search_WWCode').val()
				+ "&POINT_CODE=" + $('#search_PointCode').val();
		
		g_param = "";
		g_items = "";
		
		// ������ ���� ���� ����
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				var URL;
				var sHTML;		
				var reportType;
				var fromDateParam, toDateParam, workDateParam;
			
				if( data.isData ) {
					sHTML = "";
					sHTML += "<table width=100% cellspacing=0 cellpadding=0 bgcolor=white>"
					sHTML += "<tr>";
					sHTML += "<td width=20></td>";
					sHTML += "<td height=30 align=left>";
					sHTML += "<img src='"+ g_contextPath + "/images/comm/20081212_swn_dbullet01.gif' style='margin-bottom:2px; margin-right:4px;'>";
					sHTML += "<font color=#00375D><b>" + ($("#search_WWType").val() == "P" ? "������ : " : "���ް��� : ") + data.sPointName + "</b></font>";
					sHTML += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
					sHTML += "<img src='"+ g_contextPath + "/images/comm/20081212_swn_dbullet01.gif' style='margin-bottom:2px; margin-right:4px;'>";
					sHTML += "<font color=#00375D><b>" + ($("#search_WWType").val() == "P" ? "�������͸� : " : "���޼��� : ") + data.sWWName + "</b></font>";
					sHTML += "</td>";
					if( data.sPointName == '������' ) {
						sHTML += "<td align=right width=20%>";
						sHTML += "<table width=100% border=0 cellspacing=1 cellpadding=2>";
						sHTML += "<tr align=center>";
						sHTML += "<td bgcolor=#C3E4FF>�����׸�</td>";
						//sHTML += "<td bgcolor=#FFFFFF>" + data.sItemName + "</td>";
						sHTML += "<td bgcolor=#FFFFFF>Ź��</td>";
						sHTML += "<td bgcolor=#C3E4FF>����</td>";
						sHTML += "<td bgcolor=#FFFFFF>" + data.sItemUnit + "</td>";
						sHTML += "</tr>";
						sHTML += "</table>";
						sHTML += "</td>";
					}
					sHTML += "</tr>";
					sHTML += "</table>";
					sHTML += "<table width=100% height=100% cellspacing=1 cellpadding=0 id='report'></table>";
					$('#report_form').html(sHTML);
					$('#report').html(data.sDataTable);
					
					reportType = $("#search_ReportType").val();
					
					// ���� �Ķ���� ����					
					fromDateParam = "";
					toDateParam = "";
					workDateParam = "";
					if( reportType == "R" ) {
						fromDateParam = fnDateTrim($('#search_ReportR_FromYMD').val());			
						toDateParam = fnDateTrim($('#search_ReportR_ToYMD').val());
					} else if( reportType == "H" ) {
						workDateParam = fnDateTrim($('#search_ReportH_YMD').val() + $('#search_ReportH_H').val());
					} else if( reportType == "D" ) {
						workDateParam = fnDateTrim($('#search_ReportD_YMD').val() + "00");
					} else if( reportType == "M" ) {
						workDateParam = fnDateTrim($('#search_ReportM_Y').val() + $('#search_ReportM_M').val() + "0100");
					} else if( reportType == "Y" ) {
						workDateParam = fnDateTrim($('#search_ReportY_Y').val() + "010100");
					}
					
					// ������ ��û URL �����					
					URL = g_urlReportData;
					URL += "&WW_TYPE=" + $('#search_WWType').val();
					URL += "&WW_CODE=" + $('#search_WWCode').val();
					URL += "&POINT_CODE=" + $('#search_PointCode').val();
					URL += "&REPORT_TYPE=" + $('#search_ReportType').val();
					URL += "&FROM_DATE=" + fromDateParam;
					URL += "&TO_DATE=" + toDateParam;
					URL += "&WORK_DATE=" + workDateParam;
					URL += "&ITEMS=" + data.sItems;
					
					g_param = "";
					g_param += "&WW_TYPE=" + $('#search_WWType').val();
					g_param += "&WW_CODE=" + $('#search_WWCode').val();
					g_param += "&POINT_CODE=" + $('#search_PointCode').val();
					g_param += "&REPORT_TYPE=" + $('#search_ReportType').val();
					g_param += "&FROM_DATE=" + fromDateParam;
					g_param += "&TO_DATE=" + toDateParam;
					g_param += "&WORK_DATE=" + workDateParam;
					
					g_items = data.sItems;
					
					// Data Table �����
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
							            		 oFlash.setFileName($("#titleFileName").val() + ".xls");
							            		 this.fnSetText(oFlash, this.fnGetTableDataForXLS(oConfig));
							            	 }
							             }, {
							            	 "sExtends": "print",
							            	 "sButtonText": "������ ���",
							            	 "fnClick": function(nButton, oConfig ) {
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
						"aoColumns": data.aoColumns,
						"sAjaxSource": URL,
						"fnFooterCallback": function ( nRow, aaData, iStart, iEnd, aiDisplay ) {
							var loop, index, value, aoData;
							var aoItems;
							var aoCnt, aoMin, aoMax, aoSum;
							
							aoItems = (data.sItems).split(",");
							if( aaData != null && aaData.length > 0 ) {
								aoCnt = new Array(aaData[0].length);
								aoMin = new Array(aaData[0].length);
								aoMax = new Array(aaData[0].length);
								aoSum = new Array(aaData[0].length);
								
								for(loop = 0; loop < aoCnt.length; loop ++) {
									aoCnt[loop] = 0;
									aoMin[loop] = "-";
									aoMax[loop] = "-";
									aoSum[loop] = 0;
								}
								
								// ����, �ִ�, �ּ�, �հ� ���ϱ�
								for( loop = 0; loop < aaData.length; loop ++ ) {
									aoData = aaData[loop];
									for( index = 1; index < aoData.length; index ++) {
										if( aoData[index] != "-" ) {
											aoCnt[index] += 1;
											
											value = fnStrToFloat(aoData[index]);
											aoMax[index] = (aoMax[index] == "-" ? value : ( aoMax[index] > value ? aoMax[index] : value));
											aoMin[index] = (aoMin[index] == "-" ? value : ( aoMin[index] < value ? aoMin[index] : value));											
											aoSum[index] += value;
										}
									}
								}
								
								for( loop = 1; loop < aoCnt.length; loop ++ )
								{	
									if( aoCnt[loop] != 0 ) {
										($("#pointMax_" + loop)).html(getStandardFormat(aoItems[loop - 1], aoMax[loop]));
										($("#pointMax_" + loop)).css("text-align", "right");
										
										($("#pointMin_" + loop)).html(getStandardFormat(aoItems[loop - 1], aoMin[loop]));
										($("#pointMin_" + loop)).css("text-align", "right");
										
										($("#pointAvg_" + loop)).html(getStandardFormat(aoItems[loop - 1], aoSum[loop] / aoCnt[loop]));
										($("#pointAvg_" + loop)).css("text-align", "right");
									}
								}
							}
						}
					}).fnFakeRowColspan();
					
					// ���ϸ� �� �μ� ����Ʈ Ÿ��Ʋ �ֱ�
					if( reportType == "R" ) {
						$("#titleFileName").val("��������������_" 
								+ $('#search_WWCode option:selected').text() 
								+ "_" + $('#search_PointCode option:selected').text() 
								+ "_" + $('#search_ReportType option:selected').text() 
								+ "_" + fromDateParam + "_" + toDateParam);
						$("#titlePrintPage").val("�������������� " 
								+ $('#search_WWCode option:selected').text() 
								+ " " + $('#search_PointCode option:selected').text() 
								+ " " + $('#search_ReportType option:selected').text() 
								+ "(" + fromDateParam + "~" + toDateParam + ")");	
					} else {
						$("#titleFileName").val("��������������_" 
								+ $('#search_WWCode option:selected').text() + "_" 
								+ $('#search_PointCode option:selected').text() + "_" 
								+ $('#search_ReportType option:selected').text() + "_"
								+ workDateParam);
						
						$("#titlePrintPage").val("�������������� " 
								+ $('#search_WWCode option:selected').text() 
								+ " " + $('#search_PointCode option:selected').text() 
								+ " " + $('#search_ReportType option:selected').text() 
								+ "(" + workDateParam + ")");
					}
				} else {
					sHTML = "";
					sHTML += "<table width=100% height=100% cellspacing=2 cellpadding=0 id='report' bgcolor=#EFEFEF>";			
					sHTML += "<tr>";
					sHTML += "<td class='dataTables_empty' height=50 align=center bgcolor=#FFFFFF>�˻��� �����Ͱ� �������� �ʽ��ϴ�.</td>";
					sHTML += "</tr>";			
					sHTML += "</table>";
					
					$('#report_form').html(sHTML);
				}
			}
		});
	}
	
	$(document).ready(function() {
		// ����� ���� �ֱ�
		updateWWTypeList();
		if( "<%=paramWWType%>" != "" ) {
			$("#search_WWType").val('<%=paramWWType%>');
		} else {
			$("#search_WWType option:eq(0)").attr("selected","selected");
		}
		
		// ����Ҹ� �ֱ�
		updateWWCodeList();
		if( "<%=paramWWCode%>" != "" ) {
			$("#search_WWCode").val('<%=paramWWCode%>');
		} else {
			$("#search_WWCode option:eq(0)").attr("selected","selected");
		}
		
		// �������� �ֱ�
		updatePointCodeList();
		if( "<%=paramPointCode%>" != "" ) {
			$("#search_PointCode").val('<%=paramPointCode%>');
		} else {
			$("#search_PointCode option:eq(0)").attr("selected","selected");
		}
		
		// ����Ʈ Ÿ�� �ֱ� �� �˻� �Ⱓ �ֱ�
		if( "<%=paramReportType%>" != "" ) {
			$("#search_ReportType").val('<%=paramReportType%>');
		} else {
			$("#search_ReportType option:eq(0)").attr("selected","selected");
		}
		updateReportTypeList();
		
		// �޷� ����
		$('#search_ReportR_FromYMD').datepicker();
		$('#search_ReportR_ToYMD').datepicker();
		$('#search_ReportH_YMD').datepicker();
		$('#search_ReportD_YMD').datepicker();
		
		// �̺�Ʈ ����
		$('#search_WWType').change(function() {
			// ����Ҹ� ����Ʈ ����
			updateWWCodeList();
			$("#search_WWCode option:eq(0)").attr("selected","selected");
			
			// �������� ����Ʈ ����
			updatePointCodeList();
			$("#search_PointCode option:eq(0)").attr("selected","selected");
		});
		
		$('#search_WWCode').change(function() {
			// �������� ����Ʈ ����
			updatePointCodeList();
			$("#search_PointCode option:eq(0)").attr("selected","selected");
		});
		
		$('#search_ReportType').change(function() {
			// ����Ʈ Ÿ�� ����
			updateReportTypeList();
		});
		
		<%if( bUpdate ) {%>
		// ������ ���� ����		
		updateReport();
		<%}%>
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSelectItem(item)
	{
		if( g_param == "" ) {
			alert("���� �ڷḦ ��ȸ �Ͻñ� �ٶ��ϴ�.");
			return;
		}
		
		menuSelectWithPathAndParam("2", "2", "1", "", g_contextPath, g_param + "&ITEMS=" + item);
	}
	
	function fnSearch()
	{
		updateReport();
	}
	
	function fnExcel()
	{	
	}	
	
	function fnPrint()
	{
	}
	
	function fnTrend()
	{		
		if( g_param == "" ) {
			alert("���� �ڷḦ ��ȸ �Ͻñ� �ٶ��ϴ�.");
			return;
		}
		
		menuSelectWithPathAndParam("2", "2", "1", "", g_contextPath, g_param + "&ITEMS=" + g_items);
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/history/20081212_swn_stitle05.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table cellspacing=0 cellpadding=0>
			<tr>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02_ov.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');"><font color=white><b>����������</b></font></a></td>
				<td width=2></td>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('2', '1', '2', '', '${pageContext.request.contextPath}');"><font color=blue><b>���賻 ����������</b></font></a></td>
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
				<td width=10% class='swn_tbl_title'>����� ����</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px;">
					<select id="search_WWType" style="width:130px;">
					</select>
				</td>
				<td width=10% class='swn_tbl_title'>����Ҹ�</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WWCode" style="width:130px;">
					</select>
				</td>
			</tr>
			<tr>
				<td class='swn_tbl_title'>������ġ</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_PointCode" style="width:130px;">
					</select>
				</td>
				<td class='swn_tbl_title'>���� ����</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_ReportType" style="width:130px;">
						<option value="R">�Ⱓ</option>
						<option value="H" selected>�ú�</option>
						<option value="D">�Ϻ�</option>
						<option value="M">����</option>
						<option value="Y">�⺸</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class='swn_tbl_title'>�˻��Ⱓ</td>
				<td colspan=3 style="background-color:white; text-align:left; padding-left:5px">
					<table>
					<tr height=30>
						<td id="select_report_range" style="display:none">
							<input type="text" name="search_ReportR_FromYMD" id="search_ReportR_FromYMD" class="inputbox" readonly
                            style="width:100px; ime-mode:disabled;" maxlength="10" 
                            value="<%=searchReportR_FromYMD%>" onkeypress="key_NumberOnly();">
		                    ~
		                    <input type="text" name="search_ReportR_ToYMD" id="search_ReportR_ToYMD" class="inputbox" readonly 
		                            style="width:100px; ime-mode:disabled;" maxlength="10" 
		                            value="<%=searchReportR_ToYMD%>" onkeypress="key_NumberOnly();">
						</td>
						<td id="select_report_hour" style="display:none">
							<table cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<input type="text" name="search_ReportH_YMD" id="search_ReportH_YMD" class="inputbox"  readonly
			                            style="width:100px; ime-mode:disabled;" maxlength="10" 
			                            value="<%=searchReportH_YMD%>" onkeypress="key_NumberOnly();">
								</td>
								<td width=20px></td>
								<td>
									<select name="search_ReportH_H" id="search_ReportH_H" style="width:50px;">
									<%
										for( int iLoop = 0; iLoop < 24; iLoop ++)
										{
											String sTmp = WebUtils.FormatNumber(iLoop, "00");
											if( iLoop == Integer.parseInt(searchReportH_H) ) {
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
						<td id="select_report_day" style="display:none">
							<input type="text" name="search_ReportD_YMD" id="search_ReportD_YMD" class="inputbox"  readonly
                            style="width:100px; ime-mode:disabled;" maxlength="10" 
                            value="<%=searchReportD_YMD%>" onkeypress="key_NumberOnly();">
						</td>
						<td id="select_report_month" style="display:none">
							<table cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<select name="search_ReportM_Y" id="search_ReportM_Y">
									<%
										for( int iLoop = 2000; iLoop <= Integer.parseInt(WebUtils.GetCurrentDateTimeFormat("yyyy")) + 2; iLoop ++)
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
						<td id="select_report_year" style="display:none">
							<table cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<select name="search_ReportY_Y" id="search_ReportY_Y">
									<%
										for( int iLoop = 2000; iLoop <= Integer.parseInt(WebUtils.GetCurrentDateTimeFormat("yyyy")) + 2; iLoop ++)
										{
											String sTmp = String.valueOf(iLoop);
											if( iLoop == Integer.parseInt(searchReportY_Y) ) {
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
			</table>
		</td>
	</tr>
	<tr><td height=5></td></tr>
	<tr>
		<td align=right>
			<a href="javascript:fnTrend();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_trend.gif" border=0 ></a>&nbsp;&nbsp;
			<a href="javascript:fnSearch();"><img src="${pageContext.request.contextPath}/images/comm/20090514_swn_btn_search.gif" border=0 ></a>
		</td>
	</tr>
	<tr><td height=30></td></tr>
	</table>
	</div>
	<div id="report_form">
	<table width=100% height=100% cellspacing=2 cellpadding=0 id="report" bgcolor=#EFEFEF>			
	<tr>
		<td class="dataTables_empty" height=50 align=center bgcolor=#FFFFFF>������ ������ �˻��Ͽ� �ֽʽÿ�.</td>
	</tr>			
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