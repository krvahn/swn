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

<!-- Water Now ���� CSS �� �ڹٽ�ũ��Ʈ ���� -->
<link type="text/css" href="${pageContext.request.contextPath}/import/water_now.css" rel="stylesheet"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/common_funs.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/import/menu_funs.js"></script>

<script type="text/javascript" language="javascript">
	var g_contextPath = "${pageContext.request.contextPath}";
	var timer;
	
	$(document).ready( function() {
		timer = setInterval(function() {
			// ���� ��¥ �� �ð� ���
		    var toDay = new Date();        
		    var dateTime;
		    
		    dateTime = "����ð� : ";
		    dateTime = dateTime + toDay.getFullYear() + "�� ";
		    dateTime = dateTime + (toDay.getMonth() < 9 ? "0" : "") + (toDay.getMonth() + 1) + "�� ";
		    dateTime = dateTime + (toDay.getDate() < 10 ? "0" : "") + toDay.getDate() + "�� ";
		    dateTime = dateTime + (toDay.getHours() < 10 ? "0" : "") + toDay.getHours() + ":";
		    dateTime = dateTime + (toDay.getMinutes() < 10 ? "0" : "") + toDay.getMinutes() + ":";
		    dateTime = dateTime + ((toDay.getSeconds() < 10) ? "0" : "") + toDay.getSeconds();
		    
		    $('#date_time_val').html(dateTime);	
		});
	});
	
	//-----------------------------------------------------------------------------------------------
	// �̺�Ʈ ó��
	//-----------------------------------------------------------------------------------------------
	function onMouseOverMenu(menuNum)
	{
		$("#sub_menu_0").css("display", "none");
		$("#sub_menu_1").css("display", "none");
		$("#sub_menu_2").css("display", "none");
		$("#sub_menu_3").css("display", "none");
		$("#sub_menu_4").css("display", "none");
		$("#sub_menu_5").css("display", "none");
		$("#sub_menu_6").css("display", "none");
		
		switch(menuNum)
		{
		case 0: $("#sub_menu_0").css("display", ""); break;
		case 1: $("#sub_menu_1").css("display", ""); break;
		case 2: $("#sub_menu_2").css("display", ""); break;
		case 3: $("#sub_menu_3").css("display", ""); break;
		case 4: $("#sub_menu_4").css("display", ""); break;
		case 5: $("#sub_menu_5").css("display", ""); break;
		case 6: $("#sub_menu_6").css("display", ""); break;
		}
	}
</script>
<body style="padding:0px; margin:0px;">
	<table width=100% height=100% cellspacing=0 cellpadding=0>
		<tr>
			<td width=100% style="padding-left:10px; padding-right:0px">
				<table width=100% height=100% cellspacing=0 cellpadding=0>
					<tr>
						<!-- �ΰ� ��� -->
						<td width=198 valign=top><a href="${pageContext.request.contextPath}/" target=_top><img src="${pageContext.request.contextPath}/images/20081212_swn_logo01.jpg" border=0></a></td>
						<!-- �޴� ��� -->
						<td valign=top>
							<table width=100% height=100% cellspacing=0 cellpadding=0>
								<!-- ���� �޴� -->
								<tr>
									<td height=31 align=right>
