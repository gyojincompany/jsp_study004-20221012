<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
</head>
<body>
	<h3>회원 명단 보기</h3>
	<hr>
	<%
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/serverdb";
		String username = "root";
		String password = "12345";
		
		String sql = "SELECT * FROM members";
		
		Connection connection = null;
		Statement stmt = null; 
		ResultSet rs = null; // select 문이 반환할 데이터를 받아주는 데이터 타입 클래스
		
		
		try {
			Class.forName(driverName); // 드라이버 로딩
			connection = DriverManager.getConnection(url, username, password); // DB 연동
			stmt = connection.createStatement(); // sql문 객체 생성
			
			rs = stmt.executeQuery(sql);//select의 반환 결과물을 ResultSet 클래스로 만든 객체로 받음
			
			while(rs.next()) {
				String m_id = rs.getString("id");
				String m_pw = rs.getString("pw");
				String m_name = rs.getString("username");
				String m_email = rs.getString("email");
				
				out.println(m_id + " | ");
				out.println(m_pw + " | ");
				out.println(m_name + " | ");
				out.println(m_email + "<br>");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();// 에러 발생시 에러 내용을 콘솔창에 출력
		} finally {
			try {		
				if(rs != null) {
					rs.close();
				}
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
</body>
</html>