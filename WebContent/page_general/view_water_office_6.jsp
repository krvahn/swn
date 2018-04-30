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
						<td colspan=3><b>���ϾƸ�����������</b></td>
						<th>�ü��⵵</th>
						<td colspan=2>1996��</td>
						<th>�ü��뷮 (��/��)</th>
						<td>1,000,000</td>
					</tr>
					<tr>
						<th>�ּ�</th>
						<td colspan=3>��⵵ �����ֽ� ���� 171(���е� 397)</td>
						<th>��ȭ��ȣ</th>
						<td colspan=2>031-576-7304</td>
						<th>��������(��)</th>
						<td>135,389</td>
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
						<td rowspan=2 colspan=2>��⵵ �����ֽ� �ͺ���<br>�氭�� 682</td>
						<th style="font-weight:normal;">�ȴ�ȣ</th>
						<th colspan=2 style="font-weight:normal;">�Ѱ�ǥ����</th>
						<th style="font-weight:normal;">���������ҿ뷮</th>
						<th style="font-weight:normal;">��������</th>
					</tr>
					<tr>
						<td>-</td>
						<td colspan=2>1,050</td>
						<td>800</td>
						<td>-</td>
					</tr>
					<tr>
						<th rowspan=8>�ü���Ȳ</th>
						<th>����</th>
						<th colspan=2>���� </th>
						<th colspan=3>�԰�(m)</th>
						<th>����</th>
						<th>���</th>
					</tr>
					<tr>
						<td>������</td>
						<td>#1<br>#2</td>
						<td>2<br>2</td>
						<td colspan=3>7.0 �� 14.0 �� 5.0<br>7.0 �� 14.0 �� 5.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ȥȭ��</td>
						<td>#1<br>#2</td>
						<td>4<br>4</td>
						<td colspan=3>4.8 �� 4.8 �� 4.0<br>4.8 �� 4.8 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>#1<br>#2</td>
						<td>12<br>12</td>
						<td colspan=3>14.1 �� 16.5 �� 4.0<br>14.1 �� 16.5 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>ħ����</td>
						<td>#1<br>#2</td>
						<td>12<br>12</td>
						<td colspan=3>20.0 �� 62.4 �� 5.0<br>20.0 �� 62.4 �� 5.0</td>
						<td>Ⱦ����</td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>#1<br>#2</td>
						<td>28<br>28</td>
						<td colspan=3>8.0 �� 16.8<br>8.0 �� 16.8</td>
						<td>�ڿ�������</td>
						<td></td>
					</tr>
					<tr>
						<td>������</td>
						<td>#1<br>#2</td>
						<td>2<br>2</td>
						<td colspan=3>54.5 �� 59.5 �� 5.2<br>54.5 �� 59.5 �� 5.2</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>�����</td>
						<td>#1<br>#2</td>
						<td>1<br>1</td>
						<td colspan=3>20.0 �� 70.0 �� 8.0<br>20.0 �� 70.0 �� 8.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=5>�����<br>ó��</th>
						<td>ȸ����</td>
						<td>#1<br>#2</td>
						<td>2<br>2</td>
						<td colspan=3>7.8 �� 24.0 �� 4.0<br>5.5 �� 16.5 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>�载������</td>
						<td>#1<br>#2</td>
						<td>1<br>2</td>
						<td colspan=3>3.2 �� 7.6 �� 4.2<br>5.0 �� 16.5 �� 3.5</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>1��������</td>
						<td>#1<br>#2</td>
						<td>2<br>2</td>
						<td colspan=3>�� 11.6 �� 4.0<br>�� 32.4 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>2��������</td>
						<td>#1<br>#2</td>
						<td>2<br>2</td>
						<td colspan=3>�� 32.4 �� 4.0��<br>13.6 �� 4.0</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Ż�����</td>
						<td>#1<br>#2</td>
						<td>1<br>1</td>
						<td colspan=3>12.0 �� 42.0 �� 7.6<br>12.6 �� 36.3 �� 10.5</td>
						<td>Belt Press</td>
						<td></td>
					</tr>
					<tr>
						<th rowspan=3>������Ȳ</th>
						<th colspan=3>����</th>
						<th>�԰�(����)</th>
						<th>����(��)</th>
						<th>����(��)</th>
						<th>���ް���</th>
						<th>���</th>
					</tr>
					<tr>
						<td colspan=3>�������</td>
						<td>1,000<br>500</td>
						<td>7<br>2</td>
						<td>4</td>
						<td>�������</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=3>�ۼ�����</td>
						<td>2,400<br>1,200</td>
						<td>7<br>2</td>
						<td>4</td>
						<td>- ����, �Ͼ��ͳ�,<br>����, �ұ��ͳ�,<br>���, ���� �����<br>- ����, �����ֽ� ����</td>
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
						<td style="height:40px;">���������,<br>�Ͼ��ͳι����,<br>��������,<br>�ұ��ͳι����,<br>��ù����,<br>��������</td>
						<th rowspan=2>�޼�����</th>
						<td rowspan=2>��������(22), ���α�(7), ���۱�(20),<br>���Ǳ�(27), ���ʱ�(18), ������(26), ������(17)<br>(9���� 116����)</td>
					</tr>
					<tr>
						<th>�޼�����(����)</th>
						<td>768,574</td>
						<th>�޼��α�(��)</th>
						<td>2,225,911</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height=10></td>
			</tr>
			<tr>
				<td align=right>
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-06-2.html','','width=600,height=500')">
					<img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif">
					</a>&nbsp;
					<a href="javascript:openWindow('${pageContext.request.contextPath}/page_html/p_office1-06-1.html','','width=600,height=500')">
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