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
curPage.checkAuthority(WebConst.AUTH_ITEM_SET, true, false);

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
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
	var g_urlReportData = "history.page.do?Act=alert.history.water";
	var g_urlUnselectList = "system.page.do?Act=item_set_unselect.list";
	var g_urlSelectList = "system.page.do?Act=item_set_select.list";
	var g_urlSaveData = "system.page.do?Act=item_set_select.save";
	
	function updateWWCodeList()
	{	
		var URL;
		
		URL = "code.list.do?Act=wcode.list";	
	
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
		
		URL = "code.list.do?Act=wcode.analpoint.list&WW_CODE=" + $("#search_WWCode").val();
	
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
	
	function updateSelect()
	{
		var URL;
		
		// 전체 정보 가져 오기
		URL = g_urlUnselectList + "&POINT_CODE=" + $("#search_PointCode").val();
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_UnselectItemCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_UnselectItemCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
		
		// 선택 정보 가져 오기
		URL = g_urlSelectList + "&POINT_CODE=" + $("#search_PointCode").val();
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_SelectItemCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_SelectItemCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	$(document).ready(function() {
		// 사업소 코드 넣기
		updateWWCodeList();
		$("#search_WWCode option:eq(0)").attr("selected","selected");
		
		// 사업소별 측정 위치 코드 넣기
		updatePointCodeList();
		$("#search_PointCode option:eq(0)").attr("selected","selected");
		
		// 이벤트 설정
		$('#search_WWCode').change(function() {
			// 사업소별 측정지점 리스트 변경
			updatePointCodeList();
			$("#search_PointCode option:eq(0)").attr("selected","selected");
			
			updateSelect();
		});
		
		$('#search_PointCode').change(function() {
			updateSelect();
		});	
		
		updateSelect();
	});
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
	//-----------------------------------------------------------------------------------------------
	function fnSave()
	{		
		var URL;
		var i, items;
		
		items = "";
		for(i = 0; i < $("#search_SelectItemCode option").size(); i ++) {
			if( items.length > 0 ) {
				items += ",";
			}
			
			items += $("#search_SelectItemCode option:eq(" + i + ")").val();
		}
		
		URL = g_urlSaveData;
		URL += "&POINT_CODE=" +  $("#search_PointCode").val();
		URL += "&ITEMS=" + items;
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				if( data.isOk == true ) {
					alert("정상적으로 처리 되었습니다.");
				} else {
					alert("자료를 입력하는데 실패하였습니다.");
				}
			}
		});
	}
	
	function fnRemoveItem()
	{
		$("#search_SelectItemCode option:selected").each(function() {
			$(this).remove();
		});
	}
	
	function fnAppendItem()
	{
		$("#search_UnselectItemCode option:selected").each(function() {
			if( $("#search_SelectItemCode").find("option[value='" + $(this).val() + "']").length < 1 ) {
				$("#search_SelectItemCode").append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
			}
		});
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090506_swn_stitle25.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table cellspacing=0 cellpadding=0>
			<tr>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('99', '4', '2', '', '${pageContext.request.contextPath}');"><font color=blue><b>정수센터</b></font></a></td>
				<td width=2></td>
				<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02_ov.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('99', '4', '3', '', '${pageContext.request.contextPath}');"><font color=white><b>수도사업소</b></font></a></td>
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
				<td class='swn_tbl_title'>사업소명</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WWCode" style="width:130px; vertical-align:middle;">
					</select>
				</td>
			</tr>			
			<tr>
				<td class='swn_tbl_title'>측정위치명</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_PointCode" style="width:130px; vertical-align:middle;">
					</select>					
				</td>
			</tr>
			<tr>
				<td class='swn_tbl_title'>측정 항목</td>
				<td style="background-color:white; text-align:left; padding-left:5px;padding-top:5px;padding-bottom:5px">
					<table cellspacing="0" cellpadding="0" style="background-color: white;">
					<tr>
						<td width=200px align=center>
							<select name="search_SelectItemCode" id="search_SelectItemCode" multiple style="width:200px;" size=15 ondblclick="fnRemoveItem()">
							</select>
						</td>
						<td width=70px align="center"><input type="button" name="add" id="add" value = " => " onclick="fnRemoveItem()"><br>
							<br><input type="button" name="remove" id="remove" value = " <= " onclick="fnAppendItem()">
						</td>
						<td width=200px align=center>
							<select name="search_UnselectItemCode" id="search_UnselectItemCode" multiple style="width:200px;" size=15 ondblclick="fnAppendItem()">
							</select>
						</td>
					</tr>
					</table>			
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr><td height=5></td></tr>
	</table>
	</div>
	<div id="footer_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr><td height=5></td></tr>
	<tr>
		<td>
			<table width=100% height=100% cellspacing=0 cellpadding=0>
			<tr>
				<td align=right>
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