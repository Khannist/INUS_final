/**
 * 
 */
window.onload = function() {
	getChannel();
}

function getChannel(){
	var msg = { userId : $('#userId').val()	};
	commonAjax('/getChannel', msg , 'post', function(result){
		createChatingChannel(result);
	});
}

function createRoomName(res) {
	var roomName = "main";
	var resNum = res.list.length-1;
	var msg = {
		channelCode : res.list[resNum].channelCode,	
		roomName : roomName ,
		userId : $('#userId').val()	
	};
	$.ajax({
		url: '/createRoom',
		data: msg,
		type: 'post',
		contentType :'application/x-www-form-urlencoded; charset=UTF-8'
		});
}

function createServer(){	
	var con = document.getElementById("channelNameInput");
    con.style.display = (con.style.display != 'none') ? "none" : "inline-block";
    var big = document.getElementById("bigDiv");
    big.style.display = (big.style.display != 'none') ? "none" : "inline-block";
}

function channelCreateName(){
	if($("#channelName").val() == null || $('#channelName').val() == ""){
		$("#channelName").attr("placeholder", "이름을 입력해주세요!");
		$("#channelName").focus();
	}else {
		var msg = {
		channelName : $('input#channelName').val(),
		userId : $('#userId').val()
		};
		commonAjax('/createChannel', msg, 'post', function(result){
			createChatingChannel(result);
			createRoomName(result);
		});
		
		createServer();
		$("input#channelName").val("");
		$("#channelName").attr("placeholder", $("#username").val()+"님의 서버");
		
	}
}

function createChatingChannel(res){
	if(res != null){
		var tag = "";
		if(res.list) {
			res.list.forEach(function(d){
				$("#channelCode").val(d.channelCode);
				tag += "<li onclick=\"location.href='serverMove?channelList=" + d.channelList + "&userId="+ $("#userId").val() +"'\""+
				" id='"+ d.channelList +"' class='channel'>"+
							"<p type='hidden' name='hiddenChannelCode' value='"+d.channelCode+"'>"+
								"<img class='serverImg' src='https://source.unsplash.com/random'>"+
							"</p>" +
						"</li>";
			});
			$("#channelSpace").empty().append(tag);
		}
	}
	
}

function commonAjax(url, parameter, type, calbak, contentType){
	$.ajax({
		url: url,
		data: parameter,
		type: type,
		contentType :'application/x-www-form-urlencoded; charset=UTF-8',
		success: function (res) {
			res = JSON.parse(res);
			calbak(res);
		},
		error : function(err){
			console.log('error');
			calbak(err);
		}
	});
}



