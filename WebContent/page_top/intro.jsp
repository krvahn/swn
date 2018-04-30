<%@ page import="kr.go.seoul.water.comm.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//-----------------------------------------------------------------------------------------------
// �� ������ ĳ�� ����
//-----------------------------------------------------------------------------------------------
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
if( request.getProtocol() != null && request.getProtocol().equals("HTTP/1.1") ) {
	response.setHeader("Cache-Control", "no-cache");
}

//-----------------------------------------------------------------------------------------------
//�ʱ�ȭ
//-----------------------------------------------------------------------------------------------
WebPage curPage = new WebPage(pageContext, request, response);

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
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
<!-- jQuery ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery.js"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/jquery-ui.min.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/jquery-ui-ko.js"></script>

<!-- Water Now ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/script.do"></script>

<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<!-- DataTabele ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
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
                      <td background="${pageContext.request.contextPath}/images/top/temp2_2.gif" class="con_title">�ý��� 
                        �Ұ�</td>
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
            <p>����� ������ �������ýý����� ��������� ���ߵ� �����ڷ����հ����ý�������<br>
			  ����� ����������� ����Ǿ� �ִ� ��� PC���� ������ ������ ��Ʈ��� ��� �����񽺸� ���մϴ�.<br><br>
              ����� ���� 6�� �Ƹ����������� ��������(�����/������/ħ����/������/�ۼ�) ��<br>
              11�� ��������� ���� ���ް���(�����/�����/������/����)���� �����Ǵ�<br>
              �¶��� ������������ ���� �̷� ���� �� ���� �м�, SMS ���� ����� ����Ͽ�,<br>
			  ��������� �� ��������������� ������������ �����Ǵ� ����� ���� �����͸�<br>
			  �Է� �� ��ȸ�� �� �ִ� ����� �����մϴ�.
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
              <b>�ý��� �ֿ� ���</b></p>
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
// ����
curPage = null;
%>