<%@ page import="kr.go.seoul.water.comm.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
curPage.checkAuthority(WebConst.AUTH_OPER_RESULT, true, false);

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
// WORK_DATE : 작업 일자
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
	var g_reportDataURL = "oper.page.do?Act=oper_result.list";
	var oReport;
	
	function updateReport()
	{	
		var URL;
		var workDate;
		
		// 요청 일자 만들기
		workDate = $('#search_ReportM_Y').val() + $('#search_ReportM_M').val();
		
		// 데이터 요청 URL 만들기
		URL = g_reportDataURL
			+ "&WORK_DATE=" + workDate
			+ "&ITEMS=WW0000,PR0055,PR0065,PR0183,PR0407,PR0370,PR0710,WW0001,WW0003,WW0005,WW0006,WW0007,WW0009,WW0010,WW0011";
		
		oReport.fnReloadAjax(URL);
		
		// 날짜 넣기
		$("#list_date").html("(" + workDate.substr(0, 4) + "년 " + workDate.substr(4, 2) + "월 " + workDate.substr(6, 2) + "일)");
		
		// 파일명 및 인쇄 프린트 타이틀 넣기
		$("#titleFileName").val("일일운영결과"
				+ "_" + workDate);
		$("#titlePrintPage").val("일일운영결과"
				+ "(" + workDate.substr(0, 4) + "년 " + workDate.substr(4, 2) + "월)");
	}
	
	$(document).ready(function() {
		// 달력 설정
		$('#search_ReportYMD').datepicker();
		
		// 폼 만들기
		var URL;

		URL = "code.list.do?Act=none&COLSPAN=16";
		oReport = $('#report').dataTable( {
			// EXCEL 저장, 프린트 출력 기능
			"sDom": '<"clear">lfrtipT',
			"oTableTools": {
				"sSwfPath": "${pageContext.request.contextPath}/import/extra/copy_csv_xls_pdf.swf",
				"aButtons": [ 
				             {
				            	 "sExtends": "xls",
				            	 "sButtonText": "엑셀 파일 저장",
				            	 "fnClick": function(nButton, oConfig, oFlash) {
				            		 if( $("#titleFileName").val() == "" ) {
				            			 alert("자료 검색후 파일로 저장하세요.");
				            			 return;
				            		 }
				            		 
				            		 oFlash.setFileName($("#titleFileName").val() + ".xls");
				            		 this.fnSetText(oFlash, this.fnGetTableDataForXLS(oConfig));
				            	 }
				             }, {
				            	 "sExtends": "print",
				            	 "sButtonText": "프린터 출력",
				            	 "fnClick": function(nButton, oConfig ) {
				            		 if( $("#titlePrintPage").val() == "" ) {
				            			 alert("자료 검색후 프린터로 출력하세요.");
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
	// 기능 관련 함수
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
				<td width=10% height=30 class='swn_tbl_title'>검색기간</td>
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
	<div id="report_form">	
		<table width=100% height=100% cellspacing=1 cellpadding=0 id='report'>
			<thead>
			<tr>
				<th height=50 width=5% rowspan=2 align=center bgcolor=#EFEFEF>날짜</th>
				<th height=25 colspan=15 align=center bgcolor=#EFEFEF>일일모니터링 확인 및 조치결과</th>
			</tr>
			<tr>
				<th align=center bgcolor=#EFEFEF>본부 급수운영과</th>
				<th align=center bgcolor=#EFEFEF>광암아리수정수센터</th>
				<th align=center bgcolor=#EFEFEF>구의아리수정수센터</th>
				<th align=center bgcolor=#EFEFEF>뚝도아리수정수센터</th>
				<th align=center bgcolor=#EFEFEF>영등포아리수정수센터</th>
				<th align=center bgcolor=#EFEFEF>암사아리수정수센터</th>
				<th align=center bgcolor=#EFEFEF>강북아리수정수센터</th>
				<th align=center bgcolor=#EFEFEF>중부수도사업소</th>
				<th align=center bgcolor=#EFEFEF>동부수도사업소</th>
				<th align=center bgcolor=#EFEFEF>북부수도사업소</th>
				<th align=center bgcolor=#EFEFEF>서부수도사업소</th>
				<th align=center bgcolor=#EFEFEF>강서수도사업소</th>
				<th align=center bgcolor=#EFEFEF>남부수도사업소</th>
				<th align=center bgcolor=#EFEFEF>강남수도사업소</th>
				<th align=center bgcolor=#EFEFEF>강동수도사업소</th>
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
// 해제
curPage = null;
%>