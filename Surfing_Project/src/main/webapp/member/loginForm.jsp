<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method ="post" action ="<%= request.getContextPath() %>/member/login.jsp">
		ID
		<input type="text" name="user_Id" value="" placeholder="아이디"><br>
		비밀번호
		<input type="password" name="user_Pw" value="" placeholder="비밀번호"><br>
		<input type="submit" value="등록">
	</form>
</body>
</html>