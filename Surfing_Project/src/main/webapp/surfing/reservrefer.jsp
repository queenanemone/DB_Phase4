<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method ="post" action ="<%= request.getContextPath() %>/surfing/reservresult.jsp">
		����
		<input type="text" name="user_Id" value="" placeholder="ID"><br>
		<input type="submit" value="��ȸ">
	</form>
</body>
</html>