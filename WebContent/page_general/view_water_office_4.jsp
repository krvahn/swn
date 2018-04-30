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
				
					<table width=100% cellspacing=1 cellpadding=0 class="swn_tbl01">
					<tr>
						<th>����Ҹ�</th>
						<td colspan=3><b>�������Ƹ�����������</b></td>
						<th>�ü��⵵</th>
						<td colspan=2>1971��</td>
						<th>�ü��뷮 (��/��)</th>
						<td>600,000</td>
					</tr>
					<tr>
						<th>�ּ�</th>
						<td colspan=3>�������� ��ȭ�� 1</td>
						<th>��ȭ��ȣ</th>
						<td colspan=2>02-2632-9725</td>
						<th>��������(��)</th>
						<td>42,878</td>
					</tr>
					<tr>
						<th rowspan=3>�����</th>
						<th>������</th>
						<th colspan=2>��ġ</th>
						<th colspan=3>�����(õ��/��)</th>
						<th colspan=2>��������෮(õ��/��)</th>
					</tr>
					<tr>
						<td rowspan=2>ǳ��</td>
						<td rowspan=2 colspan=2>���ı� ǳ���� 417</td>
						<th style="font-weight:normal;">�ȴ�ȣ</th>
						<th colspan=2 style="font-weight:normal;">�Ѱ�ǥ����</th>
						<th style="font-weight:normal;">���������ҿ뷮</th>
						<th style="font-weight:normal;">��������</th>
					</tr>
					<tr>
						<td>-</td>
						<td colspan=2>700</td>
						<td>238</td>
						<td>200</td>
					</tr>
					<tr>
						<th rowspan=7>�ü���Ȳ</th>
						<th>����</th>
						<th colspan=2>���� </th>
						<th colspan=3>�԰�(m)</th>
						<th>����</th>
						<th>���</th>
					</tr>
					<tr>
						<td>������</td>
						<td>#1<br>#2<br>#3</td>
						<td>4<br>2<br>2</td>
						<td colspan=3>5.0 �� 30.5 �� 3.5<br>5.0 �� 30.5 �� 3.5<br>5.3 �� 12.8 �� 5.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ȥȭ��</td>
						<td>#1<br>#2<br>#3</td>
						<td>4<br>2<br>3</td>
						<td colspan=3>9.0 �� 3.3 �� 3.4<br>9.0 �� 3.3 �� 3.4<br>5.4 �� 5.5 �� 5.0</td>
						<td>�÷����ͼ�</td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>#1<br><br>#2<br>#3</td>
						<td>4<br>2<br>8</td>
						<td colspan=3>13.5 �� 18.0 �� 3.3<br>13.5 �� 18.0 �� 3.3<br>15.0	�� 14.1 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ħ����</td>
						<td>#1<br>#2<br>#3</td>
						<td>4<br>2<br>8</td>
						<td colspan=3>16.0 �� 59.0 �� 4.5<br>16.0 �� 59.0 �� 4.5<br>17.3 �� 67.0 �� 5.0</td>
						<td>�����<br>�����<br>Ȳ����</td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>#1<br>#2<br>#3</td>
						<td>12<br>6<br>16</td>
						<td colspan=3>8.7 �� 11.2<br>8.7 �� 11.2<br>17.3 �� 8.0</td>
						<td>�޼ӿ�����<br>�޼ӿ�����<br>�޼ӿ�����</td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>#1<br><br>#2<br><br>#3</td>
						<td>3<br><br>3<br><br>2</td>
						<td colspan=3>24.0 �� 32.0 �� 3.2 �� 2��<br>55.0 �� 20.0 �� 3.3 �� 1��<br>36.0 �� 16.0 �� 3.4 �� 2��<br>55.0 �� 20.0 �� 3.3 �� 1��<br>46.4 �� 51.6 �� 4.95 �� 1��<br>51.6 �� 51.6 �� 4.95 �� 1��</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=5>�����<br>ó��</th>
						<td>ȸ����</td>
						<td colspan=2>3</td>
						<td colspan=3>16.0 �� 23.3 �� 4.5<br>8.0 �� 27.0 �� 2.9<br>21.0 �� 8.0 �� 4.4</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>�载������</td>
						<td colspan=2>2</td>
						<td colspan=3>9.0 �� 21.0 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>1��������</td>
						<td colspan=2>2</td>
						<td colspan=3>�� 16.0 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2��������</td>
						<td colspan=2>2</td>
						<td colspan=3>�� 27.5 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Ż�����</td>
						<td colspan=2>1</td>
						<td colspan=3>10.5 �� 30.0 �� 13.5</td>
						<td>Belt Press</td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=6>������Ȳ</th>
						<th colspan=3>����</th>
						<th>�԰�(����)</th>
						<th>����(��)</th>
						<th>����(��)</th>
						<th>���ް���</th>
						<th>���</th>
					</tr>
					<tr>
						<td colspan=3>�������</td>
						<td>1,300<br>700</td>
						<td>5<br>1</td>
						<td>2<br>1</td>
						<td>���������</td>
						<td></td>
					</tr>
					<tr>
						<td rowspan=3>�ۼ�����</td>
						<td colspan=2>#1������</td>
						<td>1,000<br>700<br>400</td>
						<td>1<br>5<br>1</td>
						<td>1<br>2<br></td>
						<td>��õ�����</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=2>#2������</td>
						<td>1,050<br>550, 500<br>300</td>
						<td>1<br>1,2<br>1</td>
						<td><br>1<br>1</td>
						<td>���������</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=2>#3������</td>
						<td>1,200<br>600</td>
						<td>4<br>2</td>
						<td>2<br>1</td>
						<td>���������<br>����, ��ȭ�� ����</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=3>�������</td>
						<td>600, 350, 200</td>
						<td>1, 2, 1</td>
						<td>1</td>
						<td>���ΰ���</td>
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
						<td>����ä����</td>
						<th>��������</th>
						<td style="height:40px;">��õ�����,<br>���������,<br>���������</td>
						<th rowspan=2>�޼�����</th>
						<td rowspan=2>��õ��(16), ������(21), ��õ��(!2),<br>���α�(15) (4���� 64����)</td>
					</tr>
					<tr>
						<th>�޼�����(����)</th>
						<td>486,793</td>
						<th>�޼��α�(��)</th>
						<td>1,443,217</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height=10></td>
			</tr>
			<tr>
				<td align=right>
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-04-2.html','','width=600,height=500')">
					<img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif">
					</a>&nbsp;
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-04-1.html','','width=600,height=500')">
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