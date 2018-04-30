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

//-----------------------------------------------------------------------------------------------
// �Ķ���� �ޱ�
//-----------------------------------------------------------------------------------------------
String paramTopCode = curPage.getParam("TOP_CODE", "");
String paramSubCode = curPage.getParam("SUB_CODE", "");
String paramSubItem = curPage.getParam("SUB_ITEM", "");
String paramSubContent = curPage.getParam("SUB_CONTENT", "");

//System.out.println(paramTopCode + ", " + paramSubCode + ", " + paramSubItem + ", " + paramSubContent);

if( paramTopCode.equals("") ) {
	paramTopCode = "1";
	paramSubCode = "2";
	paramSubItem = "";
	paramSubContent = "";
}

//System.out.println(paramTopCode + ", " + paramSubCode + ", " + paramSubItem + ", " + paramSubContent);

List<Map<String, String>> items = null;
Iterator<Map<String, String>> it = null;
Map<String, String> item = null;
String titleImageURL;

//Ÿ��Ʋ �̹��� ���
titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle01.jpg";
if( paramTopCode.equals("1") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle01.jpg";
} else if( paramTopCode.equals("2") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle02.jpg";
} else if( paramTopCode.equals("3") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle03.jpg";
} else if( paramTopCode.equals("4") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle04.jpg";
} else if( paramTopCode.equals("5") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle05.jpg";
} else if( paramTopCode.equals("6") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle07.jpg";	
} else if( paramTopCode.equals("99") ) {
	titleImageURL = curPage.getContextPath() + "/images/menu/20081212_swn_ltitle06.jpg";
} 
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
</script>
<body style="padding:0px margin:0px;">
	<table width=100% height=100% cellspacing=0 cellpadding=0>
	<tr>
		<td valign=top style="padding-left:10px; padding-right:10px;" width=100%>
			<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td>
					<table width=100% cellspacing=0 cellpadding=0>
					<!-- �޴� Ÿ��Ʋ �̹��� -->
					<tr>					
						<td><img src="<%=titleImageURL%>"></td>
					</tr>
					<!-- ���� �޴� ����Ʈ -->
					<tr>					
						<td background="${pageContext.request.contextPath}/images/menu/20081212_swn_left_bg01.jpg" style="padding-left:15px; padding-right:15px;">
							<table width=158 cellspacing=0 cellpadding=0>
							<tr><td height=9></td></tr>
							<!-- �޴� ǥ�� -->
