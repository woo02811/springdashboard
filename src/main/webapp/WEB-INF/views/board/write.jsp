<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/../../../../resources/css/bootstrap.css">
<link rel="stylesheet" href="/../../../../resources/css/write.css">
<link rel="stylesheet"
	href="/../../../../resources/css/simple-sidebar.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<script type="/../../../../resouces/js/bootstrap.js"></script>
</head>
<body>

	<div id="wrapper" class="wrapper-content">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="/"> <img src = "https://img.icons8.com/color/452/spring-logo.png"
                     width="30" height="30" border="0">DashBoard.com</a></li>
				  <li>
            <a class="btn btn-primary" id = "list" onClick ='golist()'>게시 목록</a>

                 
            </li>
            <li>
                <a class="btn btn-warning" id ="write" onClick="gowrite()">게시물 작성</a>
            </li>
            <li>
                <a class="btn btn-primary" id = "search" onClick = "search()">게시글 조회</a>
            </li>
			</ul>
		</div>

		<div id="page-content-wrapper">
			<nav class="navbar navbar-default">
				<div class="container-fluid"> <h1><img src = "https://img.icons8.com/color/452/spring-logo.png"
                     width="50" height="50" border="0">DashBoard!  </h1></div>
			</nav>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- --------------------------------------------- -->
	<!-- /.modal compose message -->

	<div class="modal show" id="modalCompose">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-header-info">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onClick="history.go(-1)">×</button>
					<h4 class="modal-title">
						<span class="glyphicon glyphicon-pencil"></span> Create Posting
					</h4>
				</div>
				<div class="modal-body">
					<form role="form" class="form-horizontal" method="POST">
						<div class="form-group">
							<label class="col-sm-2" for="inputTo"> <span
								class="glyphicon glyphicon-user"></span>Writer
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="writerIn"
									name="writer" placeholder="writer">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="inputSubject"><span
								class="glyphicon glyphicon-list-alt"></span>Title</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="titleIn"
									name="title" placeholder="Title">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-12" for="inputBody"><span
								class="glyphicon glyphicon-list"></span>Content</label>
							<div class="col-sm-12">
								<textarea class="form-control" id="contentIn" name="content"
									rows="8"></textarea>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						value="BACK" onClick="history.go(-1)" data-dismiss="modal">Cancel</button>

					<button type="submit" class="btn btn-primary ">
						Posting <i class="fa fa-arrow-circle-right fa-lg"></i>
					</button>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal compose message -->

	
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