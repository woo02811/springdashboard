<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>순번</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="vs"><!-- varStatus로 현재 아이템이나 순번을 알수있음 -->
				<tr>
					<td>${vs.count}</td>
					<td><a href="/board/view?bno=${list.bno} ">${list.title}</a></td>
					<td>${list.regDate}</td>
					<td>${list.writer}</td>
					<td>${list.viewCnt}</td>
				</tr>

			</c:forEach>
			
		</tbody>
	</table>
	<br>
	<a href="/">이전</a>
	<br><br>
	<a href="${path}/board/pdf?bno=${view.bno}">PDF</a>
</body>
</html>