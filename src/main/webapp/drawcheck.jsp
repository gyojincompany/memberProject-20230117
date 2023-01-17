<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String mid = request.getParameter("userID");
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
		String username = "root";
		String password = "1234";	
		
		String sql="DELETE FROM join_member WHERE id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt;
		
		try {
			Class.forName(driverName);//드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			
			int dbCheck = pstmt.executeUpdate(sql);//삭제 성공하면 1 아니면 다른 값을 반환
			
			if (dbCheck == 1) {
				//탈퇴성공
				response.sendRedirect("drawSuccess.jsp");
			} else {
				//탈퇴실패
				response.sendRedirect("drawErr.jsp");
			}
			
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>