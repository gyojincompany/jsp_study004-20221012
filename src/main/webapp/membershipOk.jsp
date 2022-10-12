<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 성공 여부</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String mId = request.getParameter("id");
		String mPw = request.getParameter("pw");
		String mName = request.getParameter("username");
		String mEmail = request.getParameter("email");		
		 
		// out.println(mId);
		// out.println(mPw);
		// out.println(mName);
		// out.println(mEmail);
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/serverdb";
		String username = "root";
		String password = "12345";
		
		String sql = "INSERT INTO members(id, pw, username, email) VALUES ('"+mId+"','"+mPw+"','"+mName+"','"+mEmail+"')";
		
		Connection connection = null;
		Statement stmt = null; 
		
		try {
			Class.forName(driverName); // 드라이버 로딩
			connection = DriverManager.getConnection(url, username, password); // DB 연동
			stmt = connection.createStatement(); // sql문 객체 생성
			
			int dbCheck = stmt.executeUpdate(sql); // 성공하면 1을 반환
			
			if(dbCheck == 1) {
				out.println("회원 가입 성공!!!!!");
			} else {
				out.println("회원 가입 실패!!!!!");
			}
			
		} catch(Exception e) {
			e.printStackTrace();// 에러 발생시 에러 내용을 콘솔창에 출력
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				
				if(connection != null) {
					connection.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	
	%>
	<br><br>	
	<a href="memberlist.jsp">회원리스트 보기</a>
</body>
</html>