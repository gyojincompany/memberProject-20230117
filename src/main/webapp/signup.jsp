<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script type="text/javascript">
	function checkFun() {
		
		var f = document.user_info;
		
		if(f.userID.value.length == 0) {
			alert('아이디는 필수 입력사항입니다.');
			return false;
		}
		
		if((f.userID.value.length < 3) || (f.userID.value.length > 15)) {
			alert('아이디는 3자 이상 15자 이하로 입력하세요.');
			return false;
		}
		
		if(f.userPW.value.length == 0) {
			alert('비밀번호는 필수 입력사항입니다.');
			return false;
		}
		
		if(f.userPW.value.length < 4) {
			alert('비밀번호는 4자 이상이어야 합니다.');
			return false;
		}
		
		if(f.userMAIL.value.length == 0) {
			alert('이메일은 필수 입력사항입니다.');
			return false;
		}
		
		return true;
	} 
</script>
</head>
<body>
	<h2>회원 가입</h2>
	<hr>
	<form action="idCheck.jsp">
		아이디 중복체크 : <input type="text" name="idCheck">
		<input type="submit" value="중복체크">		
	</form>
	<hr>
	<form action="insertDB.jsp" method="post" name="user_info" onsubmit="return checkFun()">
		아이디 : <input type="text" name="userID" size="16"><br><br>
		비밀번호 : <input type="password" name="userPW" size="16"><br><br>
		이메일 : <input type="text" name="userMAIL" size="30"><br><br>
		<hr>
		<input type="submit" value="가입하기"> 
		<input type="reset" value="다시작성">
	</form>
</body>
</html>