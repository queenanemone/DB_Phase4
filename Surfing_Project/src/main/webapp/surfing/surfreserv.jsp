<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  import JDBC package -->

<!DOCTYPE html>
<%@page language="java" import="java.text.*, java.sql.*"%><html>
<head>
<meta charset="EUC-KR">
<title>���� �Ϸ� ������</title>
</head>
	<body>
		<%
			String user_Name = request.getParameter("user_Name");	
			String Surf_site = request.getParameter("Surf_Site");
			String MOP = request.getParameter("MOP");
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
			String query1 = "SELECT SSN FROM ACCOUNT WHERE USER_NAME = '" + user_Name + "'";
			System.out.println(query1);
			PreparedStatement pstmt1 = conn.prepareStatement(query1);
			ResultSet rs1 = pstmt1.executeQuery();
			String UN = "qwer";
			while (rs1.next()){
				UN = rs1.getString(1);
			}
			System.out.println(UN);
			String query = "INSERT INTO RESERVATION VALUES('" + UN + "', '" + Surf_site + "', '" + MOP + "', '$34.12')";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			out.println("<h2>������ �Ϸ�Ǿ����ϴ�!</h2>");
			rs.close();
			pstmt.close();
			conn.close();
		%>
	</body>
	<ul>
		<li><a href="<%= request.getContextPath()%>/surfing/reservrefer.jsp">�ڷ� ����</a></li>
		<li><a href="<%= request.getContextPath()%>/main.jsp">��������</a></li>
	</ul>
</html>