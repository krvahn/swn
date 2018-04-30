<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page import="metabit.web.board.*" %>
<%@ page import="metabit.web.board.db.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//-----------------------------------------------------------------------------------------------
// 웹 페이지 캐쉬 삭제
//-----------------------------------------------------------------------------------------------
request.setCharacterEncoding("euc-kr");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
if( request.getProtocol() != null && request.getProtocol().equals("HTTP/1.1") ) {
	response.setHeader("Cache-Control", "no-cache");
}

//-----------------------------------------------------------------------------------------------
//초기화
//-----------------------------------------------------------------------------------------------
BoardPage curPage = new BoardPage(pageContext, request, response);

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
// board_id : 게시판 아이디
// file_title : 다운로드 할 파일 경로
// file_name : 다운로드 할 실제 파일명
//-----------------------------------------------------------------------------------------------
String paramBoardID = curPage.getParam("board_id", "");
String paramFileTitle = curPage.getParam("file_title", "");
String paramFileName = curPage.getParam("file_name", "");

String sFilePath;

sFilePath = BoardConfig.UploadPath() + "/BRD_" + paramBoardID + "/" + paramFileTitle;

byte b[] = new byte[4096];
FileInputStream in = new FileInputStream(sFilePath);

String sMime = getServletContext().getMimeType(sFilePath);

String userAgent = request.getHeader("User-Agent");
String sEncoding;

if (sMime == null) {
    sMime = "application/octet-stream";
}
response.setContentType(sMime);

boolean ie = userAgent.indexOf("MSIE") > -1;

if( ie ) {
	sEncoding = new String(paramFileName.getBytes("euc-kr"), "8859_1");
} else {
	sEncoding = new String(paramFileName.getBytes("euc-kr"), "8859_1");
	//sEncoding = new String(paramFileName.getBytes("utf-8"), "8859_1");
}
response.setHeader("Content-Disposition", "attachment; filename=" + sEncoding + ";");

// 응답 헤더 지정
int numRead;
out.clear();
out = pageContext.pushBody();

ServletOutputStream out2 = response.getOutputStream();
while ((numRead = in.read(b, 0, b.length)) != -1) {
	out2.write(b, 0, numRead);
}
out2.flush();
out2.close();
in.close();

in = null;
curPage = null;
%>