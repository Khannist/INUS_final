/**
 * 
 */
 
 function delRoom(code, name) {
	var msg = {
		roomCode : code,
		channelCode : $("#channelCode").val()
	};
	if(name == "main") {
		alert("메인 채팅은 지울수 없습니다!");
	}else {
		commonAjax('/delRoom', msg , 'post', function(result){
		createChatingRoom(result);
		$("#roomList").children(":eq(0)").children(":eq(0)").trigger("click");
	});
	}
}