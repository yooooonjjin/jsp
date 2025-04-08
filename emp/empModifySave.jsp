<%@page import="java.sql.ResultSet"%>
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
 
 if( sno == null || 
     snm == null || 
     sno.length() != 4 || 
     snm.equals("") ) 
 {
%>
		<script>
		alert("올바른 접근이 아닙니다!!!");
		location = "empList.jsp";
		</script>
<% 
		return;   // jsp 종료
 }
 
 // 사원번호의 존재여부
 String sql = "select count(*) from emp where empno='"+sno+"'";
 ResultSet rs = stmt.executeQuery(sql);
 rs.next();
 int cnt = rs.getInt(1);
 if( cnt == 0 ) {
 %>
		<script>
		alert("다시 시도해주세요.");
		location="empList.jsp";
		</script> 
 <% 
 		return;
 }
 
 String sql2 = "UPDATE emp SET   ENAME='"+snm+"'    "
			 + "				,JOB='"+job+"' 	    "
		     + "				,MGR='"+mgr+"'      "
		     + "				,HIREDATE='"+hdt+"' "
		     + "				,SAL='"+sal+"'      "
		     + "				,COMM='"+com+"'     "
		     + "				,DEPTNO='"+dno+"'   "
		     + "   WHERE "
		     + "    	EMPNO='"+sno+"' ";

  int result = stmt.executeUpdate(sql2);
  if( result == 1 ) {
  %>
  		<script>
  		alert("수정완료!");
  		location="empList.jsp";
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




