<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���</title>
</head>
<body>
	<h3>ȸ�� ��� �ϱ�</h3>
<form method ="post" action ="<%= request.getContextPath() %>/member/regist.jsp">
	����
	<input type="text" name="user_Name" value="" placeholder="�̸�"><br>
	ID
	<input type="text" name="user_Id" value="" placeholder="���̵�"><br>
	��й�ȣ
	<input type="password" name="user_Pw" value="" placeholder="��й�ȣ"><br>
	SSN
	<input type="text" name="SSN" value="" placeholder="SSN"><br>
	����
	<input type="date" name="BDATE" value=""><br>
	����
	<input type="radio" name="Sex" value="M"><br>
	����
	<input type="radio" name="Sex" value="F"><br>
	��ȭ��ȣ
	<input type="tel" name="PHONENUMBER" value="" placeholder="��ȭ��ȣ"><br>
	<input type="submit" value="���">
</form>
	<ul>
		<li><a href="<%= request.getContextPath()%>/member/index.jsp">�ڷ� ����</a></li>
		<li><a href="<%= request.getContextPath()%>/main.jsp">��������</a></li>
	</ul>
</body>
</html>  