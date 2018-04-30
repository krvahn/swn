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

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
</script>

<style type="text/css">
<!--
.table_title {  color: 003471}
-->
</style>
<body style="background:#FFFFFF;">
	<table width="600" border="0" cellspacing="0" cellpadding="0" height="500">
	<tr align="center"> 
		<td height="38"><img src="${pageContext.request.contextPath}/images/top/pop1_1.gif" width="600" height="38"></td>
	</tr>
	<tr align="center">
		<td height="42"><img src="${pageContext.request.contextPath}/images/top/i_help_1.gif" width="600" height="42"></td>
	</tr>
	<tr align="center" valign="top"> 
		<td> 
			<table width="100%" border="0" cellspacing="0" cellpadding="0" background="${pageContext.request.contextPath}/images/top/pop1_4.gif" height="100%">
			<tr> 
				<td width="10" valign="top"><img src="${pageContext.request.contextPath}/images/top/pop1_2.gif" width="10" height="132"></td>
				<td align="center" valign="top"> 
					<table width="98%" border="0" cellspacing="0" cellpadding="0">
					<tr> 
						<td width="150" valign="top"> 
							<table width="100%" border="0" cellspacing="0" cellpadding="5">
							<tr> 
								<td><img src="${pageContext.request.contextPath}/images/top/bullet_02.gif" width="9" height="9">�ǽð� ��������</td>
							</tr>
							<tr> 
								<td><img src="${pageContext.request.contextPath}/images/top/bullet_02.gif" width="9" height="9">�̷� ����</td>
							</tr>
							<tr> 
								<td><img src="${pageContext.request.contextPath}/images/top/bullet_02.gif" width="9" height="9">����� ������ ����</td>
							</tr>
							<tr> 
								<td><img src="${pageContext.request.contextPath}/images/top/bullet_02.gif" width="9" height="9">�ý��� ����</td>
							</tr>
							<tr> 
								<td><img src="${pageContext.request.contextPath}/images/top/bullet_02.gif" width="9" height="9">�Ϲ� ��Ȳ</td>
							</tr>
							<tr> 
								<td><img src="${pageContext.request.contextPath}/images/top/bullet_02.gif" width="9" height="9">�Խ���</td>
							</tr>
							<tr> 
								<td><img src="${pageContext.request.contextPath}/images/top/bullet_02.gif" width="9" height="9">�ڷ��</td>
							</tr>
							</table>
						</td>
						<td align="center"><br>
							<img src="${pageContext.request.contextPath}/images/top/i_help_2.gif" width="350" height="237">
							<br><br><br><br>
							������� ���������, ���������, �����, ������ ���� <br>
							Ȯ���Ͻ� �� �ִ� ���տ�� ������ �Դϴ�. 
						</td>
					</tr>
					</table>
				</td>
				<td width="10" valign="top"><img src="${pageContext.request.contextPath}/images/top/pop1_3.gif" width="10" height="143"></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr align="center"> 
		<td height="10"><img src="${pageContext.request.contextPath}/images/top/pop1_5.gif" width="600" height="10"></td>
	</tr>
	<tr align="right" valign="middle"> 
		<td height="30" bgcolor="DFDFDF"> 
			<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><a href="javascript:self.close();"><img src="${pageContext.request.contextPath}/images/top/pop1_6.gif" width="65" height="21" border="0"></a></td>
				<td width="10">&nbsp;</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
</body>
</html>
<%
// ����
curPage = null;
%>