<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>서핑장 목록</title>
</head>
	<h2>서핑장 목록</h2>
<body>
	<h4>바로 예약</h4>
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
	<%
		String serverIP = "localhost";
		String strSID = "ORCL";
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
		for (int i = 1; i <= cnt; i++){
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
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