<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��ȸ â</title>
	<style>
		h2{
			color: blue;
		}
		.box{
			border: 1px solid red;
			padding: 10px;
		}	
	</style>
</head>
	<h2>������ ���̵� �Է��ϼ���</h2>
	<body>
		<form method ="post" action ="<%= request.getContextPath() %>/surfing/reservresult.jsp">
			ID
			<input type="text" name="user_Id" value="" placeholder="ID"><br><br>
			
			<input type="submit" value="��ȸ">
		</form>
	</body><br>
	<div class = "box">
		����� ���ǻ��� : ������ �ƴ� ���̵� �Է��ϼž� �˴ϴ�!<br>
		��ҹ��� �����ؼ� �����ּž� �մϴ�!
	</div>
</html>