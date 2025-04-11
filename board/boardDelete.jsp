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
		alert("입력 데이터를 다시 확인해주세요.");
		location="boardList.jsp";
	</script>
<%
	return;
}
%>
<!-- 출력 SQL 작성 -->
<%
String sql	= " DELETE FROM nboard 				"
		 	+ " WHERE							"
		 	+ "				seqid ='"+seqid+"'	"
		 	+ " AND								"
		 	+ "				pass = '"+pass+"'";

int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>
	<script>
		alert("삭제 완료!!");
		location="boardList.jsp";
	</script>
<%
} else {
%>
	<script>
		alert("삭제 실패!!");
		history.back();	// 이전 화면으로 이동
		//history.go(-1);		// 이전 화면으로 이동
		//history.go(-2);	// 이전 이전 화면으로 이동
		//history.go(1);	// 다음 화면으로 이동
	</script>
<%
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
</head>
<body>

</body>
</html>