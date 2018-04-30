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
								<td class='swn_tbl_data'><b>서부수도사업소</b></td>
								<th class='swn_tbl_title'>소재지</th>
								<td class='swn_tbl_data'>서대문구 홍제2동 38-69</td>
								<th class='swn_tbl_title'>전화번호</th>
								<td class='swn_tbl_data'>02-3146-3790</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width=100% cellspacing=0 cellpadding=0>
							<tr><td height=10></td></tr>
							<tr>
								<td align=right><a href=# onclick="openWindow('${pageContext.request.contextPath}/page_html/p_office2-06-1-1.html','','width=600,height=500')"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif"></a></td>
							</tr>
							<tr><td height=10></td></tr>
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
								<td rowspan=2 width=10% class='swn_tbl_data'>30</td>
								<th width=12% class='swn_tbl_title'>지역배수지(개소)</th>
								<td width=10% class='swn_tbl_data'>5</td>
								<th width=12% class='swn_tbl_title'>가압장 수(개소)</th>
								<td width=10% class='swn_tbl_data'>2</td>
								<th width=12% rowspan=2 class='swn_tbl_title'>급수구역(구)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>은평구, 서대문구, 마포구<br>(3개구)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>그 외 배수지(개소)</th>
								<td class='swn_tbl_data'>13</td>
								<th class='swn_tbl_title'>수도꼭지(개소)</th>
								<td class='swn_tbl_data'>10</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr><Td height=10></td></tr>
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
								<td class='swn_tbl_data' rowspan=2>증산(배)</td>
								<td class='swn_tbl_data' rowspan=2>영등포</td>
								<td class='swn_tbl_data' rowspan=2>2009년</td>
								<td class='swn_tbl_data'>(유입) HACH(미)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>은평구 증산동 산 18-6</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(유출)TOA-DKK A4(일)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>북악(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>(유출)TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 홍제3동 산1-100</td>
								<td class='swn_tbl_data' rowspan=1>02-394-5780</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>현행(가)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 현저동 101-2</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>독박골(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>은평구 불광동 11-26</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>불광(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2003년</td>
								<td class='swn_tbl_data' rowspan=1>SENSORTECHNIK(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>은평구 녹번동 산1-13</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>삼우(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>은평구 갈현동 산12-6</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>백련(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 홍은3동 산26-133</td>
								<td class='swn_tbl_data' rowspan=1>02-379-2868</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>만리(가)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>마포구 아현동 85-6</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>만리(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>중구 만리동2가 199</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>와우산(배)</td>
								<td class='swn_tbl_data' rowspan=2>뚝도</td>
								<td class='swn_tbl_data' rowspan=2>2001년</td>
								<td class='swn_tbl_data'>(유입) HACH(미)<BR>NANOCHEM9200(한)</td>
								<td class='swn_tbl_data'>2</td>
								<td class='swn_tbl_data' rowspan=2>마포구 창전동 산1-73</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(유출)TOA-DKK A4(일)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>응암동(소년의집)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>은평구 응암동 42-1</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>홍제1동(송죽원)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 홍제1동 356-13</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>성산동(월드컵공원)</td>
								<td class='swn_tbl_data' rowspan=1>영등포</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>마포구 성산동 390-1</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>신수동</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>마포구 신수동 100-5</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>홍제2동(서부수도)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 홍제2동 38-69</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>마포동(쌍용아파트)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>마포구 마포동 253(쌍용APT)</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>진관(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>HACH(미)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>은평구 진광동</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>노고산(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>마포구 노고산동 산 2-2</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>홍은(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 홍은동 산 1-551</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>홍제(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 홍제3동 산 1-100</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>진관동(동사무소)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>은평구 진관동 78</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>연희(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 연희동 산 113-10</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>가좌(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 홍은동 산 26-170</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>남가좌2동(현대아파트)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 남가좌동 376</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>수색(배)</td>
								<td class='swn_tbl_data' rowspan=1>영등포</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>은평구 수색동 산 30-4</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>능안(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 신촌동 산 2-206</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>갈현2동(길마상상어린이공원)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>은평구 갈현2동 474-1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>자하문(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 홍은2동 8</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>홍은3(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서대문구 홍은3동 산 11-63</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>공덕동(공덕초교)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>마포구 공덕동 256-4</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
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