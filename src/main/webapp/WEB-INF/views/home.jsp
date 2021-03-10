<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello DashBoard!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p>
	<a href="/board/listPage?num=1">게시 목록</a>
	<a href="/board/write">게시물 작성</a>
	<a href="/board/listPageSearch?num=1">글조회</a>
</p>	
	<!--  <form name="fomr1" method="post">
	<table>
		<tr>
			<td>아이디<input name="Id" id="Id"></input></td>
		</tr>
		<tr>
			<td>패스워드<input name="pw" id="pw"></input></td>
		</tr>
		<tr>
			<td><button type="button" id ="loginbtn">로그인</button></td>
		</tr>
	</table>
	</form>-->


</body>
</html>
