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
// WORK_DATE : �۾� ����
//-----------------------------------------------------------------------------------------------
String paramWorkDate = curPage.getParam("WORK_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMdd"));

String searchReportM_Y, searchReportM_M;
searchReportM_Y = WebUtils.GetCurrentDateTimeFormat("yyyy");
searchReportM_M = WebUtils.GetCurrentDateTimeFormat("MM");
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
	var g_reportItemURL = "manual_search_etc.page.do?Act=lab_inout_result_plant.item";
	var g_reportDataURL = "manual_search_etc.page.do?Act=lab_inout_result_plant.list";
	var oReport, oFC;
	
	function updateWWCodeList()
	{	
		var URL;
		
		URL = "code.list.do?Act=pcode.list";	
	
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_WWCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_WWCode").append("<option value='" + item[0] + "'>" + item[1] + "</option>");
		    	});
			}
		});
	}
	
	function updateWWCodeOpList()
	{
		$("#search_WWCodeOp").empty().data('option');
		switch($("#search_WWCode").val())
		{
		case "PR0065":
			$("#search_WWCodeOp").append("<option value='3'>#3</option>");
			$("#search_WWCodeOp").append("<option value='4'>#4</option>");
			$("#search_WWCodeOp").css("display", "");
			break;
			
		case "PR0183":
			$("#search_WWCodeOp").append("<option value='2'>#2</option>");
			$("#search_WWCodeOp").append("<option value='3'>#3</option>");
			$("#search_WWCodeOp").append("<option value='4'>#4</option>");
			$("#search_WWCodeOp").css("display", "");				
			break;
			
		case "PR0407":
			$("#search_WWCodeOp").append("<option value='1'>#1</option>");
			$("#search_WWCodeOp").append("<option value='2'>#2</option>");
			$("#search_WWCodeOp").append("<option value='3'>#3</option>");
			$("#search_WWCodeOp").css("display", "");
			break;
			
		case "PR0370":
			$("#search_WWCodeOp").append("<option value='1'>#1</option>");
			$("#search_WWCodeOp").append("<option value='2'>#2</option>");
			$("#search_WWCodeOp").css("display", "");
			break;
			
		default:
			$("#search_WWCodeOp").append("<option value=''></option>");
			$("#search_WWCodeOp").css("display", "none");
			break;
		}
	}
	
	function updateReport()
	{	
		var URL;
		var waterTypeName;
		var workDate;
		
		// ��û ���� ���
		waterTypeName = $("#search_WaterType option:selected").text();
		workDate = $('#search_ReportM_Y').val() + $('#search_ReportM_M').val();
		
		// ���̺� ������ ��û URL �����
		URL = g_reportItemURL
			+ "&WW_TYPE=P"
			+ "&WW_CODE=" + $("#search_WWCode").val()
			+ "&WW_CODE_OP=" + $("#search_WWCodeOp").val()
			+ "&WATER_TYPE=" + $("#search_WaterType").val()			
			+ "&WORK_DATE=" + workDate;	
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				
				//���̺� �ֱ�
				$("#report_form").html(data.sHTML);
				
				// ������ ��û URL �����
				URL = g_reportDataURL
					+ "&WW_TYPE=P"
					+ "&WW_CODE=" + $("#search_WWCode").val()
					+ "&WW_CODE_OP=" + $("#search_WWCodeOp").val()
					+ "&WATER_TYPE=" + $("#search_WaterType").val()			
					+ "&WORK_DATE=" + workDate;
				
				// ����Ʈ �����
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
						            		 if( $("#titleFileName").val() == "" ) {
						            			 alert("�ڷ� �˻��� ���Ϸ� �����ϼ���.");
						            			 return;
						            		 }
						            		 
						            		 oFlash.setFileName($("#titleFileName").val() + ".xls");
						            		 this.fnSetText(oFlash, this.fnGetTableDataForXLS(oConfig));
						            	 }
						             }, {
						            	 "sExtends": "print",
						            	 "sButtonText": "������ ���",
						            	 "fnClick": function(nButton, oConfig ) {
						            		 if( $("#titlePrintPage").val() == "" ) {
						            			 alert("�ڷ� �˻��� �����ͷ� ����ϼ���.");
						            			 return;
						            		 }
						            		 
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
					"sAjaxSource": URL,
					"aoColumns": data.aoColumns,
					
					"bServerSide": true,
					"sScrollX": "100%",
					"sScrollXInner": "300%",
			        "bScrollCollapse": true,
					
					"fnInitComplete": function() {
						new FixedColumns(oReport, {"iLeftColumns": 0});
					}
				} ).fnFakeRowColspan();
			}
		});
		
		// �ؽ�Ʈ �ֱ�
		$("#list_text").html(waterTypeName + " �������� ���(" + workDate.substr(0, 4) + "�� " + workDate.substr(4, 2) + "��)");
		
		// ���ϸ� �� �μ� ����Ʈ Ÿ��Ʋ �ֱ�
		$("#titleFileName").val(waterTypeName + "_����������_"
				+ "_" + workDate.substr(0, 4) + workDate.substr(4, 2));
		$("#titlePrintPage").val(waterTypeName + " ���� ���� ���"
				+ "(" + workDate.substr(0, 4) + "�� " + workDate.substr(4, 2) + "��)");
	}
	
	$(document).ready(function() {
		// ����� �ڵ� �ֱ�
		updateWWCodeList();
		$("#search_WWCode option:eq(0)").attr("selected","selected");
		
		// ����� �ڵ� OP �ֱ�
		updateWWCodeOpList();
		$("#search_WWCodeOp option:eq(0)").attr("selected","selected");
		
		// �̺�Ʈ ó��
		$("#search_WWType").change( function() {
			var nSel, URL;
			
			nSel = $(this).val();
			URL = g_contextPath + "/page_manual/";
			
			switch(nSel)
			{
			case "P":
				URL += "lab_inout_result_plant.jsp";
				break;
				
			case "W":
				URL += "lab_inout_result_water.jsp";
				break;
			}
			
			document.location.href = URL;
		});
		
		$("#search_WWCode").change( function() {
			updateWWCodeOpList();
			$("#search_WWCodeOp option:eq(0)").attr("selected","selected");
		});
		
		updateReport();
	});
	
	//-----------------------------------------------------------------------------------------------
	// ��� ���� �Լ�
	//-----------------------------------------------------------------------------------------------
	function fnSearch()
	{
		updateReport();
	}	
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/manual/20081212_swn_stitle17.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table cellspacing=0 cellpadding=0>
			<tr>
				<td width=160 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab03.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');"><font color=blue><b>�������� ���Ͽ��Ȳ</b></font></a></td>
				<td width=2></td>
				<td width=160 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab03_ov.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '1', '2', '', '${pageContext.request.contextPath}');"><font color=white><b>������ �����˻���</b></font></a></td>
				<td width=2></td>
				<td width=160 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab03.jpg); padding-top:5px;" align="center"><a href="javascript:menuSelectWithPath('3', '1', '3', '', '${pageContext.request.contextPath}');"><font color=blue><b>����ó������ ����</b></font></a></td>
			</tr>
			</table>
		</td>		
	</tr>
	<tr><td height=2 bgcolor=#00375D></td></tr>
	<tr><td height=10></td></tr>
	<tr>
		<td>
			<table width="100%" cellspacing="1" cellpadding="0" style="background-color: #666666;">
			<tr>
				<td width=10% height=30 class='swn_tbl_title'>�˻� ���</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WWType" style="width:130px;">
						<option value="P" selected>��������</option>
						<option value="W">�����������</option>
					</select>
				</td>
				<td width=10% height=30 class='swn_tbl_title'>����Ҹ�</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WWCode" style="width:130px;">						
					</select>&nbsp;&nbsp;
					<select id="search_WWCodeOp" style="width:130px;">						
					</select>
				</td>
			</tr>
			<tr>
				<td width=10% height=30 class='swn_tbl_title'>����</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_WaterType" style="width:130px;">
						<option value="O" selected>����</option>
						<option value="P">����</option>
					</select>
				</td>	
				<td width=10% class='swn_tbl_title'>�˻��Ⱓ</td>
				<td width=40% style="background-color:white; text-align:left; padding-left:5px">
					<table cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<select name="search_ReportM_Y" id="search_ReportM_Y">
							<%
								for(int iLoop = 2000; iLoop <= Integer.parseInt(WebUtils.GetCurrentDateTimeFormat("yyyy")) + 2; iLoop ++)
								{
									String sTmp = String.valueOf(iLoop);
									if( iLoop == Integer.parseInt(searchReportM_Y) ) {
										out.println("<option value='" + sTmp + "' selected>" + sTmp + "</option>");	
									} else {
										out.println("<option value='" + sTmp + "'>" + sTmp + "</option>");
									}
								}
							%>
							</select>&nbsp;��
						</td>
						<td width=20px></td>
						<td>
							<select name="search_ReportM_M" id="search_ReportM_M">
							<%
								for( int iLoop = 1; iLoop <= 12; iLoop ++)
								{
									String sTmp = WebUtils.FormatNumber(iLoop, "00");
									if( iLoop == Integer.parseInt(searchReportM_M) ) {
										out.println("<option value='" + sTmp + "' selected>" + sTmp + "</option>");	
									} else {
										out.println("<option value='" + sTmp + "'>" + sTmp + "</option>");
									}
								}
							%>
							</select>&nbsp;��
						</td>
					</tr>
					</table>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr><td height=5></td></tr>
	<tr>
		<td align=right><a href="javascript:fnSearch();"><img src="${pageContext.request.contextPath}/images/comm/20090514_swn_btn_search.gif" border=0 ></a></td>
	</tr>
	<tr><td height=30></td></tr>
	</table>
	</div>
	<div id="report_title">	
		<table width=100% height=100% cellspacing=0 cellpadding=0>
		<tr>
			<td>
				<img src='${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif' style='margin-bottom:2px; margin-right:4px;'><b><font color=#003750><span id="list_text">����������</span></font></b>
			</td>
		</tr>
		</table>
	</div>
	<div id="report_form">
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