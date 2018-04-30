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
curPage.checkAuthority(WebConst.AUTH_USER_MANAGER, true, false);

String g_USERID = (String)session.getAttribute("USER_ID");

if(g_USERID == null || !g_USERID.equals("dkryu100"))
{
%>
<script type="text/javascript" language="javascript">
	alert('죄송합니다. 해당 기능에 대한 접근권한이 없습니다.');
	history.back();
</script>
<% 
}

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
		
		document.location.href = g_contextPath + "/page_system/user_manager_list.jsp";
	}
	
	function updateGrupAuthCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=group.list";	
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#GROUP_AUTH").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#GROUP_CODE").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateSelectPointCodeList()
	{
		var URL;
		
		URL = "code.list.do?Act=point.list";	
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_UnselectPointCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_UnselectPointCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
		
		URL = "code.list.do?Act=user.select.point.list";
		URL += "&USER_ID=" + $("#USER_ID").val();
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_SelectPointCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_SelectPointCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateWWCodeList()
	{		
		var URL;
		
		URL = "code.list.do?Act=wellwater.all.list";
		URL += "&WW_TYPE=" + $("#WW_TYPE").val();
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#WW_CODE").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#WW_CODE").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	$(document).ready(function() {
		updateGrupAuthCodeList();
		if( "${GROUP_CODE}" != "" ) {
			$("#GROUP_CODE").val('${GROUP_CODE}');
		} else {
			$("#GROUP_CODE option:eq(0)").attr("selected","selected");
		}
		
		if( "${CELL_NUM1}" != "" ) {
			$("#CELL_NUM1").val('${CELL_NUM1}');
		} else {
			$("#CELL_NUM1 option:eq(0)").attr("selected","selected");
		}
		
		if( "${WW_TYPE}" != "" ) {
			$("#WW_TYPE").val('${WW_TYPE}');
		} else {
			$("#WW_TYPE option:eq(0)").attr("selected","selected");
		}
		
		updateWWCodeList();
		if( "${WW_CODE}" != "" ) {
			$("#WW_CODE").val('${WW_CODE}');
		} else {
			$("#WW_CODE option:eq(0)").attr("selected","selected");
		}
		
		if( "${ALARM_TYPE1}" == "Y" ) {
			$("#search_ALARM_TYPE1").attr("checked", true);			
		}
		
		if( "${ALARM_TYPE2}" == "Y" ) {
			$("#search_ALARM_TYPE2").attr("checked", true);			
		}
		
		if( "${ALARM_TYPE3}" == "Y" ) {
			$("#search_ALARM_TYPE3").attr("checked", true);			
		}
		
		if( "${SMS_WD}" == "Y" ) {
			$("#search_SMS_WD").attr("checked", true);			
		}
		
		if( "${SMS_WN}" == "Y" ) {
			$("#search_SMS_WN").attr("checked", true);			
		}
		
		if( "${SMS_HD}" == "Y" ) {
			$("#search_SMS_HD").attr("checked", true);			
		}
		
		if( "${SMS_HN}" == "Y" ) {
			$("#search_SMS_HN").attr("checked", true);			
		}
		
		if( "${USER_LEVEL}" != "" ) {
			$("#USER_LEVEL").val('${USER_LEVEL}');
		} else {
			$("#USER_LEVEL option:eq(0)").attr("selected","selected");
		}
		
		if( "${EXPIRE_FLAG}" != "" ) {
			$("#EXPIRE_FLAG").val('${EXPIRE_FLAG}');
		} else {
			$("#EXPIRE_FLAG option:eq(0)").attr("selected","selected");
		}
		
		if( "${USER_AUTH}" != "" ) {
			$("#USER_AUTH").val('${USER_AUTH}');
		} else {
			$("#USER_AUTH option:eq(0)").attr("selected","selected");
		}
		
		updateSelectPointCodeList();
		
		// 읽기전용으로 만들기
		if( "${MODE}" == "update" ) {
			$("#USER_ID").attr("readonly", true);
		}
		
		// 이벤트 설정
		$("#WW_TYPE").change( function() {
			updateWWCodeList();
		});
	});
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
	//-----------------------------------------------------------------------------------------------
	function fnSave()
	{
		var theForm;
		var i, items;
		
		theForm = document.sendForm;
		
		if(theForm.USER_ID.value.length < 6) {
			alert("사용자 아이디는 최소 6자 이상 되어야 합니다.");
			theForm.USER_ID.focus();
			return;
		}
		
		if( theForm.USER_NAME.value == "" ) {
			alert("사용자명을 입력하시오.");
			theForm.USER_NAME.focus();
			return;
		}
		
		if( theForm.PWD.value.length < 9 ) {
			alert("비밀번호는 문자, 숫자, 특수문자의 조합 9자 이상입니다.");
			theForm.PWD.focus();
			return;
		}
		
		if(!theForm.PWD.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/))
		{
			alert("비밀번호는 문자, 숫자, 특수문자의 조합 9자 이상입니다.");
			theForm.PWD.focus();
			return;
		}
		
		if( theForm.USER_ID.value == theForm.PWD.value ) {
			alert("비밀번호는 아이디와 같게 사용할수 없습니다.");
			theForm.PWD.focus();
			return;
		}
		
		if( theForm.PWD.value != theForm.PWD_CONFIRM.value ) {
			alert("비밀번호확인이 맞지 않습니다.\n\n정확하게 다시 입력해주십시요.");
			theForm.PWD_CONFIRM.focus();
			return;
		}
		
		
		if( $("#search_ALARM_TYPE1").is(":checked") ) { theForm.ALARM_TYPE1.value = "Y"; } else { theForm.ALARM_TYPE1.value = "N"; }
		if( $("#search_ALARM_TYPE2").is(":checked") ) { theForm.ALARM_TYPE2.value = "Y"; } else { theForm.ALARM_TYPE2.value = "N"; }
		if( $("#search_ALARM_TYPE3").is(":checked") ) { theForm.ALARM_TYPE3.value = "Y"; } else { theForm.ALARM_TYPE3.value = "N"; }
		
		if( $("#search_SMS_WD").is(":checked") ) { theForm.SMS_WD.value = "Y"; } else { theForm.SMS_WD.value = "N"; }
		if( $("#search_SMS_WN").is(":checked") ) { theForm.SMS_WN.value = "Y"; } else { theForm.SMS_WN.value = "N"; }
		if( $("#search_SMS_HD").is(":checked") ) { theForm.SMS_HD.value = "Y"; } else { theForm.SMS_HD.value = "N"; }
		if( $("#search_SMS_HN").is(":checked") ) { theForm.SMS_HN.value = "Y"; } else { theForm.SMS_HN.value = "N"; }
		
		items = "";
		for(i = 0; i < $("#search_SelectPointCode option").size(); i ++) {
			if( items.length > 0 ) {
				items += ",";
			}
			
			items += $("#search_SelectPointCode option:eq(" + i + ")").val();
		}
		theForm.ITEMS.value = items;
		
		theForm.submit();
	}
	
	function fnDelete(user_id)
	{
		var nDel;
		var URL;		
		
		nDel = confirm("선택한 데이터를 삭제하시겠습니까?");
		
		if (nDel == true) {
			URL = g_contextPath + "/user_manager_form.do";
			URL += "?MODE=delete";
			URL += "&USER_ID=${USER_ID}";
			
			document.location.href = URL;	
		}
	}
	
	function fnList()
	{
		var URL;
		
		URL = g_contextPath + "/page_system/user_manager_list.jsp";
		
		document.location.href = URL;
	}
	
	function fnRemoveItem()
	{
		$("#search_SelectPointCode option:selected").each(function() {
			$(this).remove();
		});
	}
	
	function fnAppendItem()
	{
		$("#search_UnselectPointCode option:selected").each(function() {
			if( $("#search_SelectPointCode").find("option[value='" + $(this).val() + "']").length < 1 ) {
				$("#search_SelectPointCode").append("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>");
			}
		});
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090506_swn_stitle16.jpg">
		</td>
	</tr>
	<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<form name="sendForm" id="sendForm" method="POST" action="user_manager_form.do">
	<input type="hidden" name="MODE" id="MODE" value="${MODE}">
	<input type="hidden" name="ALARM_TYPE1" id="ALARM_TYPE1" value="">
	<input type="hidden" name="ALARM_TYPE2" id="ALARM_TYPE2" value="">
	<input type="hidden" name="ALARM_TYPE3" id="ALARM_TYPE3" value="">
	<input type="hidden" name="SMS_WD" id="SMS_WD" value="">
	<input type="hidden" name="SMS_WN" id="SMS_WM" value="">
	<input type="hidden" name="SMS_HD" id="SMS_HD" value="">
	<input type="hidden" name="SMS_HN" id="SMS_HN" value=""> 
	<input type="hidden" name="ITEMS" id="ITEMS" value="">
	<table width=100% height=100% cellspacing=1 cellpadding=0 style="background-color: #666666;">
		<tr>
			<td class='swn_tbl_title' width=30%>사용자 그룹 목록 <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="GROUP_CODE" name="GROUP_CODE" style="width:130px;">
				</select>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>사용자 ID <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="USER_ID" id="USER_ID" value="${USER_ID}" size=20 maxlength=12 style="width:200px;vertical-align:middle;">
			</td>
		</tr>			
		<tr>
			<td class='swn_tbl_title'>사용자명 <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="USER_NAME" id="USER_NAME" value="${USER_NAME}" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>비밀번호 <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="PWD" id="PWD" value="" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>비밀번호확인 <font color='#FF0000'>(*)</font></td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="PWD_CONFIRM" id="PWD_CONFIRM" value="" size=20 maxlength=20 style="width:200px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>전화번호</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='text' name="TEL_NUM1" id="TEL_NUM1" value="${TEL_NUM1}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
				-&nbsp;<input type='text' name="TEL_NUM2" id="TEL_NUM2" value="${TEL_NUM2}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
				-&nbsp;<input type='text' name="TEL_NUM3" id="TEL_NUM3" value="${TEL_NUM3}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>휴대폰번호</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="CELL_NUM1" name="CELL_NUM1" style="width:50px;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">018</option>
					<option value="017">018</option>
					<option value="019">019</option>
				</select>
				-&nbsp;<input type='text' name="CELL_NUM2" id="CELL_NUM2" value="${CELL_NUM2}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
				-&nbsp;<input type='text' name="CELL_NUM3" id="CELL_NUM3" value="${CELL_NUM3}" size=4 maxlength=4 style="width:50px;vertical-align:middle;">
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>관할사업소</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="WW_TYPE" name="WW_TYPE" style="width:130px;">
					<option value="M">상수도사업본부</option>
					<option value="P">아리수정수센터</option>
					<option value="W">수도사업소</option>
					<option value="R">상수도연구원</option>
				</select>&nbsp;
				<select id="WW_CODE" name="WW_CODE" style="width:130px;">
				</select>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>경보 수신옵션</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='checkbox' name="search_ALARM_TYPE1" id="search_ALARM_TYPE1">기준치 초과
				&nbsp;<input type='checkbox' name="search_ALARM_TYPE2" id="search_ALARM_TYPE2">측정상태 이상
				&nbsp;<input type='checkbox' name="search_ALARM_TYPE3" id="search_ALARM_TYPE3">전송상태 이상
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>SMS 수신옵션</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<input type='checkbox' name="search_SMS_WD" id="search_SMS_WD">평일주간
				&nbsp;<input type='checkbox' name="search_SMS_WN" id="search_SMS_WN">평일야간
				&nbsp;<input type='checkbox' name="search_SMS_HD" id="search_SMS_HD">휴일주간
				&nbsp;<input type='checkbox' name="search_SMS_HN" id="search_SMS_HN">휴일야간
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>SMS 수신 사업소</td>
			<td style="background-color:white; text-align:left; padding-left:5px;padding-top:5px;padding-bottom:5px">
				<table cellspacing="0" cellpadding="0" style="background-color: white;">
					<tr>
						<td width=200px align=center>
							<select name="search_SelectPointCode" id="search_SelectPointCode" multiple style="width:250px;" size=15 ondblclick="fnRemoveItem()">
							</select>
						</td>
						<td width=70px align="center"><input type="button" name="add" id="add" value = " => " onclick="fnRemoveItem()"><br>
							<br><input type="button" name="remove" id="remove" value = " <= " onclick="fnAppendItem()">
						</td>
						<td width=200px align=center>
							<select name="search_UnselectPointCode" id="search_UnselectPointCode" multiple style="width:250px;" size=15 ondblclick="fnAppendItem()">
							</select>
						</td>
					</tr>
					</table>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>관리자 여부</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="USER_LEVEL" name="USER_LEVEL" style="width:60px;">
					<option value="1">담당</option>
					<option value="2">관리자</option>
				</select>&nbsp;&nbsp;(담당 : 일반담당자, 관리자 : 과장, 소장, 부장)				
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>근부여부</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="EXPIRE_FLAG" name="EXPIRE_FLAG" style="width:60px;">
					<option value="1">재직중</option>
					<option value="2">전출</option>
					<option value="3">퇴직</option>
					<option value="8">기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class='swn_tbl_title'>사용자 권한값</td>
			<td style="background-color:white; text-align:left; padding-left:5px">
				<select id="USER_AUTH" name="USER_AUTH" style="width:60px;">
					<option value="9">9</option>
					<option value="5">5</option>
					<option value="3">3</option>
					<option value="1">1</option>
				</select>
			</td>
		</tr>
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