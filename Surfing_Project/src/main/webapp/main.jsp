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
		<li><a href="<%= request.getContextPath()%>/member/index.jsp">��� ���� ������</a></li>
		<li><a href="<%= request.getContextPath()%>/surfing/index.jsp">����</a></li>
		<li><a href="<%= request.getContextPath()%>/member/loginForm.jsp">�α���(Not Completed)</a></li>
	</ul>
</body>
</html>