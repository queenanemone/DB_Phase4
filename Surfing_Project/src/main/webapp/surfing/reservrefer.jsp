<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��ȸ â</title>
</head>
	<h2>������ ���̵� �Է��ϼ���</h2>
	<body>
		<form method ="post" action ="<%= request.getContextPath() %>/surfing/reservresult.jsp">
			ID
			<input type="text" name="user_Id" value="" placeholder="ID"><br>
			<input type="submit" value="��ȸ">
		</form>
	</body>
	<ul>
		<li><a href="<%= request.getContextPath()%>/surfing/index.jsp">�ڷ� ����</a></li>
		<li><a href="<%= request.getContextPath()%>/main.jsp">��������</a></li>
	</ul>
</html>