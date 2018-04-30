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

<link type="text/css" href="${pageContext.request.contextPath}/import/jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui-ko.js"></script>

<!-- Water Now 관련 CSS 및 자바스크립트 포함 -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/script.do"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<!-- DataTabele 관련 CSS 및 자바스크립트 포함 -->
<link type="text/css" href="${pageContext.request.contextPath}/import/jquery.dataTables.none.css" rel="stylesheet" />
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.fnReloadAjax.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.dataTables.fnFakeRowColspan.js"></script>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
</script>
<body style="background:#FFFFFF;">
<table width="100%" border="0" cellspacing="0" cellpadding="40" height="100%">
  <tr align="center" valign="top"> 
    <td> 
      <table width="654" border="0" cellspacing="0" cellpadding="0" align="left">
        <tr> 
          <td height="10" colspan="4">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="4"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" background="${pageContext.request.contextPath}/images/top/temp2_4.gif">
              <tr> 
                <td> 
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="22"><img src="${pageContext.request.contextPath}/images/top/temp2_1.gif" width="27" height="30"></td>
                      <td background="${pageContext.request.contextPath}/images/top/temp2_2.gif" class="con_title">시스템 
                        소개</td>
                      <td colspan="2"><img src="${pageContext.request.contextPath}/images/top/temp2_3.gif" width="27" height="30"></td>
                    </tr>
                  </table>
                </td>
                <td width="220"><img src="${pageContext.request.contextPath}/images/top/temp2_5.gif" width="220" height="30"></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="4" height="113">
            <p><b><img src="${pageContext.request.contextPath}/images/top/bullet_01.gif" width="20" height="16"> Seoul 
              Water-Now (Web)</b></p>
            <p>서울시 수돗물 수질감시시스템의 웹기반으로 개발된 수질자료통합관리시스템으로<br>
			  서울시 행정전산망에 연결되어 있는 모든 PC에서 접속이 가능한 인트라넷 기반 웹서비스를 말합니다.<br><br>
              서울시 관할 6개 아리수정수센터 정수공정(취수장/착수정/침전지/여과지/송수) 및<br>
              11개 수도사업소 관할 공급과정(사업소/배수지/가압장/공원)에서 측정되는<br>
              온라인 수질데이터의 통합 이력 관리 및 추이 분석, SMS 전송 기능을 비롯하여,<br>
			  정수사업소 및 상수도연구원에서 오프라인으로 측정되는 실험실 측정 데이터를<br>
			  입력 및 조회할 수 있는 기능을 제공합니다.
            </p>
          </td>
        </tr>
        <tr> 
          <td colspan="4" height="341"> 
            <div align="center"><img src="${pageContext.request.contextPath}/images/top/system_intro.jpg" width="558" height="297" align="left"></div>
          </td>
        </tr>
        <tr> 
          <td colspan="4" height="56"> 
            <p><b><img src="${pageContext.request.contextPath}/images/top/bullet_01.gif" width="20" height="16"></b> 
              <b>시스템 주요 기능</b></p>
          </td>
        </tr>
        <tr> 
          <td width="30">&nbsp;</td>
          <td width="170"><b><img src="${pageContext.request.contextPath}/images/top/new_sitemap01.gif" width="170" height="36"></b></td>
          <td width="170"><b><img src="${pageContext.request.contextPath}/images/top/new_sitemap02.gif" width="184" height="36"></b></td>
          <td width="300"><b><img src="${pageContext.request.contextPath}/images/top/new_sitemap03.gif" width="160" height="36"></b></td>
        </tr>
        <tr> 
          <td width="30">&nbsp;</td>
          <td width="170"><b><img src="${pageContext.request.contextPath}/images/top/new_sitemap04.gif" width="160" height="38"></b></td>
          <td width="170"><b><img src="${pageContext.request.contextPath}/images/top/new_sitemap05.gif" width="170" height="38"></b></td>
          <td width="300"><b></b></td>
        </tr>
        <tr align="center"> 
          <td colspan="4">&nbsp;</td>
        </tr>
      </table>
      <br>
    </td>
  </tr>
</table>
</body>
</html>
<%
// 해제
curPage = null;
%>