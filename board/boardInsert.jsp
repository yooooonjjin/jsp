<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="/include/dbcon.jsp" %>

<!-- 파라메터 값 설정 -->
<%
String title	= request.getParameter("title");
String pass		= request.getParameter("pass");
String writer 	= request.getParameter("writer");
String content 	= request.getParameter("content");
%>

<!-- 제목, 암호에 대한 null -->
<%
if( title == null 		||
	pass == null 		||
	title.equals("")	||
	pass.equals("") ) 
{
%>
	<script>
		alert("입력 데이터를 다시 확인해 주세요.");
		location="boardList.jsp";
	</script>
<%
	return;
}
%>

<!-- 저장 처리 -->
<%
String sql = "INSERT INTO nboard VALUES"
           + "(nboard_seq.nextval,'"+title+"','"+pass+"','"+writer+"','"+content+"','0',sysdate,'' )";
int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>
	<script>
		alert("저장완료");
		location="boardList.jsp";
		</script>
<%
} else {
%>
	<script>
		alert("저장실패");
		history.back();
	</script>  
<% 
}
%>







