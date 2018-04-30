jQuery(function($){
	var __contextPath = "./";
	
	$.datepicker.regional['ko'] = {
		closeText: '�ݱ�'
		, prevText: '������'
		, nextText: '������'
		, currentText: '����'
		, changeYear: true
		, changeMonth: true
		, monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��']
	 	, monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��']
	 	, dayNames: ['��','��','ȭ','��','��','��','��']
	 	, dayNamesShort: ['��','��','ȭ','��','��','��','��']
	 	, dayNamesMin: ['��','��','ȭ','��','��','��','��']
	 	, showOn: 'button'
	 	, yearRange: '2000:+2'
	 	, buttonImage: __contextPath + 'post1.gif'
	 	, buttonImageOnly: true
	 	, weekHeader: 'Wk'
	 	, dateFormat: 'yy-mm-dd'
	 	, onClose : function(dateText) {
	 	}
	};
	
	$.datepicker.setDefaults($.datepicker.regional['ko']);
});