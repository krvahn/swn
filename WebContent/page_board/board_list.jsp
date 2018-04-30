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
// search_method : 검색 방법
// search_keyword : 검색 키워드
//-----------------------------------------------------------------------------------------------
String paramBoardID = curPage.getParam("board_id", "");
int paramCurPageNum = Integer.parseInt(curPage.getParam("page", "1"));
String paramSearchMethod = curPage.getParam("search_method", "");
String paramSearchKeyword = curPage.getParam("search_keyword", "");

Map<String, Object> params = null;
BoardDao dao = new BoardDao();

Map<String, Object> boardAdmin = null;
List<Map<String, Object>> boardList = null;
Iterator<Map<String, Object>> it = null;
Map<String, Object> item = null;

int nTotalCnt;
int nTotalPageNum, nFromNum, nToNum;
String sErrorMessage;
String sTopImage;
String sAttachFlag, sReplyFlag, sExpireFlag;
String sNewFlag;
int nListCount;

int nConfigTitleMaxLen;
int nConfigTitleMaxLen2;

// 조건 설정
params = new HashMap<String, Object>();
params.put("BOARD_ID", paramBoardID);

//해당 게시판의 정보 얻기
boardAdmin = dao.selectOneBoardAdmin(params);

sTopImage = BoardConfig.ToString(boardAdmin.get("TOP_IMAGE"), ""); // TOP 이미지 URL
sAttachFlag = BoardConfig.ToString(boardAdmin.get("ATTACH_FLAG"), "N"); // 첨부파일 여부
sReplyFlag = BoardConfig.ToString(boardAdmin.get("REPLY_FLAG"), "N"); // 답글여부
sExpireFlag = BoardConfig.ToString(boardAdmin.get("EXPIRE_FLAG"), "N"); // 유통기한여부
sNewFlag = BoardConfig.ToString(boardAdmin.get("NEWS_FLAG"), "N"); // 유통기한여부
nListCount = BoardConfig.ToInt(boardAdmin.get("LIST_COUNT"), 10); // 한페이지당 개수

// 검색 조건 설정 하기
if( paramSearchKeyword.length() > 0 ) {
	if( paramSearchMethod.equals("title") ) {
		params.put("SEARCH_METHOD", "TITLE");
	} else if( paramSearchMethod.equals("content") ) {
		params.put("SEARCH_METHOD", "CONTENT");
	} else if( paramSearchMethod.equals("title_content") ) {
		params.put("SEARCH_METHOD", "TITLE_CONTENT");
	} else if( paramSearchMethod.equals("save_file_name") ) {
		params.put("SEARCH_METHOD", "SAVE_FILE_NAME");
	} else if( paramSearchMethod.equals("user_name") ) {
		params.put("SEARCH_METHOD", "USER_NAME");
	} else {
		params.put("SEARCH_METHOD", "ALL");
	}
	params.put("SEARCH_KEYWORD", paramSearchKeyword);
}

// 게시물 전체 개수 가져오기
nTotalCnt = (int) dao.selectOnBoardListTotalCnt(params);
nTotalPageNum = (int) (nTotalCnt / nListCount) + (nTotalCnt % nListCount > 0 ? 1 : 0);
nFromNum = ((paramCurPageNum - 1) * nListCount) + 1;
nToNum =  nFromNum + nListCount - 1;
if( nToNum > nTotalCnt ) {
	nToNum = nTotalCnt;
}

// 내부 설정
nConfigTitleMaxLen = 60;
nConfigTitleMaxLen2 = 50;

if( sAttachFlag.equals("Y") ) {	
	nConfigTitleMaxLen = 50;
	nConfigTitleMaxLen2 = 40; 
}

// 추가 조건 설정
params.put("FROM_NUM", nFromNum);
params.put("TO_NUM", nToNum);

// 데이터 얻기
sErrorMessage = ""; 
boardList = dao.selectBoardList(params);
if( boardList == null || boardList.size() == 0 ) {
	if(paramSearchKeyword.length() > 0 ) {
		sErrorMessage = "<br><b>등록된 내용이 없습니다.<br>영문일경우 대소문자를 구별하오니 다시 검색해주십시오.</b><br><br>";
	} else {
		sErrorMessage = "<br><b>등록된 내용이 없습니다.</b><br><br>";
	}
}

