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

//-----------------------------------------------------------------------------------------------
// 파라미터 받기
//-----------------------------------------------------------------------------------------------
String paramTopCode = curPage.getParam("TOP_CODE", "");
String paramSubCode = curPage.getParam("SUB_CODE", "");
String paramSubItem = curPage.getParam("SUB_ITEM", "");
String paramSubContent = curPage.getParam("SUB_CONTENT", "");

//System.out.println(paramTopCode + ", " + paramSubCode + ", " + paramSubItem + ", " + paramSubContent);

if( paramTopCode.equals("") ) {
	paramTopCode = "1";
	paramSubCode = "2";
	paramSubItem = "";
	paramSubContent = "";
}

//System.out.println(paramTopCode + ", " + paramSubCode + ", " + paramSubItem + ", " + paramSubContent);

List<Map<String, String>> items = null;
Iterator<Map<String, String>> it = null;
Map<String, String> item = null;
String titleImageURL;

//타이틀 이미지 얻기
titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle01.jpg";
if( paramTopCode.equals("1") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle01.jpg";
} else if( paramTopCode.equals("2") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle02.jpg";
} else if( paramTopCode.equals("3") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle03.jpg";
} else if( paramTopCode.equals("4") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle04.jpg";
} else if( paramTopCode.equals("5") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle05.jpg";
} else if( paramTopCode.equals("6") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle07.jpg";	
} else if( paramTopCode.equals("99") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle06.jpg";
} 
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
</script>
<body style="padding:0px margin:0px;">
	<table width=100% height=100% cellspacing=0 cellpadding=0>
	<tr>
		<td valign=top style="padding-left:10px; padding-right:10px;" width=100%>
			<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td>
					<table width=100% cellspacing=0 cellpadding=0>
					<!-- 메뉴 타이틀 이미지 -->
					<tr>					
						<td><img src="<%=titleImageURL%>"></td>
					</tr>
					<!-- 서브 메뉴 리스트 -->
					<tr>					
						<td background="${pageContext.request.contextPath}/images/menu/20081212_swn_left_bg01.jpg" style="padding-left:15px; padding-right:15px;">
							<table width=158 cellspacing=0 cellpadding=0>
							<tr><td height=9></td></tr>
							<!-- 메뉴 표시 -->
