<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB 연결 -->
<%@ include file = "/include/dbcon.jsp" %>

<!-- 파라메터 값 연결 -->
<%
String seqid = request.getParameter("seqid");
String pass = request.getParameter("pass");
%>

<!-- null 값 체크 -->
<%
if( seqid == null		||
	pass == null 		||
	seqid.equals("")	||
	pass.equals("")) 
{
%>
	<script>
		alert("잘못된 접근입니다!!");
		location="boardList.jsp";
	</script>
<%
	return;
}
%>
<!-- 출력 SQL 작성 -->
<%
String sql = " SELECT count(*) from nboard where pass ='"+pass+"'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt(1);
if( cnt == 0 ) {
%>
	<script>
		alert("암호를 잘못 입력했습니다.")
		history.back();
	</script>	
<%
}

String sql2	= " DELETE FROM nboard 				"
		 	+ " WHERE							"
		 	+ "				seqid ='"+seqid+"'	"
		 	+ " AND								"
		 	+ "				pass = '"+pass+"'";

int result = stmt.executeUpdate(sql2);
if( result == 0 ) {
%>
	<script>
		alert("잘못된 접근입니다!!");
		location="boardList.jsp";
	</script>
<%
} else {
%>
	<script>
		alert("삭제 완료!!");
		location="boardList.jsp";
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