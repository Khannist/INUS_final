/**
 * 
 */
 window.onload = function() {
	getChannel();
	flistLoad();
}
 function flistLoad() {
	var param = {
		userId : $("#userId").val(),
		nickname : $("#username").val()
	}
	
	$.ajax({
		url: "/flist",
		data: param,
		type: "POST",
		contentType :'application/x-www-form-urlencoded; charset=UTF-8',
		success: function (res) {
			res = JSON.parse(res);
			createFriend(res);
		},
		error : function(err){
			console.log('error');
			console.log(err);
		}
	});
	
}

function createFriend(res) {
	if(res != null){
		var tag = "";
		if(res.list) {
			res.list.forEach(function(d){
				tag += "<li>" +
							"<p id='friendMember' style='width:220px;'>" + d.nickname + "</p>" +
						"</li>";
			});
			$("#friend").empty().append(tag);
		}
	}
}