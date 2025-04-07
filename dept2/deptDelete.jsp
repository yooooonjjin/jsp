<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/include/dbcon.jsp" %>  

<%
String deptno = request.getParameter("deptno");
if( deptno == null || deptno.equals("") ) {
%>
	<script>
		alert("잘못된 경로로의 접근입니다.");
		location = "deptList.jsp";
	</script>
<%	
	return;
}


String sql = "DELETE FROM dept2 WHERE deptno = '"+deptno+"'";
int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>    
	<script>
		alert("삭제완료!!")
		location = "deptList.jsp";
	</script>
<%	
} else {
%>
	<script>
		alert("삭제실패!!")
		history.back();
	</script>
<%
}
%>











