<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/dbcon.jsp" %>

<%
String seqid = request.getParameter("seqid");

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>암호 입력 화면</title>
	<link rel="stylesheet" href="../css/style.css">
</head>

<script>
function fn_submit() {
	if( document.frm.pass.value == "" ) {
		alert("암호를 입력해주세요."); // 알림창
		document.frm.pass.focus();  // 특정위치에 커서를 위치시킴
		return false;     			// 함수의 종료
	}
	document.frm.submit();
}
</script>
<body>

	 <div class="div_title">
	    암호 입력 화면
	 </div>

	<form name="frm" method="post" action="boardDelete.jsp">
		
		<input type="hidden" name="seqid" value="<%=seqid %>">
	
		<div class="div_top_button">
	 	<!-- return false : submit버튼 기능의 전송기능을 없애는 세팅 -->
	 	<!-- submit버튼 :: 전송기능,{enter}버튼의 인식 -->
	    
		    <button type="submit" onClick="fn_submit(); return false;">삭제</button>
		    <button type="reset">취소</button>
		    <button type="button" onClick="location='boardList.jsp'">목록</button>
	
	 	</div>
	
		<table>
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tr>
				<th><label for="pass">암호</label></th>
				<td><input type="password" id="pass" name="pass" class="input1" placeholder="암호입력" autofocus></td>
			</tr>
		</table>
	</form>

</body>
</html>