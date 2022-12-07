<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Main Page</title>
</head>
	<h1>THIS IS OUR PHASE4 WEBSITE</h1>
<body>
	<ul>
		<li><a href="<%= request.getContextPath()%>/member/index.jsp">멤버 관리 페이지</a></li>
		<li><a href="<%= request.getContextPath()%>/surfing/index.jsp">서핑</a></li>
		<li><a href="<%= request.getContextPath()%>/member/loginForm.jsp">로그인(Not Completed)</a></li>
	</ul>
</body>
</html>