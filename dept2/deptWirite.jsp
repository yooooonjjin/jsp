<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- include : 특정 파일 내용을 가져와서 실행하는 설정 -->    
<%@ include file ="/include/dbcon.jsp" %>

<%
String sql = "select nvl(max(deptno),0)+10 from dept2";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int dno = rs.getInt(1);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서정보 등록 화면</title>
</head>
<body>

	<!-- GET : 전송 데이터가 노출됨 -->
	<!-- POST : 전송 데이터가 노출 안됨 -->
	<form name = "frm" method = "post" action = "deptWriteSave.jsp">
		<table border = "1" width = "500">
			<tr>
				<th>부서번호</th>
				<td>
					<input type = "text" name = "deptno" value="<%=dno %>" readonly>
				</td>
			</tr>
			<tr>
				<th><label for = "dname">부서이름</label></th>
				<td>
					<input type = "text" id = "dname" name = "dname" placeholder="부서번호입력" autofocus>
				</td>
			</tr>
			<tr>
				<th><label for = "loc">부서위치</label></th>
				<td>
					<input type = "text" id = "loc" name = "loc" placeholder="부서위치입력">
				</td>
			</tr>
			<tr>
				<th colspan = "2">
					<button type = "submit">등록</button>
					<button type = "reset">취소</button>
					<button type = "button" onClick ="location='deptList.jsp'">목록</button>
					<a href ="deptList.jsp">목록</a>
				</th>
	
			</tr>
			
		</table>
	</form>
</body>
</html>