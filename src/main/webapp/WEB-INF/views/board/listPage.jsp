<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/../../../../../resources/css/bootstrap.css" />
<link rel="stylesheet" href="/../../../../../resources/css/testboot.css" />
<link rel="stylesheet"
	href="/../../../../../resources/css/simple-sidebar.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"
	integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY="
	crossorigin="anonymous" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<script type="/../../../../../resouces/js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>

	<div id="wrapper" class="wrapper-content">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="/"> <img src = "https://img.icons8.com/color/452/spring-logo.png"
                     width="30" height="30" border="0">DashBoard.com </a></li>
				<li><a class="btn btn-warning" id="list" onClick='golist()'>게시
						목록</a></li>
				<li><a class="btn btn-primary" id="write" onClick="gowrite()">게시물
						작성</a></li>
				<li><a class="btn btn-primary" id="search" onClick="search()">게시글
						조회</a></li>
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
                     width="50" height="50" border="0">DashBoard!</h1>
				</div>
			</nav>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">

						<div class="container">
							<div class="row">
								<div class="col-lg-10 mx-auto mb-4">
									<div class="section-title text-center ">
										<h3 class="top-c-sep">
											<!--  -->
										</h3>

									</div>
								</div>
							</div>

							<c:forEach items="${list}" var="list" varStatus="vs">
								<!-- varStatus로 현재 아이템이나 순번을 알수있음 -->

								<div class="filter-result">
									<p class="mb-30 ff-montserrat"></p>

									<div
										class="job-box d-md-flex align-items-center justify-content-between mb-30">
										<div
											class="job-left my-4 d-md-flex align-items-center flex-wrap">
											<div
												class="img-holder mr-md-4 mb-md-0 mb-4 mx-auto mx-md-0 d-md-none d-lg-flex">
												${vs.count+((page.num-1)*page.postNum)}</div>

											<div class="job-content">

												<h5 class="text-center text-md-left">${list.content }</h5>
												<ul class="d-md-flex flex-wrap text-capitalize ff-open-sans">
													<li class="mr-md-4">${list.title }</li>
													<li class="mr-md-4"><i
														class="zmdi zmdi-assignment-account mr-2"></i>${list.writer}
													</li>
													<li class="mr-md-4"><i class="zmdi zmdi-calendar mr-2"></i>
														${list.regDate }</li>
													<li class="mr-md-4"><i class="zmdi zmdi-eye mr-2"></i>
														${list.viewCnt }</li>
												</ul>
											</div>
										</div>
										<div class="job-right my-4 flex-shrink-0">
											<a href="/board/modify?bno=${list.bno} "
												class="btn d-block w-100 d-sm-inline-block btn-light"><i
												class="zmdi zmdi-edit mr-2"></i>edit</a> <a
												href="/board/delete?bno=${list.bno}"
												class="btn d-block w-100 d-sm-inline-block btn-light"><i
												class="zmdi zmdi-delete mr-2"></i>delete</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>


						<!-- START Pagination -->
						<nav aria-label="Page navigation">

							<!-- -------------------------------------------------------------- -->

							<ul class="pagination pagination-reset justify-content-center">
								<c:if test="${page.prev}">
									<li class="page-item disabled"><a class="page-link"
										href="/board/listPage?num=${page.startPageNum - 1}"
										tabindex="-1" aria-disabled="true"> <i
											class="zmdi zmdi-long-arrow-left"></i>
									</a></li>
								</c:if>
								<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
									var="num">
									<li class="page-item"><a class="page-link"
										href="/board/listPage?num=${num}">${num }</a></li>

								</c:forEach>
								<c:if test="${page.next}">
									<li class="page-item"><a class="page-link"
										href="/board/listPage?num=${page.endPageNum + 1}"> <i
											class="zmdi zmdi-long-arrow-right"></i>
									</a></li>
								</c:if>
							</ul>
						</nav>
						<!-- END Pagination
						
						<li class="page-item d-none d-md-inline-block"><a
									class="page-link" href="#">2</a></li>
								<li class="page-item d-none d-md-inline-block"><a
									class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">...</a></li>
								<li class="page-item"><a class="page-link" href="#">8</a></li>
								<li class="page-item"><a class="page-link" href="#"> <i
										class="zmdi zmdi-long-arrow-right"></i>
								</a></li>
						 -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ----------------------------------- -->

	<br>
	<div>
		<br> <span> <a href="${path}/board/pdf?bno=${view.bno}">PDF</a>
			<br>
		</span> <br> <span> <a href="/">이전</a>
		</span>
	</div>
</body>
<script>
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