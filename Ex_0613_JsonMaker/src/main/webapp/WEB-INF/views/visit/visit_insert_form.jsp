<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f) {
 				let name = f.name.value.trim();
				let content = f.content.value.trim();
				let pwd = f.pwd.value.trim();
				
				if(name == '' || content == '' || pwd == ''){
					alert("모두 입력해주세요.");
					return;
				} 
				
				//유효성 체크 생략
				
				f.action="insert.do";
				f.submit();				
			}
		</script>
		
	</head>
	
	<body>
		<form method="post" enctype="multipart/form-data">
			<table border="1" align="center">
				<caption>::새 글 등록::</caption>
				<tr>
					<th>작성자</th>			
					<td><input name="name"> </td>			
				</tr>
				<tr>
					<th>내용</th>	 <!-- wrap="on" : 내용이 길어 내려간 글을 엔터처럼 보이게 할 경우 -->
					<td><textarea rows="5" cols="50" style="resize: none;" wrap="on" name="content"></textarea> </td>			
				</tr>
				<tr>
					<th>비밀번호</th>			
					<td><input name="pwd" type="password"> </td>			
				</tr>
				<tr>
					<th>첨부파일</th>				
					<td><input type="file" name="photo"></td>				
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="완료" onclick="send(this.form);"> 			
						<input type="button" value="돌아가기" onclick="history.go(-1);"> 
					</td>			
				</tr>
			</table>
		</form>
	</body>
</html>