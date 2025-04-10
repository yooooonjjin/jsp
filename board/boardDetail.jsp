<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->    
<%@ include file="/include/dbcon.jsp" %>

<!-- 파라메터 값 설정 -->
<%
String seqid = request.getParameter("seqid");

if( seqid == null || seqid.equals("") ) {
%>
	<script>
		alert("잘못된 접근입니다!!");
		location="boardList.jsp";
	</script>
<%	
	return;
}

int result = stmt.executeUpdate
			("update nboard set hits = hits+1 where seqid='"+seqid+"'");

if( result == 0 ) {
%>
	<script>
		alert("잘못된 접근입니다!!");
		location="boardList.jsp";
	</script>
<%	
	return;
}

String sql	= " select	title  								"
        	+ "       	,writer  							"
        	+ "       	,content							"
        	+ "       	,hits								"
        	+ "       	,to_char(rdate, 'yyyy-mm-dd') rdate	"
        	+ "       	,to_char(udate, 'yyyy-mm-dd') udate	"
        	+ " from 										"
        	+ "			nboard 								"
        	+ " where										"
        	+ "			seqid='"+seqid+"'					";

ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title	= rs.getString("title");
String writer	= rs.getString("writer");
String content	= rs.getString("content");
String hits		= rs.getString("hits");
String rdate	= rs.getString("rdate");
String udate	= rs.getString("udate");

if( udate == null ) {
	udate = "변경 날짜가 없습니다.";
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 화면</title>
<link rel = "stylesheet" href="/css/style.css" />
<script src="/js/fn_script.js"></script>
</head>

<style>
	td {
		text-align : left;
		padding-left : 5px;
	}
</style>

<body>

<div class="div_title">게시판 상세 화면</div>


<div class="div_top_button">
    <button type="button" onClick="location='boardList.jsp'">목록</button>
    <button type="button" onClick="location='boardModify.jsp?seqid=<%=seqid %>'">수정</button>
    <button type="button" onClick="location='passWrite.jsp?seqid=<%=seqid %>'">삭제</button>
</div>

<table>
	<colgroup>
		<col width="20%" />
		<col width="*" />
	</colgroup>
	<tr>
		<th><label for="title">제목</label></th>
		<td><%=title %></td>
	</tr>
	<tr>
		<th><label for="writer">글쓴이</label></th>
		<td><%=writer %></td>
	</tr>
	<tr>
		<th><label for="content">내용</label></th>
		<td>
			<div class="div_content_area">
				<%=content %>
			</div>
		</td>
	</tr>
	<tr>
		<th><label for="hits">조회수</label></th>
		<td><%=hits %></td>
	</tr>
	<tr>
		<th><label for="rdate">등록일</label></th>
		<td><%=rdate %></td>
	</tr>
	<tr>
		<th><label for="udate">변경일</label></th>
		<td><%=udate %></td>
	</tr>
</table>


</body>
</html>