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

// ���� �˻�
curPage.checkAuthority(3, true, false);

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// board_id : �Խ��� ���̵�
// mode : ���(�߰�:add, ����:update, ���:answer)
// page : ������ ��ȣ
// write_no : �Խù� ��ȣ
// paren_no : ���� �Խù� ��ȣ
// search_method : �˻� ���
// search_keyword : �˻� Ű����
//-----------------------------------------------------------------------------------------------
String paramBoardID = curPage.getParam("board_id", "");
String paramMode = curPage.getParam("mode", "add");
int paramCurPageNum = Integer.parseInt(curPage.getParam("page", "1"));
int paramWriteNo = Integer.parseInt(curPage.getParam("write_no", "-1"));
int paramParentNo = Integer.parseInt(curPage.getParam("parent_no", "-1"));
String paramSearchMethod = curPage.getParam("search_method", "");
String paramSearchKeyword = curPage.getParam("search_keyword", "");

Map<String, Object> params = null;
BoardDao dao = new BoardDao();

Map<String, Object> boardAdmin = null;

String sTopImage;
String sAttachFlag, sReplyFlag, sExpireFlag;
String sNewFlag;
String sTitle, sContent, sSaveFileName, sFileTitle;
int nRelevel, nRestep;

// ���� ����
params = new HashMap<String, Object>();
params.put("BOARD_ID", paramBoardID);
params.put("MODE", paramMode);
params.put("WRITE_NO", paramWriteNo);
params.put("PARENT_NO", paramParentNo);

//System.out.println(params);

//�ش� �Խ����� ���� ���
boardAdmin = dao.selectOneBoardAdmin(params);

sTopImage = BoardConfig.ToString(boardAdmin.get("TOP_IMAGE"), ""); // TOP �̹��� URL
sAttachFlag = BoardConfig.ToString(boardAdmin.get("ATTACH_FLAG"), "N"); // ÷������ ����

