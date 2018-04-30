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

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
// board_id : 게시판 아이디
// page : 페이지 번호
// write_no : 게시물 번호
// paren_no : 상위 게시물 번호
// search_method : 검색 방법
// search_keyword : 검색 키워드
//-----------------------------------------------------------------------------------------------
String paramBoardID = curPage.getParam("board_id", "");
int paramCurPageNum = Integer.parseInt(curPage.getParam("page", "1"));
int paramWriteNo = Integer.parseInt(curPage.getParam("write_no", "-1"));
String paramSearchMethod = curPage.getParam("search_method", "");
String paramSearchKeyword = curPage.getParam("search_keyword", "");

Map<String, Object> params = null;
BoardDao dao = new BoardDao();

Map<String, Object> boardAdmin = null;
Map<String, Object> item = null;

String sErrorMessage;
String sTopImage;
String sAttachFlag, sReplyFlag, sExpireFlag;
String sNewFlag;

// 조건 설정
params = new HashMap<String, Object>();
params.put("OPEN_BOARD", "1");
params.put("BOARD_ID", paramBoardID);
params.put("WRITE_NO", paramWriteNo);

// 해당 게시판의 조회 횟수 늘리기
dao.updateBoardViewCount(params);

//해당 게시판의 정보 얻기
boardAdmin = dao.selectOneBoardAdmin(params);

sTopImage = BoardConfig.ToString(boardAdmin.get("TOP_IMAGE"), ""); // TOP 이미지 URL
sAttachFlag = BoardConfig.ToString(boardAdmin.get("ATTACH_FLAG"), "N"); // 첨부파일 여부
sReplyFlag = BoardConfig.ToString(boardAdmin.get("REPLY_FLAG"), "N"); // 답글여부
sExpireFlag = BoardConfig.ToString(boardAdmin.get("EXPIRE_FLAG"), "N"); // 유통기한여부
sNewFlag = BoardConfig.ToString(boardAdmin.get("NEWS_FLAG"), "N"); // 유통기한여부

// 데이터 얻기
sErrorMessage = ""; 
item = dao.selectOneOpenBoardContent(params);
if( item == null || item.size() == 0 ) {
	sErrorMessage = "<br><b>등록된 내용이 없습니다.</b><br><br>";
}

