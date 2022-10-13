<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String mId = request.getParameter("id");
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/serverdb";
		String username = "root";
		String password = "12345";
		
		String sql = "DELETE FROM members WHERE id = ?";
		
		Connection connection = null;
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driverName); // 드라이버 로딩
			connection = DriverManager.getConnection(url, username, password); // DB 연동
			pstmt = connection.prepareStatement(sql); // sql문 객체 준비 후 생성
			pstmt.setString(1, mId);			
			
			int dbCheck = pstmt.executeUpdate(); // 성공하면 1을 반환
			
			if(dbCheck == 1) {
				out.println("회원 탈퇴 성공!!!!!");
			} else {
				out.println("회원 탈퇴 실패!!!!!");
			}
			
		} catch(Exception e) {
			e.printStackTrace();// 에러 발생시 에러 내용을 콘솔창에 출력
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
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
	<a href="memberlist.jsp">회원 리스트 보기</a>
</body>
</html>