<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="/include/dbcon.jsp" %>

<%
String page1 = request.getParameter("page");	// 무조건 String
if ( page1 == null ) {
	page1 = "1";
}
// String -> int 형변환
// pageIndex => 츨력 페이지 번호
int pageIndex = Integer.parseInt(page1);

int unit = 7;
%>

<%
	String sql2 = "select count(*) from nboard";
	ResultSet rs2 = stmt.executeQuery(sql2);
	rs2.next();
	int total = rs2.getInt(1);
	
	// (double)13/10 -> 13.0/10 -> Math.ceil(1.3) -> (int)2.0
	int totalpage = (int) Math.ceil((double)total/unit);
	
	// 출력 페이지의 시작 (행)번호
	int pageRownum = total - (pageIndex-1)*unit;
	
	// 1 page ->  1, 10
	// 2 page -> 11, 20
	// 3 page -> 21, 30
	// ex)	2 page -> 11, 3 page -> 21
	//		(2-1)*10+1 -> 11, (3-1)*10+1 -> 21
	int firstIndex = (pageIndex-1)*unit+1;
	int lastIndex = firstIndex+(unit-1);
	
	String sql 	= "select b.* from (								\n"
				+ "	select rownum rn, a.* from (					\n"
				+ "		select	seqid  								\n"
				+ "				,title  							\n"	
				+ "				,writer								\n"
				+ "				,hits 								\n"
				+ "				,to_char(rdate,'yyyy-mm-dd') rdate	\n"
				+ "		from										\n"
				+ "				nboard 								\n"
				+ "		order by									\n"
				+ "				seqid desc ) a ) b					\n"
				+ "where											\n"
				+ "		rn >= "+firstIndex+" and rn <= "+lastIndex+"  ";
				
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
	<div class="div_title">
		일반 게시판 목록
	</div>

	<div class="div_top_button">
		<button type="button"onClick="fn_action()">등록</button>
	</div>

	<table>
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
 
  <div class = "div_page">
  	<%
  	for( int p=1; p<=totalpage; p++ ) {
  	%>
  		<a href="boardList2.jsp?page=<%=p %>"><%=p %></a>
  	<%
  	}
  	%>
  </div>


</body>
</html>