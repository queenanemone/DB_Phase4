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
		<input type="text" name="user_Id" value="" placeholder="���̵�"><br>
		��й�ȣ
		<input type="password" name="user_Pw" value="" placeholder="��й�ȣ"><br>
		<input type="submit" value="���">
	</form>
</body>
</html>