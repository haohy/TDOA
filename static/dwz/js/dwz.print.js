<<<<<<< HEAD
/**
 * @author ZhangHuihua@msn.com
 * 
 */
(function($){
	$.printBox = function(rel){
		var _printBoxId = 'printBox';
		var $contentBox = rel ? $('#'+rel) : $("body"),
			$printBox = $('#'+_printBoxId);
			
		if ($printBox.size()==0){
			$printBox = $('<div id="'+_printBoxId+'"></div>').appendTo("body");
		}

		$printBox.html($contentBox.html()).find("[layoutH]").height("auto");
		window.print();

	}

})(jQuery);
=======
/**
 * @author ZhangHuihua@msn.com
 * 
 */
(function($){
	$.printBox = function(rel){
		var _printBoxId = 'printBox';
		var $contentBox = rel ? $('#'+rel) : $("body"),
			$printBox = $('#'+_printBoxId);
			
		if ($printBox.size()==0){
			$printBox = $('<div id="'+_printBoxId+'"></div>').appendTo("body");
		}

		$printBox.html($contentBox.html()).find("[layoutH]").height("auto");
		window.print();

	}

})(jQuery);
>>>>>>> f41086b3477dec126aff19d257158dc3d3221e97