<%
if( curPage.isLogin() ) {
%>
										<a href="${pageContext.request.contextPath}/login.jsp?opcode=logout" target="_top">�α׾ƿ�</a>&nbsp;&nbsp;&nbsp;
<%
} else {
%>
										<a href="${pageContext.request.contextPath}/login.jsp" target="_top">�α���</a>&nbsp;&nbsp;&nbsp;
<%
}
%>
										<a href="#" onClick="menuSelectWithPath('0', '1', '', '', '${pageContext.request.contextPath}');">����Ʈ��</a>&nbsp;&nbsp;&nbsp;
										<a href="#" onClick="menuSelectWithPath('0', '2', '', '', '${pageContext.request.contextPath}');">�ý��ۼҰ�</a>&nbsp;&nbsp;&nbsp;
										<a href="#" onClick="menuSelectWithPath('99', '1', '1', '', '${pageContext.request.contextPath}');">�ý��۰���</a>&nbsp;&nbsp;&nbsp;
										<a href="#" onClick="menuSelectWithPath('0', '3', '', '', '${pageContext.request.contextPath}');">����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>											
								</tr>
								<!-- �޴�(�ֻ���) -->
								<tr>
									<td height=34 background="${pageContext.request.contextPath}/images/menu/20081212_swn_menu_bg01.jpg">
										<table width=100% height=100% cellspacing=0 cellpadding=0>
											<tr>
												<!-- 1�ܰ� �޴� -->
												<td>
													<a href="#" onMouseOver="onMouseOverMenu(0);" onClick="menuSelectWithPath('1', '2', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu01.jpg" alt="Ȩ"></a>
													<a href="#" onMouseOver="onMouseOverMenu(1);" onClick="menuSelectWithPath('1', '2', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu02.jpg" alt="�ǽð� ���� ����"></a>
													<a href="#" onMouseOver="onMouseOverMenu(2);" onClick="menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu03.jpg" alt="���� �̷� ����"></a>
													<a href="#" onMouseOver="onMouseOverMenu(3);" onClick="menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu04.jpg" alt="�������� �Է� ����"></a>
													<a href="#" onMouseOver="onMouseOverMenu(4);" onClick="menuSelectWithPath('4', '1', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu05.jpg" alt="�Խ���"></a>
													<a href="#" onMouseOver="onMouseOverMenu(5);" onClick="menuSelectWithPath('5', '1', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu06.jpg" alt="�ڷ��"></a>
													<a href="#" onMouseOver="onMouseOverMenu(6);" onClick="menuSelectWithPath('6', '1', '', '', '${pageContext.request.contextPath}');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_menu07.jpg" alt="���Ͽ"></a>
												</td>
												<!-- �ð� ǥ�� -->
												<td align=right style="padding-top:3px;"><span style="color:#CEB3C1; font-size:8pt; margin-right:16px" id="date_time_val">����ð�</span></td>
											</tr>
										</table>
									</td>
								</tr>
								<!-- 2�ܰ� �޴� -->
								<tr>
									<td height=29 background="${pageContext.request.contextPath}/images/menu/20081212_swn_menu_bg02.jpg">
										<table width=100% height=100% cellspacing=0 cellpadding=0>
											<tr>
												<!-- 1�ܰ� �޴� -->
												<td style="padding-top:4px;">
													<div id="sub_menu_0" style="display:none;"></div>
													<div id="sub_menu_1" style="display:none; padding-left:30px;">
														<a href="#" onClick="menuSelectWithPath('1', '1', '', '', '${pageContext.request.contextPath}');">�������ȭ��</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('1', '2', '', '', '${pageContext.request.contextPath}');">���տ��ȭ��</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('1', '3', '', '', '${pageContext.request.contextPath}');">�Ƹ�����������</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('1', '4', '<%=WebConst.SWQ_FIRST_WCODE%>', '', '${pageContext.request.contextPath}');">���������</a>
													</div>
													<div id="sub_menu_2" style="display:none; padding-left:150px;">
														<a href="#" onClick="menuSelectWithPath('2', '1', '1', '', '${pageContext.request.contextPath}');">����</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('2', '2', '1', '', '${pageContext.request.contextPath}');">Ʈ����</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('2', '3', '1', '', '${pageContext.request.contextPath}');">�溸�̷�</a>
													</div>
													<div id="sub_menu_3" style="display:none; padding-left:150px;">
														<a href="#" onClick="menuSelectWithPath('3', '1', '1', '', '${pageContext.request.contextPath}');">����� �����ڷ� ��ȸ</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('3', '2', '1', '', '${pageContext.request.contextPath}');">����� ������ �Է�</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('3', '3', '', '', '${pageContext.request.contextPath}');">����� �����׸� ����</a>
													</div>
													<div id="sub_menu_4" style="display:none; padding-left:360px;">
														<a href="#" onClick="menuSelectWithPath('4', '1', '', '', '${pageContext.request.contextPath}');">��������</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('4', '2', '', '', '${pageContext.request.contextPath}');">�����Խ���</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('4', '3', '', '', '${pageContext.request.contextPath}');">�����ڷ�</a>
													</div>
													<div id="sub_menu_5" style="display:none; padding-left:100px;">
														<a href="#" onClick="menuSelectWithPath('5', '1', '', '', '${pageContext.request.contextPath}');">�������ýý��ۿ</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '2', '', '', '${pageContext.request.contextPath}');">���ù���ħ</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '3', '', '', '${pageContext.request.contextPath}');">�������</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '4', '', '', '${pageContext.request.contextPath}');">���������Ȳ</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '5', '', '', '${pageContext.request.contextPath}');">��������</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('5', '6', '1', '<%=WebConst.SWQ_FIRST_PCODE%>', '${pageContext.request.contextPath}');">������ü���Ȳ</a>
													</div>
													<div id="sub_menu_6" style="display:none; padding-left:500px;">
														<a href="#" onClick="menuSelectWithPath('6', '1', '', '', '${pageContext.request.contextPath}');">���Ȳ�Է�</a>&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#" onClick="menuSelectWithPath('6', '2', '', '', '${pageContext.request.contextPath}');">�����ȸ</a>
													</div>
												</td>
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
	</table>
</body>
</html>
<%
// ����
curPage = null;
%>