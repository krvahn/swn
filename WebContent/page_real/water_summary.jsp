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

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
// WW_CODE : ��������� �ڵ�
//-----------------------------------------------------------------------------------------------
String paramWWCode = curPage.getParam("WW_CODE", WebConst.SWQ_FIRST_WCODE);

String maxAnalDate;
maxAnalDate = curPage.selectCurrDataRecord_MaxAnalDate(paramWWCode);
maxAnalDate = (maxAnalDate == null || maxAnalDate.length() == 0 ? WebUtils.GetCurrentDateTimeFormat("yyyyMMddHH") + "0000" : maxAnalDate);
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
	var g_urlReport = "real.page.do?Act=water.summary";
	var oReport;
	
	$(document).ready(function() {
		var URL;
		
		URL = g_urlReport + "&WW_CODE=<%=paramWWCode%>&ANAL_DATE=<%=maxAnalDate%>";		
		
		// ������ �ʱ�ȭ
		oReport = $('#report').dataTable( {
			// EXCEL ����, ����Ʈ ��� ���
			"sDom": '<"clear">lfrtipT',
			"oTableTools": {
				"sSwfPath": "${pageContext.request.contextPath}/import/extra/copy_csv_xls_pdf.swf",
				"aButtons": [ 
				             {
				            	 "sExtends": "xls",
				            	 "sButtonText": "���� ���� ����",
				            	 "fnClick": function(nButton, oConfig, oFlash) {
				            		 oFlash.setFileName($("#titleFileName").val() + ".xls");
				            		 this.fnSetText(oFlash, this.fnGetTableDataForXLS(oConfig));
				            	 }
				             }, {
				            	 "sExtends": "print",
				            	 "sButtonText": "������ ���",
				            	 "fnClick": function(nButton, oConfig ) {
				            		 oConfig.sMessage = "<center><font style='font-size: 12pt;'>" + $("#titlePrintPage").val() + "</font></center><br><br>";
				            		 this.fnPrint(true, oConfig);
				            		 window.print();
				            		 this._fnPrintEnd(null);
				            	 }
				             }
				             ]
         	},
         	
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
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "center"}
			              ]
		}).fnFakeRowColspan();
		
		// ���ϸ� �� �μ� ����Ʈ Ÿ��Ʋ �ֱ�
		$("#titleFileName").val("<%=WebConst.GetWPShortName(paramWWCode)%>���������_���ް�������Ȳ");
		$("#titlePrintPage").val("<%=WebConst.GetWPShortName(paramWWCode)%>���������_���ް�������Ȳ");
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSelectPoint(wwCode, pointCode)
	{
		document.location.href = g_contextPath + "/page_general/view_plant_office.jsp?WW_CODE=" + wwCode + "&POINT_CODE=" + pointCode;
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
		<tr>
			<td colspan=2>
				<img src="${pageContext.request.contextPath}/<%=WebConst.GetWPImageURL(paramWWCode)%>">
			</td>
		</tr>
		<tr>
			<td align=left>�� "-" ǥ�ô� �������� �ʴ� �׸��Դϴ�.</td>
			<td align=right>�ֱ� �����ð� : <%=WebUtils.String2DateTimeFormat(maxAnalDate, "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm")%></td>
		</tr>
		<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">
	<table width=100% height=100% cellspacing=1 cellpadding=0 id="report">
		<thead>
		<tr>
			<th align=center height=50 bgcolor="#EFEFEF">���ް�����</th>
			<th align=center bgcolor="#EFEFEF">����</th>
			<th align=center bgcolor="#EFEFEF">Ź��<br>[NTU]</th>
			<th align=center bgcolor="#EFEFEF">pH<br>[-]</th>
			<th align=center bgcolor="#EFEFEF">����<br>[��]</th>
			<th align=center bgcolor="#EFEFEF">�ܷ�����<br>[mg/L]</th>
			<th align=center bgcolor="#EFEFEF">����������<br>[��/��]</th>
			<th align=center bgcolor="#EFEFEF">����1<br>[m]</th>
			<th align=center bgcolor="#EFEFEF">����2<br>[m]</th>
			<th align=center bgcolor="#EFEFEF">����</th>
			<th align=center bgcolor="#EFEFEF">THMs<br>[mg/L]</th>
			<th align=center bgcolor="#EFEFEF">���</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan='12' class='dataTables_empty' align=center>�����κ��� �����͸� ��ȸ���Դϴ�.</td>
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
	<input type="hidden" name="titleFileName" id="titleFileName" value="">
	<input type="hidden" name="titlePrintPage" id="titlePrintPage" value="">
</body>
</html>
<%
// ����
curPage = null;
%>