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
								<td class='swn_tbl_data'><b>중부수도사업소</b></td>
								<th class='swn_tbl_title'>소재지</th>
								<td class='swn_tbl_data'>중구 장충동2가 208-1</td>
								<th class='swn_tbl_title'>전화번호</th>
								<td class='swn_tbl_data'>02-3146-2290</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width=100% cellspacing=0 cellpadding=0>
							<tr><td height=10></td></tr>
							<tr>
								<td align=right><a href=# onclick="openWindow('${pageContext.request.contextPath}/page_html/p_office2-01-1-1.html','','width=600,height=500')"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif"></a></td>
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
								<td rowspan=2 width=10% class='swn_tbl_data'>32</td>
								<th width=12% class='swn_tbl_title'>지역배수지(개소)</th>
								<td width=10% class='swn_tbl_data'>2</td>
								<th width=12% class='swn_tbl_title'>가압장 수(개소)</th>
								<td width=10% class='swn_tbl_data'>5</td>
								<th width=12% rowspan=2 class='swn_tbl_title'>급수구역(구)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>종로구, 중구, 용산구,<br>성북구<br>(4개구)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>그 외 배수지(개소)</th>
								<td class='swn_tbl_data'>15</td>
								<th class='swn_tbl_title'>수도꼭지(개소)</th>
								<td class='swn_tbl_data'>10</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr><td height=10></td></tr>
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
								<td class='swn_tbl_data' rowspan=1>삼청(가)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>종로구 삼청동 28-49</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-2071</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>중부(수)</td>							
								<td class='swn_tbl_data' rowspan=1>뚝도</td>							
								<td class='swn_tbl_data' rowspan=1>2004년</td>							
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>							
								<td class='swn_tbl_data' rowspan=1>5</td>							
								<td class='swn_tbl_data' rowspan=1>중구 장충동 208-1</td>							
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>							
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>보광(배)</td>
								<td class='swn_tbl_data' rowspan=2>뚝도</td>
								<td class='swn_tbl_data' rowspan=2>2004년</td>
								<td class='swn_tbl_data'>(유출)TOA-DKK A4(일)</td>
								<td class='swn_tbl_data'>5</td>
								<td class='swn_tbl_data' rowspan=2>용산구 한남동 산10-212</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(유입)HACH(미)</td>
								<td class='swn_tbl_data'>1</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>보광(가)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>용산구 이태원1동 126-1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>남산(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>용산구 한남동 산8-72</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>성북1(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 동소문동1가 1</td>
								<td class='swn_tbl_data' rowspan=1>02-3171-0308</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>월곡대(배)</td>
								<td class='swn_tbl_data' rowspan=2>강북</td>
								<td class='swn_tbl_data' rowspan=2>2004년</td>
								<td class='swn_tbl_data'>(유출)TOA-DKK A4(일)</td>
								<td class='swn_tbl_data'>5</td>
								<td class='swn_tbl_data' rowspan=2>성북구 월곡동 산 2-1</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(유입)HACH(미)</td>
								<td class='swn_tbl_data'>1</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>월곡소(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 월곡동 산1-47</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>광화문광장</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4 (일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>종로구 세종로 광화문광장</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>종암1동(성북소방서)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 종암1동 3-72</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-2049</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>삼선2동(돈암119)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 삼선2동 349-1</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-2049</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>동숭동(사대부초)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>종로구 동숭동 199</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-2049</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>정동(시청)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>HACH(미)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>중구 서소문동 37</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-2049</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>성북2(가)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2002년</td>
								<td class='swn_tbl_data' rowspan=1>HACH(미)</td>
								<td class='swn_tbl_data' rowspan=1>1</td>
								<td class='swn_tbl_data' rowspan=1>성북구 종암동 산2-27</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>낙산(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>종로구 창신3동 23-319</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>경내(가)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>종로구 세종로 1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>무악(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>종로구 무악동 46-1910</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>서빙고초교</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>용산구 서빙고동 235</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>정릉2(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 정릉4동 산 1-1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>정릉3(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 정릉3동 산 1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>성북2저구(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 성북2동 226-234</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>혜명(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>종로구 명륜3가 산 2-13</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>도원(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>용산구 산천동 산 1-5</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>북악(가)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>북악가압장</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>이촌동(동아그린)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>용산구 이촌2동 411</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>한남(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>용산구 한남동 산 8-72</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>인수(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 길음2동 산 75-15</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>정릉4(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 정릉4동 산 1-1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>평창1(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>종로구 평창동 491-3</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>용산2가동(용암초교)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>용산구 녹사평로 60길 39</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>한강3가(한강초교)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>용산구 한강대로 14길 9</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>개운산(배)</td>
								<td class='swn_tbl_data' rowspan=1>강북</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성북구 돈암동 산 6-1</td>
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