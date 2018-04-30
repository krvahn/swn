function menuSelect(topCode, subCode, subItem, subContent)
{
	_menu_select(topCode, subCode, subItem, subContent, '.', '');
}

function menuSelectWithParam(topCode, subCode, subItem, subContent, param)
{
	_menu_select(topCode, subCode, subItem, subContent, '.', param);
}

function menuSelectWithPath(topCode, subCode, subItem, subContent, contextPath)
{
	_menu_select(topCode, subCode, subItem, subContent, contextPath, '');
}

function menuSelectWithPathAndParam(topCode, subCode, subItem, subContent, contextPath, param)
{
	_menu_select(topCode, subCode, subItem, subContent, contextPath, param);
}

function _menu_select(topCode, subCode, subItem, subContent, contextPath, params)
{
	var leftURL, mainURL, popURL, helpURL;
	
	leftURL = contextPath + "/left.jsp?TOP_CODE=" + topCode + "&SUB_CODE=" + subCode + "&SUB_ITEM=" + subItem + "&SUB_CONTENT=" + subContent;
	mainURL = "";
	popURL = "";
	helpURL = "";
	
	//alert(leftURL);
	
	if( params != null && params.length > 0 ) {
		if( params.indexOf("?") != 0 ) {
			if( params.indexOf("&") == 0 ) {
				params = "?" + params.substr(1, params.length - 1);
			} else {
				params = "?" + params;
			}
		}
	} else {
		params = "";
	}
	
	switch(topCode)
	{
	case "0":
		// 상위 헤더
		switch(subCode)
		{
		case "1":
			leftURL = "";
			mainURL = contextPath + "/page_top/sitemap.jsp";
			break;
			
		case "2":
			leftURL = "";
			mainURL = contextPath + "/page_top/intro.jsp";
			break;
			
		case "3":
			leftURL = "";
			helpURL = contextPath + "/page_top/help.jsp";
			break;
		}
		break;
	case "1":
		// 실시간 수질정보
		switch(subCode)
		{
		case "1":
			leftURL = "";
			popURL = contextPath + "/page_map/WaterNow.html";
			break;
			
		case "2":
			mainURL = contextPath + "/page_real/total_summary.jsp";
			break;
			
		case "3":
			if( subItem.length > 0 ) {
				mainURL = contextPath + "/page_real/plant_summary_process.jsp?WW_CODE=" + subItem;
			} else {
				mainURL = contextPath + "/page_real/total_plant_summary_in.jsp";
			}
			break;
			
		case "4":
			mainURL = contextPath + "/page_real/water_summary.jsp?WW_CODE=" + subItem;
			break;
		}
		break;
		
	case "2":
		// 수질 이력정보
		switch(subCode)
		{
		case "1":
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_history/report_point.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_history/report_range.jsp";
				break;
			}			
			break;			
		case "2":
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_history/trend_point.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_history/trend_range.jsp";
				break;
				
			case "3":
				mainURL = contextPath + "/page_history/trend_plant.jsp";
				break;
				
			case "4":
				mainURL = contextPath + "/page_history/trend_process.jsp";
				break;
				
			case "5":
				mainURL = contextPath + "/page_history/trend_provider.jsp";
				break;
			}
			break;
		case "3":
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_history/alert_history_plant.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_history/alert_history_water.jsp";
				break;
			}			
			break;
		}
		break;
		
	case "3":
		// 정수센터 입력정보
		switch(subCode)
		{
		case "1":
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_manual/lab_day_op_water.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_manual/lab_inout_result_plant.jsp";
				break;
				
			case "3":
				mainURL = contextPath + "/page_manual/lab_baseline_oper.jsp";
				break;
			}
			break;			
		case "2":
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_manual/lab_measure_value_plant_form.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_manual/lab_measure_value_water_form.jsp";
				break;
			}
			break;			
		case "3":
			mainURL = contextPath + "/page_manual/lab_measure_item.jsp";
			break;
		}
		break;
		
	case "4":
		// 게시판
		switch(subCode)
		{
		case "1":
			mainURL = contextPath + "/page_board/board_list.jsp?board_id=notice";
			break;			
		case "2":
			mainURL = contextPath + "/page_board/board_list.jsp?board_id=free";
			break;
		case "3":
			mainURL = contextPath + "/page_board/board_list.jsp?board_id=study";
			break;
		}		
		break;
		
	case "5":
		// 자료실
		switch(subCode)
		{
		case "1":
			mainURL = contextPath + "/page_board/board_list.jsp?board_id=waterwatch";
			break;			
		case "2":
			mainURL = contextPath + "/page_board/board_list.jsp?board_id=law";
			break;
		case "3":
			mainURL = contextPath + "/page_board/board_list.jsp?board_id=trend";
			break;			
		case "4":
			mainURL = contextPath + "/page_board/board_list.jsp?board_id=equip";
			break;			
		case "5":
			mainURL = contextPath + "/page_board/board_list.jsp?board_id=watermanage";
			break;			
		case "6":
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_general/view_water_office.jsp?WW_CODE=" + subContent;
				break;
				
			case "2":
				mainURL = contextPath + "/page_general/view_plant_office.jsp?WW_CODE=" + subContent;
				break;
			}
			break;
		}
		break;
		
	case "6":
		// 운영현황
		switch(subCode)
		{
		case "1":
			mainURL = contextPath + "/page_oper/oper_result_form.jsp";
			break;			
		case "2":
			mainURL = contextPath + "/page_oper/oper_result_list.jsp";
			break;
		}		
		break;
		
	case "99":
		// 관리자 메뉴
		switch(subCode)
		{
		case "1" :
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_system/data_sending_total.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_system/data_sending_office.jsp?WW_TYPE=P&WW_CODE=" + subContent;
				break;
				
			case "3":
				mainURL = contextPath + "/page_system/data_sending_office.jsp?WW_TYPE=W&WW_CODE=" + subContent;
				break;
			}
			break;
		
		case "2" :
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_system/group_manager_list.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_system/user_manager_list.jsp";
				break;
				
			case "3":
				mainURL = contextPath + "/page_system/water_manager_list.jsp";
				break;
			}
			break;
			
		case "3" :
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_system/point_office_list.jsp?WW_TYPE=P&WW_CODE=" + subContent;
				break;
				
			case "2":
				mainURL = contextPath + "/page_system/point_office_list.jsp?WW_TYPE=W&WW_CODE=" + subContent;
				break;
			}
			break;
			
		case "4" :
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_system/measure_item_list.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_system/item_set_plant.jsp";
				break;
				
			case "3":
				mainURL = contextPath + "/page_system/item_set_water.jsp";
				break;
			}
			break;
			
		case "5" :
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_system/status_sub_list.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_system/status_top_list.jsp";
				break;
			}
			break;
			
		case "6" :
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_system/base_line_exec_plant.jsp";
				break;
				
			case "2":
				mainURL = contextPath + "/page_system/base_line_exec_water.jsp";
				break;
			}
			break;
			
		case "7" :
			switch(subItem)
			{
			case "1":
				mainURL = contextPath + "/page_system/sms_send_list.jsp?WW_TYPE=P&WW_CODE=" + subContent;
				break;
				
			case "2":
				mainURL = contextPath + "/page_system/sms_send_list.jsp?WW_TYPE=W&WW_CODE=" + subContent;
				break;
			}
			break;
			
		case "8" :
			mainURL = contextPath + "/page_board/board_list.jsp?board_id=instrument";
			break;
		}
	}
	
	// 왼쪽 화면 설정
	if(leftURL.length > 0) {
		parent.leftFrm.location = leftURL;
	}
	
	// 메인 화면 설정
	if(mainURL.length > 0) {
		parent.mainFrm.location = mainURL + params;
	}
	
	// 팝업 화면 표시
	if( popURL.length > 0 ) {
		window.open(popURL, 'WaterNowMap', 'scrollbars=no, menubar=no, toolbar=no, location=no, status=no, left=0,top=0,width=1268,height=972');
	}
	
	//  도우말 화면 표시
	if( helpURL.length > 0 ) {
		window.open(helpURL, 'WaterNowHelp', 'scrollbars=no, menubar=no, toolbar=no, location=no, status=no, left=0,top=0,width=600,height=518');
	}
}