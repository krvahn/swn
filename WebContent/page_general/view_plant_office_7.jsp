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
									<td class='swn_tbl_data'><b>강남수도사업소</b></td>
								<th class='swn_tbl_title'>소재지</th>
									<td class='swn_tbl_data'>강남구 도곡2동 459-4 </td>
								<th class='swn_tbl_title'>전화번호</th>
									<td class='swn_tbl_data'>02-3146-4990</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
							<td>
							<table width=100% cellspacing=0 cellpadding=0>
							<tr>	<td height=10></td></tr>
							<tr>
									<td align=right><a href=# onclick="openWindow('${pageContext.request.contextPath}/page_html/p_office2-10-1-1.html','','width=600,height=500')"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif"></a></td>
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
								<td rowspan=2 width=10% class='swn_tbl_data'>18</td>
								<th width=12% class='swn_tbl_title'>지역배수지(개소)</th>
								<td width=10% class='swn_tbl_data'>3</td>
								<th width=12% class='swn_tbl_title'>가압장 수(개소)</th>
								<td width=10% class='swn_tbl_data'>2</td>
								<th width=12% rowspan=2 class='swn_tbl_title'>급수구역(구)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>서초구,강남구<br>(2개구,47개동)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>그 외 배수지(개소)</th>
								<td class='swn_tbl_data'>3</td>
								<th class='swn_tbl_title'>수도꼭지(개소)</th>
								<td class='swn_tbl_data'>10</td>
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
								<td class='swn_tbl_data' rowspan=1>서초(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서초구 서초동 393-1</td>
								<td class='swn_tbl_data' rowspan=1>02-304-1343</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>방배(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서초구 방배동 산95</td>
								<td class='swn_tbl_data' rowspan=1>02-394-5780</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>일원(가)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강남구 일원동 731-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>우면산(배)</td>
								<td class='swn_tbl_data' rowspan=2>암사</td>
								<td class='swn_tbl_data' rowspan=2>2002년</td>
								<td class='swn_tbl_data'>(유입)HACH, WATER-ZON(미)</td>
								<td class='swn_tbl_data'>2</td>
								<td class='swn_tbl_data' rowspan=2>서초구 서초동 278-6</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(유출)SENSORTECHNIK(독)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>청담(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2002년</td>
								<td class='swn_tbl_data' rowspan=1>SENSORTECHNIK(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강남구 삼성동 82</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>반포(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서초구 반포동 산93</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>도곡2동(수도사업소)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강남구 도곡동 459-4</td>
								<td class='swn_tbl_data' rowspan=1>02-379-2868</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>일원동(탄천재생센터)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강남구 일원동</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>양재동(매헌초교)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서초구 양재동</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>세곡동(은곡어린이공원)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강남구 세곡동 369-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>반포1동(반포자이)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서초구 반포1동 20-1(반포자이)</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>내곡(배)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서초구 내곡동 산 2-410</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>도곡동 (경남아너스빌)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강남구 도곡동 967</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>내곡동(내곡가압장내)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서초구 내곡동 산 12-750</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>우면동(품질시험소)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>서초구 우면동 15</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>논현동 (논현초교)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>강남구 강남대로 120길 33</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>내곡(가)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>HACH(미)</td>
								<td class='swn_tbl_data' rowspan=1>1</td>
								<td class='swn_tbl_data' rowspan=1>서초구 내곡동 산 12-750</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>서울대공원)</td>
								<td class='swn_tbl_data' rowspan=1>암사</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK (일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>경기도 과천시 광명길 42</td>
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