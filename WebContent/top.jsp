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
<!-- jQuery 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.js"></script>

<!-- Water Now 관련 CSS 및 자바스크립트 포함 -->
<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	var timer;
	
	$(document).ready( function() {
		timer = setInterval(function() {
			// 현재 날짜 및 시간 얻기
		    var toDay = new Date();        
		    var dateTime;
		    
		    dateTime = "현재시간 : ";
		    dateTime = dateTime + toDay.getFullYear() + "년 ";
		    dateTime = dateTime + (toDay.getMonth() < 9 ? "0" : "") + (toDay.getMonth() + 1) + "월 ";
		    dateTime = dateTime + (toDay.getDate() < 10 ? "0" : "") + toDay.getDate() + "일 ";
		    dateTime = dateTime + (toDay.getHours() < 10 ? "0" : "") + toDay.getHours() + ":";
		    dateTime = dateTime + (toDay.getMinutes() < 10 ? "0" : "") + toDay.getMinutes() + ":";
		    dateTime = dateTime + ((toDay.getSeconds() < 10) ? "0" : "") + toDay.getSeconds();
		    
		    $('#date_time_val').html(dateTime);	
		});
	});
	
	//-----------------------------------------------------------------------------------------------
	// 이벤트 처리
	//-----------------------------------------------------------------------------------------------
	function onMouseOverMenu(menuNum)
	{
		$("#sub_menu_0").css("display", "none");
		$("#sub_menu_1").css("display", "none");
		$("#sub_menu_2").css("display", "none");
		$("#sub_menu_3").css("display", "none");
		$("#sub_menu_4").css("display", "none");
		$("#sub_menu_5").css("display", "none");
		$("#sub_menu_6").css("display", "none");
		
		switch(menuNum)
		{
		case 0: $("#sub_menu_0").css("display", ""); break;
		case 1: $("#sub_menu_1").css("display", ""); break;
		case 2: $("#sub_menu_2").css("display", ""); break;
		case 3: $("#sub_menu_3").css("display", ""); break;
		case 4: $("#sub_menu_4").css("display", ""); break;
		case 5: $("#sub_menu_5").css("display", ""); break;
		case 6: $("#sub_menu_6").css("display", ""); break;
		}
	}
</script>
<body style="padding:0px; margin:0px;">
	<table width=100% height=100% cellspacing=0 cellpadding=0>
		<tr>
			<td width=100% style="padding-left:10px; padding-right:0px">
				<table width=100% height=100% cellspacing=0 cellpadding=0>
					<tr>
						<!-- 로고 출력 -->
						<td width=198 valign=top><a href="${pageContext.request.contextPath}/" target=_top><img src="${pageContext.request.contextPath}/images/20081212_swn_logo01.jpg" border=0></a></td>
						<!-- 메뉴 출력 -->
						<td valign=top>
							<table width=100% height=100% cellspacing=0 cellpadding=0>
								<!-- 단축 메뉴 -->
								<tr>
									<td height=31 align=right>
