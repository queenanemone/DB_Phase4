<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예약 조회 창</title>
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
	<h2>예약한 아이디를 입력하세요</h2>
	<body>
		<form method ="post" action ="<%= request.getContextPath() %>/surfing/reservresult.jsp">
			ID
			<input type="text" name="user_Id" value="" placeholder="ID"><br><br>
			
			<input type="submit" value="조회">
		</form>
	</body><br>
	<div class = "box">
		예약시 주의사항 : 성함이 아닌 아이디를 입력하셔야 됩니다!<br>
		대소문자 구별해서 적어주셔야 합니다!
	</div>
</html>