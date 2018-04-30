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
// WW_CODE : ��������/��������� �ڵ�
// REPORT_TYPE : ����Ʈ Ÿ��(R:�Ⱓ,H:�ú�,D:�Ϻ�, M:����,Y:����)
// FROM_DATE : �Ⱓ ����Ʈ�� ��� ������ (yyyyMMdd ����)
// TO_DATE : �Ⱓ ����Ʈ�� ��� ������ (yyyyMMdd ����)
// WORK_DATE : �Ⱓ �̿��� ����Ʈ�� ����� ���� (yyyyMMddHH ����)
//-----------------------------------------------------------------------------------------------
String paramWWCode = curPage.getParam("WW_CODE", "");
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
if( paramWWCode.equals("") ) {
	bUpdate = false;
	
	paramWWCode = "";
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
	var g_urlReportItem = "history.page.do?Act=report.range.item";
	var g_urlReportData = "history.page.do?Act=report.range.data";
	var g_param = "";
	var g_items = "";
	var oReport;
	
	var g_choosePointCodes = new Array();
	var g_selectPointCodes = new Array();
	var g_iMaxCol = 9;
	
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
	
	function updatePointCodeList()
	{
		var URL;
		var sHTML;
		var i, iCnt;
		var obj;

		URL = "code.list.do?Act=pcode.waterpath.analpoint.list&WW_CODE=" + $("#search_WWCode").val();
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				g_choosePointCodes = new Array();
				g_selectPointCodes = new Array();				
				
				iCnt = 0;
				sHTML = "<table><tr>";				
				$.each(data.aaItems, function(i, item) {
					if( iCnt == g_iMaxCol ) {
						sHTML += "</tr><tr>";
						iCnt = 0;
					}
					sHTML += "<td>";
					sHTML += "<span id='" + item[0] + "'><a href='javascript:fnSelectPointCode(true, \"" + item[0] + "\")'>" + item[1] + "</a></span>&nbsp&nbsp&nbsp";
					sHTML += "</td>";
					
					iCnt ++;
					
					obj = new Object();
					obj.id = item[0];
					obj.text = item[1];
					obj.select = false;
					
					g_choosePointCodes.push(obj);
		    	});				
				for(i = iCnt; i <= g_iMaxCol; i++ ) {
					sHTML += "<td></td>";
				}
				sHTML += "</tr></table>";
				
				$("#search_ChoosePointCodes").html(sHTML);
				$("#search_SelectPointCodes").html("");
			}
		});
	}
	
	function updateReport()
	{	
		var URL;
		var pointCodes;
		var loop;
		
		if( g_selectPointCodes.length == 0 )
		{
			alert("���õ� ���������� �����ϴ�.\n\n���������� �����Ͻ��� �˻� �ϼ���.");
			return;
		}
		
		pointCodes = "";
		for(loop = 0; loop < g_selectPointCodes.length; loop ++) {
			pointCodes += (pointCodes.length > 0 ? "," : "");
			pointCodes += g_selectPointCodes[loop].id;
		}
		
		// ITEM ��û URL �����
		URL = g_urlReportItem
			+ "&WW_CODE=" + $("#search_WWCode").val()
			+ "&ITEMS=" + pointCodes;
		
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
					URL += "&WW_CODE=" + $('#search_WWCode').val();
					URL += "&REPORT_TYPE=" + $('#search_ReportType').val();
					URL += "&FROM_DATE=" + fromDateParam;
					URL += "&TO_DATE=" + toDateParam;
					URL += "&WORK_DATE=" + workDateParam;
					URL += "&ITEMS=" + data.sPointCodes;
					
					g_param = "";
					g_param += "&WW_CODE=" + $('#search_WWCode').val();
					g_param += "&ANAL_ITEM=TB01"
					g_param += "&REPORT_TYPE=" + $('#search_ReportType').val();
					g_param += "&FROM_DATE=" + fromDateParam;
					g_param += "&TO_DATE=" + toDateParam;
					g_param += "&WORK_DATE=" + workDateParam;
					
					g_items = data.sPointCodes;
					
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
						"bServerSide": true,
						"sAjaxSource": URL,
						
						"sScrollX": "100%",
						"sScrollXInner": data.sPagePerTotal,
				        "bScrollCollapse": true,
						
						"fnInitComplete": function() {
							new FixedColumns(oReport, {"iLeftColumns": 0});
						}
					}).fnFakeRowColspan();
					
					// ���ϸ� �� �μ� ����Ʈ Ÿ��Ʋ �ֱ�
					if( reportType == "R" ) {
						$("#titleFileName").val("��������������_" 
								+ $('#search_WWCode option:selected').text() 
								+ "_" + $('#search_ReportType option:selected').text() 
								+ "_" + fromDateParam + "_" + toDateParam);
						$("#titlePrintPage").val("�������������� " 
								+ $('#search_WWCode option:selected').text() 

								+ " " + $('#search_ReportType option:selected').text() 
								+ "(" + fromDateParam + "~" + toDateParam + ")");	
					} else {
						$("#titleFileName").val("��������������_" 
								+ $('#search_WWCode option:selected').text() + "_" 
								+ $('#search_ReportType option:selected').text() + "_"
								+ workDateParam);
						
						$("#titlePrintPage").val("�������������� " 
								+ $('#search_WWCode option:selected').text() 
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
		// �������� �ڵ� �ֱ�
		updateWWCodeList();
		if( "<%=paramWWCode%>" != "" ) {
			$("#search_WWCode").val('<%=paramWWCode%>');
		} else {
			$("#search_WWCode option:eq(0)").attr("selected","selected");
		}
		
		// ����Ʈ Ÿ�� �ֱ� �� �˻� �Ⱓ �ֱ�
		if( "<%=paramReportType%>" != "" ) {
			$("#search_ReportType").val('<%=paramReportType%>');
		} else {
			$("#search_ReportType option:eq(0)").attr("selected","selected");
		}
		updateReportTypeList();
		
		// �������� �ֱ�
		updatePointCodeList();
		
		// �޷� ����
		$('#search_ReportR_FromYMD').datepicker();
		$('#search_ReportR_ToYMD').datepicker();
		$('#search_ReportH_YMD').datepicker();
		$('#search_ReportD_YMD').datepicker();
		
		// �̺�Ʈ ����
		$('#search_WWCode').change(function() {
			// �������� ����Ʈ ����
			updatePointCodeList();
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
	function fnSelectPointCode(select, id)
	{
		var loop, iCnt;
		var sHTML;
		var obj;
		var index;
		
		obj = null;
		
		// ������ �����ۿ��� ����Ʈ Ȯ��
		for(loop = 0; loop < g_choosePointCodes.length; loop ++)
		{
			if( g_choosePointCodes[loop].id == id ) {
				g_choosePointCodes[loop].select = select;
				
				obj = g_choosePointCodes[loop]; 
				break;
			}
		}
		
		// ������ ������ ����Ʈ
		sHTML = "<table><tr>";
		iCnt = 0;
		for(loop = 0; loop < g_choosePointCodes.length; loop ++)
		{
			if( g_choosePointCodes[loop].select == false ) {
				if( iCnt == g_iMaxCol ) {
					sHTML += "</tr><tr>";
					iCnt = 0;
				}
				
				sHTML += "<td>";
				sHTML += "<span id='" + g_choosePointCodes[loop].id + "'>";
				sHTML += "<a href='javascript:fnSelectPointCode(true, \"" + g_choosePointCodes[loop].id + "\")'>" + g_choosePointCodes[loop].text + "</a>";
				sHTML += "&nbsp&nbsp&nbsp</span>";
				sHTML += "</td>";
				
				iCnt ++;
			}
		}
		for(loop = iCnt; loop <= g_iMaxCol; loop++ ) {
			sHTML += "<td></td>";
		}
		sHTML += "</tr></table>";
		$("#search_ChoosePointCodes").html(sHTML); 
		
		// ���õ� ������ ����Ʈ
		index = -1;
		for( loop = 0; loop < g_selectPointCodes.length; loop ++)
		{
			if( g_selectPointCodes[loop].id == id ) {
				index = loop;
				break;
			}
		}
		if( index == -1 ) {
			g_selectPointCodes.push(obj);
		} else {
			g_selectPointCodes.splice(index, 1);
		}
		
		// ���õ� ������ ����Ʈ
		sHTML = "<table><tr>";
		iCnt = 0;
		for(loop = 0; loop < g_selectPointCodes.length; loop ++)
		{
			if( iCnt == g_iMaxCol ) {
				sHTML += "</tr><tr>";
				iCnt = 0;
			}
			
			sHTML += "<td>";
			sHTML += "<span id='" + g_selectPointCodes[loop].id + "'>";
			sHTML += "<a href='javascript:fnSelectPointCode(false, \"" + g_selectPointCodes[loop].id + "\")'>" + g_selectPointCodes[loop].text + "</a>";
			sHTML += "&nbsp&nbsp&nbsp</span>";
			sHTML += "</td>";
			
			iCnt ++;
		}
		for(loop = iCnt; loop <= g_iMaxCol; loop++ ) {
			sHTML += "<td></td>";
		}
		sHTML += "</tr></table>";
		$("#search_SelectPointCodes").html(sHTML);
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
		if( g_param == "" || g_items == "" ) {
			alert("���� �ڷḦ ��ȸ �Ͻñ� �ٶ��ϴ�.");
			return;
		}
		
		menuSelectWithPathAndParam("2", "2", "2", "", g_contextPath, g_param + "&ITEMS=" + g_items);
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
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');"><font color=blue><b>����������</b></font></a></td>
				<td width=2></td>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02_ov.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('2', '1', '2', '', '${pageContext.request.contextPath}');"><font color=white><b>���賻 ����������</b></font></a></td>
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
				<td width=10% class='swn_tbl_title'>���輱��</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WWCode" style="width:130px;">
					</select>
				</td>
				<td width=10% class='swn_tbl_title'>���� ����</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
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
							<input type="text" name="search_ReportR_FromYMD" id="search_ReportR_FromYMD" class="inputbox"  readonly
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
			<tr>
				<td class='swn_tbl_title'>��������</td>
				<td id="search_ChoosePointCodes" colspan=3 style="background-color:white; text-align:left; padding-left:5px">
				</td>
			</tr>
			<tr>
				<td class='swn_tbl_title'>��������</td>
				<td id="search_SelectPointCodes" colspan=3 style="background-color:white; text-align:left; padding-left:5px">
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