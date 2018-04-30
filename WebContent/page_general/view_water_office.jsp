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
if( wwCode.equals("PR0055") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_water_office_1.jsp");
} else if( wwCode.equals("PR0065") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_water_office_2.jsp");
} else if( wwCode.equals("PR0183") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_water_office_3.jsp");
} else if( wwCode.equals("PR0407") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_water_office_4.jsp");
} else if( wwCode.equals("PR0370") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_water_office_5.jsp");
} else if( wwCode.equals("PR0710") ) {
	response.sendRedirect(curPage.getContextPath() + "/page_general/view_water_office_6.jsp");
}

// ����
curPage = null;
%>