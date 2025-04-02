<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String url = "jdbc:oracle:thin:@//localhost:1521/orcl7";
String username = "c##java";
String userpass = "1234";

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection(url, username, userpass);
Statement stmt = con.createStatement();

String deptno = request.getParameter("deptno");

String sql = "SELECT deptno,dname,loc from dept2 where deptno = '"+deptno+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

String dname = rs.getString("dname");
String loc = rs.getString("loc");
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name = "frm" method = "post" action = "deptModifySave.jsp">
		<table border = "1" width = "500">
			<tr>
				<th>부서번호</th>
				<td>	
					<!-- readonly : 입력 상자는 활성 상태로 두고 쓰기를 막음 (전송 가능) -->			
					<!-- disabled : 입력 상자를 비활성 상태로 만들고 쓰기를 막음 (전송 안됨) -->			
					<input	type = "text"
							name = "deptno"
							value="<%=deptno %>"
							readonly>
				</td>
			</tr>
			<tr>
				<th>부서이름</th>
				<td>
					<input type = "text" name = "dname" value="<%=dname %>">
				</td>
			</tr>
			<tr>
				<th>부서위치</th>
				<td>
					<input type = "text" name = "loc" value="<%=loc %>">
				</td>
			</tr>
			<tr>
				<th colspan = "2">
					<button type = "submit">수정</button>
					<button type = "reset">취소</button>
				</th>
	
			</tr>
			
		</table>
	</form>
</body>
</html>