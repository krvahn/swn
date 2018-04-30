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
// mode : �۾� ���(add, update, answer)
// board_id : �Խ��� ���̵�
// write_no : �Խù� ��ȣ
// parent_no : ���� �Խù� ��ȣ
// re_level : �Խù� ����
// re_step : �Խù� ����
// title : �Խù� Ÿ��Ʋ
// content : �Խù� ����
// file_paths : ���� ���� ��� ���ڿ�
// file_titles : ���� ��Ī ���ڿ�
//-----------------------------------------------------------------------------------------------
String paramMode  = curPage.getParam("mode", "add"); 
String paramBoardID = curPage.getParam("board_id", "");
int paramWriteNo = Integer.parseInt(curPage.getParam("write_no", "-1"));
int paramParentNo = Integer.parseInt(curPage.getParam("parent_no", "-1"));
int paramReLevel = Integer.parseInt(curPage.getParam("re_level", "0")); 
int paramReStep = Integer.parseInt(curPage.getParam("re_step", "0"));
String paramTitle = curPage.getParam("title", "");
String paramContent = curPage.getParam("content", "");
String paramFilePaths = curPage.getParam("file_paths", "");
String paramFileTitles = curPage.getParam("file_titles", "");

BoardDao dao = new BoardDao();
Map<String, Object> params = null;
boolean bSuccess;

params = new HashMap<String, Object>();
bSuccess = false;
if( paramMode.equals("add") ) {
	// �߰�
	
	//���� ����	
	params.put("BOARD_ID", paramBoardID);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("FILE_TITLE", paramFilePaths);
	params.put("SAVE_FILE_NAME", paramFileTitles);
	
	params.put("WW_CODE", curPage.getGroupCode());
	params.put("USER_ID", curPage.getUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	// �۾�
	if( dao.insertBoardContent(params) <= 0 ) {
		bSuccess = false;
	} else {
		bSuccess = true;
	}
} else if( paramMode.equals("update") ) {
	// ����
	
	//���� ����	
	params.put("BOARD_ID", paramBoardID);
	params.put("WRITE_NO", paramWriteNo);
	params.put("PARENT_NO", paramParentNo);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("FILE_TITLE", paramFilePaths);
	params.put("SAVE_FILE_NAME", paramFileTitles);
	
	params.put("WW_CODE", curPage.getGroupCode());
	params.put("USER_ID", curPage.getUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	System.out.println(params);
	
	// �۾�
	if( dao.updateBoardContent(params) <= 0 ) {
		bSuccess = false;
	} else {
		bSuccess = true;
	}
} else if(paramMode.equals("answer")) {
	// ��� �ޱ�
	
	//���� ����	
	params.put("BOARD_ID", paramBoardID);
	params.put("WRITE_NO", paramWriteNo);
	params.put("PARENT_NO", paramParentNo);
	params.put("RE_LEVEL", paramReLevel);
	params.put("RE_STEP", paramReStep);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("FILE_TITLE", paramFilePaths);
	params.put("SAVE_FILE_NAME", paramFileTitles);
	
	params.put("WW_CODE", curPage.getGroupCode());
	params.put("USER_ID", curPage.getUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	// �۾�
	if( dao.insertBoardAnswerContent(params) <= 0 ) {
		bSuccess = false;
	} else {
		bSuccess = true;
	}
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