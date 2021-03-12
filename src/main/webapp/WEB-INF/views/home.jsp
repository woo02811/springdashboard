<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.board.controller.HomeController" %>
<link rel = "stylesheet" href ="/../../../../resources/css/bootstrap.css">
<link rel = "stylesheet" href ="/../../../../resources/css/simple-sidebar.css">
 <%
	HomeController je = new HomeController(); 
	String result = je.jsonEx();
	
%>
<html>
<head>
	<title>Home</title>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<script type="/../../../../resouces/js/bootstrap.js"></script>
</head>

<body>
<!-- <h1>
	Hello DashBoard!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p>
	<a href="/board/listPage?num=1">게시 목록</a>
	<a href="/board/write">게시물 작성</a>
	<a href="/board/listPageSearch?num=1">글조회</a>
</p>	-->
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

<!-- ------------------------- -->  



<div id="wrapper" class="wrapper-content">
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <li class="sidebar-brand">
                <a href="/">
                <img src = "https://img.icons8.com/color/452/spring-logo.png"
                     width="30" height="30" border="0">
                    DashBoard.com "${result}"
                </a>
            </li>
            <li>
            <a class="btn btn-primary" id = "list" onClick ='golist()'>게시 목록</a>

                 
            </li>
            <li>
                <a class="btn btn-primary" id ="write" onClick="gowrite()">게시물 작성</a>
            </li>
            <li>
                <a class="btn btn-primary" id = "search" onClick = "search()">게시글 조회</a>
            </li>
            <!-- <li>
                <a href="#">Events</a>
            </li>
            <li class="active">
                <a href="#">About</a>
            </li>
            <li>
                <a href="#">Services</a>
            </li>
            <li>
                <a href="#">Contact</a>
            </li> -->
        </ul>
    </div>

    <div id="page-content-wrapper">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
            
                 <h1><img src = "https://img.icons8.com/color/452/spring-logo.png"
                     width="50" height="50" border="0"> DashBoard!  </h1>
            </div>
        </nav>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                	
                    <p> Today's Dust!!  <%=result %>.</p>
                    
                </div>
            </div>
        </div>
    </div>
</div>

  <!-- ------------------------- -->

</body>
  <script >
  document.getElementById("list").onclick = function(){
	  //href는 a->b로 이동하는것
	  //replace a가 b로 바뀌는것 replace를 사용하면 이전페이지(history.go(-1))로 갈수없다.
	
		location.replace("/board/listPage?num=1");
	}
  
  document.getElementById("write").onclick = function(){
	  //href는 a->b로 이동하는것
	  //replace a가 b로 바뀌는것 replace를 사용하면 이전페이지(history.go(-1))로 갈수없다.
	
		window.location.href="/board/write";
	}
  
  document.getElementById("search").onclick = function(){
	  //href는 a->b로 이동하는것
	  //replace a가 b로 바뀌는것 replace를 사용하면 이전페이지(history.go(-1))로 갈수없다.
	
		location.replace("/board/listPageSearch?num=1");
	}

  </script>
</html>