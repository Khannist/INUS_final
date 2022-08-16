<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="bigDiv" style="display: none;">
	<div id="channelNameInput" >
		<div id="channelThumbFrame">
		</div>
		<p id="textchannel">서버 이름</p>
		<input type="text" name="channelName" id="channelName" placeholder="나연님의 서버" maxlength="20">
		<!-- channelCreateName함수 지우기 -->
		<input type="button" name="inputChannelName" class="inputChannelName" id="RealinputChannelName" value="서버생성" onclick="channelCreateName();">
		<input type="button" name="NotinputChannelName" class="inputChannelName" id="NotinputChannelName" value="돌아가기" onclick="NotchannelCreateName();">
	</div>
</div>

</body>
</html>