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
						<td colspan=3><b>영등포아리수정수센터</b></td>
						<th>시설년도</th>
						<td colspan=2>1971년</td>
						<th>시설용량 (톤/일)</th>
						<td>600,000</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan=3>영등포구 양화동 1</td>
						<th>전화번호</th>
						<td colspan=2>02-2632-9725</td>
						<th>부지면적(평)</th>
						<td>42,878</td>
					</tr>
					<tr>
						<th rowspan=3>취수장</th>
						<th>취수장명</th>
						<th colspan=2>위치</th>
						<th colspan=3>취수량(천톤/일)</th>
						<th colspan=2>워수사용계약량(천톤/일)</th>
					</tr>
					<tr>
						<td rowspan=2>풍납</td>
						<td rowspan=2 colspan=2>송파구 풍납동 417</td>
						<th style="font-weight:normal;">팔당호</th>
						<th colspan=2 style="font-weight:normal;">한강표류수</th>
						<th style="font-weight:normal;">용수대금지불용량</th>
						<th style="font-weight:normal;">기득수리량</th>
					</tr>
					<tr>
						<td>-</td>
						<td colspan=2>700</td>
						<td>238</td>
						<td>200</td>
					</tr>
					<tr>
						<th rowspan=7>시설현황</th>
						<th>구분</th>
						<th colspan=2>지수 </th>
						<th colspan=3>규격(m)</th>
						<th>형식</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>착수정</td>
						<td>#1<br>#2<br>#3</td>
						<td>4<br>2<br>2</td>
						<td colspan=3>5.0 × 30.5 × 3.5<br>5.0 × 30.5 × 3.5<br>5.3 × 12.8 × 5.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>혼화지</td>
						<td>#1<br>#2<br>#3</td>
						<td>4<br>2<br>3</td>
						<td colspan=3>9.0 × 3.3 × 3.4<br>9.0 × 3.3 × 3.4<br>5.4 × 5.5 × 5.0</td>
						<td>플래쉬믹서</td>
						<td></td>
					</tr>
					<tr>
						<td>응집지</td>
						<td>#1<br><br>#2<br>#3</td>
						<td>4<br>2<br>8</td>
						<td colspan=3>13.5 × 18.0 × 3.3<br>13.5 × 18.0 × 3.3<br>15.0	× 14.1 × 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>침전지</td>
						<td>#1<br>#2<br>#3</td>
						<td>4<br>2<br>8</td>
						<td colspan=3>16.0 × 59.0 × 4.5<br>16.0 × 59.0 × 4.5<br>17.3 × 67.0 × 5.0</td>
						<td>경사판<br>경사판<br>황류식</td>
						<td></td>
					</tr>
					<tr>
						<td>여과지</td>
						<td>#1<br>#2<br>#3</td>
						<td>12<br>6<br>16</td>
						<td colspan=3>8.7 × 11.2<br>8.7 × 11.2<br>17.3 × 8.0</td>
						<td>급속여과지<br>급속여과지<br>급속여과지</td>
						<td></td>
					</tr>
					<tr>
						<td>정수지</td>
						<td>#1<br><br>#2<br><br>#3</td>
						<td>3<br><br>3<br><br>2</td>
						<td colspan=3>24.0 × 32.0 × 3.2 × 2지<br>55.0 × 20.0 × 3.3 × 1지<br>36.0 × 16.0 × 3.4 × 2지<br>55.0 × 20.0 × 3.3 × 1지<br>46.4 × 51.6 × 4.95 × 1지<br>51.6 × 51.6 × 4.95 × 1지</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=5>배출수<br>처리</th>
						<td>회수조</td>
						<td colspan=2>3</td>
						<td colspan=3>16.0 × 23.3 × 4.5<br>8.0 × 27.0 × 2.9<br>21.0 × 8.0 × 4.4</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>배슬러지조</td>
						<td colspan=2>2</td>
						<td colspan=3>9.0 × 21.0 × 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>1차농축조</td>
						<td colspan=2>2</td>
						<td colspan=3>φ 16.0 × 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2차농축조</td>
						<td colspan=2>2</td>
						<td colspan=3>φ 27.5 × 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>탈수기실</td>
						<td colspan=2>1</td>
						<td colspan=3>10.5 × 30.0 × 13.5</td>
						<td>Belt Press</td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=6>펌프현황</th>
						<th colspan=3>구분</th>
						<th>규격(마력)</th>
						<th>수량(대)</th>
						<th>가동(대)</th>
						<th>공급계통</th>
						<th>비고</th>
					</tr>
					<tr>
						<td colspan=3>취수펌프</td>
						<td>1,300<br>700</td>
						<td>5<br>1</td>
						<td>2<br>1</td>
						<td>영등포취수</td>
						<td></td>
					</tr>
					<tr>
						<td rowspan=3>송수펌프</td>
						<td colspan=2>#1정수장</td>
						<td>1,000<br>700<br>400</td>
						<td>1<br>5<br>1</td>
						<td>1<br>2<br></td>
						<td>금천배수지</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=2>#2정수장</td>
						<td>1,050<br>550, 500<br>300</td>
						<td>1<br>1,2<br>1</td>
						<td><br>1<br>1</td>
						<td>우장산배수지</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=2>#3정수장</td>
						<td>1,200<br>600</td>
						<td>4<br>2</td>
						<td>2<br>1</td>
						<td>신정배수지<br>가양, 방화동 직송</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=3>공업용수</td>
						<td>600, 350, 200</td>
						<td>1, 2, 1</td>
						<td>1</td>
						<td>구로공단</td>
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
						<td style="height:40px;">금천배수지,<br>우장산배수지,<br>신정배수지</td>
						<th rowspan=2>급수구역</th>
						<td rowspan=2>양천구(16), 강서구(21), 금천구(!2),<br>구로구(15) (4개구 64개동)</td>
					</tr>
					<tr>
						<th>급수세대(세대)</th>
						<td>486,793</td>
						<th>급수인구(명)</th>
						<td>1,443,217</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height=10></td>
			</tr>
			<tr>
				<td align=right>
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-04-2.html','','width=600,height=500')">
					<img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif">
					</a>&nbsp;
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-04-1.html','','width=600,height=500')">
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