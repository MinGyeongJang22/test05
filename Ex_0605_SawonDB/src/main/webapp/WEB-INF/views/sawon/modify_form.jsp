<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function update(f) {
				f.action = "update.do"
				f.submit();
			}	
		</script>
		
	</head>
	
	<body>
		<form>
			<input type="hidden" name="before_sabun" value="${vo.sabun}"> 
			<table border="1">
				<tr>
					<th>사번</th>
					<td><input name="sabun" value="${vo.sabun}"> </td>
				</tr>
				<tr>
					<th>성함</th>
					<td><input name="saname" value="${vo.saname}"> </td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input name="sagen" value="${vo.sagen}"> </td>
				</tr>
				<tr>
					<th>부서번호</th>
					<td><input name="deptno" value="${vo.deptno}"> </td>
				</tr>
				<tr>
					<th>직종</th>
					<td><input name="sajob" value="${vo.sajob}"> </td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input name="sahire" value="${vo.sahire}"> </td>
				</tr>
				<tr>
					<th>담당자</th>
					<td><input name="samgr" value="${vo.samgr}"> </td>
				</tr>
				<tr>
					<th>월급</th>
					<td><input name="sapay" value="${vo.sapay}"> </td>
				</tr>
				
				<tr>
					<td>
						<input type="button" value="수정" onclick="update(this.form);">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>