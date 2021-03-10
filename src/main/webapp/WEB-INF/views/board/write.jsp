<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성</title>
</head>
<body>

	<form method="POST">
		<label>제목</label> 
		<input type="text" name="title" id="titleIn" /><br /> 
		<label>작성자</label>
		<input type="text" name="writer" id="writeIn" /><br /> 
		<label>내용</label>
		<textarea cols="50" rows="5" name="content" id="contentIn"></textarea><br />
		<button type="submit">작성</button>
	</form>
</body>
</html>