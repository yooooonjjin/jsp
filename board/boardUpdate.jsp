<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB 연결 -->
<%@ include file = "/include/dbcon.jsp" %>

<!-- 파라메터 설정 -->    
<%
String seqid = request.getParameter("seqid");
String title	= request.getParameter("title");
String pass		= request.getParameter("pass");
String writer 	= request.getParameter("writer");
String content 	= request.getParameter("content");
%>

<!-- 고유번호, 제목, 암호 null 값 설정 -->
<%
if (seqid == null 		||
	title == null 		||
	pass == null 		||
	seqid.equals("") 	||
	title.equals("") 	||
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

<!-- UPDATE 실행 -->
<%
String sql	= " UPDATE nboard SET	title='"+title+"'		"
			+ "						,writer='"+writer+"'	"
			+ "						,content='"+content+"'	"
			+ " WHERE										"
			+ "						seqid='"+seqid+"'		"
			+ " AND											"
			+ "						pass='"+pass+"'			";

int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>
	<script>
		alert("수정 완료!!");
		location="boardList.jsp";
	</script>
<%
} else {
%>
	<script>
		alert("수정 실패!!");
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