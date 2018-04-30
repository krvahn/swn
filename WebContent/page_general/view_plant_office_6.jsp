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

<!-- Water Now 관련 CSS 및 자바스크립트 포함 -->
<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	
	function openWindow(theURL, winName, features)
	{
		window.open(theURL, winName, features);
	}
</script>
<body style="background:#FFFFFF;">
	<div id="content_form">
	<table width=100% height=100% cellspacing=0 cellpadding=0 bgcolor=white>
    <tr>
	    	<td style="padding-left:0px; padding-right:10px;" width=100%>
	        <table width=100% height=100% cellspacing=0 cellpadding=0>	        
	        <tr>
	            	<td valign=top width=100% height=100%>
	                <!-- content -->
	                <table width=100% cellspacing=0 cellpadding=0>
					<tr>
							<td><img src="${pageContext.request.contextPath}/images/general/20081212_swn_stitle16.jpg"></td>
					</tr>
					</table>					
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
							<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>시설정보</b></font></td>
					</tr>					
					</table>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
							<td bgcolor=#CFCFCF>
							<table width=100% cellspacing=1 cellpadding=0>
							<tr>
								<th class='swn_tbl_title'>사업소명</th>
									<td class='swn_tbl_data'><b>남부수도사업소</b></td>
								<th class='swn_tbl_title'>소재지</th>
									<td class='swn_tbl_data'>동작구 신대방동 470-11</td>
								<th class='swn_tbl_title'>전화번호</th>
									<td class='swn_tbl_data'>02-3146-4690</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
							<td>
							<table width=100% cellspacing=0 cellpadding=0>
							<tr>	<td height=10></td></tr>
							<tr>
									<td align=right><a href=# onclick="openWindow('${pageContext.request.contextPath}/page_html/p_office2-09-1-1.html','','width=600,height=500')"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif"></a></td>
							</tr>
							<tr>	<td height=10></td></tr>
							</table>
						</td>
					</tr>
					</table>					
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
							<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>관할 공급과정 개소 및 급수구역 정보</b></font></td>
					</tr>
					</table>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
						<td bgcolor=#CFCFCF>
							<table width=100% cellspacing=1 cellpadding=0>
							<tr>
								<th rowspan=2 width=12% class='swn_tbl_title'>전 체 개 소</th>
								<td rowspan=2 width=10% class='swn_tbl_data'>33</td>
								<th width=12% class='swn_tbl_title'>지역배수지(개소)</th>
								<td width=10% class='swn_tbl_data'>5</td>
								<th width=12% class='swn_tbl_title'>가압장 수(개소)</th>
								<td width=10% class='swn_tbl_data'>1</td>
								<th width=12% rowspan=2 class='swn_tbl_title'>급수구역(구)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>동작구, 관아구<br>영등포구,금천구<br>(4개구)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>그 외 배수지(개소)</th>
								<td class='swn_tbl_data'>15</td>
								<th class='swn_tbl_title'>수도꼭지(개소)</th>
								<td class='swn_tbl_data'>12</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>	<td height=10></td></tr>
					</table>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
							<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>공급과정 측정기 설치 정보</b></font></td>
					</tr>
					</table>                    
                    <table width=100% cellspacing=0 cellpadding=0 align=center>
                    <tr>
						<td bgcolor=#CFCFCF>
							<table width=100% cellspacing=1 cellpadding=0>
							<tr>
								<td width=20% class='swn_tbl_title'>지점명</td>
								<td width=10% class='swn_tbl_title'>공급수계</td>
								<td width=10% class='swn_tbl_title'>설치년도</td>
								<td width=20% class='swn_tbl_title'>측정기 제작사</td>
								<td width=5%  class='swn_tbl_title'>측정항목수</td>
								<td width=25% class='swn_tbl_title'>소재지</td>
								<td width=10% class='swn_tbl_title'>전화번호</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>노량진(배)</td>
								<td class='swn_tbl_data' rowspan=2>암사</td>
								<td class='swn_tbl_data'>2004년</td>
								<td class='swn_tbl_data'>(유입)HACH(미)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>동작구 본동 258-1</td>
								<td class='swn_tbl_data' rowspan=2>02-3146-2071</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>2006년</td>
								<td class='swn_tbl_data'>(유출)TOA-DKK A4(일)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>낙성대(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 봉천7동 산53-1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>대방(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동작구 대방동 15-45</td>
								<td class='swn_tbl_data' rowspan=1>02-2586-4424</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>남부(수)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동작구 신대방동 470-11</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>상도(배)</td>
								<td class='swn_tbl_data' rowspan=2>암사</td>
								<td class='swn_tbl_data'>2010년</td>
								<td class='swn_tbl_data'>(유입)HACH(미)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>동작구 본동 258-1</td>
								<td class='swn_tbl_data' rowspan=2>02-3146-2071</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>2011년</td>
								<td class='swn_tbl_data'>(유출)TOA-DKK B4(일)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>신림6(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 신림동 산 89-4</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>영등포(공)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>영등포구 영등포동 582-3</td>
								<td class='swn_tbl_data' rowspan=1>02-3171-0308</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>독산(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>금천구 독산3동 산10-2</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>법원(가)</td>
								<td class='swn_tbl_data' rowspan=1>영등포</td>
								<td class='swn_tbl_data' rowspan=1>2002년</td>
								<td class='swn_tbl_data' rowspan=1>SENSORTECHNIK(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>금천구 시흥4동 3-65</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>금천(배)</td>
								<td class='swn_tbl_data' rowspan=2>영등포</td>
								<td class='swn_tbl_data' rowspan=2>2001년</td>
								<td class='swn_tbl_data'>(유입)HACH(미)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>금천구 독산동 산118-4</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(유출)TOA-DKK A4(일)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>선우(배)</td>
								<td class='swn_tbl_data' rowspan=1>영등포</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 신림12동 산117-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>사당5동</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동작구 사당5동</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>봉천동(까치고개)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 봉천6동 산 66-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>독산4동(독산119)</td>
								<td class='swn_tbl_data' rowspan=1>영등포</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>금천구 독산4동 1030</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>영등포동7가(경남아너스빌)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>영등포구 영등포동 7가 46-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>장군봉(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 봉천동 산 151-15</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>시흥동(시흥119)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>금천구 시흥동 909-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>신대방1동(동작상떼빌)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동작구 신대방1동 719</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>신대방2동(보라매)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동작구 신대방2동 711</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>상도3(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동작구 상도3동 산 75-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>봉현(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 봉천동 1712-4</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>봉천6-2(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동작구 사당4동 산 32-85</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>봉천11(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 봉천동 산 3-6</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>신림2-1(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 신림10동 328</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>남현(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 남현동 산 57-18</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>사당3(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동작구 사당3동 22-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>사당4(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동작구 사당4동 산 45-6</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>봉천11소(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 봉천11동 17-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>신림2(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 신림2동 산 1-254</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>신림9(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 신림9동 산 68-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>신림9동(샘말공원)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 신림9동 산 63-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>시흥5동(백산초교)</td>
								<td class='swn_tbl_data' rowspan=1>영등포</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>금천구 시흥대로 38길 78</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>청룡동 (청룡초교)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>관악구 청룡동 꿈나무길 22</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							</table>
                        </td>
                    </tr>
                    </table>
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
// 해제
curPage = null;
%>