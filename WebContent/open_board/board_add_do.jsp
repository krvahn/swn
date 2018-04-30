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
curPage.checkAuthority(0, true, false);

//-----------------------------------------------------------------------------------------------
//파라미터 받기
//-----------------------------------------------------------------------------------------------
// mode : 작업 모드(add, update, answer)
// board_id : 게시판 아이디
// write_no : 게시물 번호
// title : 게시물 타이틀
// content : 게시물 내용
// expire_date : 팝업 종료일
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
	// 추가
	
	//조건 설정	
	params.put("OPEN_BOARD", "1");
	params.put("BOARD_ID", paramBoardID);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("EXPIRE_DATE", paramExireDate);
	
	params.put("USER_ID", curPage.getSessionUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	// 작업
	if( dao.insertOpenBoardContent(params) <= 0 ) {
		bSuccess = false;
	} else {
		bSuccess = true;
	}
} else if( paramMode.equals("update") ) {
	// 수정
	
	//조건 설정	
	params.put("BOARD_ID", paramBoardID);
	params.put("WRITE_NO", paramWriteNo);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("EXPIRE_DATE", paramExireDate);
	params.put("USER_ID", curPage.getSessionUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	System.out.println(params);
	
	// 작업
	if( dao.updateOpenBoardContent(params) <= 0 ) {
		bSuccess = false;
	} else {
		bSuccess = true;
	}
} else if(paramMode.equals("answer")) {
	// 답글 달기
	
	//조건 설정	
	params.put("BOARD_ID", paramBoardID);
	params.put("WRITE_NO", paramWriteNo);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("EXPIRE_DATE", paramExireDate);
	params.put("USER_ID", curPage.getSessionUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	// 작업
	// 작업 내용 없음
}

if( bSuccess ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("document.location.href = './board_list.jsp?board_id=" + paramBoardID + "';");
	out.println("</script>");
	out.flush();
} else {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('해당 게시물을 등록할 수 없습니다.\\n\\n관리자에게 문의 하세요.');");
	out.println("history.go(-1);");
	out.println("</script>");
	out.flush();
}

// 해제
dao = null;
curPage = null;
%>