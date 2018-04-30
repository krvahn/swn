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
								<td class='swn_tbl_data'><b>�������������</b></td>
								<th class='swn_tbl_title'>������</th>
								<td class='swn_tbl_data'>������ ������ 541-4</td>
								<th class='swn_tbl_title'>��ȭ��ȣ</th>
								<td class='swn_tbl_data'>02-3146-5290</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width=100% cellspacing=0 cellpadding=0>
							<tr><td height=10></td></tr>
							<tr>
								<td align=right><a href=# onclick="openWindow('${pageContext.request.contextPath}/page_html/p_office2-11-1-1.html','','width=600,height=500')"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif"></a></td>
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
							<td bgcolor=#CFCFCF>
							<table width=100% cellspacing=1 cellpadding=0>
							<tr>
								<th rowspan=2 width=12% class='swn_tbl_title'>�� ü �� ��</th>
								<td rowspan=2 width=10% class='swn_tbl_data'>14</td>
								<th width=12% class='swn_tbl_title'>���������(����)</th>
								<td width=10% class='swn_tbl_data'>2</td>
								<th width=12% class='swn_tbl_title'>������ ��(����)</th>
								<td width=10% class='swn_tbl_data'>1</td>
								<th width=12% rowspan=2 class='swn_tbl_title'>�޼�����(��)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>���ı�, ������<br>(2���� 49����)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>�� �� �����(����)</th>
								<td class='swn_tbl_data'></td>
								<th class='swn_tbl_title'>��������(����)</th>
								<td class='swn_tbl_data'>11</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr><td height=10></td></tr>
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
                                <td class='swn_tbl_data' rowspan=1>����(��)</td>
                                <td class='swn_tbl_data' rowspan=1>����</td>
                                <td class='swn_tbl_data' rowspan=1>2002��</td>
                                <td class='swn_tbl_data' rowspan=1>SENSORTECHNIK(��)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>���ı� ���ݵ� 51</td>
                                <td class='swn_tbl_data' rowspan=1>02-3146-3200</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=1>�Ÿ�(��)</td>
                                <td class='swn_tbl_data' rowspan=1>����</td>
                                <td class='swn_tbl_data' rowspan=1>2002��</td>
                                <td class='swn_tbl_data' rowspan=1>SENSORTECHNIK(��)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>���ı� ��õ�� 36</td>
                                <td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=1>õȣ��(��)</td>
                                <td class='swn_tbl_data' rowspan=1>�ϻ�</td>
                                <td class='swn_tbl_data' rowspan=1>2004��</td>
                                <td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>������ õȣ�� 360</td>
                                <td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=1>������(���������)</td>
                                <td class='swn_tbl_data' rowspan=1>�ϻ�</td>
                                <td class='swn_tbl_data' rowspan=1>2004��</td>
                                <td class='swn_tbl_data' rowspan=1>TOA-DKK A4(��)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>������ ������ 541</td>
                                <td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=2>�浿(��)</td>
                                <td class='swn_tbl_data' rowspan=2>����</td>
                                <td class='swn_tbl_data' rowspan=2>2006��</td>
                                <td class='swn_tbl_data'>(����)HACH(��)</td>
                                <td class='swn_tbl_data'>1</td>
                                <td class='swn_tbl_data' rowspan=2>������ ������ 541</td>
                                <td class='swn_tbl_data' rowspan=2>-</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data'>(����)SENSORTECHNIK(��)</td>
                                <td class='swn_tbl_data'>5</td>
                            </tr>
                            <tr>
                                <td class='swn_tbl_data' rowspan=1>��õ��(���ļҹ漭)</td>
                                <td class='swn_tbl_data' rowspan=1>����</td>
                                <td class='swn_tbl_data' rowspan=1>2009��</td>
                                <td class='swn_tbl_data' rowspan=1>TOA-DKK A4(��)</td>
                                <td class='swn_tbl_data' rowspan=1>5</td>
                                <td class='swn_tbl_data' rowspan=1>���ı� ��õ1�� 306-11</td>
                                <td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>��������</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ı� �������� 37</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>������(��������)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ı� ������ 847</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>��ǵ�(���������)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ı� ��ǵ� 19-5</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>������(����������)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ı� ������ 62-3</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>�ϻ絿(����ȨŸ��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ �ϻ絿 400</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>�ϻ�1��(�����ʱ�)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2012��</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ �ϻ絿 418-18</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>�����(�������ü����)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ����� 296</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
                            </tr>
                            <tr>
								<td class='swn_tbl_data' rowspan=1>���ϵ�(�ֹμ���)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ���ϵ� 678</td>
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