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
						<td colspan=3><b>암사아리수정수센터</b></td>
						<th>시설년도</th>
						<td colspan=2>1986년</td>
						<th>시설용량 (톤/일)</th>
						<td>1,600,000</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan=3>강동구 암사3동 산 10</td>
						<th>전화번호</th>
						<td colspan=2>02-441-5610</td>
						<th>부지면적(평)</th>
						<td>71,940</td>
					</tr>
					<tr>
						<th rowspan=3>취수장</th>
						<th>취수장명</th>
						<th colspan=2>위치</th>
						<th colspan=3>취수량(천톤/일)</th>
						<th colspan=2>워수사용계약량(천톤/일)</th>
					</tr>
					<tr>
						<td rowspan=2>암사</td>
						<td rowspan=2 colspan=2>강동구 암사동 산 10</td>
						<th style="font-weight:normal;">팔당호</th>
						<th colspan=2 style="font-weight:normal;">한강표류수</th>
						<th style="font-weight:normal;">용수대금지불용량</th>
						<th style="font-weight:normal;">기득수리량</th>
					</tr>
					<tr>
						<td>-</td>
						<td colspan=2>1,706</td>
						<td>970</td>
						<td>236</td>
					</tr>
					<tr>
						<th rowspan=8>시설현황</th>
						<th>구분</th>
						<th colspan=2>지수 </th>
						<th colspan=3>규격(m)</th>
						<th>형식</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>착수정</td>
						<td>#1<br>#2</td>
						<td>4<br>2</td>
						<td colspan=3>6.0 × 16.0 × 5.5<br>5.0 × 9.0 × 4.7</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>혼화지</td>
						<td>#1<br>#2</td>
						<td>16<br>4</td>
						<td colspan=3>4.7 × 4.7 × 4.9<br>3.7 × 3.7 × 4.9</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>응집지</td>
						<td>#1<br>#2</td>
						<td>32<br>8</td>
						<td colspan=3>16.6 × 13.6 × 3.5<br>16.6 × 3.8 × 353 × 3단</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>침전지</td>
						<td>#1<br>#2</td>
						<td>32<br>8</td>
						<td colspan=3>19.6 × 63.7 × 4.8<br>19.5 × 66.7 × 4.6</td>
						<td>횡류식</td>
						<td></td>
					</tr>
					<tr>
						<td>여과지</td>
						<td>#1<br>#2</td>
						<td>64<br>16</td>
						<td colspan=3>9.45 × 16.75 × 2.0<br>4.8 × 17.4 × 1.2 × 2열</td>
						<td>자연평형형</td>
						<td></td>
					</tr>
					<tr>
						<td>정수지</td>
						<td>#1<br><br>#2</td>
						<td>4<br><br>2</td>
						<td colspan=3>64.6 × 53.8 × 5.9 × 2지<br>64.6 × 71.5 × 5.9 × 2지<br>49.1 × 34.5 × 5.3 × 2지</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>흡수정</td>
						<td>#1<br>#2</td>
						<td>2<br>1</td>
						<td colspan=3>9.7 × 44.6 × 5.35<br>5.9 × 53.4 × 8.5</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=5>배출수<br>처리</th>
						<td>회수조</td>
						<td>#1<br>#2</td>
						<td>2<br>2</td>
						<td colspan=3>7.8 × 24.0 × 4.0<br>5.5 × 16.5 × 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>배슬러지조</td>
						<td>#1<br>#2</td>
						<td>1<br>2</td>
						<td colspan=3>3.2 × 7.6 × 4.2<br>5.0 × 16.5 × 3.5</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>1차농축조</td>
						<td>#1<br>#2</td>
						<td>2<br>2</td>
						<td colspan=3>φ 11.6 × 4.0<br>φ 32.4 × 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2차농축조</td>
						<td>#1<br>#2</td>
						<td>2<br>2</td>
						<td colspan=3>φ 32.4 × 4.0φ<br>13.6 × 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>탈수기실</td>
						<td>#1<br>#2</td>
						<td>1<br>1</td>
						<td colspan=3>12.0 × 42.0 × 7.6<br>12.6 × 36.3 × 10.5</td>
						<td>Belt Press</td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=7>펌프현황</th>
						<th colspan=3>구분</th>
						<th>규격(마력)</th>
						<th>수량(대)</th>
						<th>가동(대)</th>
						<th>공급계통</th>
						<th>비고</th>
					</tr>
					<tr>
						<td colspan=2 rowspan=2>취수펌프</td>
						<td>#1</td>
						<td>1,900<br>1,200, 600</td>
						<td>4<br>6, 2</td>
						<td>2<br>2, 1</td>
						<td rowspan=2>암사취수</td>
						<td rowspan=2></td>
					</tr>
					<tr>
						<td>#2</td>
						<td>1,100<br>550, 576</td>
						<td>3<br>1, 1</td>
						<td>1<br>1, 0</td>
					</tr>
					<tr>
						<td rowspan=4>송수펌프</td>
						<td rowspan=3>#1정수장</td>
						<td>노량진</td>
						<td>자연유하</td>
						<td></td>
						<td></td>
						<td>노량진배수지<br>(상도, 대방배수지)</td>
						<td></td>
					</tr>
					<tr>
						<td>우면산</td>
						<td>800<br>576<br>400</td>
						<td>5<br>1<br>1</td>
						<td>1<br>1<br>1</td>
						<td>우면산(배)가압장<br>고양정 : 낙성대<br>저양정 : 서초, 양재</td>
						<td></td>
					</tr>
					<tr>
						<td>방배1</td>
						<td>1,300<br>650</td>
						<td>4<br>1</td>
						<td>1<br></td>
						<td>#2정수장 혼용 급수</td>
						<td></td>
					</tr>
					<tr>
						<td>#2정수장</td>
						<td>방배2</td>
						<td>1,400<br>700</td>
						<td>4<br>1</td>
						<td>2<br>1</td>
						<td>청담, 방배배수지</td>
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
						<td style="height:40px;">노량진 배수지,<br>우면산 배수지,<br>청담 배수지,<br>방배 배수지</td>
						<th rowspan=2>급수구역</th>
						<td rowspan=2>영등포구(22), 구로구(7), 동작구(20),<br>관악구(27), 서초구(18), 강남구(26), 강동구(17)<br>(7개구 137개동)</td>
					</tr>
					<tr>
						<th>급수세대(세대)</th>
						<td>983,748</td>
						<th>급수인구(명)</th>
						<td>2,745,362</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height=10></td>
			</tr>
			<tr>
				<td align=right>
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-05-2.html','','width=600,height=500')">
					<img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif">
					</a>&nbsp;
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-05-1.html','','width=600,height=500')">
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