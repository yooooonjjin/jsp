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
%>
 
<%
String deptno = request.getParameter("deptno");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

String sql = "UPDATE dept2 set dname = '"+dname+"', loc='"+loc+"' "
		   + " where deptno ='"+deptno+"' ";
int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>
	<script>
	alert("수정완료!");
	location ="deptList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("수정실패!");
	history.back();
	</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>