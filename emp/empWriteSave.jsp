<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="/include/dbcon.jsp" %>

<!-- 파라메터 값 (받기)설정 -->
<%
 String sno = request.getParameter("empno");
 String snm = request.getParameter("ename");
 String job = request.getParameter("job");
 String mgr = request.getParameter("mgr");
 String hdt = request.getParameter("hiredate");
 String sal = request.getParameter("sal");
 String com = request.getParameter("comm");
 String dno = request.getParameter("deptno");
%>

<!-- 입력SQL작성 -->
<%
 String sql = "INSERT INTO emp VALUES"
 + "('"+sno+"','"+snm+"','"+job+"','"+mgr+"','"+hdt+"','"+sal+"','"+com+"','"+dno+"')";

 int result = stmt.executeUpdate(sql); 
 if( result == 1 ) {
%>
		<script>
		alert("저장완료!");
		location="empList.jsp";
		</script>
<%
 } else {
%>
		<script>
		alert("저장실패!");
        history.back();
		</script>
<%
 }
%>






