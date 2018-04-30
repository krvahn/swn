<%@ page import="kr.go.seoul.water.comm.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//-----------------------------------------------------------------------------------------------
// 웹 페이지 캐쉬 삭제
//-----------------------------------------------------------------------------------------------
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
if( request.getProtocol() != null && request.getProtocol().equals("HTTP/1.1") ) {
	response.setHeader("Cache-Control", "no-cache");
}

//-----------------------------------------------------------------------------------------------
//초기화
//-----------------------------------------------------------------------------------------------
WebPage curPage = new WebPage(pageContext, request, response);

//권한 검사
curPage.checkAuthority(WebConst.AUTH_LAB_MEASURE_VALUE, true, false);

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
// WORK_DATE : 작업 일자
//-----------------------------------------------------------------------------------------------
String paramWWCode = curPage.getParam("WW_CODE", "");
String paramWorkDate = curPage.getParam("WORK_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMdd"));

String searchReportM_Y, searchReportM_M;
if( paramWorkDate.length() >= 6 ) {
	searchReportM_Y = paramWorkDate.substring(0, 4);
	searchReportM_M = paramWorkDate.substring(4, 6);
} else {
	searchReportM_Y = WebUtils.GetCurrentDateTimeFormat("yyyy");
	searchReportM_M = WebUtils.GetCurrentDateTimeFormat("MM");
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
<!-- jQuery 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.js"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui-ko.js"></script>

<!-- Water Now 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/script.do"></script>

<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/water_now.css");
-->
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<!-- DataTabele 관련 CSS 및 자바스크립트 포함 -->
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
	var g_reportDataURL = "manual_value.page.do?Act=lab_manual_value_power.list";
	var oReport = null;
	
	// 에러 메세지 출력
	if( "${fieldErrors.message}" != "" ) {
		alert("${fieldErrors.message}");
	}
	
	// datatable HTML 설정
	jQuery.fn.dataTableExt.aTypes.push( function(sData) {
		return 'html';
	});
	
	function updateReport()
	{	
		var URL;
		
		URL = g_reportDataURL;
		URL += "&WW_CODE=" + $("#search_WWCode").val();
		URL += "&WORK_DATE=" + $("#search_ReportM_Y").val() + $("#search_ReportM_M").val();
		
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
								{"sClass" : "center"}
				              ],
	              "fnServerData": function(sSource, aoData, fnCallback ) {
	  	            $.ajax( {
	  	                "dataType": 'json',
	  	                "url": sSource,
	  	                "data": aoData,
	  	                "success": function(data, textStatus, jqXHR) {
	  	                	$("#WW_CODE").val($("#search_WWCode").val());
	  	                	$("#WORK_DATE").val($("#search_ReportM_Y").val() + $("#search_ReportM_M").val());
	  	                	$("#POINT_CODE_LIST").val(data.sPOINT_CODE_LIST);
	  	                	fnCallback(data, textStatus, jqXHR);
	  	               }
	  	            } );
	  	        }
			}).fnFakeRowColspan();
		}
	}
	
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
	
	$(document).ready(function() {
		updateWWCodeList();
		if( "<%=paramWWCode%>" != "" ) {
			$("#search_WWCode").val('<%=paramWWCode%>');
		} else {
			$("#search_WWCode option:eq(0)").attr("selected","selected");
		}
		
		// 이벤트 설정
		$("#search_ReportType").change(function() {
			var nSel, URL;
			
			nSel = $(this).val();
			URL = g_contextPath + "/page_manual/";
			
			switch(nSel)
			{
			case "0":
				URL += "lab_measure_value_plant_form.jsp";
				break;
				
			case "1":
				URL += "lab_measure_value_inout_result_form.jsp";
				break;
				
			case "2":
				URL += "lab_measure_value_baseline_form.jsp";
				break;
				
			case "3":
				URL += "lab_measure_value_power_form.jsp";
				break;
			}
			
			document.location.href = URL;
		});
		
		updateReport();
	});
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
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
				<td width=160 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab03_ov.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '2', '1', '', '${pageContext.request.contextPath}');"><font color=white><b>정수센터</b></font></a></td>
				<td width=2></td>
				<td width=160 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab03.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '2', '2', '', '${pageContext.request.contextPath}');"><font color=blue><b>상수도연구원</b></font></a></td>
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
				<td width=10% height=30 class='swn_tbl_title'>보고서 유형</td>
				<td colspan=3 style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_ReportType" style="width:150px;">
						<option value='0'>정수장 일일운영현황</option>
						<option value='1'>원정수 수질검사결과</option>
						<option value='2'>정수처리기준 운영결과</option>
						<option value='3' selected>월전력 사용현황</option>
					</select>					
				</td>
			</tr>
			<tr>
				<td width=10% height=30 class='swn_tbl_title'>사업소명</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WWCode" style="width:150px;">
					</select>					
				</td>
				<td width=10% height=30 class='swn_tbl_title'>입력자</td>
				<td style="background-color:white; text-align:left; padding-left:5px"><%=curPage.getUserName()%></td>
			</tr>
			<tr>
				<td height=30 class='swn_tbl_title'>측정일자</td>
				<td colspan=3 style="background-color:white; text-align:left; padding-left:5px">
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
							</select>&nbsp;년
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
							</select>&nbsp;월
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
	<form name="sendForm" method="POST" action="${pageContext.request.contextPath}/page_manual/lab_measure_value_power_form.do">
	<input type=hidden name="WW_CODE" id="WW_CODE" value="">
	<input type=hidden name="WORK_DATE" id="WORK_DATE" value="">
	<input type=hidden name="POINT_CODE_LIST" id="POINT_CODE_LIST" value="">
	<div id="report_form">	
		<table width=100% height=100% cellspacing=0 cellpadding=0>
		<tr>
			<td>매월 18일 전력요금담당자로부터 자료를 받아 입력하시기 바랍니다. (월 1회 입력 요망)</td>
		</tr>
		<tr>
			<td height=5></td>
		</tr>
		</table>
		<table width=100% height=100% cellspacing=1 cellpadding=0 id='report' bgcolor=#666666>
		<thead>
			<tr>
				<th rowspan=2 width=20% align="center" bgcolor=#FFFFFF>구분</th>
				<th colspan=4 align="center" bgcolor=#FFFFFF>전력사용량 (kWh)</th>
			</tr>
			<tr>
				<th width=20% align="center" bgcolor=#FFFFFF>PEAK</th>
				<th width=20% align="center" bgcolor=#FFFFFF>주간</th>
				<th width=20% align="center" bgcolor=#FFFFFF>야간</th>
				<th width=20% align="center" bgcolor=#FFFFFF>심야</th>
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
// 해제
curPage = null;
%>