<%@ page import="java.util.*" %>

<%@ page import="metabit.web.board.*" %>
<%@ page import="metabit.web.board.db.*" %>
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
//�ʱ�ȭ
//-----------------------------------------------------------------------------------------------
BoardPage curPage = new BoardPage(pageContext, request, response);

//���� �˻�
curPage.checkAuthority(3, true, false);

//-----------------------------------------------------------------------------------------------
//�Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
//board_id : �Խ��� ���̵�
//page : ������ ��ȣ
//write_no : �Խù� ��ȣ
//parent_no : ���� �Խù� ��ȣ
//search_method : �˻� ���
//search_keyword : �˻� Ű����
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

//���� ����
params = new HashMap<String, Object>();
params.put("BOARD_ID", paramBoardID);
params.put("WRITE_NO", paramWriteNo);
params.put("PARENT_NO", paramParentNo);


item = dao.selectOneBoardContent(params);
if( item == null ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('�ش� ��ù��� �������� �ʽ��ϴ�.');");
	out.println("history.go(-1);");
	out.println("</script>");
	out.flush();
} else if( (curPage.getGroupAuth() == 9 || BoardConfig.ToString(item.get("USER_ID"), "").equals(curPage.getUserID())) == false ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('�ۼ��� �Ǵ� �����ڸ��� ������ �� �ֽ��ϴ�.');");
	out.println("history.go(-1);");
	out.println("</script>");
	out.flush();
}

// �ش� �Խù��� ���� �Խù��� �����ϱ�
if( dao.deleteBoardContent(params) == -1 ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('�ش� �Խù��� ������ �� �����ϴ�.\n\n�����ڿ��� ���� �ϼ���.');");
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
//��� �������� �̵�
out.println("<script type='text/javascript' language='javascript'>");
out.println("document.frmPage.submit();");
out.println("</script>");

// ����
dao = null;
curPage = null;
%>