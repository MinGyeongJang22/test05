<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send1(f) {
				//유효성 생략
				f.method = "post";
				f.action = "insert1.do";
				f.submit();
			}
			function send2(f) {
				//유효성 생략
				f.action = "insert2.do";
				f.submit();
			}
		
		</script>
	</head>
	
	<body>
		<form>
			<table border="1" align="conter">
				<caption>::회원가입::</caption>
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input name="age"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="낱개로 전송"
								onclick="send1(this.form);">
						<input type="button" value="객체로 전송"
								onclick="send2(this.form);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>