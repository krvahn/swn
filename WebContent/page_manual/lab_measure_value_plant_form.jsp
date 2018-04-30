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
curPage.checkAuthority(WebConst.AUTH_LAB_MEASURE_VALUE, true, false);

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
// WORK_DATE : 작업 일자
//-----------------------------------------------------------------------------------------------
String paramWWCode = curPage.getParam("WW_CODE", "");
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
<!-- jQuery 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.js"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui-ko.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.alphanumeric.js"></script>

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
	var g_reportDataURL = "manual_value.page.do?Act=lab_measure_value_plant.list";
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
		URL += "&WORK_DATE=" + fnDateTrim($('#search_ReportYMD').val());
		
		if( oReport != null ) {			
			oReport.fnReloadAjax(URL);
		} else {
			oReport = $('#report_prod').dataTable( {	         	
				"bProcessing": true,
				"bPaginate": false,
				"bSort": false,
				"bInfo": false,
				"bFilter": false,
				"sAjaxSource": URL,
				"aoColumns": [
				              {"sClass" : "left"}
				              , {"sClass" : "left"}
				              , {"sClass" : "left"}
				              , {"sClass" : "left"}
				              , {"sClass" : "left"}
				              , {"sClass" : "left"}
				              , {"sClass" : "left"}
				              , {"sClass" : "left"}
				              ],
              "fnServerData": function(sSource, aoData, fnCallback ) {
	  	            $.ajax( {
	  	                "dataType": 'json',
	  	                "url": sSource,
	  	                "data": aoData,
	  	                "success": function(data, textStatus, jqXHR) {
	  	                	$("#WW_CODE").val($("#search_WWCode").val());
	  	                	$("#WORK_DATE").val(fnDateTrim($("#search_ReportYMD").val()));
	  	                	$("#PS_POINT_CODES").val(data.sPS_POINT_CODES);
	  	                	$("#SS_POINT_CODES").val(data.sSS_POINT_CODES);
	  	                	$("#RS_POINT_CODES").val(data.sRS_POINT_CODES);
	  	                	$("#AS_POINT_CODES").val(data.sAS_POINT_CODES);
	  	                	$("#AS_POINT_VAL_CNT").val(data.sAS_POINT_VAL_CNT);
	  	                	$("#ITEM_CODES").val(data.sITEM_CODES);
	  	                	
	  	                	fnCallback(data, textStatus, jqXHR);
	  	                	
	  	                	var arr, arrCnt;
		  	          		var i, j, val;
		  	                	
	  	                	// 숫자만 입력하도록 설정
	  	                	
	  	                	// 생산현황
	  	                	$("#TAKE_WATER").numeric({allow:"."});
	  	                	
		  	          		arr = $("#PS_POINT_CODES").val().split(",");
		  	          		for( i = 0; i < arr.length; i ++) {
		  	          			$("#PS_ITEM_VAL1_" + arr[i]).numeric({allow:"."});
		  	          		}
		  	          		
		  	          		// 송수 현황
		  	          		arr = $("#SS_POINT_CODES").val().split(",");
		  	          		for( i = 0; i < arr.length; i ++) {
		  	          			$("#SS_ITEM_VAL1_" + arr[i]).numeric({allow:"."});
		  	          		}
		  	          		
			  	          	arr = $("#RS_POINT_CODES").val().split(",");
		  	          		for( i = 0; i < arr.length; i ++) {
		  	          			$("#RS_ITEM_VAL1_" + arr[i]).numeric({allow:"."});
			  	          		$("#RS_ITEM_VAL2_" + arr[i]).numeric({allow:"."});
			  	          		$("#RS_ITEM_VAL3_" + arr[i]).numeric({allow:"."});
		  	          		}
		  	          		
			  	          	arr = $("#AS_POINT_CODES").val().split(",");
		  	          		for( i = 0; i < arr.length; i ++) {
			  	          		$("#AS_ITEM_VAL2_" + arr[i]).numeric({allow:":"});
			  	          		$("#AS_ITEM_VAL3_" + arr[i]).numeric({allow:":"});
		  	          		}
		  	          		
		  	          		arr = $("#AS_POINT_CODES").val().split(",");
		  	          		arrCnt = $("#AS_POINT_VAL_CNT").val().split(",");
		  	          		for( i = 0; i < arr.length; i ++) {
		  	          			for( j = 0; j < parseInt(arrCnt[i]); j ++ ) {
		  	          				$("AS_POINT_VA1L_" + arr[i] + j).numeric({allow:"."});	
		  	          				$("AS_POINT_VAL2_" + arr[i] + j).numeric({allow:"."});
		  	          			}
		  	          		}
			  	          		
		  	          		// 약품 투입 현황
			  	          	$("#PAC").numeric({allow:"."});
			  	        	$("#PACS").numeric({allow:"."});
			  	        	$("#PAHCS").numeric({allow:"."});
			  	        	$("#AL_GA").numeric({allow:"."});
			  	        	$("#AL_SO").numeric({allow:"."});
			  	        	$("#FRONT").numeric({allow:"."});
			  	        	$("#REAR").numeric({allow:"."});
			  	        	$("#POWDER").numeric({allow:"."});
			  	        	$("#CD00").numeric({allow:"."});
			  	        	
			  	        	// 수질 현황
			  	        	arr = $("#ITEM_CODES").val().split(",");
			  	        	for( i = 0; i < arr.length; i ++) {
			  	        		val = $("#ITEM_" + arr[i])[0].nodeName;
			  	        		//console.log( val );
			  	        		
			  	        		if( val == "SELECT" ) {
			  	        		} else {
			  	        			$("#ITEM_" + arr[i]).numeric({allow:"."});
			  	        		}
		  	          		}
			  	        	
			  	        	// 여과지속 시간
			  	        	$("#FILTER_TIME").numeric({allow:"."});
			  	        	
			  	        	// 기타
			  	        	$("#DISCHARGE").numeric({allow:"."});
			  	        	$("#TEMP_MAX").numeric({allow:".-"});
			  	        	$("#TEMP_MIN").numeric({allow:".-"});
	  	               	}
	  	            });
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
		// 달력 설정
		$('#search_ReportYMD').datepicker();
		
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
	
	function toCapa(pCode)
	{
		var retVal = 1;
		
		if( pCode == "PR0055" )
		{
			retVal = 400000;
		} else if(pCode == "PR0065") {
			retVal = 500000;
		} else if(pCode == "PR0183") {
			retVal = 350000;
		} else if(pCode == "PR0370") {
			retVal = 1600000;
		} else if(pCode == "PR0407") {
			retVal = 600000;
		} else if(pCode == "PR0710") {
			retVal = 1000000;
		}
		
		return retVal;
	}
	
	function fnCalc(item)
	{
		var arr;
		var i, val;
		var sum;
		
		if( item == "PS" ) {
			val = $("#PS_POINT_CODES").val();
			arr = val.split(",");
			
			sum = 0;
			for( i = 0; i < arr.length; i ++) {
				val = $("#PS_ITEM_VAL1_" + arr[i]).val();
				if( val != "" ) {
					sum += parseFloat(val);	
				}
			}
			
			$("#PROD_WATER").val(sum);
			$("#DRIVE_RATE").val(_digitFormat(sum / toCapa($("#WW_CODE").val()) * 100, 2));
		} else if( item == "SS" ) {
			val = $("#SS_POINT_CODES").val();
			arr = val.split(",");
			
			sum = 0;
			for( i = 0; i < arr.length; i ++) {
				val = $("#SS_ITEM_VAL1_" + arr[i]).val();
				if( val != "" ) {
					sum += parseFloat(val);	
				}
			}
			
			$("#SEND_WATER").val(sum);
		}
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
						<option value='0' selected>정수장 일일운영현황</option>
						<option value='1'>원정수 수질검사결과</option>
						<option value='2'>정수처리기준 운영결과</option>
						<option value='3'>월전력 사용현황</option>
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
	<form name="sendForm" method="POST" action="${pageContext.request.contextPath}/page_manual/lab_measure_value_plant_form.do">
	<input type="hidden" name="USER_ID" id="USER_ID" value="<%=curPage.getUserID()%>">
	<input type="hidden" name="USER_NAME" id="USER_NAME" value="<%=curPage.getUserName()%>">
	<input type="hidden" name="WW_CODE" id="WW_CODE" value="">
	<input type="hidden" name="WORK_DATE" id="WORK_DATE" value="">
	<input type="hidden" name="PS_POINT_CODES" id="PS_POINT_CODES" value="">
	<input type="hidden" name="SS_POINT_CODES" id="SS_POINT_CODES" value="">
	<input type="hidden" name="RS_POINT_CODES" id="RS_POINT_CODES" value="">
	<input type="hidden" name="AS_POINT_CODES" id="AS_POINT_CODES" value="">
	<input type="hidden" name="AS_POINT_VAL_CNT" id="AS_POINT_VAL_CNT" value="">
	<input type="hidden" name="ITEM_CODES" id="ITEM_CODES" value="">
	<div id="report_form">	
		<table width=100% height=100% cellspacing=0 cellpadding=0>
		<tr>
			<td>
				<img src='${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif' style='margin-bottom:2px; margin-right:4px;'><b>실험실 측정값 현황</b>
			</td>
		</tr>
		</table>
		<table width=100% height=100% cellspacing=1 cellpadding=0 id='report_prod'>
		<thead>
		<tr>	
			<th colspan=2 width=20% height=25 align=center bgcolor=#EFEFEF>측정항목</th>
			<th colspan=6 align=center bgcolor=#EFEFEF>측정값</th>
		</tr>
		<tr style="display:none">
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