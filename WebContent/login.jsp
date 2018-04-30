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
// opcode : ���(logout : �α׾ƿ�, ��Ÿ: �α���)
// gotoUrl : �α��� �� ���� URL
//-----------------------------------------------------------------------------------------------
String paramOpCode = curPage.getParam("opcode", "");
String paramGotoURL = curPage.getParam("gotoUrl", "");

if( paramOpCode.equals("logout") ) {
	curPage.logout();
	response.sendRedirect(curPage.getContextPath() + "/index.jsp");
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

<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<!-- DataTabele ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<link type="text/css" href="${pageContext.request.contextPath}/import/jquery.dataTables.none.css" rel="stylesheet" />
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.fnReloadAjax.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.fnFakeRowColspan.js"></script>

<style type="text/css">
html
{
	width:100%;
	height:100%;	
	padding:0px;
}

</style>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	
	$(document).ready(function() {
		// COOKIE �� �ֱ�
		$("#UserID").val("<%=curPage.getCookieUserID("")%>");
		
		if( $("#UserID").val() != "" ) {
			$("#UserPWD").focus();
		}
	});
	
	function fnSubmitForm()
	{	
		var userId, userPwd;
		var URL;
		
		userId = $("#UserID").val();
		userPwd = $("#UserPWD").val();
		
		userId = $.trim(userId);
		userPwd = $.trim(userPwd);
		
		if( userId == "" ) {
			alert("[���̵� �Է��Ͽ� �ֽʽÿ�.]");
			
			$("#UserID").focus();
			
			if( event ) {
				event.returnValue = false;
			}
			
			return false;
		}
		
		if( userPwd == "" ) {
			alert("[�н����带 �Է��Ͽ� �ֽʽÿ�.]");
			
			$("#UserPWD").focus();
		}
		
		URL = "login.do?Act=login&USER_ID=" + userId + "&USER_PWD=" + userPwd;
		jQuery.ajax({
			type: "POST",
			url: URL,
			async: true,
			dataType: "JSON",
			success: function(data) {
				if( data.isLogin ) {
					if( data.isOpenSystem ) {
						<%
						if( paramGotoURL.equals("") ) {
							out.println("document.location.href = g_contextPath + '/index.jsp?TYPE=1';");
						} else {
							out.println("document.location.href = g_contextPath + '/" + paramGotoURL + "';");
						}
						%>
					} else {
						<%
						if( paramGotoURL.equals("") ) {
							out.println("document.location.href = g_contextPath + '/index.jsp';");							
						} else {							
							out.println("document.location.href = g_contextPath + '/" + paramGotoURL + "';");
						}
						%>
					}
				} else {
					alert("����� ������ Ȯ�� �� �� �����ϴ�.\n\n�α��� ������ Ȯ�� �Ͽ� �ֽʽÿ�.");
					
					$("#UserPWD").val("");
					$("#UserPWD").focus();
				}
			},
			error: function(e) {
				alert("�ý��� �α��� ������ ���ӿ� �����Ͽ����ϴ�.\n\n������ �Ͽ� �ֽʽÿ�.");
			}
		});
		
		if( event ) {
			event.returnValue = false;
		}
		
		return fale;
	}
</script>
<body style="height:100%; padding:0px; margin:0px;">
<table id="outer_table">
<tr><td height=10px></td></tr>
<tr>
	<td height=100%>
		<table align="center" cellspacing=0 cellpadding=0>
		<tr>
			<td><img src="${pageContext.request.contextPath}/images/login/20090506_swn_login_top01.jpg"></td>
		</tr>
		<tr>
			<td>
				<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="481" height="271" id="20090506_swn_login01" align="middle">
					<param name="allowScriptAccess" value="sameDomain" />
					<param name="allowFullScreen" value="false" />
					<param name="movie" value="${pageContext.request.contextPath}/images/login/20090506_swn_login01.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#ffffff" />	
					<embed src="${pageContext.request.contextPath}/images/login/20090506_swn_login01.swf" width="481" height="271" align="middle"  type="application/x-shockwave-flash"/>
				</object>
			</td>
		</tr>
		<tr>
		
			<td background="${pageContext.request.contextPath}/images/login/20090506_swn_login_bg01.jpg" height=70>
				<form name="LoginForm" onSubmit="fnSubmitForm()" method="POST">
					<table align=right cellspacing=0 cellpadding=0>
					<tr>
						<td><img src="${pageContext.request.contextPath}/images/login/20090506_swn_login_img02.jpg"></td>
						<td width=10></td>
						<td width=110>
							<table cellspacing=0 cellpadding=0>
							<tr>
								<td height=12></td>
							</tr>
							<tr>
								<td height=21 valign=middle><input type=text id="UserID" name="UserID" value="" style="width:110px; height:14px;"></td>
							</tr>
							<tr>
								<td height=5></td>
							</tr>
							<tr>
								<td height=21 valign=middle><input type=password id="UserPWD" name="UserPWD" value="" style="width:110px; height:14px;"></td>
							</tr>
							<tr>
								<td height=12></td>
							</tr>
							</table>
						</td>
						<td width=10></td>
						<td width=66>
							<table cellspacing=0 cellpadding=0>
							<tr>
								<td height=12></td>
							</tr>
							<tr>
								<td height=21><input type=image src="${pageContext.request.contextPath}/images/login/20090506_swn_login_btn01.gif" border=0></td>
							</tr>
							<tr>
								<td height=5></td>
							</tr>
							<tr>
								<td height=21><a href="javascript:LoginForm.reset();"><img src="${pageContext.request.contextPath}/images/login/20090506_swn_login_btn02.gif" border=0></a></td>
							</tr>
							<tr>
								<td height=12></td>
							</tr>
							</table>
						</td>
						<td width=10></td>						
					</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td><img src="${pageContext.request.contextPath}/images/login/20090506_swn_login_bottom01.jpg"></td>
		</tr>
		</table>
	</td>
</tr>
<tr><td height=10px></td></tr>
</table>
</body>
</html>
<%
// ����
curPage = null;
%>