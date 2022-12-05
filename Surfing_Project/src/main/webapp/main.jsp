<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Main Page</title>
</head>
<body>
	<ul>
		<li><a href="<%= request.getContextPath()%>/member/index.jsp">멤버 관리 페이지</a></li>
		<li><a href="<%= request.getContextPath()%>/surfing/index.jsp">서핑</a></li>
		<li><a href="<%= request.getContextPath()%>/member/loginForm.jsp">로그인</a></li>
	</ul>
</body>
</html>