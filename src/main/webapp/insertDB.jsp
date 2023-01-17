<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
		String mpw = request.getParameter("userPW");		
		String memail = request.getParameter("userMAIL");
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
		String username = "root";
		String password = "1234";
		
		String sql = "INSERT INTO join_member(id, passwd, email) VALUES ('"+mid+"','"+mpw+"','"+memail+"')";
		
		Connection conn = null;//DB 연결 선언
		
		try {
			Class.forName(driverName);//드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			Statement stmt = conn.createStatement();
			
			int dbCheck = stmt.executeUpdate(sql);
			
			if(dbCheck == 1) {
				//out.println("회원 가입 성공!!");
				response.sendRedirect("signupSuccess.jsp");
			} else {
				//out.println("회원 가입 실패!!");
				response.sendRedirect("signup.jsp");
			}
			
			stmt.close();
			
			//System.out.println(conn);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {				
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	%>
	
	
</body>
</html>