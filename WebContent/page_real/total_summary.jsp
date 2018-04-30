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
	@import url("${pageContext.request.contextPath}/import/jquery.dataTables.basic.css");
-->	
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/jquery.dataTables.basic.css" rel="stylesheet"/>
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
	var g_urlReportWater = "real.page.do?Act=total.summary.water";
	var g_urlReportPlant = "real.page.do?Act=total.summary.plant";
	var g_urlReportPoints = "real.page.do?Act=total.summary.points";
	var oReportWater, oReportPlant;
	
	function updateWWCodeList()
	{		
		var URL;
		
		URL = "code.list.do?Act=wcode.list";
		
		jQuery.ajax({
			type: "GET",
			url: URL,
			async: false,
			dataType: "JSON",
			success: function(data) {
				$("#search_WWCode").empty().data('option');
				$.each(data.aaItems, function(i, item) {
					$("#search_WWCode").append("<option value='" + item[0] + "'>" + item[1] + " ���� �����</option>");
		    	});
			}
		});
	}
	
	function updateSummaryWater()
	{
		var URL;
		
		URL = g_urlReportWater + "&WW_CODE=" + $("#search_WWCode").val();
		oReportWater.fnReloadAjax(URL);
	}
	
	function updateSummaryPlant()
	{	
		var URL;
		
		URL = g_urlReportPlant;
		oReportPlant.fnReloadAjax(URL);
	}
	
	function updateSummaryPoints()
	{
		var URL;
		
		URL = g_urlReportPoints;
		jQuery.ajax({
			type: "GET",
			url: URL,
			dataType: "JSON",
			success: function(data) {
				var sHtml;
				
				$('#summary_currDate').html(data.sCurrDate);
				$('#summary_workDate').html(data.sWorkDate);
				$('#summary_totalPointCnt').html(data.iTotalCnt);
				
				iHeight = (data.iTotalCnt > 0 ? data.iOkCnt * 48 / data.iTotalCnt : 0);
				sHtml = data.iOkCnt + "<br><img src=" + g_contextPath + "/images/real/20081212_swn_bar01.gif height=" + iHeight + " width=10>";
				$('#summary_okPoint').html(sHtml);
				
				iHeight = (data.iTotalCnt > 0 ? data.iWarnCnt * 48 / data.iTotalCnt : 0);
				sHtml = data.iWarnCnt + "<br><img src=" + g_contextPath + "/images/real/20081212_swn_bar02.gif height=" + iHeight + " width=10>";
				$('#summary_warnPoint').html(sHtml);
				
				iHeight = (data.iTotalCnt > 0 ? data.iInvalidCnt * 48 / data.iTotalCnt : 0);
				sHtml = data.iInvalidCnt + "<br><img src=" + g_contextPath + "/images/real/20081212_swn_bar03.gif height=" + iHeight + " width=10>";
				$('#summary_invalidPoint').html(sHtml);
				
				iHeight = (data.iTotalCnt > 0 ? data.iCheckCnt * 48 / data.iTotalCnt : 0);
				sHtml = data.iCheckCnt + "<br><img src=" + g_contextPath + "/images/real/20081212_swn_bar05.gif height=" + iHeight + " width=10>";
				$('#summary_checkPoint').html(sHtml);
				
				iHeight = (data.iTotalCnt > 0 ? data.iStopCnt * 48 / data.iTotalCnt : 0);
				sHtml = data.iStopCnt + "<br><img src=" + g_contextPath + "/images/real/20081212_swn_bar04.gif height=" + iHeight + " width=10>";
				$('#summary_stopPoint').html(sHtml);
			}
		});
	}
	
	$(document).ready(function() {
		var URL;
		
		// ��������� �ڵ� ����Ʈ
		updateWWCodeList();
		$("#search_WWCode option:eq(0)").attr("selected","selected");
		
		// ������ ���̺� �ʱ�ȭ
		URL = g_urlReportWater + "&WW_CODE=" + $("#search_WWCode").val();
		oReportWater = $('#summary_water').dataTable( {
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
			              {"sClass" : "left"},
			              {"sClass" : "left"},
			              {"sClass" : "left"},
			              {"sClass" : "left"},
			              {"sClass" : "left"},
			              {"sClass" : "left"}
			              ],
			"fnRowCallback": function( nRow, aData, iDisplayIndex ) {
				if( checkStandardValue(aData[1]) ) {
					if( checkStandardRange('TB01', aData[1]) ) {
						$('td:eq(1)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[1]);
					} else {
						$('td:eq(1)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl03.gif>&nbsp;' + aData[1]);
					}	
				} else {
					$('td:eq(1)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
				
				
				if( checkStandardValue(aData[2]) ) {
					if( checkStandardRange('PH01', aData[2]) ) {
						$('td:eq(2)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[2]);
					} else {
						$('td:eq(2)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl03.gif>&nbsp;' + aData[2]);
					}
				} else {
					$('td:eq(2)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
				
				if( checkStandardValue(aData[3]) ) {
					if( checkStandardRange('RC01', aData[3]) ) {
						$('td:eq(3)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[3]);
					} else {
						$('td:eq(3)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl03.gif>&nbsp;' + aData[3]);
					}
				} else {
					$('td:eq(3)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
				
				if( checkStandardValue(aData[4]) ) {
					$('td:eq(4)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[4]);
				} else {
					$('td:eq(4)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
				
				if( checkStandardValue(aData[5]) ) {
					$('td:eq(5)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[5]);
				} else {
					$('td:eq(5)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
 			}
		}).fnFakeRowColspan();		
		
		URL = g_urlReportPlant;
		oReportPlant = $('#summary_plant').dataTable( {
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
			              {"sClass" : "left"},
			              {"sClass" : "left"},
			              {"sClass" : "left"},
			              {"sClass" : "left"},
			              {"sClass" : "left"},
			              {"sClass" : "left"}
			              ],
			"fnRowCallback": function( nRow, aData, iDisplayIndex ) {				
				if( checkStandardValue(aData[1]) ) {
					if( checkStandardRange('TB01', aData[1]) ) {
						$('td:eq(1)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[1]);
					} else {
						$('td:eq(1)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl03.gif>&nbsp;' + aData[1]);
					}	
				} else {
					$('td:eq(1)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
				
				
				if( checkStandardValue(aData[2]) ) {
					if( checkStandardRange('PH01', aData[2]) ) {
						$('td:eq(2)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[2]);
					} else {
						$('td:eq(2)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl03.gif>&nbsp;' + aData[2]);
					}
				} else {
					$('td:eq(2)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
				
				if( checkStandardValue(aData[3]) ) {
					//if( checkStandardRange('RC01', aData[3]) ) {
					if( checkStandardRange1('RC01', aData[3]) ) {
						$('td:eq(3)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[3]);
					} else {
						$('td:eq(3)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl03.gif>&nbsp;' + aData[3]);
					}
				} else {
					$('td:eq(3)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
				
				if( checkStandardValue(aData[4]) ) {
					$('td:eq(4)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[4]);
				} else {
					$('td:eq(4)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
				
				if( checkStandardValue(aData[5]) ) {
					$('td:eq(5)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl01.gif>&nbsp;' + aData[5]);
				} else {
					$('td:eq(5)', nRow).html('<img src=' + g_contextPath + '/images/real/20081212_swn_bl05.gif>&nbsp;������');
				}
 			}
		}).fnFakeRowColspan();
		
		updateSummaryPoints();
		
		// �̺�Ʈ ���
		$("#search_WWCode").change( function() {
			// ��������� ������Ʈ
			updateSummaryWater();
			
			// �������� ������Ʈ
			updateSummaryPlant();
			
			// ��ü ��Ȳ ������Ʈ
			updateSummaryPoints();
		});
	});
</script>
<body style="background:#FFFFFF;">
	<div id="content_form">
	<table width=100% cellspacing=0 cellpadding=0>
		<tr><td colspan=3 height=10></td></tr>
		<tr>
			<!-- ����Һ� ���� ��Ȳ -->
			<td width=50% valign=top>
				<table width=100% cellspacing=0 cellpadding=0>
					<!-- ����Һ� ���� ��Ȳ -->
					<tr>
						<td height=30>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<select id="search_WWCode" style="width:150px;">
							</select>				
							&nbsp;&nbsp;<font color="#0000FF" style="font-style:10pt;font-weight:bold;">���� ��Ȳ</font>			
						</td>
					</tr>
					<tr>
						<td>
							<table width=100% height=100% cellspacing=0 cellpadding=0 border=0 class="display" id="summary_water">
								<thead>
								<tr>
									<th align=center height=25><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt01.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt02.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt03.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt04.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt05.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt06.gif"></th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td colspan="6" class="dataTables_empty" align=center>Loading data from server</td>
								</tr>
								</tbody>
								<tfoot>
								<tr>
									<th colspan="6" align="left"><img src="${pageContext.request.contextPath}/images/real/20081212_swn_img01.gif"></th>
								</tr>
								</tfoot>
							</table>
						</td>
					</tr>
					<tr>
						<td height=10></td>
					</tr>
					<!-- ��ü ��Ȳ SUMMARY -->
					<tr>
						<td><img src="${pageContext.request.contextPath}/images/real/20081212_swn_stitle02.jpg"></td>
					</tr>
					<tr>
						<td bgcolor=#E8F1F3 style="padding:4px 4px 4px 4px;">			
							<table width=100% height=100%  cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>					
								<tr>
									<td width=50%>
										<div style="color:#000000; line-height:21px; margin-left:10px">
										���� �ð� : <span id="summary_currDate"></span><br>
										���� ���� �ð� : <span id="summary_workDate"></span><br>
										�� ������ : <span id="summary_totalPointCnt"></span>����
										</div>
									</td>
									<td width=50%>
										<table width=100% height=100%  cellspacing=0 cellpadding=0>
											<tr>
		                                    	<td width=20% height=73 align=center valign=bottom class="font8" id="summary_okPoint"></td>
		                                    	<td width=20% align=center valign=bottom class="font8" id="summary_warnPoint"></td>
		                                    	<td width=20% align=center valign=bottom class="font8" id="summary_invalidPoint"></td>
		                                    	<td width=20% align=center valign=bottom class="font8" id="summary_checkPoint"></td>
		                                    	<td width=20% align=center valign=bottom class="font8" id="summary_stopPoint"></td>	                                    
		                                    	
		                                	</tr>
		                                	<tr>
		                                    	<td height=23 align=center class="font8">����</td>
		                                    	<td height=23 align=center class="font8">�溸</td>
		                                    	<td height=23 align=center class="font8">�����̻�</td>
		                                    	<td height=23 align=center class="font8">������</td>
		                                    	<td height=23 align=center class="font8">��ߴ�</td>		                                    	
		                                	</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td width=12></td>
			<!-- �������ͺ� ���� ��Ȳ -->
			<td valign=top>
				<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=30>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<font color="#0000FF" style="font-style:10pt;font-weight:bold;">�Ƹ��� �������� ���� ��Ȳ</font>			
						</td>
					</tr>
					<tr>
						<td>
							<table width=100% height=100% cellspacing=0 cellpadding=0 border=0 class="display" id="summary_plant">
								<thead>
								<tr>
									<th align=center height=25><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt01.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt02.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt03.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt04.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt05.gif"></th>
									<th align=center width=70><img src="${pageContext.request.contextPath}/images/real/20081212_swn_bt06.gif"></th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td colspan="6" class="dataTables_empty" align=center>Loading data from server</td>
								</tr>
								</tbody>
								<tfoot>
								<tr>
									<th colspan="6" align="left"><img src="${pageContext.request.contextPath}/images/real/20081212_swn_img01.gif"></th>
								</tr>
								</tfoot>
							</table>
						</td>
					</tr>				
				</table>
			</td>
		<tr>
		</tr>
	</table>	
	</div>
</body>
</html>
<%
// ����
curPage = null;
%>