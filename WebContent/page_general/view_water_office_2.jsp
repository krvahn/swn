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
						<td colspan=3><b>���ǾƸ�����������</b></td>
						<th>�ü��⵵</th>
						<td colspan=2>1936��</td>
						<th>�ü��뷮 (��/��)</th>
						<td>250,000</td>
					</tr>
					<tr>
						<th>�ּ�</th>
						<td colspan=3>������ ������� 571</td>
						<th>��ȭ��ȣ</th>
						<td colspan=2>02-3146-5400</td>
						<th>��������(��)</th>
						<td>82,349</td>
					</tr>
					<tr>
						<th rowspan=3>�����</th>
						<th>������</th>
						<th colspan=2>��ġ</th>
						<th colspan=3>�����(õ��/��)</th>
						<th colspan=2>��������෮(õ��/��)</th>
					</tr>
					<tr>
						<td rowspan=2>����</td>
						<td rowspan=2 colspan=2>������ ���嵿 �� 18-2</td>
						<th style="font-weight:normal;">�ȴ�ȣ</th>
						<th colspan=2 style="font-weight:normal;">�Ѱ�ǥ����</th>
						<th style="font-weight:normal;">���������ҿ뷮</th>
						<th style="font-weight:normal;">��������</th>
					</tr>
					<tr>
						<td>-</td>
						<td colspan=2>1,260</td>
						<td>-</td>
						<td>960</td>
					</tr>
					<tr>
						<th rowspan=9>�ü���Ȳ</th>
						<th>����</th>
						<th colspan=2>���� </th>
						<th colspan=3>�԰�(m)</th>
						<th>����</th>
						<th>���</th>
					</tr>
					<tr>
						<td>������</td>
						<td></td>
						<td></td>
						<td colspan=3></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ħ����</td>
						<td>��1������</td>
						<td>2</td>
						<td colspan=3>45.0 �� 10.0 �� 5.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ȥȭ��</td>
						<td>��1������</td>
						<td>4</td>
						<td colspan=3>4.8 �� 4.8 �� 3.3</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>��1������</td>
						<td>6</td>
						<td colspan=3>17.0 �� 13.0 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ħ����</td>
						<td>��1������</td>
						<td>6</td>
						<td colspan=3>18.5 �� 71.7 �� 5.0</td>
						<td>Ⱦ����</td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>��1������</td>
						<td>40<br>12</td>
						<td colspan=3>14.0 �� 9.4 </td>
						<td>�ڿ�������</td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>��1������</td>
						<td>2</td>
						<td colspan=3>50.0 �� 40.0 �� 5.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>�����</td>
						<td>��1������</td>
						<td>12</td>
						<td colspan=3>36.0 �� 4.2</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=4>�����<br>ó��</th>
						<td>ȸ����</td>
						<td>��1������</td>
						<td>2</td>
						<td colspan=3>11.5 �� 21.7 �� 2.9<br>10.0 �� 21.7 �� 2.9</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>1��������</td>
						<td colspan=2>6</td>
						<td colspan=3>�� 31 �� 4 �� 2��<br>36.9 �� 12 �� 3.8 �� 2��</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2��������</td>
						<td colspan=2>2</td>
						<td colspan=3>�� 38 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Ż�����</td>
						<td colspan=2>1</td>
						<td colspan=3>24.0 �� 36.0 �� 3��</td>
						<td>Belt Press</td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=4>������Ȳ</th>
						<th colspan=3>����</th>
						<th>�԰�(����)</th>
						<th>����(��)</th>
						<th>����(��)</th>
						<th>���ް���</th>
						<th>���</th>
					</tr>
					<tr>
						<td colspan=3>�������</td>
						<td>800<br>550<br>650,350<br>750,400</td>
						<td>7<br>2<br>1<br>4</td>
						<td>0<br>0<br>0<br>2,1</td>
						<td>��2������(��������)<br><br><br>��1������</td>
						<td></td>
					</tr>
					<tr>
						<td rowspan=2>�ۼ�����</td>
						<td colspan=2>��1������</td>
						<td>800<br>950<br>500</td>
						<td>3<br>2<br>1</td>
						<td>0<br>2<br>1</td>
						<td>�븶�����<br>����������</td>
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
						<td style="height:40px;">�븶�����,<br>����������,<br></td>
						<th rowspan=2>�޼�����</th>
						<td rowspan=2>���α�(1), ������(6), �߶���(20),<br>���빮��(24), ������(16), ���ϱ�(9), ���ϱ�(8),<br>������(8), �����(4),<br>(9���� 96����)</td>
					</tr>
					<tr>
						<th>�޼�����(����)</th>
						<td>752,788</td>
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
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-02-2.html','','width=600,height=500')">
					<img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif">
					</a>&nbsp;
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-02-1.html','','width=600,height=500')">
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