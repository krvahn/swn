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
					
					<table width=100% cellspacing=1 cellpadding=0 class="swn_tbl01">
					<tr>
						<th>사업소명</th>
						<td colspan=3><b>구의아리수정수센터</b></td>
						<th>시설년도</th>
						<td colspan=2>1936년</td>
						<th>시설용량 (톤/일)</th>
						<td>250,000</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan=3>광진구 광나루로 571</td>
						<th>전화번호</th>
						<td colspan=2>02-3146-5400</td>
						<th>부지면적(평)</th>
						<td>82,349</td>
					</tr>
					<tr>
						<th rowspan=3>취수장</th>
						<th>취수장명</th>
						<th colspan=2>위치</th>
						<th colspan=3>취수량(천톤/일)</th>
						<th colspan=2>워수사용계약량(천톤/일)</th>
					</tr>
					<tr>
						<td rowspan=2>구의</td>
						<td rowspan=2 colspan=2>광진구 광장동 산 18-2</td>
						<th style="font-weight:normal;">팔당호</th>
						<th colspan=2 style="font-weight:normal;">한강표류수</th>
						<th style="font-weight:normal;">용수대금지불용량</th>
						<th style="font-weight:normal;">기득수리량</th>
					</tr>
					<tr>
						<td>-</td>
						<td colspan=2>1,260</td>
						<td>-</td>
						<td>960</td>
					</tr>
					<tr>
						<th rowspan=9>시설현황</th>
						<th>구분</th>
						<th colspan=2>지수 </th>
						<th colspan=3>규격(m)</th>
						<th>형식</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>착수정</td>
						<td></td>
						<td></td>
						<td colspan=3></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>침사지</td>
						<td>제1정수장</td>
						<td>2</td>
						<td colspan=3>45.0 × 10.0 × 5.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>혼화지</td>
						<td>제1정수장</td>
						<td>4</td>
						<td colspan=3>4.8 × 4.8 × 3.3</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>응집지</td>
						<td>제1정수장</td>
						<td>6</td>
						<td colspan=3>17.0 × 13.0 × 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>침전지</td>
						<td>제1정수장</td>
						<td>6</td>
						<td colspan=3>18.5 × 71.7 × 5.0</td>
						<td>횡류식</td>
						<td></td>
					</tr>
					<tr>
						<td>여과지</td>
						<td>제1정수장</td>
						<td>40<br>12</td>
						<td colspan=3>14.0 × 9.4 </td>
						<td>자연평형형</td>
						<td></td>
					</tr>
					<tr>
						<td>정수지</td>
						<td>제1정수장</td>
						<td>2</td>
						<td colspan=3>50.0 × 40.0 × 5.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>흡수정</td>
						<td>제1정수장</td>
						<td>12</td>
						<td colspan=3>36.0 × 4.2</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=4>배출수<br>처리</th>
						<td>회수조</td>
						<td>제1정수장</td>
						<td>2</td>
						<td colspan=3>11.5 × 21.7 × 2.9<br>10.0 × 21.7 × 2.9</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>1차농축조</td>
						<td colspan=2>6</td>
						<td colspan=3>φ 31 × 4 × 2지<br>36.9 × 12 × 3.8 × 2지</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2차농축조</td>
						<td colspan=2>2</td>
						<td colspan=3>φ 38 × 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>탈수기실</td>
						<td colspan=2>1</td>
						<td colspan=3>24.0 × 36.0 × 3층</td>
						<td>Belt Press</td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=4>펌프현황</th>
						<th colspan=3>구분</th>
						<th>규격(마력)</th>
						<th>수량(대)</th>
						<th>가동(대)</th>
						<th>공급계통</th>
						<th>비고</th>
					</tr>
					<tr>
						<td colspan=3>취수펌프</td>
						<td>800<br>550<br>650,350<br>750,400</td>
						<td>7<br>2<br>1<br>4</td>
						<td>0<br>0<br>0<br>2,1</td>
						<td>제2정수장(가동중지)<br><br><br>제1정수장</td>
						<td></td>
					</tr>
					<tr>
						<td rowspan=2>송수펌프</td>
						<td colspan=2>제1정수장</td>
						<td>800<br>950<br>500</td>
						<td>3<br>2<br>1</td>
						<td>0<br>2<br>1</td>
						<td>용마배수지<br>아차산배수지</td>
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
						<td>강제채수식</td>
						<th>수계배수지</th>
						<td style="height:40px;">용마배수지,<br>아차산배수지,<br></td>
						<th rowspan=2>급수구역</th>
						<td rowspan=2>종로구(1), 성동구(6), 중랑구(20),<br>동대문구(24), 광진구(16), 성북구(9), 강북구(8),<br>도봉구(8), 노원구(4),<br>(9개구 96개동)</td>
					</tr>
					<tr>
						<th>급수세대(세대)</th>
						<td>752,788</td>
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
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-02-2.html','','width=600,height=500')">
					<img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif">
					</a>&nbsp;
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-02-1.html','','width=600,height=500')">
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