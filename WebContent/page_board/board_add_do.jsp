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
// mode : 작업 모드(add, update, answer)
// board_id : 게시판 아이디
// write_no : 게시물 번호
// parent_no : 상위 게시물 번호
// re_level : 게시물 레벨
// re_step : 게시물 스템
// title : 게시물 타이틀
// content : 게시물 내용
// file_paths : 파일 저장 경로 문자열
// file_titles : 파일 명칭 문자열
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
	// 추가
	
	//조건 설정	
	params.put("BOARD_ID", paramBoardID);
	params.put("TITLE", paramTitle);
	params.put("CONTENT", BoardConfig.ToCheckWord(paramContent));
	params.put("FILE_TITLE", paramFilePaths);
	params.put("SAVE_FILE_NAME", paramFileTitles);
	
	params.put("WW_CODE", curPage.getGroupCode());
	params.put("USER_ID", curPage.getUserID());
	params.put("USER_NAME", curPage.getUserName());
	params.put("IP_ADDRESS", curPage.getIP());
	
	// 작업
	if( dao.insertBoardContent(params) <= 0 ) {
		bSuccess = false;
	} else {
		bSuccess = true;
	}
} else if( paramMode.equals("update") ) {
	// 수정
	
	//조건 설정	
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
	
	// 작업
	if( dao.updateBoardContent(params) <= 0 ) {
		bSuccess = false;
	} else {
		bSuccess = true;
	}
} else if(paramMode.equals("answer")) {
	// 답글 달기
	
	//조건 설정	
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
	
	// 작업
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
	out.println("alert('해당 게시물을 등록할 수 없습니다.\\n\\n관리자에게 문의 하세요.');");
	out.println("history.go(-1);");
	out.println("</script>");
	out.flush();
}

// 해제
dao = null;
curPage = null;
%>