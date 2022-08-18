/**
 * 
 */
  function delChannel(code) {
	var msg = {
		channelCode : code,
		userId : $("#userId").val()
	};

	commonAjax('/delChan', msg , 'post', function(result){
	createChatingChannel(result);
	});		
	$("ul#channelSpace").children(":eq(0)").trigger("click");
	F_closeReplace();
}