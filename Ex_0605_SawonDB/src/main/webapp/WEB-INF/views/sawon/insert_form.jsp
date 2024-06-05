<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function insert(f) {
				f.action = "insert.do"
				f.submit();
			}
		
		</script>
		
	</head>
	
	<body>
		<form>
	
		<table border="1">
			<tr>
				<th>사번</th>
				<td><input name="sabun"> </td>
			</tr>
			<tr>
				<th>성함</th>
				<td><input name="saname"> </td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input name="sagen"> </td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><input name="deptno"> </td>
			</tr>
			<tr>
				<th>직종</th> 
				<td><input name="sajob"> </td>
			</tr>
			<tr>
				<th>입사일</th>
				<td><input name="sahire"> </td>
			</tr>
			<tr>
				<th>담당자</th>
				<td><input name="samgr"> </td>
			</tr>
			<tr>
				<th>월급</th>
				<td><input name="sapay"> </td>
			</tr>

			<tr>
				<th>
					<input type="button" value="수정" onclick="insert(this.form);">
				</th>
			</tr>
		</form>
	</body>
</html>