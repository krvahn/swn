<%@ page import="java.io.*" %>

<%@ page import="org.apache.commons.codec.binary.*" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//-----------------------------------------------------------------------------------------------
// �� ������ ĳ�� ����
//-----------------------------------------------------------------------------------------------
request.setCharacterEncoding("euc-kr");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
if( request.getProtocol() != null && request.getProtocol().equals("HTTP/1.1") ) {
	response.setHeader("Cache-Control", "no-cache");
}

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// FILE_NAME : ���� ��Ī
// FILE_DATA : ���� ������ (�̹��� ���ڿ�)
//-----------------------------------------------------------------------------------------------
String paramFileName = request.getParameter("FILE_NAME");
String paramFileData = request.getParameter("FILE_DATA");

boolean isDownLoad = false;
String imageType, fileName, fileData;
byte[] imageDecData;

imageType = "";
fileName = "";
imageDecData = null;
if( paramFileName == null || paramFileName.length() == 0 || paramFileData == null || paramFileData.length() == 0 )
{
	isDownLoad = false;
} else {
	System.out.println("FILE NAME : " + paramFileName);
	System.out.println("FILE DATA : " + paramFileData);
	
	if( paramFileName.indexOf(".png") < 0 ) {
		paramFileName += ".png";
	}
	
	imageType = "image/png";
	//fileName = paramFileName;
	fileName = new String(paramFileName.getBytes("euc-kr"), "8859_1");
	fileData = paramFileData.replace("data:image/png;base64,", "");
	imageDecData = Base64.decodeBase64(fileData);
	
	isDownLoad = true;
}

if( isDownLoad == false ) {
	out.println("<html>");
	out.println("<head>");
	out.println("</head>");
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('�ش� �̹����� ������ �� �����ϴ�.');");
	out.println("</script>");
	out.println("</html>");
} else {
	response.setContentType(imageType);
	response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
	
	out.clear();
	out = pageContext.pushBody();
	
	ServletOutputStream out2 = response.getOutputStream();
	out2.write(imageDecData, 0, imageDecData.length);
	out2.flush();
	out2.close();
}
%>
