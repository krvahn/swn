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
	var g_urlReport = "real.page.do?Act=total.plant.summary.out";
	var oReport;
	
	$(document).ready(function() {
		URL = g_urlReport;
		
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
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"},
			              {"sClass" : "right"}
			              ]
		}).fnFakeRowColspan();
	});
	
	//-----------------------------------------------------------------------------------------------
	// �Լ� ó��
	//-----------------------------------------------------------------------------------------------
	function fnSelectType(type)
	{
		if( type == 1 ) {
			document.location.href = g_contextPath + "/page_real/total_plant_summary_in.jsp";
		} else {
			document.location.href = g_contextPath + "/page_real/total_plant_summary_out.jsp";
		}
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
		<tr>
			<td>
				<img src="${pageContext.request.contextPath}/images/real/20081212_swn_btitle01.jpg">
			</td>
		</tr>
		<tr>
			<td>
				<table cellspacing=0 cellpadding=0>
					<tr>
						<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:fnSelectType(1);"><font color=blue><b>���</b></font></a></td>
						<td width=2></td>
						<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02_ov.jpg); padding-top:5px;" align="center"><a href="javascript:fnSelectType(2);"><font color=white><b>����</b></font></a></td>
					</tr>
				</table>
			</td>		
		</tr>
		<tr><td height=2 bgcolor=#00375D></td></tr>
		<tr><td height=10></td></tr>
	</table>
	</div>
	<div id="content_form">	
		<table width=100% height=100% cellspacing=1 cellpadding=0 id='report'>
			<thead>
			<tr>
				<th rowspan=2 width=25% height=25 align=center bgcolor='#EFEFEF'>����Ҹ�</th>
				<th width=15% align=center bgcolor='#EFEFEF'>Ź��</th>
				<th width=15% align=center bgcolor='#EFEFEF'>pH</th>
				<th width=15% align=center bgcolor='#EFEFEF'>�ܷ�����</th>
				<th width=15% align=center bgcolor='#EFEFEF'>����</th>
				<th width=15% align=center bgcolor='#EFEFEF'>����������</th>			
			</tr>
			<tr>
				<th height=25 align=center bgcolor='#EFEFEF'>NTU</th>
				<th align=center bgcolor='#EFEFEF'>-</th>
				<th align=center bgcolor='#EFEFEF'>mg/L</th>
				<th align=center bgcolor='#EFEFEF'>��</th>
				<th align=center bgcolor='#EFEFEF'>��/��</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan='6' class='dataTables_empty' align=center>�����κ��� �����͸� ��ȸ���Դϴ�.</td>
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
	<input type="hidden" name="titleFileName" id="titleFileName" value="��ü �Ƹ��� �������� ���� ��Ȳ">
	<input type="hidden" name="titlePrintPage" id="titlePrintPage" value="��ü �Ƹ��� �������� ���� ��Ȳ">
</body>
</html>
<%
// ����
curPage = null;
%>
