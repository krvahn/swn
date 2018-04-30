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
								<td class='swn_tbl_data'><b>동부수도사업소</b></td>
								<th class='swn_tbl_title'>소재지</th>
								<td class='swn_tbl_data'>성동구 행당동 142-1</td>
								<th class='swn_tbl_title'>전화번호</th>
								<td class='swn_tbl_data'>02-3146-2890</td>
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
								<td rowspan=2 width=10% class='swn_tbl_data'>21</td>
								<th width=12% class='swn_tbl_title'>지역배수지(개소)</th>
								<td width=10% class='swn_tbl_data'>3</td>
								<th width=12% class='swn_tbl_title'>가압장 수(개소)</th>
								<td width=10% class='swn_tbl_data'></td>
								<th width=12% rowspan=2 class='swn_tbl_title'>급수구역(구)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>성동구, 광진구<br>중랑구,동대문구<br>(4개구)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>그 외 배수지(개소)</th>
								<td class='swn_tbl_data'>4</td>
								<th class='swn_tbl_title'>수도꼭지(개소)</th>
								<td class='swn_tbl_data'>15</td>
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
								<td class='swn_tbl_data' rowspan=1>동부(수)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2004년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성동구 행당동 142-1</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-2600</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>용마(배)</td>
								<td class='swn_tbl_data' rowspan=2>구의+강북</td>
								<td class='swn_tbl_data' rowspan=2>2004년</td>
								<td class='swn_tbl_data'>(유입)HACH(미)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>중랑구 면목동 산1-4</td>
								<td class='swn_tbl_data' rowspan=2>02-2878-0966</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(유출)TOA-DKK A4(일)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>아차산(배)</td>
								<td class='swn_tbl_data' rowspan=2>구의+암사</td>
								<td class='swn_tbl_data' rowspan=2>2004년</td>
								<td class='swn_tbl_data'>(유입)HACH(미)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>광진구 구의동 산 17-1</td>
								<td class='swn_tbl_data' rowspan=2>02-2877-2539</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(유출)TOA-DKK A4 (일)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>대현산(배)</td>
								<td class='swn_tbl_data' rowspan=2>뚝도</td>
								<td class='swn_tbl_data' rowspan=2>2004년</td>
								<td class='swn_tbl_data'>(유입)HACH(미)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>성동구 금호1가 1-72</td>
								<td class='swn_tbl_data' rowspan=2>02-2879-9873</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(유출)TOA-DKK A4(일)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>상수도(연)</td>
								<td class='swn_tbl_data' rowspan=1>구의+암사</td>
								<td class='swn_tbl_data' rowspan=1>2002년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>광진구 구의2동 130-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>성수2가1동(성수동)</td>
								<td class='swn_tbl_data' rowspan=1>구의+암사</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성동구 성수2가 333-134</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>신내동</td>
								<td class='swn_tbl_data' rowspan=1>구의</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>중랑구 신내동 644-2</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>용신동(시립동부병원)</td>
								<td class='swn_tbl_data' rowspan=1>구의</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동대문구 용두동 118-20</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>용마소(배)</td>
								<td class='swn_tbl_data' rowspan=1>구의</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>중랑구 면목동 산 1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>전농동(서울시립대)</td>
								<td class='swn_tbl_data' rowspan=1>구의+강북</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동대문구 전농동 90</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>장안동(동대문소방서)</td>
								<td class='swn_tbl_data' rowspan=1>구의</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동대문구 장안동 434</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>면목동(사가정공원)</td>
								<td class='swn_tbl_data' rowspan=1>구의</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>중랑구 면목동 산 50</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>망우동(중랑캠핑숲)</td>
								<td class='swn_tbl_data' rowspan=1>구의</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>중랑구 망우동 산 30-7</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>금호(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성동구 금호동 3가 산1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>응봉(배)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성동구 응봉동 산1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>아차산소(배)</td>
								<td class='swn_tbl_data' rowspan=1>구의+암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>광진구 구의동 산 38-4</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>중곡4동(중곡119)</td>
								<td class='swn_tbl_data' rowspan=1>구의+암사</td>
								<td class='swn_tbl_data' rowspan=1>2010년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>광진구 중곡4동 18-20</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>옥수동(옥정초교)</td>
								<td class='swn_tbl_data' rowspan=1>뚝도</td>
								<td class='swn_tbl_data' rowspan=1>2009년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>성동구 옥수2동 233-16</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>용두동(롯데캐슬피렌체)</td>
								<td class='swn_tbl_data' rowspan=1>구의+암사</td>
								<td class='swn_tbl_data' rowspan=1>2011년</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(일)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>동대문구 용두동 790</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>상봉1동(상봉초교)</td>
								<td class='swn_tbl_data' rowspan=1>구의+강북</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>중랑구 동이로 126길 11</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>묵2동(신묵초교)</td>
								<td class='swn_tbl_data' rowspan=1>구의+강북</td>
								<td class='swn_tbl_data' rowspan=1>2012년</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(독)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>중랑구 동일로 149-46</td>
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