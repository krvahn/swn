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

// 권한 검사
curPage.checkAuthority(3, true, false);

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
// board_id : 게시판 아이디
// mode : 모드(추가:add, 수정:update, 답글:answer)
// page : 페이지 번호
// write_no : 게시물 번호
// paren_no : 상위 게시물 번호
// search_method : 검색 방법
// search_keyword : 검색 키워드
//-----------------------------------------------------------------------------------------------
String paramBoardID = curPage.getParam("board_id", "");
String paramMode = curPage.getParam("mode", "add");
int paramCurPageNum = Integer.parseInt(curPage.getParam("page", "1"));
int paramWriteNo = Integer.parseInt(curPage.getParam("write_no", "-1"));
String paramSearchMethod = curPage.getParam("search_method", "");
String paramSearchKeyword = curPage.getParam("search_keyword", "");

Map<String, Object> params = null;
BoardDao dao = new BoardDao();

Map<String, Object> boardAdmin = null;

String sTopImage;
String sAttachFlag, sReplyFlag, sExpireFlag;
String sNewFlag;
String sTitle, sContent, sExpireDate;

// 조건 설정
params = new HashMap<String, Object>();
params.put("OPEN_BOARD", "1");
params.put("BOARD_ID", paramBoardID);
params.put("MODE", paramMode);
params.put("WRITE_NO", paramWriteNo);

//System.out.println(params);

//해당 게시판의 정보 얻기
boardAdmin = dao.selectOneBoardAdmin(params);

sTopImage = BoardConfig.ToString(boardAdmin.get("TOP_IMAGE"), ""); // TOP 이미지 URL
sAttachFlag = BoardConfig.ToString(boardAdmin.get("ATTACH_FLAG"), "N"); // 첨부파일 여부

// 데이터 얻기
sTitle = "";
sContent = "";
sExpireDate = BoardConfig.GetCurrentDateTimeFormat("yyyy-MM-dd");
if( paramMode.equals("update") || paramMode.equals("answer") ) {
	Map<String, Object> item = null;
	item = dao.selectOneOpenBoardContent(params);
	
	if( item != null && item.size() > 0 ) {
		sTitle = BoardConfig.ToString(item.get("TITLE"), "");
		sContent = BoardConfig.ToString(item.get("CONTENT"), "");
		sExpireDate = BoardConfig.ToString(item.get("EXPIRE_DATe"), BoardConfig.GetCurrentDateTimeFormat("yyyy-MM-dd"));

		if( paramMode.equals("answer") ) {
			sTitle = "[RE] " + sTitle;
			sContent = "";
		}
	} else {
		paramMode = "add";
	}
	
	item = null;
} else {
	paramMode = "add"; 
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
<script type="text/javascript" language="javascript" src="jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="jquery-ui-ko.js"></script>
<link type="text/css" href="board.css" rel="stylesheet"/>
<link type="text/css" href="jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	
	$(document).ready(function() {
		// 달력 설정
		$('#expire_date').datepicker();
	});
	
	function goList()
	{
		var oForm;
		
		oForm = document.frmPage;
		
		oForm.board_id.value = "<%=paramBoardID%>"; 
		oForm.page.value = "<%=paramCurPageNum%>";
		oForm.search_method.value = "<%=paramSearchMethod%>";
		oForm.search_keyword.value = "<%=paramSearchKeyword%>";
		
		oForm.method = "post";
		oForm.action = "./board_list.jsp";
		oForm.submit();
	}
	
	function goAdd()
	{
		var oForm;
		var title, content, expire_date;
		
		title = $.trim($("#title").val());
		content = $.trim($("#content").val());
		expire_date = $("#expire_date").val();
		
		if( title == "" ) {
			alert("제목을 입력하세요");
			$("#title").focus();
			return;
		}
		
		if( content == "" ) {
			alert("내용을 입력하세요");
			$("#content").focus();
			return;
		}
		
		oForm = document.frmPage;
		
		oForm.board_id.value = "<%=paramBoardID%>";
		oForm.mode.value = "<%=paramMode%>";
		oForm.write_no.value = "<%=paramWriteNo%>";
		oForm.title.value = title;
		oForm.content.value = content;
		oForm.expire_date.value = expire_date;
		
		oForm.method = "post";
		oForm.action = "./board_add_do.jsp";
		oForm.submit();
	}
	
	function goReset()
	{	
		document.reset_title.reset();
		document.reset_content.reset();
		document.reset_expire_date.reset();
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
			<tr><td height=5></td></tr>
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
					<table width=100% cellspacing=5 cellpadding=0 align=center>
					<tr><td colspan=2 bgcolor=#00375D height=2></td></tr>
					<tr>
						<td bgcolor=#EDEDED width=20% align=center height=32><strong><font color=#00375D>제목</font></strong></td>
						<td style="padding-left:10px;">
							<form name="reset_title"> 
							<input type='text' name="title" id="title" value="<%=BoardConfig.ToReCheckWord(sTitle)%>" size=70 maxlength=100 style="width:600px;vertical-align:middle;">
							</form>
						</td>
					</tr>
					<tr><td colspan=2 bgcolor=#00375D height=2></td></tr>
					<tr>
						<td bgcolor=#EDEDED align=center><strong><font color=#00375D>내용</font></strong></td>
						<td style="padding-left:10px; padding-top:5px; padding-bottom:5px;">
							<form name="reset_content">
							<textarea name="content" id="content" cols=92 style="width:600px; height:300px; vertical-align:middle; overflow:auto;"><%=BoardConfig.ToReCheckWord(sContent)%></textarea>
							</form>
						</td>
					</tr>
					<tr><td colspan=2 bgcolor=#00375D height=2></td></tr>
					<tr>
						<td bgcolor=#EDEDED width=20% align=center height=32><strong><font color=#00375D>팝업 마침일</font></strong></td>
						<td style="padding-left:10px;">
							<form name="reset_expire_date"> 
							<input type="text" name="expire_date" id="expire_date" class="inputbox" readonly 
		                        style="width:100px; ime-mode:disabled;" maxlength="10" 
		                        value="<%=sExpireDate%>" onkeypress="key_NumberOnly();">
							</form>
						</td>
					</tr>
					<tr><td colspan=2 bgcolor=#00375D height=2></td></tr>
					</table>
				</td>
			</tr>
			<!-- 버튼 처리 -->
			<tr><td height=5></td></tr>
			<tr>
				<td height=25>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
						<td height=25 align=left>
							<a href="javascript:goList();"><img src="./images/20081212_swn_btn_list.gif" border=0></a>
						</td>
						<td height=25 align=right>
							<a href="javascript:goAdd();"><img src="./images/20081212_swn_btn_confirm.gif" border=0></a>&nbsp;
							<a href="javascript:goReset();"><img src="./images/20081212_swn_btn_cancel.gif" border=0></a>
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
		<input type="hidden" name="search_method" id="search_method" value="">
		<input type="hidden" name="search_keyword" id="search_keyword" value="">
		
		<input type="hidden" name="mode" id ="mode" value="">		
		<input type="hidden" name="write_no" id ="write_no" value="">
		<input type="hidden" name="title" id ="title" value="">
		<input type="hidden" name="content" id ="content" value="">
		<input type="hidden" name="expire_date" id ="expire_date" value="">
	</form>
	<iframe name="frame_file_up" width=0 height=0></iframe>
</body>
</html>
<%
// 해제
params = null;
boardAdmin = null;
dao = null;
curPage = null;
%>