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
								<td class='swn_tbl_data'>���빮�� ȫ��2�� 38-69</td>
								<th class='swn_tbl_title'>��ȭ��ȣ</th>
								<td class='swn_tbl_data'>02-3146-3790</td>
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
						<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>���� ���ް��� ���� �� �޼����� ����</b></font></td>
					</tr>
					</table>
					<table width=100% cellspacing=0 cellpadding=0 align=center>
					<tr>
						<td bgcolor=#CFCFCF>
							<table width=100% cellspacing=1 cellpadding=0>
							<tr>
								<th rowspan=2 width=12% class='swn_tbl_title'>�� ü �� ��</th>
								<td rowspan=2 width=10% class='swn_tbl_data'>30</td>
								<th width=12% class='swn_tbl_title'>���������(����)</th>
								<td width=10% class='swn_tbl_data'>5</td>
								<th width=12% class='swn_tbl_title'>������ ��(����)</th>
								<td width=10% class='swn_tbl_data'>2</td>
								<th width=12% rowspan=2 class='swn_tbl_title'>�޼�����(��)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>����, ���빮��, ������<br>(3����)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>�� �� �����(����)</th>
								<td class='swn_tbl_data'>13</td>
								<th class='swn_tbl_title'>��������(����)</th>
								<td class='swn_tbl_data'>10</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr><Td height=10></td></tr>
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
								<td class='swn_tbl_data' rowspan=2>����(��)</td>
								<td class='swn_tbl_data' rowspan=2>������</td>
								<td class='swn_tbl_data' rowspan=2>2009��</td>
								<td class='swn_tbl_data'>(����) HACH(��)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>���� ���굿 �� 18-6</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(����)TOA-DKK A4(��)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�Ͼ�(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>(����)TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ȫ��3�� ��1-100</td>
								<td class='swn_tbl_data' rowspan=1>02-394-5780</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ������ 101-2</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���ڰ�(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���� �ұ��� 11-26</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�ұ�(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2003��</td>
								<td class='swn_tbl_data' rowspan=1>SENSORTECHNIK(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���� ����� ��1-13</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���� ������ ��12-6</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ȫ��3�� ��26-133</td>
								<td class='swn_tbl_data' rowspan=1>02-379-2868</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ������ 85-6</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>�߱� ������2�� 199</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>�Ϳ��(��)</td>
								<td class='swn_tbl_data' rowspan=2>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=2>2001��</td>
								<td class='swn_tbl_data'>(����) HACH(��)<BR>NANOCHEM9200(��)</td>
								<td class='swn_tbl_data'>2</td>
								<td class='swn_tbl_data' rowspan=2>������ â���� ��1-73</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(����)TOA-DKK A4(��)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���ϵ�(�ҳ�����)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���� ���ϵ� 42-1</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>ȫ��1��(���׿�)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ȫ��1�� 356-13</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���굿(�����Ű���)</td>
								<td class='swn_tbl_data' rowspan=1>������</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ���굿 390-1</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�ż���</td>
								<td class='swn_tbl_data' rowspan=1>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ �ż��� 100-5</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>ȫ��2��(���μ���)</td>
								<td class='swn_tbl_data' rowspan=1>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ȫ��2�� 38-69</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>������(�ֿ����Ʈ)</td>
								<td class='swn_tbl_data' rowspan=1>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ������ 253(�ֿ�APT)</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>HACH(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���� ������</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3568</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ���굿 �� 2-2</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>ȫ��(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ȫ���� �� 1-551</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>ȫ��(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ȫ��3�� �� 1-100</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>������(���繫��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���� ������ 78</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ���� �� 113-10</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ȫ���� �� 26-170</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>������2��(�������Ʈ)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� �����µ� 376</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>������</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���� ������ �� 30-4</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�ɾ�(��)</td>
								<td class='swn_tbl_data' rowspan=1>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ���̵� �� 2-206</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����2��(�渶����̰���)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���� ����2�� 474-1</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���Ϲ�(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ȫ��2�� 8</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>ȫ��3(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���빮�� ȫ��3�� �� 11-63</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>������(�����ʱ�)</td>
								<td class='swn_tbl_data' rowspan=1>�ҵ�</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ������ 256-4</td>
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
// ����
curPage = null;
%>