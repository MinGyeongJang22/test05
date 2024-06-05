<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<table border="1" align="center">
			<tr>
				<td>부서번호</td>
				<td>이름</td>
				<td colspan="3">위치</td>
			</tr>
			
			<c:forEach var="vo" items="${ list }">
				<tr>
					<td>${vo.deptno}</td>
					<td>${vo.dname}</td>
					<td>${vo.loc}</td>
					
					<td>
						<input type="button" value="수정"
								onclick="location.href='modify_form.do?deptno=${vo.deptno}'">
					</td>
						
					<td>
						<input type="button" value="삭제" onclick="location.href='del_dept.do?deptno=${vo.deptno}'">
					</td>
						
				</tr>
			</c:forEach> 
			
			<tr>
				<td colspan="5">
					<input type="button" value="추가" 
							onclick="location.href='insert_form.do'"> <!-- jsp에서 jsp로는 전환이 불가능하다. -->
				</td>
			</tr>
		</table>
	</body>
</html>