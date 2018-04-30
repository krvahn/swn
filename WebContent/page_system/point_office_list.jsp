<%@ page import="kr.go.seoul.water.comm.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//-----------------------------------------------------------------------------------------------
// �� ������ ĳ�� ����
//-----------------------------------------------------------------------------------------------
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
if( request.getProtocol() != null && request.getProtocol().equals("HTTP/1.1") ) {
	response.setHeader("Cache-Control", "no-cache");
}

//-----------------------------------------------------------------------------------------------
//�ʱ�ȭ
//-----------------------------------------------------------------------------------------------
WebPage curPage = new WebPage(pageContext, request, response);

//���� �˻�
curPage.checkAuthority(WebConst.AUTH_OFFICE_POINT, true, false);

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// WW_TYPE : P:��������, W:���������
// WW_CODE : ��������� �� �������� �ڵ�
// FACTORY_CODE : �����ڵ�
// POINT_CODE : �����ڵ�
// POINT_NAME : �����ڵ� ��Ī
// WATER_PATH_CODE : ���޼���
//-----------------------------------------------------------------------------------------------
String paramWWType = curPage.getParam("WW_TYPE", "");
String paramWWCode = curPage.getParam("WW_CODE", "");
String paramFactoryCode = curPage.getParam("FACTORY_CODE", "");
String paramPointCode = curPage.getParam("POINT_CODE", "");
String paramPointName = curPage.getParam("POINT_NAME", "");
String paramWaterPathCode = curPage.getParam("WATER_PATH_CODE", "");

// �ѱ��̹Ƿ� ĳ���� �� ��ȯ
paramPointName = new String(paramPointName.getBytes("ISO-8859-1"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Expires" content ="-1">
<meta http-equiv="Prgama" content ="no-cache">
<meta http-equiv="Cache-Control" content ="No-Cache">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%=WebConst.WEB_PAGE_TITLE%></title>
</head>
<!-- jQuery ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.js"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui-ko.js"></script>

<!-- Water Now ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/script.do"></script>

<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/water_now.css");
-->
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<!-- DataTabele ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/jquery.dataTables.none.css");
-->	
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/jquery.dataTables.none.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.fnReloadAjax.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.fnFakeRowColspan.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.FixedColumns.js"></script>

<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/extra/TableTools_JUI.css");
-->
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/extra/TableTools_JUI.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/extra/TableTools.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/extra/ZeroClipboard.js"></script>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	var g_urlReport = "system.page.do?Act=point_office.list";
	var oReport;
	
	$(document).ready(function() {
		var URL;
		
		URL = g_urlReport;	
		URL += "&WW_TYPE=<%=paramWWType%>";
		URL += "&WW_CODE=<%=paramWWCode%>";
		URL += "&FACTORY_CODE=<%=paramFactoryCode%>";
		URL += "&POINT_CODE=<%=paramPointCode%>";
		URL += "&POINT_NAME=<%=paramPointName%>";
		URL += "&WATER_PATH_CODE=<%=paramWaterPathCode%>";
		
		// ������ �ʱ�ȭ
		oReport = $('#report').dataTable( {
			"bProcessing": true,
			"bPaginate": false,
			"bSort": false,
			"bInfo": false,
			"bFilter": false,
			"oLanguage": {
				"sProcessing" : "�ڷḦ �˻� ���Դϴ�."
			},
			"sAjaxSource": URL,
			"aoColumns": [
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"}
			              ]
		}).fnFakeRowColspan();
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnAdd()
	{
		var URL;
		
		URL = g_contextPath + "/point_office_form.do";
		URL += "?MODE=add";
		
		document.location.href = URL;
	}
	
	function fnUpdate(wwType, wwCode, pointCode)
	{
		var URL;
		
		URL = g_contextPath + "/point_office_form.do";
		URL += "?MODE=select";
		URL += "&WW_TYPE=" + wwType;
		URL += "&WW_CODE=" + wwCode;
		URL += "&POINT_CODE=" + pointCode;
		
		document.location.href = URL;
	}

	function fnReSelect(key, value)
	{
		var URL;
		
		URL = g_contextPath + "/page_system/point_office_list.jsp";
		
		if( key == "WW_TYPE" ) {			
			URL += "?WW_TYPE=" + value;
		} else if( key == "WW_CODE" ) {
			URL += "?WW_CODE=" + value;
		} else if( key == "FACTORY_CODE" ) {
			URL += "?FACTORY_CODE=" + value;
		} else if( key == "POINT_CODE" ) {
			URL += "?POINT_CODE=" + value;
		} else if( key == "POINT_NAME" ) {
			URL += "?POINT_NAME=" + value;
		} else if( key == "WATER_PATH_CODE" ) {
			URL += "?WATER_PATH_CODE=" + value;
		}
		
		document.location.href = URL;
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090506_swn_stitle22.jpg">
		</td>
	</tr>
	<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<table width=100% height=100% cellspacing=1 cellpadding=0 id="report">
		<thead>
		<tr>
			<th align=center height=30 width=20% bgcolor="#EFEFEF">����</th>
			<th align=center width=20% bgcolor="#EFEFEF">����Ҹ�</th>
			<th align=center width=25% bgcolor="#EFEFEF">�������/���ް�����</th>
			<th align=center width=25% bgcolor="#EFEFEF">������/���޼���</th>
			<th align=center width=10% bgcolor="#EFEFEF">����</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="5" class="dataTables_empty" align=center>Loading data from server</td>
		</tr>
		</tbody>			
	</table>
	</div>
	<div id="footer_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr><td height=5></td></tr>
	<tr>
		<td>
			<table width=100% height=100% cellspacing=0 cellpadding=0>
			<tr>
				<td align=right>			
					<a href="javascript:fnReSelect('', '');"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_list.gif" border=0 ></a>&nbsp;&nbsp;
					<a href="javascript:fnAdd();"><img src="${pageContext.request.contextPath}/images/comm/20090506_swn_btn03.gif" border=0 ></a>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
	</table>
	</div>
</body>
</html>
<%
// ����
curPage = null;
%>