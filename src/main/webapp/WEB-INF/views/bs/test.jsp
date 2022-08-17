<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/boardInsert" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<td>
				<input type="text" id="inus_userName" name="inus_userName" placeholder="이름">
				<input type="text" id="inus_subject" name="inus_subject" placeholder="제목">
				<input type="text" id="inus_content" name="inus_content" placeholder="내용">
				<input type="file" id="boardimg" name="boardimg">
				<input type="text" id="nickname" name="nickname" placeholder="닉네임">
			</td>
		</tr>
		<tr>
		<td>
				<input type="submit" id="submit" value="저장">
				<input type="button" value="돌아가기" onclick="location='boardList'">
		</td>
		</tr>
	</table>
</form>
</body>
</html>