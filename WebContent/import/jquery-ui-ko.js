jQuery(function($){
	var __contextPath = "../";
	
	$.datepicker.regional['ko'] = {
		closeText: '닫기'
		, prevText: '이전달'
		, nextText: '다음달'
		, currentText: '오늘'
		, changeYear: true
		, changeMonth: true
		, monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	 	, monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	 	, dayNames: ['일','월','화','수','목','금','토']
	 	, dayNamesShort: ['일','월','화','수','목','금','토']
	 	, dayNamesMin: ['일','월','화','수','목','금','토']
	 	, showOn: 'button'
	 	, yearRange: '2000:+2'
	 	, buttonImage: __contextPath + 'images/comm/post1.gif'
	 	, buttonImageOnly: true
	 	, weekHeader: 'Wk'
	 	, dateFormat: 'yy-mm-dd'
	 	, onClose : function(dateText) {
	 	}
	};
	
	$.datepicker.setDefaults($.datepicker.regional['ko']);
});