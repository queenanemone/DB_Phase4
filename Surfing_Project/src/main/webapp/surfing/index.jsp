<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ������</title>
	<style>
		li{
			color: blue;
			text-decoration: underline;
		}
	</style>
</head>
	<h2>������ �� ���� ��ȸ</h2>
<body>
	<ul>
		<li><a href="<%= request.getContextPath()%>/surfing/reservrefer.jsp">���� ��ȸ</a></li>
		<li><a href="<%= request.getContextPath()%>/surfing/surfingsite.jsp">������ ���</a></li>
	</ul>
</body>
</html>