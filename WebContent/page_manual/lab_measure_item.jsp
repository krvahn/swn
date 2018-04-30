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
curPage.checkAuthority(WebConst.AUTH_LAB_MEASURE_ITEM, true, false);

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------
// WW_TYPE : ������� (A:��ü, P:��������, W:�����������)
// WATER_TYPE : �׸񱸺�(��ü, ����, ����)
// CHECK_CYCLE : �����ֱ� (��ü, ����, �ְ�, ����, �б�)
// ITEM_KIND : ���� �׸� �з� (��ü, 16�׸�, 23�׸�, 47�׸�, 55�׸�)
// SEARCH_TXT : �˻� ���ڿ�
//-----------------------------------------------------------------------------
String paramWWType = curPage.getParam("WW_TYPE", "P");
String paramWaterType = curPage.getParam("WATER_TYPE", "");
String paramCheckCycle = curPage.getParam("CHECK_CYCLE", "");
String paramItemKind = curPage.getParam("ITEM_KIND", "");
String paramSearchKeyWord = curPage.getParam("SEARCH_KEYWORD", "");
//-----------------------------------------------------------------------------
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
	var g_urlReportData = "manual_item.page.do?Act=lab_measure_item.list";
	
	function updateReport()
	{
		var URL;
		
		// ��û URL �����
		URL = g_urlReportData
			+ "&WW_TYPE=" + $("#search_WWType").val()
			+ "&WATER_TYPE=" + $("#search_WaterType").val()
			+ "&CHECK_CYCLE=" + $("#search_CheckCycle").val()
			+ "&ITEM_KIND=" + $("#search_ItemKind").val()
			+ "&SEARCH_KEYWORD=" + $("#search_KeyWord").val();
		
		oReport.fnReloadAjax(URL);
	}
	
	$(document).ready(function() {
		var URL;		
		
		if( "<%=paramWWType%>" != "" ) {
			$("#search_WWType").val('<%=paramWWType%>');
		} else {
			$("#search_WWType option:eq(0)").attr("selected","selected");
		}
		
		if( "<%=paramWaterType%>" != "" ) {
			$("#search_WaterType").val('<%=paramWaterType%>');
		} else {
			$("#search_WaterType option:eq(0)").attr("selected","selected");
		}
		
		if( "<%=paramCheckCycle%>" != "" ) {
			$("#search_CheckCycle").val('<%=paramCheckCycle%>');
		} else {
			$("#search_CheckCycle option:eq(0)").attr("selected","selected");
		}
		
		if( "<%=paramItemKind%>" != "" ) {
			$("#search_ItemKind").val('<%=paramItemKind%>');
		} else {
			$("#search_ItemKind option:eq(0)").attr("selected","selected");
		}
		
		// ��û URL �����
		URL = g_urlReportData
			+ "&WW_TYPE=" + $("#search_WWType").val()
			+ "&WATER_TYPE=" + $("#search_WaterType").val()
			+ "&CHECK_CYCLE=" + $("#search_CheckCycle").val()
			+ "&ITEM_KIND=" + $("#search_ItemKind").val()
			+ "&SEARCH_KEYWORD=" + $("#search_KeyWord").val();

		// ���̺� ����
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
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"}
			              ]
		} ).fnFakeRowColspan();
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSearch()
	{
		updateReport();
	}
	
	function fnAdd()
	{		
		var URL;
		
		URL = g_contextPath + "/lab_measure_item_form.do";
		URL += "?MODE=add";
		
		document.location.href = URL;
	}
	
	function fnDelete(itemCode, wwType)
	{
		var nDel;
		var URL;		
		
		nDel = confirm("������ �����͸� �����Ͻðڽ��ϱ�?");
		
		if (nDel == true) {
			URL = g_contextPath + "/lab_measure_item_form.do";
			URL += "?MODE=delete";
			URL += "&ITEM_CODE=" + itemCode;
			URL += "&WW_TYPE=" + wwType;
			
			document.location.href = URL;	
		}		
	}
	
	function fnUpdate(itemCode, wwType)
	{		
		var URL;
		
		URL = g_contextPath + "/lab_measure_item_form.do";
		URL += "?MODE=select";
		URL += "&ITEM_CODE=" + itemCode;
		URL += "&WW_TYPE=" + wwType;
		
		document.location.href = URL;
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/manual/20081212_swn_stitle19.jpg">
		</td>
	</tr>	
	<tr>
		<td>
			<table width="100%" cellspacing="1" cellpadding="0" style="background-color: #666666;">
			<tr>
				<td width=10% height=30 class='swn_tbl_title'>�������</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WWType" style="width:130px;">
						<option value=''>��ü</option>
						<option value='P'>�Ƹ�����������</option>
						<option value='W'>�����������</option>
					</select>					
				</td>
				<td width=10% height=30 class='swn_tbl_title'>�׸񱸺�</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WaterType" style="width:130px;">
						<option value='A'>��ü�����׸�</option>
						<option value='O'>���������׸�</option>
						<option value='P'>���������׸�</option>
					</select>					
				</td>
			</tr>
			<tr>
				<td height=30 class='swn_tbl_title'>�����ֱ�</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_CheckCycle" style="width:130px;">
						<option value=''>��ü</option>
						<option value='D'>����</option>
						<option value='W'>�ְ�</option>
						<option value='M'>����</option>
						<option value='Q'>�б�</option>
					</select>					
				</td>
				<td height=30 class='swn_tbl_title'>�׸��</td>
				<td style="background-color:white; text-align:left; padding-left:5px">
					<input type="text" id="search_KeyWord" size="40" value="<%=paramSearchKeyWord%>"/>
				</td>
			</tr>
			<tr>
				<td height=30 class='swn_tbl_title'>�����׸�з�</td>
				<td colspan=3 style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_ItemKind" style="width:130px;">
						<option value=''>��ü</option>
						<option value='item_16'>16�׸�</option>
						<option value='item_23'>23�׸�</option>
						<option value='item_47'>47�׸�</option>
						<option value='item_55'>55�׸�</option>
					</select>					
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr><td height=5></td></tr>
	<tr>
		<td align=right><a href="javascript:fnSearch();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_search03.gif" border=0 ></a></td>
	</tr>
	<tr><td height=30></td></tr>
	</table>
	</div>
	<div id="report_form">	
		<table width=100% cellspacing=1 cellpadding=0 id='report'>
		<thead>
		<tr>
			<th width="6%" align=center rowspan=2 bgcolor=#EFEFEF>NO</th>
			<th width="8%" align=center rowspan=2 bgcolor=#EFEFEF>�׸񱸺�</th>
			<th width="8%" align=center rowspan=2 bgcolor=#EFEFEF>�����ֱ�</th>
			<th width="15%" align=center rowspan=2 bgcolor=#EFEFEF>�����׸�</th>
			<th width="8%" align=center rowspan=2 bgcolor=#EFEFEF>��������</th>
			<th width="13%" align=center rowspan=2 bgcolor=#EFEFEF>�׸񱸺�</th>
			<th width="16%" align=center colspan=2 bgcolor=#EFEFEF>����ȯ�� ����</th>
			<th width="16%" align=center colspan=2 bgcolor=#EFEFEF>�Դ¹� ���� ����</th>
			<th width="10%" align=center rowspan=2 bgcolor=#EFEFEF>�׸� ����</th>
		</tr>
		<tr>
			<th width="8%" align=center bgcolor=#EFEFEF style="font-weight:normal;">����</th>
			<th width="8%" align=center bgcolor=#EFEFEF style="font-weight:normal;">����</th>
			<th width="8%" align=center bgcolor=#EFEFEF style="font-weight:normal;">����</th>
			<th width="8%" align=center bgcolor=#EFEFEF style="font-weight:normal;">����</th>
		</tr>
		</thead>
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
					<a href="javascript:fnAdd();"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_add.gif" border=0 ></a>
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