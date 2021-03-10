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
	<!-- DIV는 컨텐츠 나눌때 -->
	<div>
		<c:if test="${page.prev}">
			<span>[ <a
				href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
				]
			</span>
		</c:if>

		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
			var="num">
			<span> <c:if test="${select != num}">
					<a href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${page.next}">
			<span>[ <a
				href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
				]
			</span>
		</c:if>
		<!-- 1부터 pagenum까지 listpage(num) 만큼 페이지 번호생성 -->
		<!--<c:forEach begin="1" end="${pageNum}" var="num">
			<span> <a href="/board/listPage?num=${num}">${num}</a>
			</span>
		</c:forEach> -->
		<div>
			<select name="searchSel" id="searchSel">
				<!-- 셀럭터 -->
				<option value="writer"
					<c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
				<option value="title"
					<c:if test = "${searchType eq 'title'}">selected</c:if>>제목</option>
				<option value="content"
					<c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
				
			</select> <input name="key" type="text" id="key" value="${keyword}" />
			<!-- 검색할 내용 -->
			<button type="button" id="search">검색</button>
		</div>
	</div>
	<br>
	<div>
		<br> <span> <a href="${path}/board/pdf?bno=${view.bno}">PDF</a>
			<br>
		</span> <br> <span> <a href="/">이전</a>
		</span>
	</div>
	<!--search(검색) 버튼클릭 이벤트-->
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
</body>

</html>
