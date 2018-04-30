<%@ page import="java.util.*" %>

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

//권한 검사
curPage.checkAuthority(3, true, false);

//-----------------------------------------------------------------------------------------------
//파라미터 받기
//-----------------------------------------------------------------------------------------------
//board_id : 게시판 아이디
//page : 페이지 번호
//write_no : 게시물 번호
//parent_no : 상위 게시물 번호
//search_method : 검색 방법
//search_keyword : 검색 키워드
//-----------------------------------------------------------------------------------------------
String paramBoardID = curPage.getParam("board_id", "");
int paramCurPageNum = Integer.parseInt(curPage.getParam("page", "1"));
int paramWriteNo = Integer.parseInt(curPage.getParam("write_no", "-1"));
int paramParentNo = Integer.parseInt(curPage.getParam("parent_no", "-1"));
String paramSearchMethod = curPage.getParam("search_method", "");
String paramSearchKeyword = curPage.getParam("search_keyword", "");

BoardDao dao = new BoardDao();
Map<String, Object> params = null;
Map<String, Object> item = null;

//조건 설정
params = new HashMap<String, Object>();
params.put("BOARD_ID", paramBoardID);
params.put("WRITE_NO", paramWriteNo);
params.put("PARENT_NO", paramParentNo);


item = dao.selectOneBoardContent(params);
if( item == null ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('해당 계시물이 존재하지 않습니다.');");
	out.println("history.go(-1);");
	out.println("</script>");
	out.flush();
} else if( (curPage.getGroupAuth() == 9 || BoardConfig.ToString(item.get("USER_ID"), "").equals(curPage.getUserID())) == false ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('작성자 또는 관리자만이 삭제할 수 있습니다.');");
	out.println("history.go(-1);");
	out.println("</script>");
	out.flush();
}

// 해당 게시물을 상위 게시물을 삭제하기
if( dao.deleteBoardContent(params) == -1 ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('해당 게시물을 삭제할 수 없습니다.\n\n관리자에게 문의 하세요.');");
	out.println("history.go(-1);");
	out.println("</script>");
	out.flush();
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Expires" content ="-1">
<meta http-equiv="Prgama" content ="no-cache">
<meta http-equiv="Cache-Control" content ="No-Cache">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%=BoardConfig.PageTitle()%></title>
</head>
<body>
	<form name="frmPage" id="frmPage" method="post" action="./board_list.jsp">
		<input type="hidden" name="board_id" id="board_id" value="<%=paramBoardID%>">
		<input type="hidden" name="page" id="page" value="<%=paramCurPageNum%>">
		<input type="hidden" name="search_method" id="search_method" value="<%=paramSearchMethod%>">
		<input type="hidden" name="search_keyword" id="search_keyword" value="<%=paramSearchKeyword%>">
	</form>
</body>
<%
//목록 페이지로 이동
out.println("<script type='text/javascript' language='javascript'>");
out.println("document.frmPage.submit();");
out.println("</script>");

// 해제
dao = null;
curPage = null;
%>