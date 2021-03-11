<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/../../../../resources/css/bootstrap.css">
<link rel="stylesheet"
	href="/../../../../resources/css/simple-sidebar.css">
<link rel="stylesheet" href="/../../../../../resources/css/testboot.css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"
	integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY="
	crossorigin="anonymous" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<script type="/../../../../resouces/js/bootstrap.js"></script>
</head>
<body>

	<div id="wrapper" class="wrapper-content">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="/"><img src = "https://img.icons8.com/color/452/spring-logo.png"
                     width="30" height="30" border="0">DashBoard.com </a></li>
				<li><a class="btn btn-primary" id="list" onClick='golist()'>게시
						목록</a></li>
				<li><a class="btn btn-primary" id="write" onClick="gowrite()">게시물
						작성</a></li>
				<li><a class="btn btn-warning" id="search" onClick="search()">게시글
						조회</a></li>
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
							<!-- --------------------------------------------- -->
							<div class="row">
								<div class="col-lg-10 mx-auto">
									<div class="career-search mb-60">

										<form action="#" class="career-form mb-60">
											<div class="row">
												<div class="col-md-6 col-lg-3 my-3">
													<div class="input-group position-relative">
														<input type="text" class="form-control" name="key"
															type="text" id="key" value="${keyword}"
															placeholder="Enter Your Keywords" id="keywords">
													</div>
												</div>
												<div class="col-md-6 col-lg-3 my-3">
													<div>
														<select class="custom-select" name="searchSel"
															id="searchSel">
															<option value="writer"
																<c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
															<option value="title"
																<c:if test = "${searchType eq 'title'}">selected</c:if>>제목</option>
															<option value="content"
																<c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
														</select>
													</div>
												</div>

												<div class="col-md-6 col-lg-3 my-3">
													<button type="button"
														class="btn btn-lg btn-block btn-light btn-custom"
														id="search">Search</button>
												</div>
											</div>
										</form>
										<!-- ----------------------------------------------------------------------------- -->
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
															<ul
																class="d-md-flex flex-wrap text-capitalize ff-open-sans">
																<li class="mr-md-4">${list.title }</li>
																<li class="mr-md-4"><i
																	class="zmdi zmdi-assignment-account mr-2"></i>${list.writer}
																</li>
																<li class="mr-md-4"><i
																	class="zmdi zmdi-calendar mr-2"></i> ${list.regDate }</li>
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
													href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}"
													tabindex="-1" aria-disabled="true"> <i
														class="zmdi zmdi-long-arrow-left"></i>
												</a></li>
											</c:if>
											<c:forEach begin="${page.startPageNum}"
												end="${page.endPageNum}" var="num">
												<li class="page-item"><a class="page-link"
													href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num }</a></li>
											</c:forEach>
											<c:if test="${page.next}">
												<li class="page-item"><a class="page-link"
													href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">
														<i class="zmdi zmdi-long-arrow-right"></i>
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


				<!-- --------------------------------------------- -->
				<script>
		document.getElementById("search").onclick = function(){
			<!-- 제목,내용,글쓴이 중에 무엇을 선택했는지를 searchType으로 받아오고 [0]은 select가 배열이여서 -->
			
			var searchT = document.getElementById("searchSel");
			var FsearchT = searchT.options[searchT.selectedIndex].value;
			let searchCol = document.getElementById("searchSel")[1].value;
			let searchKey = document.getElementById("key").value;
			
			console.log(FsearchT);
			console.log(searchCol);
			console.log(searchKey);
			
			location.href = "/board/listPageSearch?num=1"+"&searchType="+FsearchT+"&keyword="+searchKey;
		}
	</script>

				<!-- --------------------------------------------- -->
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
