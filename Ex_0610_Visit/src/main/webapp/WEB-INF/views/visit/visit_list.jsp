<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- vs 패키지 경로를 못찾는 경우
			${pageContext.request.contextPath}/resources/css... -->
		<link rel="stylesheet" href="/vs/resources/css/visit.css">
		
		<script src="/vs/resources/js/httpRequest.js"></script>
		
		<script>
			function modify(f) {
				let idx = f.idx.value;
				let pwd = f.c_pwd.value;
				
				let url = "modify_pwd_chk.do";
				let param = "idx="+idx+"&pwd="+encodeURIComponent(pwd);
				
				sendRequest(url, param, resultModify, "post");
			}
		
			function resultModify() {
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					let json = (new Function('return '+data))();
						
					if(json[0].result == 'no'){
						alert("비밀번호 불일치");
						return;
					}else{
						//json으로 넘겨받은 idx값을 가지고 수정 폼으로 이동
						location.href="modify_form.do?idx="+json[0].idx;
					}
				}
			}
		
		 	function del(f) {
				let idx = f.idx.value; 
				let c_pwd = f.c_pwd.value; // 입력받은 비밀번호
				
				let url = "delete.do";
				let param = "idx="+idx+"&pwd="+encodeURIComponent(c_pwd);
				
				sendRequest(url, param, resultFn, "post");
			}
		
		 	function resultFn() {
				if(xhr.readyState == 4 && xhr.status == 200){
					
					let data = xhr.responseText;
					let json = (new Function('return ' + data))();
					
					if(json[0].result == 'no'){
						alert("비밀번호 불일치");
						return;
					}else if(json[0].result == 'fail'){
						alert("삭제 실패");
						return;
					}else{
						alert("삭제 성공");
						location.href="list.do";
					}
				}
			}
		</script>
		
	</head>
	
	<body>
		<div id="main_box">
			<h1>::: 방명록 :::</h1>
			
			<div align="center">
				<input type="button" value="글쓰기" onclick="location.href='insert_form.do'">
			</div>
			
			<c:forEach var="vo" items="${list}">
				
				<div class="visit_box">
					<div class="type_content">내용  <pre>${vo.content}</pre></div>
					<div class="type_name">작성자 : ${vo.name} ( ${vo.ip} )</div>
					<div class="type_regdate">작성일 : ${vo.regdate}</div>

					<form>
						<input type="hidden" name="idx" value="${vo.idx}">
						<input type="hidden" name="pwd" value="${vo.pwd}">
						비밀번호 <input type="password" name="c_pwd">
						<input type="button" value="수정" onclick="modify(this.form)">
						<input type="button" value="삭제" onclick="del(this.form)">
					</form>
				</div>
				
			</c:forEach>
		</div>
		<p align="center"> ${pageMenu}</p>
	</body>
</html>