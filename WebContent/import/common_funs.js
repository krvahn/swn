function fnStrTrim(str)
{
	var result;
	
	result = str;
	result = result.split(" ").join("");
	
	return result;
}

function fnStrRight(str, n)
{
	if (n <= 0)
		return "";
	else if (n > String(str).length)
		return str;
	else {
		var iLen = String(str).length;
		return String(str).substring(iLen, iLen - n);
	}
}

function fnStrLeft(str, n)
{
	if (n <= 0)
		return "";
	else if (n > String(str).length)
		return str;
	else
		return String(str).substring(0,n);
}

function fnDateTrim(dt)
{
	var result;
	
	result = dt;
	result = result.split(" ").join("");
	result = result.split("-").join("");
	result = result.split(":").join("");
	
	return result;
}

function fnStrToFloat(str)
{
	var result;
	
	result = str;
	result = result.split(" ").join("");
	result = result.split(",").join("");
	
	return parseFloat(result);
}

function fnStrToInt(str)
{
	var result;
	
	result = str;
	result = result.split(" ").join("");
	result = result.split(",").join("");
	
	return parseInt(result);
}

function fnDetectBrowser() 
{
	var strBrowser = "";
	
	if( navigator.userAgent.indexOf("Opera") >= 0 ) {
		strBrowser = "Opera";
	} else if( navigator.userAgent.indexOf("Netscape6/") >= 0 ) {
		strBrowser = "Netscape6/";
	} else if( navigator.userAgent.indexOf("Geck") >= 0 ) {
		strBrowser = "Gecko";
	} else if( navigator.userAgent.indexOf("MSIE") >= 0 ) {
		strBrowser = "MSIE";
	}
	
	return strBrowser;
}

function fnSaveImageFile(iframeID, fileName, fileData, contextPath)
{
	var html;
	var oIframe = document.getElementById(iframeID);		
	var oDoc = (oIframe.contentWindow == null ? oIframe.contentDocument : oIframe.contentWindow);
    if (oDoc.document) oDoc = oDoc.document;
    
    html = "<html>";
    html += "<head><\/head>";
    html += "<body onload='save.submit();'>";
    html += "<form name='save' id='save' method='post' action='" + contextPath + "/save_image.jsp'>";
    html += "<input type='hidden' name='FILE_NAME' value='" + fileName + "'>";
    html += "<input type='hidden' name='FILE_DATA' value='" + fileData + "'>";
    html += "<\/form>";
    html += "<\/body>";
    html += "<\/html>";	    
    oDoc.write(html);
	oDoc.close();
}

function fnPrintImageFile(iframeID, fileData)
{
	var html;
	var oIframe = document.getElementById(iframeID);		
	var oDoc = (oIframe.contentWindow == null ? oIframe.contentDocument : oIframe.contentWindow);
    if (oDoc.document) oDoc = oDoc.document;
	
	if( fnDetectBrowser() == "MSIE" ) {
		$("#" + iframeID).get(0).contentWindow.focus();
		
		html = "<html>";
	    html += "<head><\/head>";
	    html += "<body onload='window.focus(); window.print();'>";
	    html += "<center><img src='" + fileData + "'><\/center>";
	    html += "<\/body>";
	    html += "<\/html>";	    
	    oDoc.write(html);
		oDoc.close();
	} else {
		html = "<html>";
	    html += "<head><\/head>";
	    html += "<body>";
	    html += "<center><img src='" + fileData + "'><\/center>";
	    html += "<\/body>";
	    html += "<\/html>";	    
	    oDoc.write(html);
		oDoc.close();
		
		$("#" + iframeID).get(0).contentWindow.print();
	}
}