<%
if( curPage.isLogin() ) {
%>
										<a href="${pageContext.request.contextPath}/login.jsp?opcode=logout" target="_top">로그아웃</a>&nbsp;&nbsp;&nbsp;
<%
} else {
%>
										<a href="${pageContext.request.contextPath}/login.jsp" target="_top">로그인</a>&nbsp;&nbsp;&nbsp;
<%
}
%>
										<a href="#" onClick="menuSelectWithPath('0', '1', '', '', '${pageContext.request.contextPath}');">사이트맵</a>&nbsp;&nbsp;&nbsp;
										<a href="#" onClick="menuSelectWithPath('0', '2', '', '', '${pageContext.request.contextPath}');">시스템소개</a>&nbsp;&nbsp;&nbsp;
										<a href="#" onClick="menuSelectWithPath('99', '1', '1', '', '${pageContext.request.contextPath}');">시스템관리</a>&nbsp;&nbsp;&nbsp;
										<a href="#" onClick="menuSelectWithPath('0', '3', '', '', '${pageContext.request.contextPath}');">도움말</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>											
								</tr>
								<!-- 메뉴(최상위) -->
								<tr>
									<td height=34 background="${pageContext.request.contextPath}/images/menu/20081212_swn_menu_bg01.jpg">
										<table width=100% height=100% cellspacing=0 cellpadding=0>
											<tr>
												<!-- 1단계 메뉴 -->
												<td>
													<a href="#" onMouseOver="onMouseOverMenu(0);" onClick="menuSelectWithPath('1', '2', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu01.jpg" alt="홈"></a>
													<a href="#" onMouseOver="onMouseOverMenu(1);" onClick="menuSelectWithPath('1', '2', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu02.jpg" alt="실시간 수질 정보"></a>
													<a href="#" onMouseOver="onMouseOverMenu(2);" onClick="menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu03.jpg" alt="수질 이력 정보"></a>
													<a href="#" onMouseOver="onMouseOverMenu(3);" onClick="menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu04.jpg" alt="정수센터 입력 정보"></a>
													<a href="#" onMouseOver="onMouseOverMenu(4);" onClick="menuSelectWithPath('4', '1', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu05.jpg" alt="게시판"></a>
													<a href="#" onMouseOver="onMouseOverMenu(5);" onClick="menuSelectWithPath('5', '1', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu06.jpg" alt="자료실"></a>
													<a href="#" onMouseOver="onMouseOverMenu(6);" onClick="menuSelectWithPath('6', '1', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu07.jpg" alt="일일운영"></a>
												</td>
												<!-- 시계 표시 -->
												<td align=right style="padding-top:3px;"><span style="color:#CEB3C1; font-size:8pt; margin-right:16px" id="date_time_val">현재시간</span></td>
											</tr>
										</table>
									</td>
								</tr>
								<!-- 2단계 메뉴 -->
								<tr>
									<td height=29 background="${pageContext.request.contextPath}/images/menu/20081212_swn_menu_bg02.jpg">
										<table width=100% height=100% cellspacing=0 cellpadding=0>
											<tr>
												<!-- 1단계 메뉴 -->
												<td style="padding-top:4px;">
													<div id="sub_menu_0" style="display:none;"></div>
													<div id="sub_menu_1" style="display:none; padding-left:30px;">
														<a href="#" onClick="menuSelectWithPath('1', '1', '', '', '${pageContext.request.contextPath}');">지도요약화면</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('1', '2', '', '', '${pageContext.request.contextPath}');">종합요약화면</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('1', '3', '', '', '${pageContext.request.contextPath}');">아리수정수센터</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('1', '4', '<%=WebConst.SWQ_FIRST_WCODE%>', '', '${pageContext.request.contextPath}');">수도사업소</a>
													</div>
													<div id="sub_menu_2" style="display:none; padding-left:150px;">
														<a href="#" onClick="menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');">보고서</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('2', '2', '1', '', '${pageContext.request.contextPath}');">트랜드</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('2', '3', '1', '', '${pageContext.request.contextPath}');">경보이력</a>
													</div>
													<div id="sub_menu_3" style="display:none; padding-left:150px;">
														<a href="#" onClick="menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');">실험실 측정자료 조회</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('3', '2', '1', '', '${pageContext.request.contextPath}');">실험실 측정값 입력</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('3', '3', '', '', '${pageContext.request.contextPath}');">실험실 측정항목 설정</a>
													</div>
													<div id="sub_menu_4" style="display:none; padding-left:360px;">
														<a href="#" onClick="menuSelectWithPath('4', '1', '', '', '${pageContext.request.contextPath}');">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('4', '2', '', '', '${pageContext.request.contextPath}');">자유게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('4', '3', '', '', '${pageContext.request.contextPath}');">연구자료</a>
													</div>
													<div id="sub_menu_5" style="display:none; padding-left:100px;">
														<a href="#" onClick="menuSelectWithPath('5', '1', '', '', '${pageContext.request.contextPath}');">수질감시시스템운영</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '2', '', '', '${pageContext.request.contextPath}');">관련법지침</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '3', '', '', '${pageContext.request.contextPath}');">수질통계</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '4', '', '', '${pageContext.request.contextPath}');">보유장비현황</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '5', '', '', '${pageContext.request.contextPath}');">수질관리</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '6', '1', '<%=WebConst.SWQ_FIRST_PCODE%>', '${pageContext.request.contextPath}');">상수도시설현황</a>
													</div>
													<div id="sub_menu_6" style="display:none; padding-left:500px;">
														<a href="#" onClick="menuSelectWithPath('6', '1', '', '', '${pageContext.request.contextPath}');">운영현황입력</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('6', '2', '', '', '${pageContext.request.contextPath}');">결과조회</a>
													</div>
												</td>
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
	</table>
</body>
</html>
<%
// 해제
curPage = null;
%>