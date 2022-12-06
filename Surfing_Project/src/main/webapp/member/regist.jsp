<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>등록 완료 페이지</title>
</head>
	<body>
		<%
			String user_Name = request.getParameter("user_Name");
			String user_Id = request.getParameter("user_Id");
			String user_Pw = request.getParameter("user_Pw");
			String SSN = request.getParameter("SSN");
			String BDATE = request.getParameter("BDATE");
			String Sex = request.getParameter("Sex");
			String PHONENUMBER = request.getParameter("PHONENUMBER");
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
			String query = "INSERT INTO ACCOUNT VALUES ('" + user_Name + "', '" + user_Id + "', '" + user_Pw + "', '" + SSN + "', TO_DATE('" + BDATE + "', 'yyyy-mm-dd'), '" + Sex + "', '" + PHONENUMBER + "', NULL)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
		%>
	</body>
		<h2>등록이 완료되었습니다!</h2>
	<ul>
		<li><a href="<%= request.getContextPath()%>/member/registform.jsp">뒤로 가기</a></li>
		<li><a href="<%= request.getContextPath()%>/main.jsp">메인으로</a></li>
	</ul>
</html>