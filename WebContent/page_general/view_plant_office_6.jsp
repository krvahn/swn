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

<!-- Water Now ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
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
							<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>�ü�����</b></font></td>
					</tr>					
					</table>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
							<td bgcolor=#CFCFCF>
							<table width=100% cellspacing=1 cellpadding=0>
							<tr>
								<th class='swn_tbl_title'>����Ҹ�</th>
									<td class='swn_tbl_data'><b>���μ��������</b></td>
								<th class='swn_tbl_title'>������</th>
									<td class='swn_tbl_data'>���۱� �Ŵ�浿 470-11</td>
								<th class='swn_tbl_title'>��ȭ��ȣ</th>
									<td class='swn_tbl_data'>02-3146-4690</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
							<td>
							<table width=100% cellspacing=0 cellpadding=0>
							<tr>	<td height=10></td></tr>
							<tr>
									<td align=right><a href=# onclick="openWindow('${pageContext.request.contextPath}/page_html/p_office2-09-1-1.html','','width=600,height=500')"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif"></a></td>
							</tr>
							<tr>	<td height=10></td></tr>
							</table>
						</td>
					</tr>
					</table>					
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
							<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>���� ���ް��� ���� �� �޼����� ����</b></font></td>
					</tr>
					</table>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
						<td bgcolor=#CFCFCF>
							<table width=100% cellspacing=1 cellpadding=0>
							<tr>
								<th rowspan=2 width=12% class='swn_tbl_title'>�� ü �� ��</th>
								<td rowspan=2 width=10% class='swn_tbl_data'>33</td>
								<th width=12% class='swn_tbl_title'>���������(����)</th>
								<td width=10% class='swn_tbl_data'>5</td>
								<th width=12% class='swn_tbl_title'>������ ��(����)</th>
								<td width=10% class='swn_tbl_data'>1</td>
								<th width=12% rowspan=2 class='swn_tbl_title'>�޼�����(��)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>���۱�, ���Ʊ�<br>��������,��õ��<br>(4����)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>�� �� �����(����)</th>
								<td class='swn_tbl_data'>15</td>
								<th class='swn_tbl_title'>��������(����)</th>
								<td class='swn_tbl_data'>12</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>	<td height=10></td></tr>
					</table>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
							<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>���ް��� ������ ��ġ ����</b></font></td>
					</tr>
					</table>                    
                    <table width=100% cellspacing=0 cellpadding=0 align=center>
                    <tr>
						<td bgcolor=#CFCFCF>
							<table width=100% cellspacing=1 cellpadding=0>
							<tr>
								<td width=20% class='swn_tbl_title'>������</td>
								<td width=10% class='swn_tbl_title'>���޼���</td>
								<td width=10% class='swn_tbl_title'>��ġ�⵵</td>
								<td width=20% class='swn_tbl_title'>������ ���ۻ�</td>
								<td width=5%  class='swn_tbl_title'>�����׸��</td>
								<td width=25% class='swn_tbl_title'>������</td>
								<td width=10% class='swn_tbl_title'>��ȭ��ȣ</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>�뷮��(��)</td>
								<td class='swn_tbl_data' rowspan=2>�ϻ�</td>
								<td class='swn_tbl_data'>2004��</td>
								<td class='swn_tbl_data'>(����)HACH(��)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>���۱� ���� 258-1</td>
								<td class='swn_tbl_data' rowspan=2>02-3146-2071</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>2006��</td>
								<td class='swn_tbl_data'>(����)TOA-DKK A4(��)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>������(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� ��õ7�� ��53-1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���۱� ��浿 15-45</td>
								<td class='swn_tbl_data' rowspan=1>02-2586-4424</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���۱� �Ŵ�浿 470-11</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>��(��)</td>
								<td class='swn_tbl_data' rowspan=2>�ϻ�</td>
								<td class='swn_tbl_data'>2010��</td>
								<td class='swn_tbl_data'>(����)HACH(��)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>���۱� ���� 258-1</td>
								<td class='swn_tbl_data' rowspan=2>02-3146-2071</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>2011��</td>
								<td class='swn_tbl_data'>(����)TOA-DKK B4(��)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�Ÿ�6(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� �Ÿ��� �� 89-4</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>������(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>�������� �������� 582-3</td>
								<td class='swn_tbl_data' rowspan=1>02-3171-0308</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>��õ�� ����3�� ��10-2</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>������</td>
								<td class='swn_tbl_data' rowspan=1>2002��</td>
								<td class='swn_tbl_data' rowspan=1>SENSORTECHNIK(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>��õ�� ����4�� 3-65</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>��õ(��)</td>
								<td class='swn_tbl_data' rowspan=2>������</td>
								<td class='swn_tbl_data' rowspan=2>2001��</td>
								<td class='swn_tbl_data'>(����)HACH(��)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>��õ�� ���굿 ��118-4</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(����)TOA-DKK A4(��)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>������</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� �Ÿ�12�� ��117-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���5��</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���۱� ���5��</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>��õ��(��ġ��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� ��õ6�� �� 66-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����4��(����119)</td>
								<td class='swn_tbl_data' rowspan=1>������</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>��õ�� ����4�� 1030</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>��������7��(�泲�Ƴʽ���)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>�������� �������� 7�� 46-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�屺��(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� ��õ�� �� 151-15</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���ﵿ(����119)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>��õ�� ���ﵿ 909-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�Ŵ��1��(���ۻ󶼺�)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���۱� �Ŵ��1�� 719</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�Ŵ��2��(�����)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���۱� �Ŵ��2�� 711</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>��3(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���۱� ��3�� �� 75-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� ��õ�� 1712-4</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>��õ6-2(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���۱� ���4�� �� 32-85</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>��õ11(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� ��õ�� �� 3-6</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�Ÿ�2-1(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� �Ÿ�10�� 328</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� ������ �� 57-18</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���3(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���۱� ���3�� 22-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���4(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���۱� ���4�� �� 45-6</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>��õ11��(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� ��õ11�� 17-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�Ÿ�2(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� �Ÿ�2�� �� 1-254</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�Ÿ�9(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� �Ÿ�9�� �� 68-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�Ÿ�9��(��������)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� �Ÿ�9�� �� 63-1</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����5��(����ʱ�)</td>
								<td class='swn_tbl_data' rowspan=1>������</td>
								<td class='swn_tbl_data' rowspan=1>2012��</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>��õ�� ������ 38�� 78</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>û�浿 (û���ʱ�)</td>
								<td class='swn_tbl_data' rowspan=1>�ϻ�</td>
								<td class='swn_tbl_data' rowspan=1>2012��</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���Ǳ� û�浿 �޳����� 22</td>
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
// ����
curPage = null;
%>