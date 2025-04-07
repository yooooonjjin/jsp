<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include : 특정 파일 내용을 가져와서 실행하는 설정 -->    
<%@ include file ="/include/dbcon.jsp" %>
    
<%
String deptno = request.getParameter("deptno");

// null	: 부서번호 설정이 안됨
// 공백	: 부서번호가 비어있는 경우
//if( deptno.equals("") || deptno == null ) {	//error
if( deptno == null || deptno.equals("") ) {
%>	
	<script>
		location = "deptList.jsp";
	</script>
<%	
	return;
}

String sqlCnt = "SELECT count(*) FROM dept2 where deptno = '"+deptno+"'";
// 1, 0
ResultSet rsCnt = stmt.executeQuery(sqlCnt);
rsCnt.next();
int cnt = rsCnt.getInt(1);

if( cnt == 0 ) {
%>
	<script>
		alert("없는 부서번호 입니다.");
		location = "deptList.jsp"
	</script>	
<%
	return;
}

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
	<script>
		function fn_delete() {
			//alert("삭제?")					// {알림}창(경고창)
			//if( confirm("1+1=2 맞습니까?") ) {	// {확인/취소} 창
			//	alert("참 잘했어요!!!");		// 확인버튼
			//} else {
			//	alert("다시 풀어보세요!!!");		// 취소버튼
			//}
			
			// 확인 : true ; 취소 : false
			if( confirm("정말 삭제??") ) {
				location = "deptDelete.jsp?deptno=<%=deptno %>";
			} else {
				
			}
		}
	</script>
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
					<button type = "button" onclick="fn_delete()">삭제</button>
				</th>
			</tr>
			
		</table>
	</form>
</body>
</html>