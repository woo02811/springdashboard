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
			<c:forEach items="${list}" var="list" varStatus="vs">
				<!-- varStatus로 현재 아이템이나 순번을 알수있음 -->
				<tr>

					<td>${vs.count+((page.num-1)*page.postNum)}</td>
					<td><a href="/board/view?bno=${list.bno} ">${list.title}</a></td>
					<td>${list.regDate}</td>
					<td>${list.writer}</td>
					<td>${list.viewCnt}</td>
				</tr>

			</c:forEach>

		</tbody>
	</table>
	<div>
		<c:if test="${page.prev}">
			<span>[ <a href="/board/listPage?num=${page.startPageNum - 1}">이전</a>
				]
			</span>
		</c:if>

		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
			var="num">
			<span> <c:if test="${select != num}">
					<a href="/board/listPage?num=${num}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${page.next}">
			<span>[ <a href="/board/listPage?num=${page.endPageNum + 1}">다음</a>
				]
			</span>
		</c:if>
	</div>
	<!-- DIV는 컨텐츠 나눌때 
	<div>
		<c:if test="${page.prev }">
			<span>[<a href="/board/listPage?num=${page.startPageNum -1}">앞</a>]</span>
		</c:if>
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<span>
			<c:if test="${select != num }">
			<a href="/board/listPage?num=${num}">${num}</a>
			</c:if> 
			<c:if test="${select==num }">
				<b>${num}</b>
			</c:if>
			</span>
		</c:forEach>
		<c:if test="${page.next }">
			<span>[<a href="/board/listPage?num=${page.endPageNum + 1}">뒤</a>]</span>
		</c:if>
		<!-- 1부터 pagenum까지 listpage(num) 만큼 페이지 번호생성 -->
	<!--<c:forEach begin="1" end="${pageNum}" var="num">
			<span> <a href="/board/listPage?num=${num}">${num}</a>
			</span>
		</c:forEach> 
	</div>-->
	<br>
	<div>
		<br> <span> <a href="${path}/board/pdf?bno=${view.bno}">PDF</a>
			<br>
		</span> <br> <span> <a href="/">이전</a>
		</span>
	</div>
</body>
</html>