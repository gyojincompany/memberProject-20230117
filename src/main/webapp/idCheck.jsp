<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String mid = request.getParameter("userID");
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
		String username = "root";
		String password = "1234";		
		
		String sql = "SELECT * FROM join_member WHERE id = '"+mid+"'";
		
		Connection conn;//DB 연결 선언
		Statement stmt;//sql 객체 선언
		ResultSet rs;//결과값 저장 객체 선언
	
		try {
			Class.forName(driverName);//드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);//sql문의 결과 값이 저장(select문이 반환하는 레코드 저장)
			
			while(rs.next()) {
				String db_id =  rs.getString("id");
				String db_pw =  rs.getString("password");
				String db_name =  rs.getString("name");
				String db_email =  rs.getString("email");
				String db_jointime =  rs.getString("jointime");
				
				out.println(db_id + "/" + db_pw + "/" + db_name + "/" + db_email + "/" + db_jointime + "<br>");  
			}
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}				
			if(conn != null) {
				conn.close();
			}
			
			//System.out.println(conn);
		} catch(Exception e) {
			e.printStackTrace();
		} 
	
	%>
</body>
</html>