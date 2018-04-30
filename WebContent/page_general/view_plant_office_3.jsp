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
								<td class='swn_tbl_data'><b>�Ϻμ��������</b></td>
								<th class='swn_tbl_title'>������</th>
								<td class='swn_tbl_data'>���ϱ� ��2�� 377</td>
								<th class='swn_tbl_title'>��ȭ��ȣ</th>
								<td class='swn_tbl_data'>02-3146-3490</td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width=100% cellspacing=0 cellpadding=0>
							<tr><td height=10></td></tr>
							<tr>
								<td align=right><a href=# onclick="openWindow('${pageContext.request.contextPath}/page_html/p_office2-05-1-1.html','','width=600,height=500')"><img src="${pageContext.request.contextPath}/images/comm/20081212_swn_btn_location.gif"></a></td>
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
								<td rowspan=2 width=10% class='swn_tbl_data'>20</td>
								<th width=12% class='swn_tbl_title'>���������(����)</th>
								<td width=10% class='swn_tbl_data'>2</td>
								<th width=12% class='swn_tbl_title'>������ ��(����)</th>
								<td width=10% class='swn_tbl_data'>3</td>
								<th width=12% rowspan=2 class='swn_tbl_title'>�޼�����(��)</th>
								<td width=22% rowspan=2 class='swn_tbl_data'>���ϱ�, ������, �����<br>(3���� 57����)</td>
							</tr>
							<tr>
								<th class='swn_tbl_title'>�� �� �����(����)</th>
								<td class='swn_tbl_data'>2</td>
								<th class='swn_tbl_title'>��������(����)</th>
								<td class='swn_tbl_data'>13</td>
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
								<td class='swn_tbl_data' rowspan=1>�Ϻ�(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ϱ� ��2�� 377</td>
								<td class='swn_tbl_data' rowspan=1>02-3146-3200</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>����� ���3�� 117-5</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>����(��)</td>
								<td class='swn_tbl_data' rowspan=2>����</td>
								<td class='swn_tbl_data' rowspan=2>2004��</td>
								<td class='swn_tbl_data'>(����)HACH(��)</td>
								<td class='swn_tbl_data'>1</td>
								<td class='swn_tbl_data' rowspan=2>����� ������ ��222-1</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>(����)TOA-DDK A4(��)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2004��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ϱ� ����6�� 605-288</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=2>����(��)</td>
								<td class='swn_tbl_data' rowspan=2>����</td>
								<td class='swn_tbl_data'>2001��</td>
								<td class='swn_tbl_data'>(����)HACH(��)</td>
								<td class='swn_tbl_data'>2</td>
								<td class='swn_tbl_data' rowspan=2>����� ����4�� ��63-1</td>
								<td class='swn_tbl_data' rowspan=2>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data'>2004��</td>
								<td class='swn_tbl_data'>(����)TOA-DDK A4(��)</td>
								<td class='swn_tbl_data'>5</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����3��</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ����3�� </td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����4��(����119)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK A4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>����� ����4�� 599</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����2��(�򱸸�����)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2009��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DKK(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ϱ� ����2�� 252-19</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�߰躻��(����6��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>HACH(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>����� �߰躻�� 34(����APT)</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>���3��(�Ҿϴ븲)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>HACH(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>����� ���3�� 1289(�븲APT)</td>
								<td class='swn_tbl_data' rowspan=1>-</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����1��(���繫��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ����1�� 593-69</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����2��(���繫��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ ����2�� 636-9</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����3��(���ϱ�û)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2012��</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ϱ� ����3�� 192-59</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�̾�(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ϱ� �̾Ƶ� 691-2</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>�̾�5��(���޸�������)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ϱ� �̾�5�� 860-116</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>������(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���α� �̾Ƶ� �� 25-23</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>419(��)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2010��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>���ϱ� ������ �� 73-3</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>â��(�ǿ�ĳ����)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ â2�� 635-42</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>����2��(û��3����)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2011��</td>
								<td class='swn_tbl_data' rowspan=1>TOA-DDK B4(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>����� ����2�� 780</td>
								<td class='swn_tbl_data' rowspan=1>02-2230-0520</td>
							</tr>
							<tr>
								<td class='swn_tbl_data' rowspan=1>â5��(�����ʱ�)</td>
								<td class='swn_tbl_data' rowspan=1>����</td>
								<td class='swn_tbl_data' rowspan=1>2012��</td>
								<td class='swn_tbl_data' rowspan=1>GOSYS(��)</td>
								<td class='swn_tbl_data' rowspan=1>5</td>
								<td class='swn_tbl_data' rowspan=1>������ â5�� 224-20</td>
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