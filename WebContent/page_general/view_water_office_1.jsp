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
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor=white> 
	<tr>
		<td align="left" colspan="2" bgcolor=white>
			<img src="${pageContext.request.contextPath}/images/general/20081212_swn_stitle15.jpg">
		</td>
	</tr>
	<tr>
		<td width=30>&nbsp;</td>
		<td>
			<table width=100% cellspacing=0 cellpadding=0 align=center bgcolor=white>
			<tr>
				<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>시설정보</b></font></td>
			</tr>
			</table>
			<table width=100% cellspacing=0 cellpadding=0 align=center>
			<tr>
				<td bgcolor=#CFCFCF>
					<table width=100% cellspacing=1 cellpadding=0 class='swn_tbl01'>
					<tr>
						<th>사업소명</th>
						<td colspan=2><b>광암아리수정수센터</b></td>
						<th>시설년도</th>
						<td>1979년</td>
						<th>시설용량 (톤/일)</th>
						<td>400,000</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan=2>경기도 하남시 광암동 174</td>
						<th>전화번호</th>
						<td>02-3146-5345</td>
						<th>부지면적(평)</th>
						<td>61,365</td>
					</tr>
					<tr>
						<th rowspan=3>취수장</th>
						<th>취수장명</th>
						<th>위치</th>
						<th colspan=2>취수량(천톤/일)</th>
						<th colspan=2>워수사용계약량(천톤/일)</th>
					</tr>
					<tr>
						<td rowspan=2>-</td>
						<td rowspan=2>-</td>
						<th style="font-weight:normal;">팔당호</th>
						<th style="font-weight:normal;">한강표류수</th>
						<th style="font-weight:normal;">용수대금지불용량</th>
						<th style="font-weight:normal;">기득수리량</th>
					</tr>
					<tr>
						<td>400</td>
						<td>-</td>
						<td>220</td>
						<td>-</td>
					</tr>
					<tr>
						<th rowspan=9>시설현황</th>
						<th>구분</th>
						<th>지수 </th>
						<th colspan=2>규격(m)</th>
						<th>형식</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>착수정</td>
						<td>2</td>
						<td colspan=2>47 × 10.0 × 5.2</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>침사지</td>
						<td></td>
						<td colspan=2></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>혼화지</td>
						<td>6</td>
						<td colspan=2>4.25 × 4.25 × 4.25</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>응집지</td>
						<td></td>
						<td colspan=2></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>침전지</td>
						<td>6</td>
						<td colspan=2>41.4 × 41.0 × 4.5</td>
						<td>맥동식</td>
						<td></td>
					</tr>
					<tr>
						<td>여과지</td>
						<td>24</td>
						<td colspan=2>4.0 × 17.46 × 2</td>
						<td>자연평형형</td>
						<td></td>
					</tr>
					<tr>
						<td>정수지</td>
						<td>11</td>
						<td colspan=2>64.6 × 54.6 × 4.6</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>흡수정</td>
						<td></td>
						<td colspan=2></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=5>배출수<br>처리</th>
						<td>회수조</td>
						<td>2</td>
						<td colspan=2>9.0 × 18.0 × 6.6</td>
						<td></td>
						<td>확장</td>
					</tr>
					<tr>
						<td>배슬러지조</td>
						<td>4</td>
						<td colspan=2>3.4 × 3.4 × 3.2</td>
						<td></td>
						<td>증설</td>
					</tr>
					<tr>
						<td>1차농축조</td>
						<td>2</td>
						<td colspan=2>φ 40 × 3.4</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2차농축조</td>
						<td>2</td>
						<td colspan=2>φ 15 × 5.0 × 1지,<br>φ 20 × 5.0 × 1지</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>탈수기실</td>
						<td>1동</td>
						<td colspan=2>12 × 4.2 × 7.6</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=4>펌프현황</th>
						<th colspan=2>구분</th>
						<th colspan=2>공급계통</th>
						<th>관련배수지</th>
						<th>비고</th>
					</tr>
					<tr>
						<td rowspan=3>자연유하</td>
						<td rowspan=2>우면산계통</td>
						<td colspan=2> </td>
						<td> </td>
						<td></td>
					</tr>
					<tr>
						<td colspan=2> </td>
						<td> </td>
						<td></td>
					</tr>
					<tr>
						<td>청담계통</td>
						<td colspan=2>직송수계</td>
						<td>오금(배)</td>
						<td></td>
					</tr>
					</table>
				</td>
			</tr>
			</table>
			<br><br>
			<table width=100% cellspacing=0 cellpadding=0 align=center>
			<tr>
				<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>급수공급계통</b></font></td>
			</tr>
			</table>
			<table width=100% cellspacing=0 cellpadding=0 align=center>
			<tr>
				<td bgcolor=#CFCFCF>
					<table width=100% cellspacing=1 cellpadding=0 class="swn_tbl01">
					<tr>
						<th>공급방식</th>
						<td>자연유하식</td>
						<th>수계배수지</th>
						<td style="height:40px;">청담배수지,<br>우면산배수지</td>
						<th rowspan=2>급수구역</th>
						<td rowspan=2>송파(26), 강동(3),<br>(2개구 29개동)</td>
					</tr>
					<tr>
						<th>급수세대(세대)</th>
						<td>755,812</td>
						<th>급수인구(명)</th>
						<td>-</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height=10></td>
			</tr>
			<tr>
				<td align=right>
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-01-2.html','','width=600,height=500')">
					<img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif">
					</a>&nbsp;
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-01-1.html','','width=600,height=500')">
					<img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location02.gif">
					</a>
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