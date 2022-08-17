/**
 * 
 */
 var ws;
window.onload = function() {
	getChannel();
}

function getChannel(){ // 채널 리스트 출력
	var msg = { userId : $('#userId').val()	};
	commonAjax('/getChannel', msg , 'post', function(result){
		createChatingChannel(result);
	});
}

function createServer(){	// 클릭시 채널 생성페이지
	var con = document.getElementById("channelNameInput");
    con.style.display = (con.style.display != 'none') ? "none" : "inline-block";
	var big = document.getElementById("bigDiv");
    big.style.display = (big.style.display != 'none') ? "none" : "inline-block";

}
		
function channelCreateName(){ // 채널 생성
	if($("#channelName").val() == null || $('#channelName').val() == ""){ // 입력값이 비었을때
		$("#channelName").attr("placeholder", "이름을 입력해주세요!");
		$("#channelName").focus();
	}else { // 입력값이 있을떄
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
	if(res != null){ // 채팅방이 있을시
		var tag = "";
		if(res.list) { // res에 list 리스트가 있을시
			res.list.forEach(function(d){ // 길이만큼 반복
				$("#channelCode").val(d.channelCode); // d번째 channelCode값 입력
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
		if(Object.keys(res).length === 0) { //채널 삭제시 채널이 없을 경우 실행되는 코드
			$("#channelSpace").empty();
			$("#roomList").empty();
			$("#ChatName").empty().text("채팅방이름");
			$("#chating").empty();
			disconnect();
		}
		if($("#TchannelList").val() != null || $("#TchannelList").val() != "") {
			$("#" + $("#TchannelList").val()).click();
			$("#TchannelList").val("");
		}else {
			if($("#roomList").children().length == 0) { // 채팅방이 없을경우 제일 처음 채팅채널을 선택하게 하는 코드
				$("ul#channelSpace").children(":eq(0)").trigger("click");		
			}else { // 채팅채널을 새로 생성할시 생성한 채널로 이동하는 코드
				$("ul#channelSpace").children(":eq(" + ($("ul#channelSpace").children().length-1) + ")").trigger("click");
				
			}			
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