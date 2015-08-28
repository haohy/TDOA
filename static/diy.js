$(function(){
	$('#doers').click(function(){
	    	$("ul[id='doerlist']").toggle();
	    });
    $(":checkbox").click(function(){
    	var doerslist='';
    	var l = $("input:checked").length;
    	for(var i=0; i<l; i++){
    	 	doerslist = doerslist + $("input:checked")[i].value + ",";
    	 	$('#doers')[0].value = doerslist;
    	}
    	if(l==0){
    		$('#doers')[0].value = '';
    	}
    });
  });