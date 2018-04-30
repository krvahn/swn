<%@ page import="java.util.*" %>
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

List<Map<String, String>> items = null;
Iterator<Map<String, String>> it = null;
Map<String, String> item = null;
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
<!-- jQuery 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.js"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui-ko.js"></script>

<!-- Water Now 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/script.do"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
</script>
<style type="text/css">
	#sitemap_2th td {font-size:8pt; padding-left:23px;}
</style>
<body style="background:#FFFFFF;">
	<div id="content_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_stitle01.jpg">
		</td>
	</tr>
	</table>
	<table width=100% cellspacing=0 cellpadding=0 align=center>
  	<tr>
    	<td>	
			<table width=653 cellspacing=0 cellpadding=0>
			<tr>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>실시간 수질정보</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('1', '1', '', '', '${pageContext.request.contextPath}');"><b>ㆍ지도 요약화면</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('1', '2', '', '', '${pageContext.request.contextPath}');"><b>ㆍ종합 요약화면</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('1', '3', '', '', '${pageContext.request.contextPath}');"><b>ㆍ아리수 정수센터</b></a></td>
					</tr>
						<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('1', '3', '', '', '${pageContext.request.contextPath}');">전체 아리수정수센터</a></td>
							</tr>
<%
items = curPage.listPlantCode();		
if( items != null )
{
	it = items.iterator();
	while( it.hasNext() )
	{
		item = it.next();
		out.println("<tr>");
		out.println("<td height=17><a href=# onClick=\"menuSelectWithPath('1', '3', '" + String.valueOf(item.get("CODE")) + "', '', '" + curPage.getContextPath() + "');\">" + String.valueOf(item.get("NAME")) + " 아리수정수센터</a></td>");
		out.println("</tr>");
	}
}
%>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('1', '4', '<%=WebConst.SWQ_FIRST_WCODE%>', '', '${pageContext.request.contextPath}');"><b>ㆍ수도사업소</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
<%
items = curPage.listWaterCode();		
if( items != null )
{
	it = items.iterator();
	while( it.hasNext() )
	{
		item = it.next();
		out.println("<tr>");
		out.println("<td height=17><a href=# onClick=\"menuSelectWithPath('1', '4', '" + String.valueOf(item.get("CODE")) + "', '', '" + curPage.getContextPath() + "');\">" + String.valueOf(item.get("NAME")) + " 수도사업소</a></td>");
		out.println("</tr>");
	}
}
%>							
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					</table>
				</td>
				<td width=40 valign=top></td>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>수질 이력정보</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');"><b>ㆍ보고서</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');">측정지점별</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '1', '2', '', '${pageContext.request.contextPath}');">수계내 측정지점간</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('2', '2', '1', '', '${pageContext.request.contextPath}');"><b>트랜드</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '1', '', '${pageContext.request.contextPath}');">측정지점별</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '2', '', '${pageContext.request.contextPath}');">수계내 측정지점간</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '3', '', '${pageContext.request.contextPath}');">정수센터간</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '4', '', '${pageContext.request.contextPath}');">정수처리공정간</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '5', '', '${pageContext.request.contextPath}');">공급과정간</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('2', '3', '1', '', '${pageContext.request.contextPath}');"><b>ㆍ경보 이력</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '3', '1', '', '${pageContext.request.contextPath}');">아리수정수센터</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '3', '2', '', '${pageContext.request.contextPath}');">수도사업소</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					</table>
				</td>
				<td width=40 valign=top></td>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>정수센터 입력정보</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');"><b>ㆍ실험실 측정자료 조회</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>	
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');">정수센터 일일운영현황</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '1', '2', '', '${pageContext.request.contextPath}');">취정수 수질검사결과</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '1', '3', '', '${pageContext.request.contextPath}');">정수처리기준 운영결과</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('3', '2', '1', '', '${pageContext.request.contextPath}');"><b>ㆍ실험실 측정값 입력</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '2', '1', '', '${pageContext.request.contextPath}');">아리수정수센터</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '2', '2', '', '${pageContext.request.contextPath}');">상수도연구원</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('3', '3', '', '', '${pageContext.request.contextPath}');"><b>ㆍ실험실 측정항목 설정</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					</table>
				</td>
			</tr>
			<tr><td colspan=5 height=30></td></tr>
			<tr>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>게시판</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('4', '1', '', '', '${pageContext.request.contextPath}');"><b>ㆍ공지사항</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('4', '2', '', '', '${pageContext.request.contextPath}');"><b>ㆍ자유게시판</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('4', '3', '', '', '${pageContext.request.contextPath}');"><b>ㆍ연구자료</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					</table>
				</td>
				<td width=40 valign=top></td>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>자료실</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '1', '', '', '${pageContext.request.contextPath}');"><b>ㆍ수질감시시스템 운영</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '2', '', '', '${pageContext.request.contextPath}');"><b>ㆍ관련법 지침</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '3', '', '', '${pageContext.request.contextPath}');"><b>ㆍ수질통계</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '4', '', '', '${pageContext.request.contextPath}');"><b>ㆍ보유장비현황</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '5', '', '', '${pageContext.request.contextPath}');"><b>ㆍ수질관리</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '6', '1', '<%=WebConst.SWQ_FIRST_PCODE%>', '${pageContext.request.contextPath}');"><b>ㆍ상수도시설현황</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('5', '6', '1', '<%=WebConst.SWQ_FIRST_PCODE%>', '${pageContext.request.contextPath}');">아리수정수센터</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('5', '6', '2', '<%=WebConst.SWQ_FIRST_WCODE%>', '${pageContext.request.contextPath}');">수도사업소</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					</table>
				</td>
				<td width=40 valign=top></td>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>일일운영</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('6', '1', '', '', '${pageContext.request.contextPath}');"><b>ㆍ운영현황 입력</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('6', '2', '', '', '${pageContext.request.contextPath}');"><b>ㆍ결과 조회</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					</table>
				</td>
			</tr>
			<tr><td colspan=5 height=30></td></tr>
			<tr>
				<td width=191 valign=top>
				</td>
				<td colspan=4></td>
			</tr>
			<tr><td colspan=5 height=60></td></tr>
			</table>
		</td>
	</tr>
	</table>
	</div>
</body>
</html>
<%
// 해제
curPage = null;
%>