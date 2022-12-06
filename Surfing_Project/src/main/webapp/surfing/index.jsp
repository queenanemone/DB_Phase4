<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>서핑 메인 페이지</title>
</head>
<body>
	<ul>
		<li><a href="<%= request.getContextPath()%>/surfing/reservrefer.jsp">예약 조회</a></li>
		<li><a href="<%= request.getContextPath()%>/surfing/surfingsite.jsp">서핑장 목록</a></li>
	</ul>
</body>
</html>