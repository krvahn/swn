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
curPage.checkAuthority(0, true, false);

//-----------------------------------------------------------------------------------------------
//�Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// mode : �۾� ���(add, update, answer)
// board_id : �Խ��� ���̵�
// write_no : �Խù� ��ȣ
// title : �Խù� Ÿ��Ʋ
// content : �Խù� ����
// expire_date : �˾� ������
//-----------------------------------------------------------------------------------------------
String paramMode  = curPage.getParam("mode", "add"); 
String paramBoardID = curPage.getParam("board_id", "");
int paramWriteNo = Integer.parseInt(curPage.getParam("write_no", "-1"));
String paramTitle = curPage.getParam("title", "");
String paramContent = curPage.getParam("content", "");
String paramExireDate = curPage.getParam("expire_date", "");

BoardDao dao = new BoardDao();
Map<String, Object> params = null;
boolean bSuccess;

params = new HashMap<String, Object>();
bSuccess = false;
if( paramMode.equals("add") ) {
	// �߰�
	
	//���� ����	
	params.put("OPEN_BOARD", "1");
	params.put("BOARD_ID", paramBoardID);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("EXPIRE_DATE", paramExireDate);
	
	params.put("USER_ID", curPage.getSessionUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	// �۾�
	if( dao.insertOpenBoardContent(params) <= 0 ) {
		bSuccess = false;
	} else {
		bSuccess = true;
	}
} else if( paramMode.equals("update") ) {
	// ����
	
	//���� ����	
	params.put("BOARD_ID", paramBoardID);
	params.put("WRITE_NO", paramWriteNo);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("EXPIRE_DATE", paramExireDate);
	params.put("USER_ID", curPage.getSessionUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	System.out.println(params);
	
	// �۾�
	if( dao.updateOpenBoardContent(params) <= 0 ) {
		bSuccess = false;
	} else {
		bSuccess = true;
	}
} else if(paramMode.equals("answer")) {
	// ��� �ޱ�
	
	//���� ����	
	params.put("BOARD_ID", paramBoardID);
	params.put("WRITE_NO", paramWriteNo);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("EXPIRE_DATE", paramExireDate);
	params.put("USER_ID", curPage.getSessionUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	// �۾�
	// �۾� ���� ����
}

if( bSuccess ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("document.location.href = './board_list.jsp?board_id=" + paramBoardID + "';");
	out.println("</script>");
	out.flush();
} else {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('�ش� �Խù��� ����� �� �����ϴ�.\\n\\n�����ڿ��� ���� �ϼ���.');");
	out.println("history.go(-1);");
	out.println("</script>");
	out.flush();
}

// ����
dao = null;
curPage = null;
%>