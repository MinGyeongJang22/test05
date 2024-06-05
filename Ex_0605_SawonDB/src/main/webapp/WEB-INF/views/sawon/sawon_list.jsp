<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<form>
			<table border="1">
				<tr>
					<th>사번</th>
					<th>성함</th>
					<th>성별</th>
					<th>부서번호</th>
					<th>직종</th>
					<th>입사일</th>
					<th>담당자</th>
					<th>월급</th>
				</tr>
				
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.sabun}</td>				
						<td>${vo.saname}</td>				
						<td>${vo.sagen}</td>				
						<td>${vo.deptno}</td>				
						<td>${vo.sajob}</td>				
						<td>${vo.sahire}</td>				
						<td>${vo.samgr}</td>				
						<td>${vo.sapay}</td>	
						
						<td>
							<input type="button" value="수정" onclick="location.href='modify_form.do?sabun=${vo.sabun}'">
							<input type="button" value="삭제" onclick="location.href='delete.do?sabun=${vo.sabun}'">
						</td>			
					</tr>
				</c:forEach>
	
				<tr>
					<td>
						<input type="button" value="추가" onclick="location.href='insert_form.do'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>