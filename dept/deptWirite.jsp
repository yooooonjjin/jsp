<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<input type = "text" name = "deptno">
				</td>
			</tr>
			<tr>
				<th>부서이름</th>
				<td>
					<input type = "text" name = "dname">
				</td>
			</tr>
			<tr>
				<th>부서위치</th>
				<td>
					<input type = "text" name = "loc">
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