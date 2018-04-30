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
//-----------------------------------------------------------------------------------------------

String currentFromDate = WebUtils.GetCurrentDateTimeFormat("yyyyMMdd");
String currentToDate = WebUtils.GetCurrentDateTimeFormat("yyyyMMdd");
String currentWorkDate = WebUtils.GetCurrentDateTimeFormat("yyyyMMddHH");

boolean bUpdate;
String searchReportR_FromYMD, searchReportR_ToYMD;
String searchReportH_YMD, searchReportH_H;
String searchReportD_YMD;
String searchReportM_Y, searchReportM_M;
String searchReportY_Y;

currentWorkDate = (currentWorkDate + "0000000000").substring(0, 10);

searchReportR_FromYMD = WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd");
searchReportR_ToYMD = WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd");

searchReportH_YMD = WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd");
searchReportH_H = WebUtils.GetCurrentDateTimeFormat("HH");

searchReportD_YMD = WebUtils.GetCurrentDateTimeFormat("yyyy-MM-dd");

searchReportM_Y = WebUtils.GetCurrentDateTimeFormat("yyyy");
searchReportM_M = WebUtils.GetCurrentDateTimeFormat("MM");	

searchReportY_Y = WebUtils.GetCurrentDateTimeFormat("yyyy");
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

