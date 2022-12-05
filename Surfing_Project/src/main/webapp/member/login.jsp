<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
	<body>
		<%
			String user_Id = request.getParameter("user_Id");
			String user_Pw = request.getParameter("user_Pw");
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
			String query = "SELECT * FROM ACCOUNT WHERE ID = '" + user_Id + "' AND PSSWD = '" + user_Pw + "'";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			int account = 0;
			while (rs.next()){
				account++;
			}
			if (account == 0){
				out.println("<h4>NO ACCOUNT</h4>");
			}
			else{
				out.println("<h4>LOGGED IN</h4>");
			}
		%>
	</body>
		<script>
			location.href = "NewFile.jsp?" + account;
		</script>
	<ul>
		<li><a href="<%= request.getContextPath()%>/main.jsp">메인페이지로</a></li>
	</ul>
</html>