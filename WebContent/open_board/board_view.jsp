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

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// board_id : �Խ��� ���̵�
// page : ������ ��ȣ
// write_no : �Խù� ��ȣ
// paren_no : ���� �Խù� ��ȣ
// search_method : �˻� ���
// search_keyword : �˻� Ű����
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

// ���� ����
params = new HashMap<String, Object>();
params.put("OPEN_BOARD", "1");
params.put("BOARD_ID", paramBoardID);
params.put("WRITE_NO", paramWriteNo);

// �ش� �Խ����� ��ȸ Ƚ�� �ø���
dao.updateBoardViewCount(params);

//�ش� �Խ����� ���� ���
boardAdmin = dao.selectOneBoardAdmin(params);

sTopImage = BoardConfig.ToString(boardAdmin.get("TOP_IMAGE"), ""); // TOP �̹��� URL
sAttachFlag = BoardConfig.ToString(boardAdmin.get("ATTACH_FLAG"), "N"); // ÷������ ����
sReplyFlag = BoardConfig.ToString(boardAdmin.get("REPLY_FLAG"), "N"); // ��ۿ���
sExpireFlag = BoardConfig.ToString(boardAdmin.get("EXPIRE_FLAG"), "N"); // ������ѿ���
sNewFlag = BoardConfig.ToString(boardAdmin.get("NEWS_FLAG"), "N"); // ������ѿ���

// ������ ���
sErrorMessage = ""; 
item = dao.selectOneOpenBoardContent(params);
if( item == null || item.size() == 0 ) {
	sErrorMessage = "<br><b>��ϵ� ������ �����ϴ�.</b><br><br>";
}

// TOP image URL ���
if( sTopImage.equals("") )
{
	// ���� �������� ���� �ϵ��ڵ� ��
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
<!-- jQuery ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
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
				alert('\n�α����� �ʿ��� �������Դϴ�.\n\n���� Ȯ���� ���� �α����� �� �ֽʽÿ�.');
				// top.location.href='<%=curPage.getContextPath()%>/<%=BoardConfig.LoginPage()%>';
				return;
			<%} else if( curPage.getSessionUserID().equals(item.get("USER_ID")) == false ) {%>
				alert("�ۼ��ڸ��� �ش� �Խù��� ������ �� �ֽ��ϴ�.");
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
			alert("�Խ����� �ۼ��� ������ �����ϴ�.");
		<%}%>
	}
	
	function goDelete()
	{
		<%if( curPage.getGroupAuth() == 9 || BoardConfig.ToString(item.get("USER_ID"), "").equals(curPage.getSessionUserID()) ) {%>
			var bDel;
			var URL;
			
			bDel = confirm("������ �����͸� ������ �����Ͻðڽ��ϱ�?");
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
			alert("�ۼ��� �Ǵ� �����ڸ��� ������ �� �ֽ��ϴ�.");
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
					<a href="${pageContext.request.contextPath}/page_system/status_manager_list.jsp">������������</a>
					| <b><a href="${pageContext.request.contextPath}/open_board/board_list.jsp?board_id=open">��������</a></b>
					| <a href="javascript:fnWater();">�ǽð���Ȳ</a>
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
			<!-- ��ư ó�� -->
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
// ����
params = null;
item = null;
boardAdmin = null;
dao = null;
curPage = null;
%>