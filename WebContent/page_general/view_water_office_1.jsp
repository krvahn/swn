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
				<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>�ü�����</b></font></td>
			</tr>
			</table>
			<table width=100% cellspacing=0 cellpadding=0 align=center>
			<tr>
				<td bgcolor=#CFCFCF>
					<table width=100% cellspacing=1 cellpadding=0 class='swn_tbl01'>
					<tr>
						<th>����Ҹ�</th>
						<td colspan=2><b>���ϾƸ�����������</b></td>
						<th>�ü��⵵</th>
						<td>1979��</td>
						<th>�ü��뷮 (��/��)</th>
						<td>400,000</td>
					</tr>
					<tr>
						<th>�ּ�</th>
						<td colspan=2>��⵵ �ϳ��� ���ϵ� 174</td>
						<th>��ȭ��ȣ</th>
						<td>02-3146-5345</td>
						<th>��������(��)</th>
						<td>61,365</td>
					</tr>
					<tr>
						<th rowspan=3>�����</th>
						<th>������</th>
						<th>��ġ</th>
						<th colspan=2>�����(õ��/��)</th>
						<th colspan=2>��������෮(õ��/��)</th>
					</tr>
					<tr>
						<td rowspan=2>-</td>
						<td rowspan=2>-</td>
						<th style="font-weight:normal;">�ȴ�ȣ</th>
						<th style="font-weight:normal;">�Ѱ�ǥ����</th>
						<th style="font-weight:normal;">���������ҿ뷮</th>
						<th style="font-weight:normal;">��������</th>
					</tr>
					<tr>
						<td>400</td>
						<td>-</td>
						<td>220</td>
						<td>-</td>
					</tr>
					<tr>
						<th rowspan=9>�ü���Ȳ</th>
						<th>����</th>
						<th>���� </th>
						<th colspan=2>�԰�(m)</th>
						<th>����</th>
						<th>���</th>
					</tr>
					<tr>
						<td>������</td>
						<td>2</td>
						<td colspan=2>47 �� 10.0 �� 5.2</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ħ����</td>
						<td></td>
						<td colspan=2></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ȥȭ��</td>
						<td>6</td>
						<td colspan=2>4.25 �� 4.25 �� 4.25</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td></td>
						<td colspan=2></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ħ����</td>
						<td>6</td>
						<td colspan=2>41.4 �� 41.0 �� 4.5</td>
						<td>�Ƶ���</td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>24</td>
						<td colspan=2>4.0 �� 17.46 �� 2</td>
						<td>�ڿ�������</td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>11</td>
						<td colspan=2>64.6 �� 54.6 �� 4.6</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>�����</td>
						<td></td>
						<td colspan=2></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=5>�����<br>ó��</th>
						<td>ȸ����</td>
						<td>2</td>
						<td colspan=2>9.0 �� 18.0 �� 6.6</td>
						<td></td>
						<td>Ȯ��</td>
					</tr>
					<tr>
						<td>�载������</td>
						<td>4</td>
						<td colspan=2>3.4 �� 3.4 �� 3.2</td>
						<td></td>
						<td>����</td>
					</tr>
					<tr>
						<td>1��������</td>
						<td>2</td>
						<td colspan=2>�� 40 �� 3.4</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2��������</td>
						<td>2</td>
						<td colspan=2>�� 15 �� 5.0 �� 1��,<br>�� 20 �� 5.0 �� 1��</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Ż�����</td>
						<td>1��</td>
						<td colspan=2>12 �� 4.2 �� 7.6</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=4>������Ȳ</th>
						<th colspan=2>����</th>
						<th colspan=2>���ް���</th>
						<th>���ù����</th>
						<th>���</th>
					</tr>
					<tr>
						<td rowspan=3>�ڿ�����</td>
						<td rowspan=2>�������</td>
						<td colspan=2> </td>
						<td> </td>
						<td></td>
					</tr>
					<tr>
						<td colspan=2> </td>
						<td> </td>
						<td></td>
					</tr>
					<tr>
						<td>û�����</td>
						<td colspan=2>���ۼ���</td>
						<td>����(��)</td>
						<td></td>
					</tr>
					</table>
				</td>
			</tr>
			</table>
			<br><br>
			<table width=100% cellspacing=0 cellpadding=0 align=center>
			<tr>
				<td height=30><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_dbullet01.gif" style="margin-bottom:2px; margin-right:4px;"><font color=#00375D><b>�޼����ް���</b></font></td>
			</tr>
			</table>
			<table width=100% cellspacing=0 cellpadding=0 align=center>
			<tr>
				<td bgcolor=#CFCFCF>
					<table width=100% cellspacing=1 cellpadding=0 class="swn_tbl01">
					<tr>
						<th>���޹��</th>
						<td>�ڿ����Ͻ�</td>
						<th>��������</th>
						<td style="height:40px;">û������,<br>��������</td>
						<th rowspan=2>�޼�����</th>
						<td rowspan=2>����(26), ����(3),<br>(2���� 29����)</td>
					</tr>
					<tr>
						<th>�޼�����(����)</th>
						<td>755,812</td>
						<th>�޼��α�(��)</th>
						<td>-</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height=10></td>
			</tr>
			<tr>
				<td align=right>
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-01-2.html','','width=600,height=500')">
					<img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif">
					</a>&nbsp;
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-01-1.html','','width=600,height=500')">
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
// ����
curPage = null;
%>