<%
// �ǽð� ��������
if(paramTopCode.equals("1"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('1', '1', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>���� ���ȭ��</a></td></tr>");	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('1', '2', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>���� ���ȭ��</a></td></tr>");
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('1', '3', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>�Ƹ��� ��������</a></td></tr>");
	if( paramSubCode.equals("3") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('1', '3', '', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("") ? "<font color=#3366FF>" : "") + "��ü �Ƹ�����������" + (paramSubItem.equals("") ? "</font>" : "") + "</a></td></tr>");
		items = curPage.listPlantCode();		
		if( items != null )
		{
			it = items.iterator();
			while( it.hasNext() )
			{
				item = it.next();
				out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('1', '3', '" + String.valueOf(item.get("CODE")) + "', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " �Ƹ����������� " + (paramSubItem.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
			}
		}
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("4") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('1', '4', '" + WebConst.SWQ_FIRST_WCODE + "', '', '" + curPage.getContextPath() + "');\"><b>��</b>���������</a></td></tr>");
	if( paramSubCode.equals("4") )
	{
		items = curPage.listWaterCode();
		if( items != null )
		{
			it = items.iterator();
			while( it.hasNext() )
			{
				item = it.next();
				out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('1', '4', '" + String.valueOf(item.get("CODE")) + "', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " ��������� " + (paramSubItem.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
			}
		}
	}
}

//�����̷�����
if(paramTopCode.equals("2"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('2', '1', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>����</a></td></tr>");
	if( paramSubCode.equals("1") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '1', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "����������" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '1', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "���賻 ����������" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelect('2', '2', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>Ʈ����</a></td></tr>");
	if( paramSubCode.equals("2") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "����������" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "���賻 ����������" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '3', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "�������Ͱ�" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '4', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("4") ? "<font color=#3366FF>" : "") + "����ó��������" + (paramSubItem.equals("4") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '2', '5', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("5") ? "<font color=#3366FF>" : "") + "���ް�����" + (paramSubItem.equals("5") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('2', '3', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>�溸�̷�</a></td></tr>");
	if( paramSubCode.equals("3") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '3', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "�Ƹ�����������" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('2', '3', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "���������" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
}

//�������� �Է�����
if(paramTopCode.equals("3"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('3', '1', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>����� �����ڷ� ��ȸ</a></td></tr>");
	if( paramSubCode.equals("1") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '1', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "�������� ���Ͽ��Ȳ" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '1', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "������ �����˻���" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '1', '3', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "����ó������ ����" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('3', '2', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>����� ������ �Է�</a></td></tr>");
	if( paramSubCode.equals("2") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '2', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "�Ƹ�����������" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('3', '2', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "�����������" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('3', '3', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>����� �����׸� ����</a></td></tr>");
	/*
	if( paramSubCode.equals("3") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelect('3', '3', '1', '');\">" + (paramSubItem1.equals("1") ? "<font color=#3366FF>" : "") + "�Ƹ�����������" + (paramSubItem1.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelect('3', '3', '2', '');\">" + (paramSubItem1.equals("2") ? "<font color=#3366FF>" : "") + "���������" + (paramSubItem1.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	*/
}

//�Խ���
if(paramTopCode.equals("4"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('4', '1', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>��������</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('4', '2', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>�����Խ���</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('4', '3', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>�����ڷ�</a></td></tr>");
}

//�ڷ��
if(paramTopCode.equals("5"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '1', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>�������ýý��� �</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '2', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>���ù���ħ</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '3', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>�������</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("4") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '4', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>���������Ȳ</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("5") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '5', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>��������</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("6") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('5', '6', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\"><b>��</b>������ü���Ȳ</a></td></tr>");
	
	if( paramSubCode.equals("6") )
	{	
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('5', '6', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "�Ƹ�����������" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");		
		if( paramSubItem.equals("1") )
		{
			items = curPage.listPlantCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('5', '6', '1', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " �Ƹ����������� " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
		
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('5', '6', '2', '" + WebConst.SWQ_FIRST_WCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "���������" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		if( paramSubItem.equals("2") )
		{		
			items = curPage.listWaterCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('5', '6', '2', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " ��������� " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
	}	
}

// ���Ͽ
if(paramTopCode.equals("6"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('6', '1', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>���Ȳ�Է�</a></td></tr>");
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('6', '2', '', '', '" + curPage.getContextPath() + "');\"><b>��</b>�����ȸ</a></td></tr>");
}

// ������
if(paramTopCode.equals("99"))
{
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("1") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '1', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>�ڷ�������Ȳ</a></td></tr>");
	if( paramSubCode.equals("1") )
	{	
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '1', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "���տ��" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '1', '2', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "�Ƹ�����������" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");		
		if( paramSubItem.equals("2") )
		{
			items = curPage.listPlantCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '1', '2', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " �Ƹ����������� " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
		
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '1', '3', '" + WebConst.SWQ_FIRST_WCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "���������" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
		if( paramSubItem.equals("3") )
		{		
			items = curPage.listWaterCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '1', '3', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " ��������� " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("2") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '2', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>����ڰ���</a></td></tr>");
	if( paramSubCode.equals("2") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '2', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "����� �׷� ����" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '2', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "����� ���� ����" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '2', '3', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "����� ����� ����" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("3") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '3', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\"><b>��</b>��������Ʈ����</a></td></tr>");
	if( paramSubCode.equals("3") )
	{	
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '3', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "�Ƹ�����������" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");		
		if( paramSubItem.equals("1") )
		{
			items = curPage.listPlantCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '3', '1', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " �Ƹ����������� " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
		
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '3', '2', '" + WebConst.SWQ_FIRST_WCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "���������" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		if( paramSubItem.equals("2") )
		{		
			items = curPage.listWaterCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '3', '2', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " ��������� " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("4") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '4', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>�����׸����</a></td></tr>");
	if( paramSubCode.equals("4") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '4', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "�����׸񸮽�Ʈ" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '4', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "�����׸���<br>&nbsp;(�Ƹ�����������)" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '4', '3', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("3") ? "<font color=#3366FF>" : "") + "�����׸���<br>&nbsp;(���������)" + (paramSubItem.equals("3") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("5") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '5', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>������������</a></td></tr>");
	if( paramSubCode.equals("5") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '5', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "�������� �Һз�" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '5', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "�������� ��з�" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("6") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '6', '1', '', '" + curPage.getContextPath() + "');\"><b>��</b>����ġ �ʰ� �̷�</a></td></tr>");
	if( paramSubCode.equals("6") )
	{
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '6', '1', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "�Ƹ�����������" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '6', '2', '', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "���������" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("7") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '7', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\"><b>��</b>SMS ���� �̷� ��ȸ</a></td></tr>");
	if( paramSubCode.equals("7") )
	{	
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '7', '1', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("1") ? "<font color=#3366FF>" : "") + "�Ƹ�����������" + (paramSubItem.equals("1") ? "</font>" : "") + "</a></td></tr>");		
		if( paramSubItem.equals("1") )
		{
			items = curPage.listPlantCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '7', '1', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " �Ƹ����������� " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
		
		out.println("<tr><td class='menu_item'><a href=# onClick=\"menuSelectWithPath('99', '7', '2', '" + WebConst.SWQ_FIRST_WCODE + "', '" + curPage.getContextPath() + "');\">" + (paramSubItem.equals("2") ? "<font color=#3366FF>" : "") + "���������" + (paramSubItem.equals("2") ? "</font>" : "") + "</a></td></tr>");
		if( paramSubItem.equals("2") )
		{		
			items = curPage.listWaterCode();
			if( items != null )
			{
				it = items.iterator();
				while( it.hasNext() )
				{
					item = it.next();
					out.println("<tr><td class='menu_item_detail'><a href=# onClick=\"menuSelectWithPath('99', '7', '2', '" + String.valueOf(item.get("CODE")) + "', '" + curPage.getContextPath() + "');\">" + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "<font color=#3366FF>" : "") + String.valueOf(item.get("NAME")) + " ��������� " + (paramSubContent.equals(String.valueOf(item.get("CODE"))) ? "</font>" : "") + "</a></td></tr>");
				}
			}
		}
	}
	
	out.println("<tr><td class='menu_sub' " + (paramSubCode.equals("8") ? "bgcolor=#EFEFEF" : "") + "><a href=# onClick=\"menuSelectWithPath('99', '8', '', '" + WebConst.SWQ_FIRST_PCODE + "', '" + curPage.getContextPath() + "');\"><b>��</b>���������</a></td></tr>");
}
%>							
							<!-- �ܺ� ��ũ URL -->
							<tr><td height=89></td></tr>							
							<tr><td align=center><a href="#" onClick="window.open('http://www.wamis.go.kr/WKD/MN_DAMMAIN.ASPX','popWinDam','scrollbars=yes,width=1024,height=768');"><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_banner01.jpg" border=0></a></td></tr>							
							</table>
						</td>
					</tr>
					<!-- �޴� �ϴ� �̹��� -->
					<tr>					
						<td><img src="${pageContext.request.contextPath}/images/menu/20081212_swn_left_bottom01.jpg"></td>
					</tr>
					<!-- �ϴ� �߰� �޴� -->
					<tr><td height=10></td></tr>
					<tr>
						<td align=center><a href="#" onClick="menuSelect('4','3','','');"><img src="${pageContext.request.contextPath}/images/menu/brd_study.gif"></a></td>
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
item = null;
it = null;
items = null;
%>