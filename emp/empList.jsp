<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 절대경로 --> 
<!-- jsp에서 최상위는 "/"이고 이는 webapp와 동일한 취급 -->
<%@ include file="/include/dbcon.jsp" %>
<%
  String sql2 = "select count(*) from emp";
  ResultSet rs2 = stmt.executeQuery(sql2);
  rs2.next();
  int total = rs2.getInt(1);
  String sql = " select empno  "
             + "       ,ename  "
             + "       ,job    "
             + "       ,deptno "
             + "       ,to_char(hiredate,'yyyy-mm-dd') hiredate "
             + " from emp "
             + " order by hiredate desc ";
  ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>사원정보 목록화면</title>
  <link rel="stylesheet" href="../css/style.css" />
</head>

 <script>
 function fn_action() {
	location = "empWrite.jsp"; 
 }
 </script> 

<body>

 <div class="div_title">
    사원목록
 </div>
 
 <div class="div_top_button">
    <button type="button" onClick="fn_action()">사원등록</button>
 </div>

 <table border="1">
 	<colgroup>
 		<col width="15%"/>
 		<col width="20%"/>
 		<col width="25%"/>
 		<col width="20%"/>
 		<col width="20%"/>
 	</colgroup>
 	<tr>
 		<!-- th:center, bold -->
 		<th>번호</th>
 		<th>사원이름</th>
 		<th>업무</th>
 		<th>부서번호</th>
 		<th>입사일</th>
 	</tr>
 	<%
 	while( rs.next() ) {
 		String sno = rs.getString(1);
 		String snm = rs.getString(2);
 		String job = rs.getString(3);
 		String dno = rs.getString(4);
 		String hdt = rs.getString(5);
 	%>
 	<tr style="cursor : pointer"
 		onclick="location='empDetail.jsp?empno=<%=sno %>'">
 		<td><%=total %></td>
 		<td><%=snm %></td>
 		<td><%=job %></td>
 		<td><%=dno %></td>
 		<td><%=hdt %></td>
 	</tr>
 	<%
 		total--;
 	}
 	%>
 </table>

</body>
</html>