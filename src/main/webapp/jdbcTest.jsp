<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연결 테스트</title>
</head>
<body>
	<%
		// mysql에 접속하는데 필요한 4개 변수 선언(driver, url, 계정id, 계정pass)
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/serverdb";
		String username = "root";
		String password = "12345";
		
		Connection connection = null;
		
		try{
			Class.forName(driverName); // 드라이버 불러오기
			
			connection = DriverManager.getConnection(url, username, password);// DB 연동
			out.println("연결성공!!!");
			out.println(connection);
		} catch(Exception e) {
			
			out.println("연결실패!!!");
		} finally {			
			try {
				if(connection != null) {
					connection.close();
				}
			} catch(Exception e) {
				
			}
		}
	
	
	%>
</body>
</html>