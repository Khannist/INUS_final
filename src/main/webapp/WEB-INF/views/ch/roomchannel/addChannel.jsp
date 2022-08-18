<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userId" var="userid" />
	<sec:authentication property="principal.nickname" var="username" />
	<sec:authentication property="principal.email" var="useremail" />
	<input type="hidden" id="userId" name="userId" value="${userid}">
	<input type="hidden" name="username" id="username" value="${username}">
</sec:authorize>
<div class="bigDiv" id="bigDiv" style="display: none;">
	<div id="channelNameInput" style="display: none;">
		<div id="channelThumbFrame">
		</div>
		<p id="textchannel">채널 이름</p>
		<input type="text" name="channelName" id="channelName" placeholder="${username}님의 채널" maxlength="20">
		<!-- channelCreateName함수 지우기 -->
		<input type="button" name="inputChannelName" class="inputChannelName" id="inputChannelName" value="채널생성" onclick="channelCreateName();">
		<input type="button" name="NotinputChannelName" class="inputChannelName" id="NotinputChannelName" value="돌아가기" onclick="createServer();">
	</div>
</div>

</body>
</html>