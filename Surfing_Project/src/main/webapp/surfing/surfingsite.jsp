<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method ="post" action ="<%= request.getContextPath() %>/surfing/surfreserv.jsp">
		����
		<input type="text" name="user_Name" value="" placeholder="����"><br>
		������ �̸�
		<input type="text" name="Surf_Site" value="" placeholder="������ �̸�"><br>s
		īī������
		<input type="radio" name="MOP" value="Kakao"><br>
		�ſ�ī��
		<input type="radio" name="MOP" value="Credit"><br>
		�������Ա�
		<input type="radio" name="MOP" value="Bankbook"><br>
		<input type="submit" value="����">
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
		<li><a href="<%= request.getContextPath()%>/surfing/index.jsp">�ڷ� ����</a></li>
		<li><a href="<%= request.getContextPath()%>/main.jsp">��������</a></li>
	</ul>
</body>
</html>