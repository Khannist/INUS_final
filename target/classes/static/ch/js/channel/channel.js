/**
 * 
 */
 var ws;
window.onload = function() {
	getChannel();
}

function getChannel(){
	var msg = { userId : $('#userId').val()	};
	commonAjax('/getChannel', msg , 'post', function(result){
		createChatingChannel(result);
	});
}

function createServer(){	
	var con = document.getElementById("channelNameInput");
    con.style.display = (con.style.display != 'none') ? "none" : "inline-block";
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
		});
		var con = document.getElementById("channelNameInput");
		con.style.display = "none";
		$("input#channelName").val("");
		$("#channelName").attr("placeholder", "채널 이름 입력");
	}
	
}


function goChannel(code, name, id, chanName){
	
	$("#roomList").empty();
	$("#ChatName").empty().text(name);
	var msg = {
		channelCode : code,
		channelName : name,
		userId : id,
		roomNumber : "1"
	}
	
	$("#channelCode").val(code);
	
	commonAjax('/moveRoom', msg, 'post', function(result){
		getRoom(result);
	});
	$(".ServerReplace ul").children('li:eq(0)').attr("onclick","inviteUser(\""+ code +"\")");
	$(".ServerReplace ul").children('li:eq(2)').attr("onclick","delChannel(\""+ code +"\")");
	$(".serverImg").css({"border":"2px solid white"});
	$("#"+chanName + " .serverImg").css({"border":"2px solid yellow"});
}

function createChatingChannel(res){
	if(res != null){
		var tag = "";
		if(res.list) {
			res.list.forEach(function(d, idx){
				$("#channelCode").val(d.channelCode);
				var cn = d.channelName;
				tag += "<li onclick='goChannel(\""+d.channelCode+"\", \""+cn+"\",\""+d.userId+"\",\""+d.channelList+"\")' "+
				" id='"+ d.channelList +"' class='channel'>"+
							"<p type='hidden' name='hiddenChannelCode' value='"+d.channelCode+"'>"+
								"<img class='serverImg' src='https://source.unsplash.com/random'>"+
							"</p>" +
						"</li>";
			});
			checkRoom(res);
			
			$("#channelSpace").empty().append(tag);
		}
		if(Object.keys(res).length === 0) {
			$("#channelSpace").empty();
			$("#roomList").empty();
			$("#ChatName").empty().text("채팅방이름");
			$("#chating").empty();
			disconnect();
		}
		if($("#roomList").children().length == 0) {
			$("ul#channelSpace").children(":eq(0)").trigger("click");		
		}else {
			$("ul#channelSpace").children(":eq(" + ($("ul#channelSpace").children().length-1) + ")").trigger("click");
			
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