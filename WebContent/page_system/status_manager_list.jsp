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
curPage.checkAuthority(WebConst.AUTH_SMS_SEND_LIST, true, false);

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// WW_CODE : �������� ����� �ڵ�
//-----------------------------------------------------------------------------------------------
String paramWWCode = curPage.getParam("WW_CODE", WebConst.SWQ_FIRST_PCODE);
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
	var g_urlReportData = "system.page.do?Act=status_manager.list";
	var g_urlSaveData = "system.page.do?Act=status_manager.save";
	var oReport;
	
	function updateWWCodeList()
	{	
		var URL;
		
		URL = "code.list.do?Act=wellwater.list";
	
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_WWCode").empty().data('option');
				$("#search_WWCode").append("<option value=''>---------��ü---------</option>");
				$.each(data.aaItems, function(i, item) {
					$("#search_WWCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});		
	}
	
	function updateReport()
	{		
		var URL;
		
		// ������ ��û URL �����
		URL = g_urlReportData
			+ "&WW_CODE=" + $('#search_WWCode').val();
		
		oReport.fnReloadAjax(URL);
	}
	
	$(document).ready(function() {
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
			"sAjaxSource": "code.list.do?Act=none&COLSPAN=7",
			"aoColumns": [
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "left"},
			              {"sClass" : "center"}
			              ]
		} ).fnFakeRowColspan();
		
		updateWWCodeList();
		if( "<%=paramWWCode%>" != "") {
			$('#search_WWCode').val("<%=paramWWCode%>");	
		} else {
			$("#search_WWCode option:eq(0)").attr("selected","selected");
		}
		
		updateReport();
		
		$("#search_WWCode").change(function() {
			updateReport();
		});
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSearch()
	{
		updateReport();	
	}
	
	function fnChange(objName, wwCode, pointCode, itemCode)
	{
		var itemStatus;
		
		itemStatus = $(":radio[name='" + objName + "']:checked").val();
		
		URL = g_urlSaveData;
		URL += "&WW_CODE=" +  wwCode;
		URL += "&POINT_CODE=" +  pointCode;
		URL += "&ITEM_CODE=" +  itemCode;
		URL += "&STATUS_CODE=" + itemStatus;
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				if( data.isOk == true ) {
					alert("���������� ó�� �Ǿ����ϴ�.");
					
					updateReport();
				} else {
					alert("�ڷḦ �Է��ϴµ� �����Ͽ����ϴ�.");
				}
			}
		});
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
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090514_swn_stitle01.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" cellspacing="0" cellpadding="0" style="background-color: ##FFFFFF;">
			<tr>
				<td colspan=2 width=100% align=right>
					<b><a href="${pageContext.request.contextPath}/page_syste/status_manager_list.jsp">������������</a></b>
					| <a href="${pageContext.request.contextPath}/open_board/board_list.jsp?board_id=open">��������</a>
					| <a href="javascript:fnWater();">�ǽð���Ȳ</a>
				</td>
			</tr>
			<tr><td height=5></td></tr>
			<tr>
				<td width=50% height=30 align=left>
					<select id="search_WWCode" name="search_WWCode" style="width:150px; vertical-align:middle;">
					</select>&nbsp;&nbsp;<a href="javascript:fnSearch();"><img src="${pageContext.request.contextPath}/images/comm/20090514_swn_btn_search.gif" border=0 ></a>
				</td>
				<td align=right>
					<a href="javascript:fnClose();"><img src="${pageContext.request.contextPath}/images/comm/20090514_swn_btn02.gif" border=0 ></a>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr><td height=5></td></tr>
	<tr>
		<td align=right></td>
	</tr>
	</table>
	</div>
	<div id="content_form">
	<table width=100% height=100% cellspacing=1 cellpadding=0 id="report">
		<thead>
		<tr>
			<th align=center height=30 width=15% bgcolor="#EFEFEF">����Ҹ�</th>
			<th align=center width=15% bgcolor="#EFEFEF">�������</th>
			<th align=center width=15% bgcolor="#EFEFEF">�����׸�</th>
			<th align=center width=10% bgcolor="#EFEFEF">����</th>
			<th align=center width=15% bgcolor="#EFEFEF">������</th>
			<th align=center width=15% bgcolor="#EFEFEF">���º���</th>
			<th align=center width=15% bgcolor="#EFEFEF">���º���</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="4" class="dataTables_empty" align=center>Loading data from server</td>
		</tr>
		</tbody>			
	</table>
	</div>
	<div id="footer_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>	
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