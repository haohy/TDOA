function isAfter(obj, str, time){
	console.log('into isAfter');
	var a = $(obj).find(str).text().split('-');
	console.log(a);
	var b = time.split('-');
	console.log(parseInt(a[0]));
	if (parseInt(a[0])>=parseInt(b[0]))
		if (parseInt(a[1])>=parseInt(b[1]))
			if (parseInt(a[2])>=parseInt(b[2]))
				return true;
	return false;
	
}

function isMatch(obj){
	
	var search_str = $('#search_str').val();
	var account = $('#account').val();
	var mission_status = $('#mission_status').val();
	var mission_start_time = $('#mission_start_time').val();
	var mission_end_time = $('#mission_end_time').val();
	var mission_repeat = $('#mission_repeat').val();
	console.log($(obj).find('.mission_name').text()+''+$(obj).find('.account').text()+''+$(obj).find('.mission_status').text());

	if(($(obj).find('.mission_name').text().match(search_str))||(search_str == null)) 

	if(($(obj).find('.account').text() == account)||(account == "所有人")) 

	if(($(obj).find('.mission_status').text() == mission_status)||(mission_status=="任务状态"))

	if((mission_start_time == "")||isAfter(obj, '.mission_start_time', mission_start_time))
// console.log('test--------------');
	if((mission_end_time=="")||(!isAfter(obj, '.mission_end_time', mission_end_time)))

	if(($(obj).find('.mission_repeat').text() == mission_repeat)||(mission_repeat=="按年重复/不重复"))
		//
			return true;
	return false;
}
function printControler(){
	$('#list tr').each(function(){
		if(isMatch(this)){
			$(this).show();
		}
		else{
			$(this).hide();
		}
	})

	// alert(search_str + '' + account + '' + mission_status + '' +mission_start_time + '' + mission_end_time);
}
$("#btn_search").click(function() {
	printControler();
});
$("#account").change(function(){
	printControler();
});
$('#mission_status').change(function(){
	printControler();
});
$('#mission_start_time').blur(function(){
	printControler();
});
$('#mission_end_time').change(function(){
	printControler();
});
$('#mission_repeat').change(function(){
	printControler();
});