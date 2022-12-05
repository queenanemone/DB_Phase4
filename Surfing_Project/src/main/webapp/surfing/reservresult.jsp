<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예약 조회 목록</title>
</head>
<body>
	<%
		String user_Id = request.getParameter("user_Id");
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
		String query = "SELECT SURFSITE_ID, MOP, TOTAL_FEE FROM RESERVATION WHERE USER_SSN = (SELECT SSN FROM ACCOUNT WHERE USER_NAME = '" + user_Id + "')";
		System.out.println(query);
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
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		conn.close();
	%>
	<ul>
		<li><a href="<%= request.getContextPath()%>/surfing/reservrefer.jsp">뒤로 가기</a></li>
		<li><a href="<%= request.getContextPath()%>/main.jsp">메인으로</a></li>
	</ul>
</body>
</html>