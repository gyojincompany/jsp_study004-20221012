<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h3>회원 가입</h3>
	<hr>
	<form action="membershipOk.jsp">
		아이디 : <input type="text" name="id"><br><br>
		비밀번호 : <input type="password" name="pw"><br><br>
		이름 : <input type="text" name="username"><br><br>
		이메일 : <input type="text" name="email"><br><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>