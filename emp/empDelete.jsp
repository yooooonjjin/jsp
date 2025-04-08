<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/dbcon.jsp" %>

<%
String empno = request.getParameter("empno");
String pass = request.getParameter("pass");

if( empno == null || pass == null || empno.equals("") || pass.equals("") ) {
%>
	<script>
		alert("잘못된 경로로의 접근!!")
		location = "empList.jsp";
	</script>
<%	
	return;
}

String sql = "select count(*) from adminInfo where pass ='"+pass+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt(1);
if( cnt == 0 ) {
%>
	<script>
		alert("암호를 잘못 입력했습니다.")
		history.back();	// 이전 화면으로 이동
	</script>	
<%
	return;
}

String sql2 = "DELETE FROM emp WHERE empno = '"+empno+"'";
int result = stmt.executeUpdate(sql2);
if( result == 0 ) {
%>   
	<script>
		alert("잘못된 경로로의 접근!!")
		location = "empList.jsp";
	</script> 
<%	
} else {
%>
	<script>
		alert("삭제완료!!")
		location = "empList.jsp";
	</script>
<%
}

%>


