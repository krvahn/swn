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
//�Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// TYPE : �ý��� ���� �˾�
//-----------------------------------------------------------------------------------------------
String paramType = curPage.getParam("TYPE", "");
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
<!-- Water Now ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>
<script type="text/javascript" language="javascript">
<%
	if( curPage.isLogin() && paramType.equals("1") ) {
		out.println("window.open('" + curPage.getContextPath() + "/page_system/status_manager_list.jsp" + "', 'stat', 'scrollbars=yes, left=0,top=0,width=810,height=620');");
	}
%>
</script>
<frameset rows="94,*" frameborder=no border=0 framespacing=0>
	<frame name="topFrm" scrolling=no src="${pageContext.request.contextPath}/top.jsp" noresize></frame>
	<frameset cols="208,*" frameborder=no border=0 framespacing=0>
		<frame name="leftFrm" scrolling=no src="${pageContext.request.contextPath}/left.jsp" noresize></frame>
		<frame name="mainFrm" scrolling=auto src="${pageContext.request.contextPath}/page_real/total_summary.jsp"></frame>
	</frameset>
</frameset>
</html>
<%
// ����
curPage = null;
%>