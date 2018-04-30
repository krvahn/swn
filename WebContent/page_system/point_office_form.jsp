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
curPage.checkAuthority(WebConst.AUTH_OFFICE_POINT, true, false);

//-----------------------------------------------------------------------------------------------
//파라미터 받기
//-----------------------------------------------------------------------------------------------
//MODE : 작업 모드
//-----------------------------------------------------------------------------------------------
String paramMode = curPage.getParam("MODE", "");
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
	
	// 에러 메세지 출력
	if( "${fieldErrors.message}" != "" ) {
		alert("${fieldErrors.message}");
		
		document.location.href = g_contextPath + "/page_system/point_office_list.jsp";
	}
	
	function updateWWTypeList()
	{		
		$("#search_WWType").empty().data('option');
		
		$("#search_WWType").append("<option value='P'>아리수정수센터</option>");
		$("#search_WWType").append("<option value='W'>수도사업소</option>");
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
		
		if(  $("#search_WWType").val() == "P" ) {
			$("#search_PlantFactoryCodeForm").css("display", "");
			$("#search_PlantPointClassCodeForm").css("display", "");
			$("#search_WaterPathCodeForm").css("display", "none");
			$("#search_WaterPointClassCodeForm").css("display", "none");			
			$("#search_WaterPointNameForm").css("display", "none");
		} else {
			$("#search_PlantFactoryCodeForm").css("display", "none");
			$("#search_PlantPointClassCodeForm").css("display", "none");
			$("#search_WaterPathCodeForm").css("display", "");
			$("#search_WaterPointClassCodeForm").css("display", "");			
			$("#search_WaterPointNameForm").css("display", "");
		}
	}
	
	function updatePlantPointClassCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=pcode.pointclass.list";
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_PlantPointClassCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_PlantPointClassCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateWaterPointClassCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=wcode.pointclass.list";
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_WaterPointClassCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_WaterPointClassCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateWaterPathCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=pcode.list";
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_WaterPathCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_WaterPathCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	$(document).ready(function() {
		// 사업소 구분 넣기
		updateWWTypeList();
		if( "${WW_TYPE}" != "" ) {
			$("#search_WWType").val('${WW_TYPE}');
		} else {
			$("#search_WWType option:eq(0)").attr("selected","selected");
		}
		
		// 사업소명 넣기
		updateWWCodeList();
		if( "${WW_CODE}" != "" ) {
			$("#search_WWCode").val('${WW_CODE}');
		} else {
			$("#search_WWCode option:eq(0)").attr("selected","selected");
		}
		
		// 정수센터 정수장 넣기
		if( "${PLANT_FACTORY_CODE}" != "" ) {
			$("#search_PlantFactoryCode").val('${PLANT_FACTORY_CODE}');
		} else {
			$("#search_PlantFactoryCode option:eq(0)").attr("selected","selected");
		}
		
		// 정수센터 공정 위치 넣기
		updatePlantPointClassCodeList();
		if( "${POINT_CODE}" != "" ) {
			$("#search_PlantPointClassCode").val('${PLANT_POINT_CLASS_CODE}');
		} else {
			$("#search_PlantPointClassCode option:eq(0)").attr("selected","selected");
		}
		
		// 수도사업소 관련수계 넣기
		updateWaterPathCodeList();
		if( "${WATER_PATH_CODE}" != "" ) {
			$("#search_WaterPathCode").val('${WATER_PATH_CODE}');
		} else {
			$("#search_WaterPathCode option:eq(0)").attr("selected","selected");
		}
		
		// 수도사업소 공정 위치 넣기
		updateWaterPointClassCodeList();
		if( "${TYPE_CODE}" != "" ) {
			$("#search_WaterPointClassCode").val('${WATER_POINT_CLASS_CODE}');
		} else {
			$("#search_WaterPointClassCode option:eq(0)").attr("selected","selected");
		}
		
		// 이벤트 설정
		$('#search_WWType').change(function() {
			// 사업소명 리스트 변경
			updateWWCodeList();
			$("#search_WWCode option:eq(0)").attr("selected","selected");
		});
		
		$('#search_WWCode').change(function() {
			// 측정지점 리스트 변경
			updatePointCodeList();
			$("#search_PointCode option:eq(0)").attr("selected","selected");
		});
	});
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
	//-----------------------------------------------------------------------------------------------
	function fnList()
	{
		var URL;
		
		URL = g_contextPath + "/page_system/point_office_list.jsp";
		
		document.location.href = URL;
	}
	
	function fnSave()
	{
		var theForm
		theForm = document.sendForm;
		
		if($("#search_WaterPointName").val() == "" && $("#search_WWType").val() == "W") {
			alert("측정지점명을 입력하세요.");
			theForm.search_WaterPointName.focus();
			return;
		}
		
		if( $("#MODE").val() == "save" || $("#search_NewData").is(":checked") == true ) {
			theForm.MODE.value = "save";
			theForm.POINT_CODE.value = "";
		}
		
		theForm.WW_TYPE.value = $("#search_WWType").val();
		theForm.WW_CODE.value = $("#search_WWCode").val();
		theForm.PLANT_FACTORY_CODE.value = $("#search_PlantFactoryCode").val();
		theForm.PLANT_POINT_CLASS_CODE.value = $("#search_PlantPointClassCode").val();
		theForm.PLANT_POINT_NAME.value = $("#search_PlantPointClassCode option:selected").text();
		theForm.WATER_PATH_CODE.value = $("#search_WaterPathCode").val();
		theForm.WATER_POINT_CLASS_CODE.value = $("#search_WaterPointClassCode").val();
		theForm.WATER_POINT_NAME.value = $("#search_WaterPointName").val();
		
		theForm.submit();
	}
	
	function fnDelete()
	{
		var theForm
		theForm = document.sendForm;
		theForm.MODE.value = "delete";
		
		theForm.submit();
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090506_swn_stitle22.jpg">
		</td>
	</tr>
	<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<form name="sendForm" id="sendForm" method="POST" action="point_office_form.do">
	<input type="hidden" name="MODE" id="MODE" value="${MODE}"> 
	<input type="hidden" name="WW_TYPE" id="WW_TYPE" value="${WW_TYPE}">
	<input type="hidden" name="WW_CODE" id="WW_CODE" value="${WW_CODE}">
	<input type="hidden" name="POINT_CODE" id="POINT_CODE" value="${POINT_CODE}">	
	<input type="hidden" name="PLANT_FACTORY_CODE" id="PLANT_FACTORY_CODE" value="">
	<input type="hidden" name="PLANT_POINT_CLASS_CODE" id="PLANT_POINT_CLASS_CODE" value="">	
	<input type="hidden" name="PLANT_POINT_NAME" id="PLANT_POINT_NAME" value="">
	<input type="hidden" name="WATER_PATH_CODE" id="WATER_PATH_CODE" value="">
	<input type="hidden" name="WATER_POINT_CLASS_CODE" id="WATER_POINT_CLASS_CODE" value="">
	<input type="hidden" name="WATER_POINT_NAME" id="WATER_POINT_NAME" value="">
	<table width=100% height=100% cellspacing=1 cellpadding=0 style="background-color: #666666;">
		<tr>
			<td class='swn_tbl_title' width=30%>관할 사업소</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="search_WWType" style="width:130px;">
				</select>&nbsp;
				<select id="search_WWCode" style="width:130px;">
				</select>
			</td>
		</tr>
		<tr id="search_PlantFactoryCodeForm">
			<td class='swn_tbl_title'>정수장명</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="search_PlantFactoryCode" style="width:130px;">
					<option value="9">N/A</option>
					<option value="0">공통</option>
					<option value="1">1정수장</option>
					<option value="2">2정수장</option>
					<option value="3">3정수장</option>
					<option value="4">4정수장</option>
				</select>				
			</td>
		</tr>
		<tr id="search_PlantPointClassCodeForm">
			<td class='swn_tbl_title'>공정명</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="search_PlantPointClassCode" style="width:130px;">
				</select>
			</td>
		</tr>
		<tr id="search_WaterPathCodeForm">
			<td class='swn_tbl_title'>관련수계</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="search_WaterPathCode" style="width:130px;">
				</select>
			</td>
		</tr>
		<tr id="search_WaterPointClassCodeForm">
			<td class='swn_tbl_title'>공정명</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="search_WaterPointClassCode" style="width:130px;">
				</select>
			</td>
		</tr>
		<tr id="search_WaterPointNameForm">
			<td class='swn_tbl_title'>측정지점명</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="search_WaterPointName" id="search_WaterPointName" value="${WATER_POINT_NAME}" size=40 maxlength=40 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
<%if(paramMode.equals("update") || paramMode.equals("select")) {%>		
		<tr id="search_NewDataForm">
			<td class='swn_tbl_title'>신규 측정지점 추가</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type="checkbox" name="search_NewData" id="search_NewData">
			</td>
		</tr>
<%}%>			
	</table>
	</form>
	</div>
	<div id="footer_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr><td height=5></td></tr>
	<tr>
		<td>
			<table width=100% height=100% cellspacing=0 cellpadding=0>
			<tr>
				<td align=right>
					<a href="javascript:fnList();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_list.gif" border=0 ></a>&nbsp;&nbsp;
<%if(paramMode.equals("update") || paramMode.equals("select")) {%>
					<a href="javascript:fnDelete();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_delete.gif" border=0 ></a>&nbsp;&nbsp;
<%}%>					
					<a href="javascript:fnSave();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_save.gif" border=0 ></a>
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