<%@ page import="kr.go.seoul.water.comm.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//-----------------------------------------------------------------------------------------------
// 웹 페이지 캐쉬 삭제
//-----------------------------------------------------------------------------------------------
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
if( request.getProtocol() != null && request.getProtocol().equals("HTTP/1.1") ) {
	response.setHeader("Cache-Control", "no-cache");
}

//-----------------------------------------------------------------------------------------------
//초기화
//-----------------------------------------------------------------------------------------------
WebPage curPage = new WebPage(pageContext, request, response);

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
// WW_CODE : 정수센터 코드
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
<!-- jQuery 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.js"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui-ko.js"></script>

<!-- Water Now 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/script.do"></script>

<style type="text/css" media="print">
<!--
	@import url("${pageContext.request.contextPath}/import/water_now.css");
-->
</style>
<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<!-- DataTabele 관련 CSS 및 자바스크립트 포함 -->
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
	var g_urlReport = "real.page.do?Act=plant.summary.process";
	var oReport;
	
	function updateReport(pointCode, pointType)
	{
		var URL;
		$("#memo").css("display", "none");
		$("#content_form").css("display", "");
		
		URL = g_urlReport + "&WW_CODE=<%=paramWWCode%>&POINT_CODE=" + pointCode + "&ANAL_POINT_TYPE=" + pointType;
		if( oReport == undefined ) {
			oReport = $('#report').dataTable( {
				// EXCEL 저장, 프린트 출력 기능
				"sDom": '<"clear">lfrtipT',
				"oTableTools": {
					"sSwfPath": "${pageContext.request.contextPath}/import/extra/copy_csv_xls_pdf.swf",
					"aButtons": [ 
					             {
					            	 "sExtends": "xls",
					            	 "sButtonText": "엑셀 파일 저장",
					            	 "fnClick": function(nButton, oConfig, oFlash) {
					            		 oFlash.setFileName($("#titleFileName").val() + ".xls");
					            		 this.fnSetText(oFlash, this.fnGetTableDataForXLS(oConfig));
					            	 }
					             }, {
					            	 "sExtends": "print",
					            	 "sButtonText": "프린터 출력",
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
					"sProcessing" : "자료를 검색 중입니다."
				},
				"sAjaxSource": URL,
				"aoColumns": [
								{"sClass" : "center"},
				            	{"sClass" : "center"},
				              	{"sClass" : "center"},
				              	{"sClass" : "center"},
				              	{"sClass" : "center"},
				              	{"sClass" : "right"},
				              	{"sClass" : "center"}
				              ]
			}).fnFakeRowColspan();	
		} else {
			oReport.fnReloadAjax(URL);	
		}
	}
	
	$(document).ready(function() {		
	});
	
	//-----------------------------------------------------------------------------------------------
	// 기능 관련 함수
	//-----------------------------------------------------------------------------------------------
	function fnSelectType(type)
	{
		if( type == 1 ) {
			document.location.href = g_contextPath + "/page_real/plant_summary_process.jsp?WW_CODE=<%=paramWWCode%>";
		} else {
			document.location.href = g_contextPath + "/page_real/plant_summary_provider.jsp?WW_CODE=<%=paramWWCode%>";
		}
	}
	
	function fnSelectProcess(pointCode, pointType)
	{
		var txt;
		
		txt = "";
		switch(pointType)
		{
		case 1:
			txt = "취수장";
			break;
			
		case 2:
			txt = "착수정";
			break;
			
		case 3:
			txt = "침전지";
			break;
			
		case 4:
			txt = "여과지";
			break;
			
		case 5:
			txt = "송수";
			break;
		}
		$("#process_Txt").html(txt);
		
		// 파일명 및 인쇄 프리트 타이틀 넣기
		$("#titleFileName").val("<%=WebConst.GetWPShortName(paramWWCode)%>아리수정수센터_수질항목별현황_" + txt);
		$("#titlePrintPage").val("<%=WebConst.GetWPShortName(paramWWCode)%>아리수정수센터 수질항목별현황 (" + txt + ")");
		
		updateReport(pointCode, pointType);
	}
	
	function fnExcel()
	{
		
	}
	
	function fnPrint()
	{
		
	}
</script>
<body style="background:#FFFFFF;">
	<div id="header_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
		<tr>
			<td>
				<img src="${pageContext.request.contextPath}/<%=WebConst.GetWPImageURL(paramWWCode)%>">
			</td>
		</tr>
		<tr>
			<td>
				<table cellspacing=0 cellpadding=0>
					<tr>
						<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02_ov.jpg); padding-top:5px;" align="center"><a href="javascript:fnSelectType(1);"><font color=white><b>정수공정</b></font></a></td>
						<td width=2></td>
						<td width=133 height=20 style="background-image:url(${pageContext.request.contextPath}/images/comm/20081212_swn_atab02.jpg); padding-top:5px;" align="center"><a href="javascript:fnSelectType(2);"><font color=blue><b>수계공급과정</b></font></a></td>
					</tr>
				</table>
			</td>		
		</tr>
		<tr><td height=2 bgcolor=#00375D></td></tr>
		<tr><td height=10></td></tr>
		<tr>
			<td>
				<table width=94% cellspacing=0 cellpadding=0 align=center>
					<tr>
						<td align=center><a href="javascript:fnSelectProcess('<%=WebConst.GetPlantProcessCode(paramWWCode, 1)%>', 1);"><img src=${pageContext.request.contextPath}/images/real/20081212_swn_dicon01.jpg></a></td>
						<td align=center><img src=${pageContext.request.contextPath}/images/real/20081212_swn_darrow01.jpg></td>
						<td align=center><a href="javascript:fnSelectProcess('<%=WebConst.GetPlantProcessCode(paramWWCode, 2)%>', 2);"><img src=${pageContext.request.contextPath}/images/real/20081212_swn_dicon02.jpg></a></td>
						<td align=center><img src=${pageContext.request.contextPath}/images/real/20081212_swn_darrow01.jpg></td>
						<td align=center><a href="javascript:fnSelectProcess('<%=WebConst.GetPlantProcessCode(paramWWCode, 3)%>', 3);"><img src=${pageContext.request.contextPath}/images/real/20081212_swn_dicon03.jpg></a></td>
						<td align=center><img src=${pageContext.request.contextPath}/images/real/20081212_swn_darrow01.jpg></td>
						<td align=center><a href="javascript:fnSelectProcess('<%=WebConst.GetPlantProcessCode(paramWWCode, 4)%>', 4);"><img src=${pageContext.request.contextPath}/images/real/20081212_swn_dicon04.jpg></a></td>
						<td align=center><img src=${pageContext.request.contextPath}/images/real/20081212_swn_darrow01.jpg></td>
						<td align=center><a href="javascript:fnSelectProcess('<%=WebConst.GetPlantProcessCode(paramWWCode, 5)%>', 5);"><img src=${pageContext.request.contextPath}/images/real/20081212_swn_dicon05.jpg></a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr><td height=20></td></tr>		
		<tr>
			<td bgcolor=#B2C3CE>
				<div id="memo" style="display:block;">
				<table width=100% cellspacing=1 cellpadding=0>
					<tr>
						<td bgcolor=#EDF4F8 align=center height=50 style="line-height:1.6em;">위의 그림은 <%=WebConst.GetWPShortName(paramWWCode)%> 아리수정수센터의 수돗물 생산과정입니다.<br><b>조회하고자 하는 정수공정을 클릭해주세요.</b></td>
					</tr>
				</table>
				</div>
			</td>
		</tr>
	</table>
	</div>
	<div id="content_form" style="display:none">
	<table width=177 height=34 cellspacing=0 cellpadding=0>
		<tr>
			<td bgcolor=#55A9E7>
				<table width=100% cellspacing=4 cellpadding=0>
					<tr>
						<td width=51 align=center style="padding-top:3px;"><font color=#ffffff><b>공정</b></font></td>
						<td width=126 bgcolor=#ffffff height=26 style="padding-top:3px; padding-left:10px;"><font color=#00375D><b><span id="process_Txt"></span></b></font></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr><td height=10></td></tr>
	</table>
	<table width=100% cellspacing=1 cellpadding=0 id="report">
		<thead>
		<tr>
			<th height=25 width=10% align=center bgcolor='#EFEFEF'>분류</th>
			<th width=10% align=center bgcolor='#EFEFEF'>구분</th>
			<th width=10% align=center bgcolor='#EFEFEF'>측정시간</th>
			<th width=10% align=center bgcolor='#EFEFEF'>측정항목</th>
			<th width=10% align=center bgcolor='#EFEFEF'>단위</th>
			<th width=10% align=center bgcolor='#EFEFEF'>측정값</th>
			<th width=10% align=center bgcolor='#EFEFEF'>비고</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan='7' class='dataTables_empty' align=center>서버로부터 데이터를 조회중입니다.</td>
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
// 해제
curPage = null;
%>
