<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="metabit.web.board.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//-----------------------------------------------------------------------------------------------
// 웹 페이지 캐쉬 삭제
//-----------------------------------------------------------------------------------------------
request.setCharacterEncoding("euc-kr");
//request.setCharacterEncoding("utf-8");
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
// attach_file : 업로드할 Parts
//-----------------------------------------------------------------------------------------------
String boardID, fileTitle, fileName;
boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
boolean isSuccessed;

boardID = "";
fileTitle = "";
fileName = "";
isSuccessed = false;
if( isMultiPart ) {
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	try
	{
		List items = upload.parseRequest(request);		
		Iterator it = null;
		
		// board id 얻기
		it = items.iterator();		
		while( it.hasNext() )
		{
			FileItem item = (FileItem) it.next();
			if( item.isFormField() ) {
				if( item.getFieldName().equals("board_id") ) {
					boardID = item.getString();
				}
			}
		}
		
		// 데이터 저장
		it = items.iterator();		
		while( boardID.equals("") == false && it.hasNext() )
		{
			FileItem item = (FileItem) it.next();
			if( ! item.isFormField() ) {
				String root = BoardConfig.UploadPath() + "\\BRD_" + boardID;
				fileName = item.getName();
				
				fileTitle = BoardConfig.GetCurrentDateTimeFormat("yyyyMMddHHmmsss");
				if( fileName.lastIndexOf(".") > 0 ) {
					fileTitle += fileName.substring(fileName.lastIndexOf("."));
				}
				
				File path = new File(root);
				if( ! path.exists() ) {
					path.mkdirs();
				}
				
				File uploadFile = new File(root + "\\" + fileTitle);
				item.write(uploadFile);
				
				isSuccessed = true;
			}
		}		
	} catch(FileUploadException fue) {
		fue.printStackTrace();
		
		isSuccessed = false;
	} catch(Exception e) {
		e.printStackTrace();
		
		isSuccessed = false;
	}
}

if( fileName.equals("") ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('첨부할 파일을 선택하여 주십시오.');");
	out.println("</script>");
	out.flush();	
} else if( isSuccessed == false ) {
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("alert('파일을 등록하는데 실패하였습니다.');");
	out.println("</script>");
	out.flush();	
} else {	
	out.println("<script type='text/javascript' language='javascript'>");
	out.println("parent.attachFile('" + fileTitle + "', '" + fileName + "')");
	out.println("</script>");
	out.flush();	
}

curPage = null;
%>