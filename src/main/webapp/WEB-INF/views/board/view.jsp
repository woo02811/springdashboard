<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	
		<label>제목</label>
		${view.title}<br/>
		<label>작성자</label>
		${view.writer}<br/>
		<label>내용</label>
		${view.content}<br/>
		<div>
			<a href="/board/modify?bno=${view.bno}">게시물 수정</a>
			<a href="/board/delete?bno=${view.bno}">게시물 삭제</a>
			
		</div>
</body>
</html>