// TOP image URL 얻기
if( sTopImage.equals("") )
{
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
	
	function goPage(pageNum)
	{	
		var oForm = document.frmPage;
		
		oForm.board_id.value = "<%=paramBoardID%>";
		oForm.search_method.value = "<%=paramSearchMethod%>";
		oForm.search_keyword.value = "<%=paramSearchKeyword%>";
		oForm.page.value = pageNum;
		
		oForm.method = "post";
		oForm.action = "./board_list.jsp";
		oForm.submit();
	}
	
	function goSearch()
	{
		var oForm = document.frmPage;
		
		oForm.board_id.value = "<%=paramBoardID%>";
		oForm.page.value = "1";
		
		oForm.method = "post";
		oForm.action = "./board_list.jsp";
		oForm.submit();
	}
	
	function goView(writeNo, parentNo)
	{	
		var oForm = document.frmPage;
		
		oForm.board_id.value = "<%=paramBoardID%>";
		oForm.search_method.value = "<%=paramSearchMethod%>";
		oForm.search_keyword.value = "<%=paramSearchKeyword%>";
		oForm.page.value = "<%=paramCurPageNum%>";
		oForm.write_no.value = writeNo;
		oForm.parent_no.value = parentNo;
		
		oForm.method = "post";
		oForm.action = "./board_view.jsp";
		oForm.submit();
	}
	
	function goAdd()
	{
		<%if( curPage.checkAuthority(3, false, true) ) {%>
		var oForm = document.frmPage;
		
		oForm.board_id.value = "<%=paramBoardID%>";
		oForm.page.value = "<%=paramCurPageNum%>";
		oForm.search_method.value = "<%=paramSearchMethod%>";
		oForm.search_keyword.value = "<%=paramSearchKeyword%>";		
		
		oForm.method = "post";
		oForm.action = "./board_add.jsp";
		oForm.submit();
		<%} else {%>
			alert("게시판을 작성할 권한이 없습니다.");
		<%}%>
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
			<table width=100% cellspacing=0 cellpadding=0 align=center>
			<tr>
				<td>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
						<td colspan=5 bgcolor=#00375D height=2></td>
					</tr>
					<tr>
						<td width=50 height=32 background="./images/20081212_swn_board_bg01.gif" align=center><img src="./images/20081212_swn_board_t01.gif"></td>
						<td width=472 background="./images/20081212_swn_board_bg01.gif" align=center><img src="./images/20081212_swn_board_t02.gif"></td>
						<td width=80 background="./images/20081212_swn_board_bg01.gif" align=center><img src="./images/20081212_swn_board_t03.gif"></td>
						<td width=80 background="./images/20081212_swn_board_bg01.gif" align=center><img src="./images/20081212_swn_board_t04.gif"></td>
						<td width=50 background="./images/20081212_swn_board_bg01.gif" align=center><img src="./images/20081212_swn_board_t05.gif"></td>
					</tr>
					<tr>
						<td colspan=5 bgcolor=#00375D height=2></td>
					</tr>
<%
int nNum, nWriteNo, nParentNo, nReLevel, nViewCount;
String sDispTitle, sTitle, sContent;
String sUserName, sWriteDate;

if( boardList != null && boardList.size() > 0 ) {	
	it = boardList.iterator();
	while( it.hasNext() ) {
		item = it.next();
		nNum = BoardConfig.ToInt(item.get("NUM"), 0);
		nWriteNo = BoardConfig.ToInt(item.get("WRITE_NO"), 0);
		nParentNo = BoardConfig.ToInt(item.get("PARENT_NO"), 0);
		sTitle = BoardConfig.ToString(item.get("TITLE"), "");
		sContent = BoardConfig.ToString(item.get("CONTENT"), "");
		sUserName = BoardConfig.ToString(item.get("USER_NAME"), "");
		sWriteDate = BoardConfig.ToString(item.get("WRITE_DATE"), "");
		nViewCount = BoardConfig.ToInt(item.get("VIEW_COUNT"), 0);
		nReLevel = BoardConfig.ToInt(item.get("RE_LEVEL"), 0);
		
		// 답글 길이 넣기
		sDispTitle = "";
		if( nReLevel > 0 ) {
			sDispTitle += "<img src='./images/level.gif' width='" + String.valueOf(10 * nReLevel) + "' height='1'>";
			sDispTitle += "<img src='./images/re.gif' width='25' height='16'>&nbsp;";
			if( sTitle.length() > nConfigTitleMaxLen2 ) {
				sTitle = sTitle.substring(0, nConfigTitleMaxLen2) + "...";
			}
		} else {
			if( sTitle.length() > nConfigTitleMaxLen ) {
				sTitle = sTitle.substring(0, nConfigTitleMaxLen) + "...";
			}
		}
		
		if( paramSearchKeyword.length() > 0 && (paramSearchMethod.equals("") || paramSearchMethod.equals("title") || paramSearchMethod.equals("title_content")) )
		{
			sTitle = sTitle.replaceAll(paramSearchKeyword, "<font color=red>" + paramSearchKeyword + "</font>");
		}
		sDispTitle += sTitle;
		
		if( sWriteDate.compareTo(BoardConfig.DateTimeDiff(BoardConfig.GetCurrentDateTimeFormat("yyyy-MM-dd HH"), "yyyy-MM-dd HH", "H", -24)) >= 0 )
		{
			sDispTitle += "&nbsp;<img src='./images/i_board_6.gif'>";
		}
		
		if( sContent.length() > 100 ) {
			sContent = sContent.substring(0, 100);
		}

		out.println("<tr>");
		out.println("<td height=30 align='center'>" + BoardConfig.ToString(nTotalCnt - nNum + 1, "0", 0) + "</td>");
		out.println("<td align='left'><a href='javascript:goView(" + String.valueOf(nWriteNo) + ", " + String.valueOf(nParentNo) + ");' title='" + sContent + "'>" + sDispTitle + "</a></td>");
		out.println("<td align='center'>" + sUserName + "</td>");
		out.println("<td align='center'>" + sWriteDate.substring(0, 10) + "</td>");
		out.println("<td align='center'>" + String.valueOf(nViewCount) + "</td>");
		out.println("</tr>");
		
		if(nNum != nToNum) {
			out.println("<tr>");
			out.println("<td height=1 colspan=5 background='./images/20081212_swn_board_line01.gif'></td>");
			out.println("</tr>");
		}	
	}
} else {
	out.println("<tr>");
	out.println("<td colspan=5 align=center>" + sErrorMessage + "</td>");
	out.println("</tr>");
}
%>
					<tr>
						<td colspan=5 bgcolor=#00375D height=2></td>
					</tr>
					</table>
				</td>
			</tr>
			<!-- 버튼 처리 -->
			<tr><td height=10></td></tr>
			<tr>
				<td height=25 align=right><a href="javascript:goAdd();"><img src="./images/20081212_swn_btn_write.gif" border=0></a></td>
			</tr>
			<tr>
				<td height=25 align=center>
			<!-- 페이징 하기 -->
<%
String sPage, sSpace, sURL;
int nPageLoop, nStartPageNum, nEndPageNum;
sPage = "";
nStartPageNum = 0;
nEndPageNum = 0;

sSpace = "&nbsp;&nbsp;&nbsp;";

nStartPageNum = (int)(((paramCurPageNum - 1) / 10)) * 10 + 1;
nEndPageNum = nStartPageNum + 10 - 1;
if( nEndPageNum > nTotalPageNum ) {
	nEndPageNum = nTotalPageNum;
}

if( nStartPageNum > 10 ) {
	sPage += "<a href='javascript:goPage(" + String.valueOf(nStartPageNum - 10) + ");'><img src='./images/20081212_swn_prev.gif' border=0 style='vertical-align:middle;'></a>";
}

for( nPageLoop = nStartPageNum; nPageLoop <= nEndPageNum; nPageLoop ++ ) {
	if( nPageLoop ==  paramCurPageNum ) {
		sPage += sSpace + "<a href='javascript:goPage(" + String.valueOf(nPageLoop) + ");' style='vertical-align:middle;'><font color=RED><b>" + String.valueOf(nPageLoop) + "</b></font></a>";	
	} else {
		sPage += sSpace + "<a href='javascript:goPage(" + String.valueOf(nPageLoop) + ");' style='vertical-align:middle;'>" + String.valueOf(nPageLoop) + "</a>";
	}
}

if( nEndPageNum < nTotalPageNum ) {
	sPage += sSpace + "<a href='javascript:goPage(" + String.valueOf(nEndPageNum + 1) + ");'><img src='./images/20081212_swn_next.gif' border=0 border=0 style='vertical-align:middle;'></a>";
}

out.println(sPage);
%>			
				</td>
			</tr>
			<tr>
				<td height=25 align=center>
					<form name="frmPage" id="frmPage">
						<input type="hidden" name="board_id" id="board_id" value="">
						<input type="hidden" name="page" id="page" value="">
						<input type="hidden" name="write_no" id="write_no" value="">
						<input type="hidden" name="parent_no" id="parent_no" value="">
						<select name="search_method" id="search_method" style="width:110px;vertical-align:middle;">
							<option value=''>전체</option>
							<option value='title' <%=((paramSearchMethod.equals("title") == true) ? "selected" : "")%>>글제목</option>
							<option value='content' <%=((paramSearchMethod.equals("content") == true) ? "selected" : "")%>>글내용</option>
							<option value='title_content' <%=((paramSearchMethod.equals("title_content") == true) ? "selected" : "")%>>글제목 + 내용</option>
							<option value='save_file_name' <%=((paramSearchMethod.equals("save_file_name") == true) ? "selected" : "")%>>첨부파일명</option>
							<option value='user_name' <%=((paramSearchMethod.equals("user_name") == true) ? "selected" : "")%>>작성자</option>
						</select>
						<input type="text" name="search_keyword" id="search_keyword" size=20 value="<%=paramSearchKeyword%>" style="width:200px;vertical-align:middle;">&nbsp;
						<input type="image" src="./images/20081212_swn_btn_search.gif" border=0 style="vertical-align:middle;" onClick="goSearch();">
					</form>
				</td>
			</tr>
			</table>
		</td>
		<td width=30>&nbsp;</td>
	</tr>
	</table>
</body>
</html>
<%
// 해제
params = null;
boardList = null;
boardAdmin = null;
dao = null;
curPage = null;
%>