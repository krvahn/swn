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
// WW_TYPE : �����ڵ�(P: ��������, W:���������)
// SMS_TYPE : �˻� ���
// FROM_DATE : �˻� �Ⱓ ������ (yyyyMMddHHmm ����)
// TO_DATE : �˻� �Ⱓ ������ (yyyyMMddHHmm ����)
//-----------------------------------------------------------------------------------------------
String paramWWCode = curPage.getParam("WW_CODE", "");
String paramWWType = curPage.getParam("WW_TYPE", "");
String paramSmsType = curPage.getParam("SMS_TYPE", "");
String paramSmsMSG = curPage.getParam("SMS_MSG", "");
String paramFromDate = WebUtils.DateTrim(curPage.getParam("FROM_DATE", WebUtils.GetDiffCurrentDateTimeFormat("yyyyMMdd", "d", -7)));
String paramToDate = WebUtils.DateTrim(curPage.getParam("TO_DATE", WebUtils.GetCurrentDateTimeFormat("yyyyMMdd")));

boolean bUpdate;
String searchReportR_FromYMD, searchReportR_ToYMD;

searchReportR_FromYMD = WebUtils.String2DateTimeFormat(paramFromDate, "yyyyMMdd", "yyyy-MM-dd");
searchReportR_ToYMD = WebUtils.String2DateTimeFormat(paramToDate, "yyyyMMdd", "yyyy-MM-dd");

String sWWName;
sWWName = WebConst.GetWPShortName(paramWWCode);
if( paramWWType.equals("P") ) {
	sWWName += " ���������";
} else if(paramWWType.equals("W") ){
	sWWName += " ���������";
} else {
	sWWName = "";
}
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

<style type="text/css">
	div.DTTT_container 
	{
	    position: absolute;
	    float: left;
	    margin-top: 10px;
	}
</style>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	var g_urlReportData = "system.page.do?Act=sms_send.list";
	var oReport;
	
	function updateReport()
	{		
		var URL;
		var fromDate, toDate;
		
		fromDate = "";
		toDate = "";
		
		// ��û ���� �����
		fromDate = fnDateTrim($('#search_ReportR_FromYMD').val()) + "000000";		
		toDate = fnDateTrim($('#search_ReportR_ToYMD').val()) + "240000";
		
		// ������ ��û URL �����
		URL = g_urlReportData
			+ "&FROM_DATE=" + fromDate
			+ "&TO_DATE=" + toDate	
			+ "&WW_TYPE=<%=paramWWType%>"
			+ "&WW_CODE=<%=paramWWCode%>"
			+ "&SMS_TYPE=" + $('#search_SmsType').val()
			+ "&SMS_MSG=" + $('#MSG').val();
		
		oReport.fnReloadAjax(URL);
		
		// ���ϸ� �� �μ� ����Ʈ Ÿ��Ʋ �ֱ�
		$("#titleFileName").val("SMS�����̷�_" 
				+ $('#search_WWCode option:selected').text()
				+ "_" + $('#search_SmsType option:selected').text()
				+ "_" + fromDate + "_" + toDate);
		$("#titlePrintPage").val("SMS �����̷� " 
				+ $('#search_WWCode option:selected').text()
				+ " " + $('#search_SmsType option:selected').text()
				+ "(" + fromDate + "~" + fromDate + ")");
	}
	
	$(document).ready(function() {
		// �˻���� �����ϱ�
		if( "<%=paramSmsType%>" != "" ) {
			$("#search_SmsType").val('<%=paramSmsType%>');
		} else {
			$("#search_SmsType option:eq(0)").attr("selected","selected");
		}
		
		// �޷� ����
		$('#search_ReportR_FromYMD').datepicker();
		$('#search_ReportR_ToYMD').datepicker();
		
		// ���̺� ����
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
			"bPaginate": true,
			"bSort": false,
			"bInfo": true,
			"bFilter": false,
			"sPaginationType" : "full_numbers",
			"oLanguage": {
				"sLengthMenu": "�� �������� _MENU_ ���ڵ� ǥ��",
				"sInfo": "��ü : _TOTAL_ ���ڵ� [ _START_ to _END_ ]",
	            "sInfoEmpty": "�ش� ���ڵ� ����",
				"sProcessing" : "�ڷḦ �˻� ���Դϴ�.",
				"oPaginate" : {
					"sFirst": "ó������",	            
		            "sLast": "����������",
		            "sPrevious": "������",
		            "sNext": "��������"
				}
			},
			"sAjaxSource": "code.list.do?Act=none&COLSPAN=3",
			"aoColumns": [
			              {"sClass" : "center"},
			              {"sClass" : "center"},
			              {"sClass" : "left"}
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
	
	function fnExcel()
	{		
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/system/20090511_swn_stitle05.jpg">
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" cellspacing="1" cellpadding="0" style="background-color: #666666;">
			<tr>
				<td width=10% class='swn_tbl_title'>�˻����</td>
				<td width=10% style="background-color:white; text-align:left; padding-left:5px">
					<select id="search_SmsType" style="width:130px;">
						<option value="">��ü</option>
						<option value="1">����ġ�ʰ�</option>
						<option value="2">���������̻�</option>
						<option value="3">���ۻ����̻�</option>
					</select>				
				</td>
				<td width=10% class='swn_tbl_title'>�˻��Ⱓ</td>
				<td width=30% style="background-color:white; text-align:left; padding-left:5px">
					<table>
					<tr height=30>
						<td>
							<input type="text" name="search_ReportR_FromYMD" id="search_ReportR_FromYMD" class="inputbox"  readonly
                            	style="width:100px; ime-mode:disabled;" maxlength="10" 
                            	value="<%=searchReportR_FromYMD%>" onkeypress="key_NumberOnly();">
                            &nbsp;~&nbsp;
		                    <input type="text" name="search_ReportR_ToYMD" id="search_ReportR_ToYMD" class="inputbox" readonly 
		                        style="width:100px; ime-mode:disabled;" maxlength="10" 
		                        value="<%=searchReportR_ToYMD%>" onkeypress="key_NumberOnly();">
						</td>
					</tr>
					</table>
				</td>
				<td width=10% class='swn_tbl_title'>SMS�޼���</td>
				<td width=10% style="background-color:white; text-align:left; padding-left:5px">
					<input type='text' name="MSG" id="MSG" value="<%=paramSmsMSG%>" size=10 maxlength=20 style="width:130px;vertical-align:middle;">
				</td>
				<td width=20% style="background-color:white; text-align:center;"><b><%=sWWName%></b></td>
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
	<div id="content_form">
	<table width=100% height=100% cellspacing=1 cellpadding=0 id="report">
		<thead>
		<tr>
			<th align=center height=30 width=20% bgcolor="#EFEFEF">����</th>
			<th align=center width=10% bgcolor="#EFEFEF">�����ڼ�</th>
			<th align=center width=70% bgcolor="#EFEFEF">SMS �޼���</th>
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
	<input type="hidden" name="titleFileName" id="titleFileName" value="">
	<input type="hidden" name="titlePrintPage" id="titlePrintPage" value="">
</body>
</html>
<%
// ����
curPage = null;
%>