<!-- jqplot ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<!--[if IE]><script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/excanvas.min.js"></script><![endif]-->
<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/jquery.jqplot.min.css");
-->
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/jquery.jqplot.min.css" rel="stylesheet" />
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.jqplot.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/plugins/jqplot.dateAxisRenderer.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/plugins/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/plugins/jqplot.canvasAxisTickRenderer.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/plugins/jqplot.cursor.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/plugins/jqplot.highlighter.min.js"></script>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	var g_urlChartData = "history.page.do?Act=trend.provider";
	var oChart;
	
	function updateContentCompare()
	{
		var compareCnt;
		
		compareCnt = $("#search_CompareCnt").val();
		
		$("#select_compare_content_one").css("display", "none");
		$("#select_compare_content_two").css("display", "none");
		$("#select_compare_content_three").css("display", "none");
		$("#select_report_month").css("display", "none");
		$("#select_report_year").css("display", "none");
		
		if(compareCnt == "2") {
			$("#select_compare_content_one").css("display", "");
		} else if(compareCnt == "4") {
			$("#select_compare_content_one").css("display", "");
			$("#select_compare_content_two").css("display", "");
		} else if(compareCnt == "6") {
			$("#select_compare_content_one").css("display", "");
			$("#select_compare_content_two").css("display", "");
			$("#select_compare_content_three").css("display", "");
		}
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
	
	function updateContentWWCodeList()
	{
		var i;
		var searchType;
		var strWWCodeID, strPointCodeID;
		var URL;
		
		searchType = $("input[name='search_WWType']:checked").val();
		
		// ��������� ����
		URL = "code.list.do?Act=pcode.list";
		if( searchType == "W" ) {
			URL = "code.list.do?Act=wcode.list";
		}
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				for(i = 1; i <= 6; i++) {
					// ���̵� ����
					strWWCodeID = "#search_WWCode_" + i;
					strPointCodeID = "#search_PointCode_" + i;
					
					$(strWWCodeID).empty().data('option');
					$.each(data.aaItems, function(i, item) {
						$(strWWCodeID).append("<option value='" + item[0] + "'>" + item[1] + "</option>");
			    	});
					$(strWWCodeID + " option:eq(0)").attr("selected","selected");
					
					updateContentPointCodeList($(strWWCodeID), $(strPointCodeID))
				}
			}
		});
	}
	
	function updateContentPointCodeList(objWWCode, objPointCode)
	{
		var URL;
		var searchType;
		
		searchType = $("input[name='search_WWType']:checked").val();
		
		// �������� ����
		URL = "code.list.do?Act=pcode.analpoint.list&WW_CODE=" + objWWCode.val();
		if( searchType == "W" ) {
			URL = "code.list.do?Act=wcode.analpoint.list&WW_CODE=" + objWWCode.val();
		}
				
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				objPointCode.empty().data('option');
				$.each(data.aaItems, function(i, item) {
					objPointCode.append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateChart()
	{	
		var URL;
		var reportType;
		var fromDateParam, toDateParam;
		var workDateParam;
		var items;
		var iCnt;
		var sWorkDate;
		
		fromDateParam = "";
		toDateParam = "";
		workDateParam = "";
		items = "";
		sWorkDate = "";
		
		// ��û ���� �����		
		reportType = $('#search_ReportType').val();
		if( reportType == "R" ) {
			fromDateParam = fnDateTrim($('#search_ReportR_FromYMD').val());			
			toDateParam = fnDateTrim($('#search_ReportR_ToYMD').val());
			
			sWorkDate = $('#search_ReportR_FromYMD').val() + " ~ " + $('#search_ReportR_ToYMD').val();
		} else if( reportType == "H" ) {
			workDateParam = fnDateTrim($('#search_ReportH_YMD').val() + $('#search_ReportH_H').val());
			
			sWorkDate = $('#search_ReportH_YMD').val() + " " + $('#search_ReportH_H').val() + "��";
		} else if( reportType == "D" ) {
			workDateParam = fnDateTrim($('#search_ReportD_YMD').val() + "00");
			
			sWorkDate = $('#search_ReportD_YMD').val();
		} else if( reportType == "M" ) {
			workDateParam = fnDateTrim($('#search_ReportM_Y').val() + $('#search_ReportM_M').val() + "0100");
			
			sWorkDate = $('#search_ReportM_Y').val() + "�� " + $('#search_ReportM_M').val() + "��";
		} else if( reportType == "Y" ) {
			workDateParam = fnDateTrim($('#search_ReportY_Y').val() + "010100");
			
			sWorkDate = $('#search_ReportY_Y').val() + "��";
		}
		
		// ���õ� ������ ���
		iCnt = $("#search_CompareCnt").val();
		for( iLoop = 1; iLoop <= iCnt; iLoop ++) {
			strTmp = $('#search_WWCode_' + iLoop).val() + "," + $('#search_PointCode_' + iLoop).val();
			if( items.indexOf(strTmp) >= 0 ) {
				alert("�ߺ��� ���׸��� �����մϴ�.\n�ߺ��� �׸��� �ٽ� ���� �Ͻʽÿ�.");
				return;
			}
			
			items += (items.length > 0 ? "," : "") + strTmp; 
		}
		
		// data ��û URL �����
		URL = g_urlChartData
			+ "&WW_TYPE=" + $("input[name='search_WWType']:checked").val()
			+ "&REPORT_TYPE=" + $('#search_ReportType').val()
			+ "&FROM_DATE=" + fromDateParam
			+ "&TO_DATE=" + toDateParam	
			+ "&WORK_DATE=" + workDateParam		
			+ "&ANAL_ITEM=" + $("input[name='search_AnalItem']:checked").val()
			+ "&ITEMS=" + items;
		
		// ������ ���� ����
		var sTitle = "";
		var angle = -30;
		
		if( $('#search_ReportType').val() == "R") {
			angle = -90;
		}
		sTitle = "���ް����� Ʈ����";
		sTitle += " (" + $('#search_ReportType option:selected').text() + ": " + sWorkDate + ")";
		$("#titleFileName").val("���ް����� Ʈ���� - " + $('#search_ReportType option:selected').text() + " - " + sWorkDate);
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				// ���� ���� �����
				$('#chart').html("");
				$("#chart").css("height", "400px");				
				
				// ���� ���
				oChart = $.jqplot('chart', data.aaData, {
					title: {
						show: true,
						text: sTitle,
						textColor: '#0000FF',
						fontFamily: '�������,verdana,Arial,Helvetica,Sans-Serif',
			    		fontSize: '12pt'
					},
					animate: true,
					animateReplot: true,					
				    axes: {
				    	xaxis: {
				    		renderer: $.jqplot.CategoryAxisRenderer,
				    		
				    		labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
				    		label: '�����ð�',
				    		labelOptions: {
				    			fontFamily: '�������,verdana,Arial,Helvetica,Sans-Serif',
				    			fontSize: '10pt'
				    		},
				    		
				    		tickRenderer: $.jqplot.CanvasAxisTickRenderer ,
					        tickOptions: {
					          angle: angle,
					          fontFamily: '�������,verdana,Arial,Helvetica,Sans-Serif',
					          fontSize: '9pt'
					        },
					        ticks: data.aTicks
				      	},
				      	yaxis: {
				      		labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
				      		max: data.dMax,
				      		min: data.dMin,
				    		label:'������',				    		
				    		labelOptions: {
				    			fontFamily: '�������,verdana,Arial,Helvetica,Sans-Serif',
				    			fontSize: '9pt'
				    		}
				    	}
				    },
				    legend: {
				    	show: true,
				    	location: 'ne'
				    },
				    seriesDefaults: {
				    	rendererOptions: {
				    		lineWidth: 1,
				    		smooth: true
				    	}
				    },
				    series: data.aSeries,
				    highlighter: {
				    	show: true,
				    	showLabel: true,				    	
				    	tooltipLocation: 'ne',
				    	tooltipContentEditor: function(str, seriesIndex, pointIndex, plot) {
				    		var item = plot.series[seriesIndex]["label"];
				    		var date = plot.axes.xaxis.ticks[pointIndex];
				    		var value = plot.data[seriesIndex][pointIndex];				    		
				    		var html = "";
				    		
				    		html += '<span style="color:#000000; font-size:7pt; font-family:�������,verdana,Arial,Helvetica,Sans-Serif;">�����׸�: </span>';
				    		html += '<span style="color:#FF0000; font-size:7pt; font-family:�������,verdana,Arial,Helvetica,Sans-Serif;">' + item + '</span><br>';
				    		html += '<span style="color:#000000; font-size:7pt; font-family:�������,verdana,Arial,Helvetica,Sans-Serif;">������: </span>';
				    		html += '<span style="color:#FF0000; font-size:7pt; font-family:�������,verdana,Arial,Helvetica,Sans-Serif;">' + date + '</span><br>';
				    		html += '<span style="color:#000000; font-size:7pt; font-family:�������,verdana,Arial,Helvetica,Sans-Serif;">������: </span>';
				    		html += '<span style="color:#FF0000; font-size:7pt; font-family:�������,verdana,Arial,Helvetica,Sans-Serif;">' + value + '</span>';
				    		
				    		return html;
				    	} 
				    },
				    cursor: {
				    	show: true,
				    	style: 'crosshair',
					    zoom: true, 
					    looseZoom: true, 
					    showTooltip: true, 
					    followMouse: true, 
					    showVerticalLine: true,
					    showHorizontalLine: true,
					    showTooltipOutsideZoom: true, 
					    constrainOutsideZoom: true
				    }
				});
			}
		});
	}
	
	$(document).ready(function() {
		// �˻� ���� ����
		$("input:radio[name='search_WWType']").filter("input[value='P']").attr("checked", "checked");
		
		// �������� ����
		$("#search_CompareCnt option:eq(0)").attr("selected","selected");
		updateContentCompare();
		
		// ���׸�
		$("input:radio[name='search_AnalItem']").filter("input[value='TB01']").attr("checked", "checked");
		
		// ����Ʈ Ÿ�� �ֱ� �� �˻� �Ⱓ �ֱ�
		$("#search_ReportType").val("H");
		updateReportTypeList();
		
		// ���� ���� �ֱ�
		updateContentWWCodeList();
		
		// �޷� ����
		$('#search_ReportR_FromYMD').datepicker();
		$('#search_ReportR_ToYMD').datepicker();
		$('#search_ReportH_YMD').datepicker();
		$('#search_ReportD_YMD').datepicker();
		
		// �̺�Ʈ ����
		$("input[name='search_WWType']").change(function() {
			updateContentWWCodeList();
		});
		
		$('#search_CompareCnt').change(function() {
			updateContentCompare();
		});
		
		$('#search_ReportType').change(function() {
			// ����Ʈ Ÿ�� ����
			updateReportTypeList();
		});
		
		$('#search_WWCode_1').change(function() { updateContentPointCodeList($('#search_WWCode_1'), $('#search_PointCode_1')); });
		$('#search_WWCode_2').change(function() { updateContentPointCodeList($('#search_WWCode_2'), $('#search_PointCode_2')); });
		$('#search_WWCode_3').change(function() { updateContentPointCodeList($('#search_WWCode_3'), $('#search_PointCode_3')); });
		$('#search_WWCode_4').change(function() { updateContentPointCodeList($('#search_WWCode_4'), $('#search_PointCode_4')); });
		$('#search_WWCode_5').change(function() { updateContentPointCodeList($('#search_WWCode_5'), $('#search_PointCode_5')); });
		$('#search_WWCode_6').change(function() { updateContentPointCodeList($('#search_WWCode_6'), $('#search_PointCode_6')); });
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSearch()
	{
		menuSelectWithPath("2", "1", "1", "", g_contextPath);	
	}
	
	function fnSave()
	{	
		if( $("#titleFileName").val() == "" ) {
			alert("Ʈ���带 ���� ��ȸ �ϼ���.");
			return;
		}
		
		var imgData;		
		imgData = $("#chart").jqplotToImageStr({});

		fnSaveImageFile("hiddenFrm", $("#titleFileName").val(), imgData, g_contextPath);
	}
	
	function fnPrint()
	{		
		if( $("#titleFileName").val() == "" ) {
			alert("Ʈ���带 ���� ��ȸ �ϼ���.");
			return;
		}
		
		var imgData;
		
		imgData = $("#chart").jqplotToImageStr({});

		fnPrintImageFile("hiddenFrm", imgData);
	}
	
	function fnTrend()
	{
		updateChart();
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/history/20081212_swn_stitle06.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table cellspacing=0 cellpadding=0>
			<tr>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('2', '2', '1', '', '${pageContext.request.contextPath}');"><font color=blue><b>����������</b></font></a></td>
				<td width=2></td>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('2', '2', '2', '', '${pageContext.request.contextPath}');"><font color=blue><b>���賻 ����������</b></font></a></td>
				<td width=2></td>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('2', '2', '3', '', '${pageContext.request.contextPath}');"><font color=blue><b>�������Ͱ�</b></font></a></td>
				<td width=2></td>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('2', '2', '4', '', '${pageContext.request.contextPath}');"><font color=blue><b>����ó��������</b></font></a></td>
				<td width=2></td>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02_ov.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('2', '2', '5', '', '${pageContext.request.contextPath}');"><font color=white><b>���ް�����</b></font></a></td>
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
				<td width=10% class='swn_tbl_title'>�˻�����</td>
				<td width=40%  style="background-color:white; text-align:left; padding-left:5px;">
					<input name="search_WWType" type="radio" value='P'>���޼��谣 ����&nbsp;&nbsp;
					<input name="search_WWType" type="radio" value='W'>���� ��������Ұ� ����
				</td>
				<td width=10% class='swn_tbl_title'>��������</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px;">					
					<select id="search_CompareCnt" style="width:130px;">
						<option value="2">2</option>
						<option value="4">4</option>
						<option value="6">6</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class='swn_tbl_title'>���׸�</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<input name="search_AnalItem" type="radio" value='TB01'>Ź��&nbsp;
					<input name="search_AnalItem" type="radio" value='RC01'>�ܷ�����&nbsp;
					<input name="search_AnalItem" type="radio" value='CD01'>����������&nbsp;
					<input name="search_AnalItem" type="radio" value='PH01'>pH&nbsp;
					<input name="search_AnalItem" type="radio" value='TE01'>����
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
			<tr id="select_compare_content_one">
				<td class='swn_tbl_title'>�������� 1</td>
				<td style="background-color:white; text-align:left; padding-left:5px;">
					<select id="search_WWCode_1" style="width:100px;">
					</select>&nbsp;
					<select id="search_PointCode_1" style="width:120px;">
					</select>&nbsp;
				</td>
				<td class='swn_tbl_title'>�������� 2</td>
				<td style="background-color:white; text-align:left; padding-left:5px;">
					<select id="search_WWCode_2" style="width:100px;">
					</select>&nbsp;
					<select id="search_PointCode_2" style="width:120px;">
					</select>
				</td>
			</tr>
			<tr id="select_compare_content_two" style="display:none">
				<td class='swn_tbl_title'>�������� 3</td>
				<td style="background-color:white; text-align:left; padding-left:5px;">
					<select id="search_WWCode_3" style="width:100px;">
					</select>&nbsp;
					<select id="search_PointCode_3" style="width:120px;">
					</select>
				</td>
				<td class='swn_tbl_title'>�������� 4</td>
				<td style="background-color:white; text-align:left; padding-left:5px;">
					<select id="search_WWCode_4" style="width:100px;">
					</select>&nbsp;
					<select id="search_PointCode_4" style="width:120px;">
					</select>
				</td>
			</tr>	
			<tr id="select_compare_content_three" style="display:none">
				<td class='swn_tbl_title'>�������� 5</td>
				<td style="background-color:white; text-align:left; padding-left:5px;">
					<select id="search_WWCode_5" style="width:100px;">
					</select>&nbsp;
					<select id="search_PointCode_5" style="width:120px;">
					</select>
				</td>
				<td class='swn_tbl_title'>�������� 6</td>
				<td style="background-color:white; text-align:left; padding-left:5px;">
					<select id="search_WWCode_6" style="width:100px;">
					</select>&nbsp;
					<select id="search_PointCode_6" style="width:120px;">
					</select>
				</td>
			</tr>				
			</table>
		</td>
	</tr>
	<tr><td height=5></td></tr>
	<tr>
		<td align=right>
			<a href="javascript:fnSearch();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_detail.gif" border=0 ></a>&nbsp;&nbsp;
			<a href="javascript:fnTrend();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_trend.gif" border=0 ></a>
		</td>
	</tr>
	<tr><td height=30></td></tr>
	</table>
	</div>
	<div id="report_form">
		<div id="chart">
			<table width=100% height=100% cellspacing=2 cellpadding=0 bgcolor=#EFEFEF>			
			<tr>
				<td class="dataTables_empty" height=50 align=center bgcolor=#FFFFFF>������ ������ �˻��Ͽ� �ֽʽÿ�.</td>
			</tr>			
			</table>
		</div>
	</div>
	<div id="footer_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr><td height=5></td></tr>
	<tr>
		<td>
			<table width=100% height=100% cellspacing=0 cellpadding=0>
			<tr>
				<td align=left>
					<a href="javascript:fnExcel();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_excel.gif" border=0 ></a>&nbsp;&nbsp;
					<a href="javascript:fnPrint();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_print.gif" border=0 ></a>
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
	<input type="hidden" name="titleFileName" id="titleFileName" value="">
	<iframe id="hiddenFrm" name="hiddenFrm" width=0 height=0></iframe>
</body>
</html>
<%
// ����
curPage = null;
%>