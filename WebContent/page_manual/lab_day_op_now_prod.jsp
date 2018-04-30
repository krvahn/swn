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

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
// WORK_DATE : 작업 일자
//-----------------------------------------------------------------------------------------------
String paramWorkDate = curPage.getParam("WORK_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMdd"));

boolean bUpdate;
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
	var g_reportDataURL = "manual_search_day.page.do?Act=lab_day_op_now_prod.list";
	var oReport;
	
	function updateReport()
	{	
		var URL;
		var workDate;
		
		// 요청 일자 만들기
		workDate = fnDateTrim($('#search_ReportYMD').val());
		
		// 데이터 요청 URL 만들기
		URL = g_reportDataURL
			+ "&WORK_DATE=" + workDate;
		
		oReport.fnReloadAjax(URL);
		
		// 날짜 넣기
		$("#list_date").html("(" + workDate.substr(0, 4) + "년 " + workDate.substr(4, 2) + "월 " + workDate.substr(6, 2) + "일)");
		
		// 파일명 및 인쇄 프린트 타이틀 넣기
		$("#titleFileName").val("정수센터일일운영일일생산량현황"
				+ "_" + workDate);
		$("#titlePrintPage").val("정수센터 일일 운영 일일 생산량 현황"
				+ "(" + workDate + ")");
	}
	
	$(document).ready(function() {
		// 달력 설정
		$('#search_ReportYMD').datepicker();
		
		// // 이벤트 설정
		$("#search_ReportType").change( function() {
			var nSel, URL;
			
			nSel = $(this).val();
			URL = g_contextPath + "/page_manual/";
			
			switch(nSel)
			{
			case "0":
				URL += "lab_day_op_water.jsp";
				break;
				
			case "1":
				URL += "lab_day_op_send.jsp";
				break;
				
			case "2":
				URL += "lab_day_op_prod_day.jsp";
				break;
				
			case "3":
				URL += "lab_day_op_now_prod.jsp";
				break;
				
			case "4":
				URL += "lab_day_op_power.jsp";
				break;
			}
			
			document.location.href = URL;
		});
		
		// 폼 만들기
		var URL;

		URL = "code.list.do?Act=none&COLSPAN=9";
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
							{"sClass" : "center"},
							{"sClass" : "center"},
							{"sClass" : "right"},
							{"sClass" : "right"},
							{"sClass" : "right"},
							{"sClass" : "right"},
							{"sClass" : "right"},
							{"sClass" : "right"},
							{"sClass" : "right"}
			              ]
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
			<img src="${pageContext.request.contextPath}/images/manual/20081212_swn_stitle17.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table cellspacing=0 cellpadding=0>
			<tr>
				<td width=160 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab03_ov.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');"><font color=white><b>정수센터 일일운영현황</b></font></a></td>
				<td width=2></td>
				<td width=160 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab03.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '1', '2', '', '${pageContext.request.contextPath}');"><font color=blue><b>취정수 수질검사결과</b></font></a></td>
				<td width=2></td>
				<td width=160 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab03.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '1', '3', '', '${pageContext.request.contextPath}');"><font color=blue><b>정수처리기준 운영결과</b></font></a></td>
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
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_ReportType" style="width:130px;">
						<option value='0'>수질 현황</option>
						<option value='1'>송수 현황</option>
						<option value='2'>생산량 현황</option>
						<option value='3' selected>금일생산량 현황</option>
						<option value='4'>전력사용량 현황</option>
					</select>					
				</td>
			</tr>
			<tr>
				<td height=30 class='swn_tbl_title'>검색기간</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<input type="text" name="search_ReportYMD" id="search_ReportYMD" class="inputbox"  readonly
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
	<div id="report_form">	
		<table width=100% height=100% cellspacing=0 cellpadding=0>
		<tr>
			<td>
				<img src='${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif' style='margin-bottom:2px; margin-right:4px;'><b><font color=#003750>일일 생산량 현황&nbsp;<span id="list_date"></span></font></b>
			</td>
		</tr>
		</table>
		<table width=100% height=100% cellspacing=1 cellpadding=0 id='report'>
			<thead>
			<tr>
				<th height=25 width=30% colspan=2 align=center bgcolor=#EFEFEF>구분</th>
				<th width=10% align=center bgcolor=#EFEFEF>합계</th>
				<th width=10% align=center bgcolor=#EFEFEF>광암</th>
				<th width=10% align=center bgcolor=#EFEFEF>구의</th>
				<th width=10% align=center bgcolor=#EFEFEF>뚝도</th>
				<th width=10% align=center bgcolor=#EFEFEF>영등포</th>
				<th width=10% align=center bgcolor=#EFEFEF>암사</th>
				<th width=10% align=center bgcolor=#EFEFEF>강북</th>
			</tr>
			<tr style="display:none">
				<th height=0></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			</thead>
			<tbody>
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
// 해제
curPage = null;
%>