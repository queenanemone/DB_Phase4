<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보</title>
</head>
<body>
<ul>
	<li><a href="index.jsp">뒤로 가기</a></li>
</ul>
	<h2>현재 등록된 회원 정보</h2>
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
	String query = "SELECT USER_NAME, ID, PSSWD, BDATE "
				+ "FROM ACCOUNT";
	System.out.println(query);
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
%>
	<h4>--------------------------------------------</h4>
<%
	out.println("<table border=\"1\">");
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	for (int i = 1; i<=cnt ;i++){
		out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}
	while (rs.next()){
		out.println("<tr>");
		out.println("<td>" + rs.getString(1) + "</td>");
		out.println("<td>" + rs.getString(2) + "</td>");
		out.println("<td>" + rs.getString(3) + "</td>");
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
		Date mgrStartDate = rs.getDate(4);
		String strMSDate = sdfDate.format(mgrStartDate);
		out.println("<td>" + strMSDate + "</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	rs.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>