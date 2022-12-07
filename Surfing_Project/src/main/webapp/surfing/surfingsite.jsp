<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>서핑장 목록</title>
	<style type="text/css">
	.box{
		border:1px solid;
		padding: 10px;
	}
	.box2{
		border:1px solid red;
		padding: 10px;
	}
	</style>
	
</head>
	<h2>서핑장 목록</h2>
<body>
	<h4>바로 예약</h4>
		<div class = "box">
			<form method ="post" action ="<%= request.getContextPath() %>/surfing/surfreserv.jsp">
				성명
				<input type="text" name="user_Name" value="" placeholder="성명"><br>
				서핑장 이름
				<input type="text" name="Surf_Site" value="" placeholder="서핑장 이름"><br>
				카카오페이
				<input type="radio" name="MOP" value="Kakao"><br>
				신용카드
				<input type="radio" name="MOP" value="Credit"><br>
				무통장입금
				<input type="radio" name="MOP" value="Bankbook"><br>
				<input type="submit" value="예약">
			</form>
		</div><br>
		<div class = "box2">
			예약시 주의사항 : 한 계정 당 하나의 예약만 가능합니다!<br>
			요금은 웹사이트로 들어가서 직접 확인해주시면 감사드리겠습니다!
		</div><br>
	<%
		String strSID = "ORCL";
		String serverIP = "localhost";
		String portNum = "1521";
		String user = "surfing";
		String pass = "sfs123";
		String url = "jdbc:oracle:thin:@" + serverIP+":"+portNum+":"+strSID;
		Connection conn = null;
		PreparedStatement pstmt;
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String query = "SELECT * FROM SURFSITE";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		out.println("<th>서핑장 이름</th>");
		out.println("<th>날씨</th>");
		out.println("<th>파도 높이(단위 : m)</th>");
		out.println("<th>웹사이트</th>");
		while (rs.next()){
			out.println("<tr>");
			out.println("<td>" + rs.getString(1) + "</td>");
			out.println("<td>" + rs.getString(2) + "</td>");
			out.println("<td>" + rs.getString(3) + "</td>");
			out.println("<td>" + rs.getString(4) + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
	%>
	<ul>
		<li><a href="<%= request.getContextPath()%>/surfing/index.jsp">뒤로 가기</a></li>
		<li><a href="<%= request.getContextPath()%>/main.jsp">메인으로</a></li>
	</ul>
</body>
</html>