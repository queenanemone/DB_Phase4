<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예약 조회 창</title>
</head>
	<h2>예약한 아이디를 입력하세요</h2>
<body>
	<form method ="post" action ="<%= request.getContextPath() %>/surfing/reservresult.jsp">
		ID
		<input type="text" name="user_Id" value="" placeholder="ID"><br>
		<input type="submit" value="조회">
	</form>
</body>
</html>