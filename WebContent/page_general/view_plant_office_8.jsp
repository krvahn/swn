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
								<td class='swn_tbl_data'><b>강동수도사업소</b></td>
								<th class='swn_tbl_title'>소재지</th>
								<td class='swn_tbl_data'>강동구 성내동 541-4</td>
								<th class='swn_tbl_title'>전화번호</th>
								<td class='swn_tbl_data'>02-3146-5290</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width=100% cellspacing=0 cellpadding=0>
							<tr><td height=10></td></tr>
							<tr>
								<td align=right><a href=# onclick="openWindow('${pageContext.request.contextPath}/page_html/p_office2-11-1-1.html','','width=600,height=500')"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif"></a></td>
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
							<td bgcolor=#CFCFCF>
							<table width=100% cellspacing=1 cellpadding=0>
							<tr>
								<th rowspan=2 width=12% class='swn_tbl_title'>전 체 개 소</th>
								<td rowspan=2 width=10% class='swn_tbl_data'>14</td>
								<th width=12% class='swn_tbl_title'>지역배수지(개소)</th>
								<td width=10% class='swn_tbl_data'>2</td>
								<th width=12% class='swn_tbl_title'>가압장 수(개소)</th>
								<td width=10% class='swn_tbl_data'>1</td>
								<th width=12% rowspan=2 class='swn_tbl_title'>급수구역(구)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>송파구, 강동구<br>(2개구 49개동)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>그 외 배수지(개소)</th>
								<td class='swn_tbl_data'></td>
								<th class='swn_tbl_title'>수도꼭지(개소)</th>
								<td class='swn_tbl_data'>11</td>
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
                                <td class='swn_tbl_data' rowspan=1>오금(배)</td>
                                <td class='swn_tbl_data' rowspan=1>광암</td>
                                <td class='swn_tbl_data' rowspan=1>2002년</td>
                                <td class='swn_tbl_data' rowspan=1>SENSORTECHNIK(독)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>송파구 오금동 51</td>
                                <td class='swn_tbl_data' rowspan=1>02-3146-3200</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=1>거마(가)</td>
                                <td class='swn_tbl_data' rowspan=1>광암</td>
                                <td class='swn_tbl_data' rowspan=1>2002년</td>
                                <td class='swn_tbl_data' rowspan=1>SENSORTECHNIK(독)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>송파구 마천동 36</td>
                                <td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=1>천호동(공)</td>
                                <td class='swn_tbl_data' rowspan=1>암사</td>
                                <td class='swn_tbl_data' rowspan=1>2004년</td>
                                <td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>강동구 천호동 360</td>
                                <td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=1>성내동(수도사업소)</td>
                                <td class='swn_tbl_data' rowspan=1>암사</td>
                                <td class='swn_tbl_data' rowspan=1>2004년</td>
                                <td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>강동구 성내동 541</td>
                                <td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=2>길동(배)</td>
                                <td class='swn_tbl_data' rowspan=2>구의</td>
                                <td class='swn_tbl_data' rowspan=2>2006년</td>
                                <td class='swn_tbl_data'>(유입)HACH(미)</td>
                                <td class='swn_tbl_data'>1</td>
                                <td class='swn_tbl_data' rowspan=2>강동구 성내동 541</td>
                                <td class='swn_tbl_data' rowspan=2>-</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data'>(유출)SENSORTECHNIK(독)</td>
                                <td class='swn_tbl_data'>5</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=1>마천동(송파소방서)</td>
                                <td class='swn_tbl_data' rowspan=1>광암</td>
                                <td class='swn_tbl_data' rowspan=1>2009년</td>
                                <td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>송파구 마천1동 306-11</td>
                                <td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>가락본동</td>
								<td class='swn_tbl_data' rowspan=1>광암</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>송파구 가락본동 37</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>장지동(송파파인)</td>
								<td class='swn_tbl_data' rowspan=1>광암</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>송파구 장지동 847</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>잠실동(잠실지구대)</td>
								<td class='swn_tbl_data' rowspan=1>광암</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>송파구 잠실동 19-5</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>삼전동(삼전지구대)</td>
								<td class='swn_tbl_data' rowspan=1>광암</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>송파구 삼전동 62-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>암사동(현대홈타운)</td>
								<td class='swn_tbl_data' rowspan=1>광암</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강동구 암사동 400</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>암사1동(명일초교)</td>
								<td class='swn_tbl_data' rowspan=1>광암</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강동구 암사동 418-18</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>고덕동(온조대왕체육관)</td>
								<td class='swn_tbl_data' rowspan=1>광암</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강동구 고덕동 296</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>강일동(주민센터)</td>
								<td class='swn_tbl_data' rowspan=1>광암</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강동구 강일동 678</td>
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