<%@ page import="java.util.*" %>
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

List<Map<String, String>> items = null;
Iterator<Map<String, String>> it = null;
Map<String, String> item = null;
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

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
</script>
<style type="text/css">
	#sitemap_2th td {font-size:8pt; padding-left:23px;}
</style>
<body style="background:#FFFFFF;">
	<div id="content_form">
	<table width=100% cellspacing=0 cellpadding=0 bgcolor=#FFFFFF>
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_stitle01.jpg">
		</td>
	</tr>
	</table>
	<table width=100% cellspacing=0 cellpadding=0 align=center>
  	<tr>
    	<td>	
			<table width=653 cellspacing=0 cellpadding=0>
			<tr>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>�ǽð� ��������</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('1', '1', '', '', '${pageContext.request.contextPath}');"><b>������ ���ȭ��</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('1', '2', '', '', '${pageContext.request.contextPath}');"><b>������ ���ȭ��</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('1', '3', '', '', '${pageContext.request.contextPath}');"><b>���Ƹ��� ��������</b></a></td>
					</tr>
						<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('1', '3', '', '', '${pageContext.request.contextPath}');">��ü �Ƹ�����������</a></td>
							</tr>
<%
items = curPage.listPlantCode();		
if( items != null )
{
	it = items.iterator();
	while( it.hasNext() )
	{
		item = it.next();
		out.println("<tr>");
		out.println("<td height=17><a href=# onClick=\"menuSelectWithPath('1', '3', '" + String.valueOf(item.get("CODE")) + "', '', '" + curPage.getContextPath() + "');\">" + String.valueOf(item.get("NAME")) + " �Ƹ�����������</a></td>");
		out.println("</tr>");
	}
}
%>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('1', '4', '<%=WebConst.SWQ_FIRST_WCODE%>', '', '${pageContext.request.contextPath}');"><b>�����������</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
<%
items = curPage.listWaterCode();		
if( items != null )
{
	it = items.iterator();
	while( it.hasNext() )
	{
		item = it.next();
		out.println("<tr>");
		out.println("<td height=17><a href=# onClick=\"menuSelectWithPath('1', '4', '" + String.valueOf(item.get("CODE")) + "', '', '" + curPage.getContextPath() + "');\">" + String.valueOf(item.get("NAME")) + " ���������</a></td>");
		out.println("</tr>");
	}
}
%>							
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					</table>
				</td>
				<td width=40 valign=top></td>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>���� �̷�����</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');"><b>������</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');">����������</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '1', '2', '', '${pageContext.request.contextPath}');">���賻 ����������</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('2', '2', '1', '', '${pageContext.request.contextPath}');"><b>Ʈ����</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '1', '', '${pageContext.request.contextPath}');">����������</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '2', '', '${pageContext.request.contextPath}');">���賻 ����������</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '3', '', '${pageContext.request.contextPath}');">�������Ͱ�</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '4', '', '${pageContext.request.contextPath}');">����ó��������</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '2', '5', '', '${pageContext.request.contextPath}');">���ް�����</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('2', '3', '1', '', '${pageContext.request.contextPath}');"><b>���溸 �̷�</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '3', '1', '', '${pageContext.request.contextPath}');">�Ƹ�����������</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('2', '3', '2', '', '${pageContext.request.contextPath}');">���������</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					</table>
				</td>
				<td width=40 valign=top></td>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>�������� �Է�����</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');"><b>������� �����ڷ� ��ȸ</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>	
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');">�������� ���Ͽ��Ȳ</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '1', '2', '', '${pageContext.request.contextPath}');">������ �����˻���</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '1', '3', '', '${pageContext.request.contextPath}');">����ó������ ����</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('3', '2', '1', '', '${pageContext.request.contextPath}');"><b>������� ������ �Է�</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '2', '1', '', '${pageContext.request.contextPath}');">�Ƹ�����������</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('3', '2', '2', '', '${pageContext.request.contextPath}');">�����������</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('3', '3', '', '', '${pageContext.request.contextPath}');"><b>������� �����׸� ����</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					</table>
				</td>
			</tr>
			<tr><td colspan=5 height=30></td></tr>
			<tr>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>�Խ���</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('4', '1', '', '', '${pageContext.request.contextPath}');"><b>����������</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('4', '2', '', '', '${pageContext.request.contextPath}');"><b>�������Խ���</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('4', '3', '', '', '${pageContext.request.contextPath}');"><b>�������ڷ�</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					</table>
				</td>
				<td width=40 valign=top></td>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>�ڷ��</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '1', '', '', '${pageContext.request.contextPath}');"><b>���������ýý��� �</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '2', '', '', '${pageContext.request.contextPath}');"><b>�����ù� ��ħ</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '3', '', '', '${pageContext.request.contextPath}');"><b>���������</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '4', '', '', '${pageContext.request.contextPath}');"><b>�����������Ȳ</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '5', '', '', '${pageContext.request.contextPath}');"><b>����������</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('5', '6', '1', '<%=WebConst.SWQ_FIRST_PCODE%>', '${pageContext.request.contextPath}');"><b>��������ü���Ȳ</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 id="sitemap_2th">
							<tr><td height=7></td></tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('5', '6', '1', '<%=WebConst.SWQ_FIRST_PCODE%>', '${pageContext.request.contextPath}');">�Ƹ�����������</a></td>
							</tr>
							<tr>
								<td height=17><a href="#" onClick="menuSelectWithPath('5', '6', '2', '<%=WebConst.SWQ_FIRST_WCODE%>', '${pageContext.request.contextPath}');">���������</a></td>
							</tr>
							<tr><td height=15></td></tr>
							</table>
						</td>
					</tr>
					</table>
				</td>
				<td width=40 valign=top></td>
				<td width=191 valign=top>
					<table width=100% cellspacing=0 cellpadding=0>
					<tr>
						<td height=29 background="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_bg01.gif" style="padding-top:3px; padding-left:10px;"><font color=white><b>���Ͽ</b></font></td>
					</tr>
					<tr><td height=5></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('6', '1', '', '', '${pageContext.request.contextPath}');"><b>�����Ȳ �Է�</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					<tr>
						<td height=26 style="padding-left:10px; padding-top:2px;"><a href="#" onClick="menuSelectWithPath('6', '2', '', '', '${pageContext.request.contextPath}');"><b>����� ��ȸ</b></a></td>
					</tr>
					<tr><td><img src="${pageContext.request.contextPath}/images/top/20090506_swn_sitemap_line01.gif"></td></tr>
					</table>
				</td>
			</tr>
			<tr><td colspan=5 height=30></td></tr>
			<tr>
				<td width=191 valign=top>
				</td>
				<td colspan=4></td>
			</tr>
			<tr><td colspan=5 height=60></td></tr>
			</table>
		</td>
	</tr>
	</table>
	</div>
</body>
</html>
<%
// ����
curPage = null;
%>