// TOP image URL 얻기
if( sTopImage.equals("") )
{
	// 기존 페이지플 위해 하드코딩 됨
	sTopImage = curPage.getContextPath() + BoardConfig.GetTopImageURL(paramBoardID);	
} else {
	sTopImage = curPage.getContextPath() + sTopImage;
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
<!-- jQuery 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="jquery.js"></script>
<link type="text/css" href="board.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	
	function goList()
	{	
		var oForm = document.frmPage;
		
		oForm.board_id.value = "<%=paramBoardID%>";
		oForm.search_method.value = "<%=paramSearchMethod%>";
		oForm.search_keyword.value = "<%=paramSearchKeyword%>";
		oForm.page.value = "<%=paramCurPageNum%>";
		
		oForm.method = "post";
		oForm.action = "./board_list.jsp";
		oForm.submit();
	}
	
	function goAdd(mode)
	{	
		if( mode == "update" ) {
			<%if( curPage.getSessionUserID().equals("") ) {%>
				alert('\n로그인이 필요한 페이지입니다.\n\n권한 확인을 위해 로그인을 해 주십시오.');
				// top.location.href='<%=curPage.getContextPath()%>/<%=BoardConfig.LoginPage()%>';
				return;
			<%} else if( curPage.getSessionUserID().equals(item.get("USER_ID")) == false ) {%>
				alert("작성자만이 해당 게시물을 수정할 수 있습니다.");
				return;
			<%}%>
		}
		
		<%if( curPage.checkAuthority(0, false, true) ) {%>
			var oForm = document.frmPage;
			
			oForm.board_id.value = "<%=paramBoardID%>";
			oForm.page.value = "<%=paramCurPageNum%>";
			oForm.mode.value = mode;
			oForm.write_no.value = "<%=paramWriteNo%>";
			oForm.search_method.value = "<%=paramSearchMethod%>";
			oForm.search_keyword.value = "<%=paramSearchKeyword%>";		
			
			oForm.method = "post";
			oForm.action = "./board_add.jsp";
			oForm.submit();
		<%} else {%>
			alert("게시판을 작성할 권한이 없습니다.");
		<%}%>
	}
	
	function goDelete()
	{
		<%if( curPage.getGroupAuth() == 9 || BoardConfig.ToString(item.get("USER_ID"), "").equals(curPage.getSessionUserID()) ) {%>
			var bDel;
			var URL;
			
			bDel = confirm("선택한 데이터를 정말로 삭제하시겠습니까?");
			if( bDel == true ) {
				var oForm = document.frmPage;
				
				oForm.board_id.value = "<%=paramBoardID%>";
				oForm.search_method.value = "<%=paramSearchMethod%>";
				oForm.search_keyword.value = "<%=paramSearchKeyword%>";
				oForm.write_no.value = "<%=paramWriteNo%>";
				oForm.page.value = "<%=paramCurPageNum%>";
				
				oForm.method = "post";
				oForm.action = "./board_del_do.jsp";
				oForm.submit();
			}
		<%} else {%>
			alert("작성자 또는 관리자만이 삭제할 수 있습니다.");
		<%}%>
	}
	
	function fnClose()
	{
		self.close();
	}
	
	function fnWater()
	{
		window.open('http://water.seoul.go.kr/waternow/RealDataFullScale.php','Real','scrollbars=yes, left=0,top=0,width=830,height=600');
	}
</script>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="background:#FFFFFF;">
	<table width=100% border=0 cellspacing=0 cellpadding=0 bgcolor=white>
	<tr>
		<td align=left colspan=2 bgcolor=white>
			<img src="<%=sTopImage%>" title="<%=BoardConfig.ToString(boardAdmin.get("TOP_COMMENT"), "")%>">
		</td>
	</tr>
	<tr>
		<td width=30>&nbsp;</td>
		<td>
			<table width="100%" cellspacing="0" cellpadding="0" style="background-color: ##FFFFFF;">
			<tr>
				<td colspan=2 width=100% align=right>
					<a href="${pageContext.request.contextPath}/page_system/status_manager_list.jsp">상태정보설정</a>
					| <b><a href="${pageContext.request.contextPath}/open_board/board_list.jsp?board_id=open">공지사항</a></b>
					| <a href="javascript:fnWater();">실시간현황</a>
				</td>
			</tr>
			<tr><td height=10></td></tr>
			<tr>
				<td align=right>
					<a href="javascript:fnClose();"><img src="${pageContext.request.contextPath}/images/comm/20090514_swn_btn02.gif" border=0 ></a>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width=30>&nbsp;</td>
		<td>
			<table width=100% cellspacing=0 cellpadding=0 align=center>
			<tr>
				<td>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr><td bgcolor=#00375D height=2></td></tr>					
<%
if( item != null && item.size() > 0 ) {
	String sTitle, sContent, sUserName, sWriteDate;
	
	sTitle = BoardConfig.ToString(item.get("TITLE"), "");
	sContent = BoardConfig.ToString(item.get("CONTENT"), "");
	sUserName = BoardConfig.ToString(item.get("USER_NAME"), "");
	sWriteDate = BoardConfig.ToString(item.get("WRITE_DATE"), "");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("		<table width=100% cellspacing=0 cellpadding=0>");
	out.println("		<tr>");
	out.println("			<td height=32 align=left style='padding-left:20px;'><strong><font color=#00375d>" + sTitle + "</font></strong>");
	out.println("			<td height=32 align=right style='padding-left:20px;'><font color=#8E8E8E>" + sWriteDate + "</font>");
	out.println("		</tr>");
	out.println("		</table>");
	out.println("	</td>");
	out.println("</tr>");
	out.println("<tr><td bgcolor=#00375D height=2></td></tr>");	
	out.println("<tr>");
	out.println("	<td>");
	out.println("		<table width=100% cellspacing=0 cellpadding=0>");
	out.println("		<tr>");	
	out.println("			<td height=50 align=center><strong><font color=#00375d size=4>" + sTitle + "</font></strong></td>");
	out.println("		</tr>");
	out.println("		<tr>");	
	out.println("			<td><blockquote>" + sContent + "</blockquote></td>");
	out.println("		</tr>");
	out.println("		</table>");
	out.println("	</td>");
	out.println("</tr>");	
} else {
	out.println("<tr>");
	out.println("<td align=center>" + sErrorMessage + "</td>");
	out.println("</tr>");
}
%>					
					<tr><td bgcolor=#00375D height=2></td></tr>
					</table>
				</td>
			</tr>
			<!-- 버튼 처리 -->
			<tr><td height=10></td></tr>
			<tr>
				<td height=25>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
						<td height=25 align=left>
							<a href="javascript:goList();"><img src="./images/20081212_swn_btn_list.gif" border=0></a>
						</td>
						<td height=25 align=right>
						<%if(sReplyFlag.equals("Y")) { %>
							<a href="javascript:goAdd('answer');"><img src="./images/20081212_swn_btn_reply.gif" border=0></a>&nbsp;
						<%}%>
							<a href="javascript:goAdd('update');"><img src="./images/20081212_swn_btn_modify.gif" border=0></a>&nbsp;
							<a href="javascript:goDelete();"><img src="./images/20081212_swn_btn_delete.gif" border=0></a>&nbsp;
							<a href="javascript:goAdd('add');"><img src="./images/20081212_swn_btn_write.gif" border=0></a>
						</td>
					</tr>
					</table>
				</td>
			</tr>			
			</table>
		</td>
		<td width=30>&nbsp;</td>
	</tr>
	</table>
	<form name="frmPage" id="frmPage">
		<input type="hidden" name="board_id" id="board_id" value="">
		<input type="hidden" name="page" id="page" value="">
		<input type="hidden" name="mode" id="mode" value="">
		<input type="hidden" name="write_no" id="write_no" value="">
		<input type="hidden" name="search_method" id="search_method" value="">
		<input type="hidden" name="search_keyword" id="search_keyword" value="">
	</form>
	<form name="frmFileDown" id="frmFileDown">
		<input type="hidden" name="board_id" id="board_id" value="">
		<input type="hidden" name="file_title" id="file_title" value="">
		<input type="hidden" name="file_name" id="file_name" value="">
	</form>
	<iframe name="frame_file_down" width=0 height=0></iframe>
</body>
</html>
<%
// 해제
params = null;
item = null;
boardAdmin = null;
dao = null;
curPage = null;
%>