<%
// 실시간 수질정보
if(paramTopCode.equals("1"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('1', '1', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>지도 요약화면</a></td></tr>");	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('1', '2', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>종합 요약화면</a></td></tr>");
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('1', '3', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>아리수 정수센터</a></td></tr>");
	if( paramSubCode.equals("3") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('1', '3', '', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("") ? "<font color=#3366FF>" : "") + "전체 아리수정수센터" + (paramSubItem.equals("") ? "</font>" : "") + "</a></td></tr>");
		items = curPage.listPlantCode();		
		if( items != null )
		{
			it = items.iterator();
			while( it.hasNext() )
			{
				item = it.next();
				out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('1', '3', '" + String.valueOf(item.get("CODE")) + "', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 아리수정수센터 " + (paramSubItem.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
			}
		}
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("4") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('1', '4', '" + WebConst.SWQ_FIRST_WCODE + "', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>수도사업소</a></td></tr>");
	if( paramSubCode.equals("4") )
	{
		items = curPage.listWaterCode();
		if( items != null )
		{
			it = items.iterator();
			while( it.hasNext() )
			{
				item = it.next();
				out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('1', '4', '" + String.valueOf(item.get("CODE")) + "', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 수도사업소 " + (paramSubItem.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
			}
		}
	}
}

//수질이력정보
if(paramTopCode.equals("2"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('2', '1', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>보고서</a></td></tr>");
	if( paramSubCode.equals("1") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '1', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "측정지점별" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '1', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "수계내 측정지점간" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelect('2', '2', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>트렌드</a></td></tr>");
	if( paramSubCode.equals("2") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "측정지점별" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "수계내 측정지점간" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '3', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "정수센터간" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '4', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("4") ? "<font color=#3366FF>" : "") + "정수처리공정간" + (paramSubItem.equals("4") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '5', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("5") ? "<font color=#3366FF>" : "") + "공급과정간" + (paramSubItem.equals("5") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('2', '3', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>경보이력</a></td></tr>");
	if( paramSubCode.equals("3") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '3', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "아리수정수센터" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '3', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "수도사업소" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
}

//정수센터 입력정보
if(paramTopCode.equals("3"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('3', '1', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>실험실 측정자료 조회</a></td></tr>");
	if( paramSubCode.equals("1") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '1', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "정수센터 일일운영현황" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '1', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "취정수 수질검사결과" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '1', '3', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "정수처리기준 운영결과" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('3', '2', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>실험실 측정값 입력</a></td></tr>");
	if( paramSubCode.equals("2") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '2', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "아리수정수센터" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '2', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "상수도연구원" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('3', '3', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>실험실 측정항목 설정</a></td></tr>");
	/*
	if( paramSubCode.equals("3") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelect('3', '3', '1', '');\">" + (paramSubItem1.equals("1") ? "<font color=#3366FF>" : "") + "아리수정수센터" + (paramSubItem1.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelect('3', '3', '2', '');\">" + (paramSubItem1.equals("2") ? "<font color=#3366FF>" : "") + "수도사업소" + (paramSubItem1.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	*/
}

//게시판
if(paramTopCode.equals("4"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('4', '1', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>공지사항</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('4', '2', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>자유게시판</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('4', '3', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>연구자료</a></td></tr>");
}

//자료실
if(paramTopCode.equals("5"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '1', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>수질감시시스템 운영</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '2', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>관련법지침</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '3', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>수질통계</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("4") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '4', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>보유장비현황</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("5") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '5', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>수질관리</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("6") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '6', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>상수도시설현황</a></td></tr>");
	
	if( paramSubCode.equals("6") )
	{	
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('5', '6', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "아리수정수센터" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");		
		if( paramSubItem.equals("1") )
		{
			items = curPage.listPlantCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('5', '6', '1', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 아리수정수센터 " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
		
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('5', '6', '2', '" + WebConst.SWQ_FIRST_WCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "수도사업소" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		if( paramSubItem.equals("2") )
		{		
			items = curPage.listWaterCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('5', '6', '2', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 수도사업소 " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
	}	
}

// 일일운영
if(paramTopCode.equals("6"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('6', '1', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>운영현황입력</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('6', '2', '', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>결과조회</a></td></tr>");
}

// 관리자
if(paramTopCode.equals("99"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '1', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>자료전송형황</a></td></tr>");
	if( paramSubCode.equals("1") )
	{	
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '1', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "종합요약" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '1', '2', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "아리수정수센터" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");		
		if( paramSubItem.equals("2") )
		{
			items = curPage.listPlantCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '1', '2', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 아리수정수센터 " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
		
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '1', '3', '" + WebConst.SWQ_FIRST_WCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "수도사업소" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
		if( paramSubItem.equals("3") )
		{		
			items = curPage.listWaterCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '1', '3', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 수도사업소 " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '2', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>사용자관리</a></td></tr>");
	if( paramSubCode.equals("2") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '2', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "사용자 그룹 관리" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '2', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "사용자 정보 관리" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '2', '3', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "사용자 담당자 정보" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '3', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>측정포인트관리</a></td></tr>");
	if( paramSubCode.equals("3") )
	{	
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '3', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "아리수정수센터" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");		
		if( paramSubItem.equals("1") )
		{
			items = curPage.listPlantCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '3', '1', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 아리수정수센터 " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
		
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '3', '2', '" + WebConst.SWQ_FIRST_WCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "수도사업소" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		if( paramSubItem.equals("2") )
		{		
			items = curPage.listWaterCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '3', '2', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 수도사업소 " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("4") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '4', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>측정항목관리</a></td></tr>");
	if( paramSubCode.equals("4") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '4', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "측정항목리스트" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '4', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "측정항목설정<br>&nbsp;(아리수정수센터)" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '4', '3', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "측정항목설정<br>&nbsp;(수도사업소)" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("5") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '5', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>상태정보관리</a></td></tr>");
	if( paramSubCode.equals("5") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '5', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "상태정보 소분류" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '5', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "상태정보 대분류" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("6") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '6', '1', '', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>기준치 초과 이력</a></td></tr>");
	if( paramSubCode.equals("6") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '6', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "아리수정수센터" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '6', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "수도사업소" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("7") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '7', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>SMS 전송 이력 조회</a></td></tr>");
	if( paramSubCode.equals("7") )
	{	
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '7', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "아리수정수센터" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");		
		if( paramSubItem.equals("1") )
		{
			items = curPage.listPlantCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '7', '1', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 아리수정수센터 " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
		
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '7', '2', '" + WebConst.SWQ_FIRST_WCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "수도사업소" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		if( paramSubItem.equals("2") )
		{		
			items = curPage.listWaterCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '7', '2', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " 수도사업소 " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("8") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '8', '', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\"><b>ㆍ</b>측정기관리</a></td></tr>");
}
%>							
							<!-- 외부 링크 URL -->
							<tr><td height=89></td></tr>							
							<tr><td align=center><a href="#" onClick="window.open('http://www.wamis.go.kr/WKD/MN_DAMMAIN.ASPX','popWinDam','scrollbars=yes,width=1024,height=768');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_banner01.jpg" border=0></a></td></tr>							
							</table>
						</td>
					</tr>
					<!-- 메뉴 하단 이미지 -->
					<tr>					
						<td><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_left_bottom01.jpg"></td>
					</tr>
					<!-- 하단 추가 메뉴 -->
					<tr><td height=10></td></tr>
					<tr>
						<td align=center><a href="#" onClick="menuSelect('4','3','','');"><img src="${pageContext.request.contextPath}/images/menu/brd_study.gif"></a></td>
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
item = null;
it = null;
items = null;
%>