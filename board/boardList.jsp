<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="/include/dbcon.jsp" %>

<%
	String sql2 = "select count(*) from nboard";
	ResultSet rs2 = stmt.executeQuery(sql2);
	rs2.next();
	int total = rs2.getInt(1);
	
	int pageRownum = total;
	
	String sql = " select seqid  	"
	           + "       ,title  	"
	           + "       ,writer	"
	           + "       ,hits 		"
	           + "       ,to_char(rdate,'yyyy-mm-dd') rdate "
	           + " from nboard 		"
	           + " order by seqid desc 						";
	ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>일반 게시판 목록 화면</title>
  <link rel="stylesheet" href="../css/style.css" />
</head>

<script>
	function fn_action() {
		location = "boardWrite.jsp"; 
	}
</script> 

<body>
	<div class="div_title">일반 게시판 목록</div>

	<div class="div_top_button">
		<button type="button" onClick="fn_action()">등록</button>
	</div>

	<table border="1">
 	<colgroup>
 		<col width="10%"/>
 		<col width="*"/>
 		<col width="10%"/>
 		<col width="10%"/>
 		<col width="15%"/>
 	</colgroup>
 	<tr>
 		<!-- th:center, bold -->
 		<th>번호</th>
 		<th>제목</th>
 		<th>글쓴이</th>
 		<th>조회수</th>
 		<th>등록일</th>
 	</tr>
 	<%
 	while( rs.next() ) {
 		String seqid	= rs.getString("seqid");
 		String title	= rs.getString("title");
 		String writer	= rs.getString("writer");
 		String hits		= rs.getString("hits");
 		String rdate	= rs.getString("rdate");
 	%>
 	<tr>
 		<td><%=pageRownum %></td>
 		<td style = "text-align:left;">&nbsp;<a href="boardDetail.jsp?seqid=<%=seqid %>"><%=title %></a></td>
 		<td><%=writer %></td>
 		<td><%=hits %></td>
 		<td><%=rdate %></td>
 	</tr>
 	<%
 		pageRownum--;
 	}
 	%>
 </table>

</body>
</html>