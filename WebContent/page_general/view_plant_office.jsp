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
// WW_CODE : �������� �ڵ�
//-----------------------------------------------------------------------------------------------
String paramWWCode = curPage.getParam("WW_CODE", "");

String wwCode = paramWWCode.toUpperCase(); 
if( wwCode.equals("WW0001") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_plant_office_1.jsp");
} else if( wwCode.equals("WW0003") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_plant_office_2.jsp");
} else if( wwCode.equals("WW0005") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_plant_office_3.jsp");
} else if( wwCode.equals("WW0006") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_plant_office_4.jsp");
} else if( wwCode.equals("WW0007") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_plant_office_5.jsp");
} else if( wwCode.equals("WW0009") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_plant_office_6.jsp");
} else if( wwCode.equals("WW0010") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_plant_office_7.jsp");
} else if( wwCode.equals("WW0011") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_plant_office_8.jsp");
}

// ����
curPage = null;
%>