// ������ ���
sTitle = "";
sContent = "";
sSaveFileName = "";
sFileTitle = "";
nRelevel = 0;
nRestep = 0;
if( paramMode.equals("update") || paramMode.equals("answer") ) {
	Map<String, Object> item = null;
	item = dao.selectOneBoardContent(params);
	
	if( item != null && item.size() > 0 ) {
		nRelevel = BoardConfig.ToInt(item.get("RE_LEVEL"), 0);
		nRestep = BoardConfig.ToInt(item.get("RE_STEP"), 0);
		sTitle = BoardConfig.ToString(item.get("TITLE"), "");
		sContent = BoardConfig.ToString(item.get("CONTENT"), "");
		sSaveFileName = BoardConfig.ToString(item.get("SAVE_FILE_NAME"), "");
		sFileTitle = BoardConfig.ToString(item.get("FILE_TITLE"), "");
		
		if( paramMode.equals("answer") ) {
			sTitle = "[RE] " + sTitle;
			sContent = "";
			sSaveFileName = "";
			sFileTitle = "";
		}
	} else {
		paramMode = "add";
	}
	
	item = null;
} else {
	paramMode = "add"; 
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
		var title, content, filePaths, fileTitles;
		var i;
		
		title = $.trim($("#title").val());
		content = $.trim($("#content").val());
		
		if( title == "" ) {
			alert("������ �Է��ϼ���");
			$("#title").focus();
			return;
		}
		
		if( content == "" ) {
			alert("������ �Է��ϼ���");
			$("#content").focus();
			return;
		}
		
		// ���� ��� �����
		filePaths = "";
		fileTitles = "";
		for( i = 1; i < $("#file_list option").size(); i ++) {
			if( filePaths.length > 0 ) {
				filePaths += ";";
			}
			
			if( fileTitles.length > 0 ) {
				fileTitles += ";";
			}
			
			filePaths += $('#file_list option:eq(' + i + ')').val();
			fileTitles += $('#file_list option:eq(' + i + ')').text();
		}
		
		oForm = document.frmPage;
		
		oForm.board_id.value = "<%=paramBoardID%>";
		oForm.mode.value = "<%=paramMode%>";
		oForm.write_no.value = "<%=paramWriteNo%>";
		oForm.parent_no.value = "<%=paramParentNo%>";
		oForm.re_level.value = "<%=nRelevel%>";
		oForm.re_step.value = "<%=nRestep%>";
		oForm.title.value = title;
		oForm.content.value = content;
		oForm.file_paths.value = filePaths;
		oForm.file_titles.value = fileTitles;
		
		oForm.method = "post";
		oForm.action = "./board_add_do.jsp";
		oForm.submit();
	}
	
	function goReset()
	{	
		document.reset_title.reset();
		document.reset_content.reset();
	}
	
	function fileDelete()
	{
		var nSel;
		
		nSel = $("#file_list option").index($("#file_list option:selected"));
		if( nSel >= 1 && nSel <= 3 ) {
			if( $("#file_list").val() == "" ) {
				alert("������ ������ �����ϴ�.");	
			} else {
				$('#file_list option:eq(' + nSel + ')').remove();
			}
		} else {
			alert("������ ������ �����ϴ�.");
		}
	}
	
	function fileUpLoad()
	{
		if( $("#file_list option").size() > 3 ) {
			alert("������ 3�������� ÷�� �� �� �ֽ��ϴ�.");
			return;
		}
		var oForm = document.frmFileUp;
		
		var szFileName = oForm.attach_file.value;
		
		if(checkTitleFileType(szFileName) == false)
		{
			alert("÷���� �� ���� ���� Ȯ���� �Դϴ�.");
			return;
		}

		oForm.target = "frame_file_up";
		oForm.method = "POST";
		oForm.action = "./file_upload.jsp";
		oForm.submit();
	}
	
	function checkTitleFileType(obj)
	{ 
		var pathpoint = obj.lastIndexOf('.'); 
		var filepoint = obj.substring(pathpoint+1,obj.length); 
		var filetype = filepoint.toLowerCase(); 
		if (filetype == 'asp'|| filetype == 'asa' || filetype == 'html' || filetype == 'htm' || filetype == 'jsp' || filetype == 'php' || filetype == 'aspx' 
			|| filetype == 'exe' || filetype == 'msi' || filetype == 'dll' || filetype == 'xml' || filetype == 'js' || filetype == 'css' || filetype == 'lib' 
			|| filetype == 'cab' )
		{
			return false; 
		}
		else
		{
			return true; 
		} 
	}
	
	function attachFile(filePath, fileName)
	{
		$("#file_list").append("<option value='" + filePath + "'>" + fileName + "</option>");
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
					<table width=100% cellspacing=5 cellpadding=0 align=center>
					<tr><td colspan=2 bgcolor=#00375D height=2></td></tr>
					<tr>
						<td bgcolor=#EDEDED width=20% align=center height=32><strong><font color=#00375D>����</font></strong></td>
						<td style="padding-left:10px;">
							<form name="reset_title"> 
							<input type='text' name="title" id="title" value="<%=BoardConfig.ToReCheckWord(sTitle)%>" size=70 maxlength=100 style="width:600px;vertical-align:middle;">
							</form>
						</td>
					</tr>
					<tr><td colspan=2 bgcolor=#00375D height=2></td></tr>
					<tr>
						<td bgcolor=#EDEDED align=center><strong><font color=#00375D>����</font></strong></td>
						<td style="padding-left:10px; padding-top:5px; padding-bottom:5px;">
							<form name="reset_content">
							<textarea name="content" id="content" cols=92 style="width:600px; height:300px; vertical-align:middle; overflow:auto;"><%=BoardConfig.ToReCheckWord(sContent)%></textarea>
							</form>
						</td>
					</tr>
					<tr><td colspan=2 bgcolor=#00375D height=2></td></tr>
					<tr>
						<td bgcolor=#EDEDED align=center><strong><font color=#00375D>÷������</font></strong></td>
						<td style="padding-left:10px;">
							<table width=100% cellspacing=0 cellpadding=0>
							<tr><td height=5></td></tr>
							<tr>
								<td>
									<form name="frmFileUp" method=POST encType="multipart/form-data">
									<input type="hidden" name="board_id" value="<%=paramBoardID%>"> 
									<input type="file" value="ã�ƺ���" size=50 name="attach_file">
									</form>
								</td>
							</tr>
							<tr><td height=5></td></tr>
							<tr>
								<td>
									<input type="button" value="&nbsp;&nbsp;÷&nbsp;&nbsp;��&nbsp;&nbsp;" onClick="fileUpLoad()">
									<input type="button" value="÷���� ��Ͽ��� ����" onClick="fileDelete();">
								</td>
							</tr>
							<tr><td height=5></td></tr>
							<tr>
								<td>									
<%
List<String> fileList, titleList;
String sOneFilePath, sOneFileName;

titleList = new ArrayList<String>();
{
	StringTokenizer st = new StringTokenizer(sFileTitle, ";");
	while(st.hasMoreTokens()) {
		titleList.add(st.nextToken().trim());
	}
}

fileList = new ArrayList<String>();
{
	StringTokenizer st = new StringTokenizer(sSaveFileName, ";");
	while(st.hasMoreTokens()) {
		fileList.add(st.nextToken().trim());
	}
}

out.println("<select name='file_list' id='file_list' size=3>");
out.println("<option value='-1'>--------------- ÷�ε� ���ϸ��(�ִ� 3��) ---------------</option>");
for(int i = 0; i < titleList.size(); i ++) {
	sOneFilePath = titleList.get(i);
	try {
		sOneFileName = fileList.get(i);
	} catch(Exception e) {
		sOneFileName = "";
	}
	
	if( sOneFilePath.equals("") == false ) {
		if( sOneFileName.equals("") ) {
			out.println("<option value='" + sOneFilePath + "'>" + sOneFilePath + "</option>");			
		} else {
			out.println("<option value='" + sOneFilePath + "'>" + sOneFileName + "</option>");
		}
	}
}
%>								
								</td>
							</tr>
							<tr><td height=5></td></tr>
							</table>
						</td>
					</tr>
					<tr><td colspan=2 bgcolor=#00375D height=2></td></tr>
					</table>
				</td>
			</tr>
			<!-- ��ư ó�� -->
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
		<input type="hidden" name="parent_no" id ="parent_no" value="">
		<input type="hidden" name="re_level" id ="re_level" value="">
		<input type="hidden" name="re_step" id ="re_step" value="">
		<input type="hidden" name="title" id ="title" value="">
		<input type="hidden" name="content" id ="content" value="">
		<input type="hidden" name="file_paths" id ="file_paths" value="">
		<input type="hidden" name="file_titles" id ="file_titles" value="">
	</form>
	<iframe name="frame_file_up" width=0 height=0></iframe>
</body>
</html>
<%
// ����
params = null;
boardAdmin = null;
dao = null;
curPage = null;
%>