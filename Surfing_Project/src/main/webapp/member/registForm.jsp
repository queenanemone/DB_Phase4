<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>등록</title>
</head>
<body>
	<h3>회원 등록 하기</h3>
<form method ="post" action ="<%= request.getContextPath() %>/member/regist.jsp">
	성명
	<input type="text" name="user_Name" value="" placeholder="이름"><br>
	ID
	<input type="text" name="user_Id" value="" placeholder="아이디"><br>
	비밀번호
	<input type="password" name="user_Pw" value="" placeholder="비밀번호"><br>
	SSN
	<input type="text" name="SSN" value="" placeholder="SSN"><br>
	생일
	<input type="date" name="BDATE" value=""><br>
	남자
	<input type="radio" name="Sex" value="M"><br>
	여자
	<input type="radio" name="Sex" value="F"><br>
	전화번호
	<input type="tel" name="PHONENUMBER" value="" placeholder="전화번호"><br>
	<input type="submit" value="등록">
</form>
	<ul>
		<li><a href="<%= request.getContextPath()%>/member/index.jsp">뒤로 가기</a></li>
		<li><a href="<%= request.getContextPath()%>/main.jsp">메인으로</a></li>
	</ul>
</body>
</html>  