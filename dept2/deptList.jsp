<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include : 특정 파일 내용을 가져와서 실행하는 설정 -->    
<%@ include file ="/include/dbcon.jsp" %>
  
<%
String sql = "SELECT deptno,dname,loc FROM dept2 ORDER BY upper(dname)";
ResultSet rs = stmt.executeQuery(sql);
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 목록화면</title>
</head>
<body>	
	<table border = "1" width="500">
		<tr>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>			
		</tr>
		<%
		while( rs.next() ) {
			String dno = rs.getString("deptno");
			String dnm = rs.getString("dname");
			String loc = rs.getString("loc");		
		%>
		<tr align = "center">
			<td><%=dno %></td>
			<td><a href = "deptModify.jsp?deptno=<%=dno %>"><%=dnm %></a></td>
			<td><%=loc %></td>					
		</tr>
		<%
		}
		%>
	</table>
	<p>
		<!-- onClick : 자바스크립트 -->
		<!-- location : 페이지 이동 명령 -->
		<button type = "button" onClick ="location='deptWirite.jsp'">부서등록</button>
	</p>
</body>
</html>      