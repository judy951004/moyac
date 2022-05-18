<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.total_content {
	display: flax;
	justify-content: center;
	align-items: center;
	padding: 0 50px;
	width: 100%;
	margin-top: 50px;
}
.search_form {	
	display: flex;
	justify-content: flex-end;
	margin: 10px;
}
.search_form2 {
	margin-left: 10px;
	margin-right: -10px;
	width: 200px;
	right: 10px;
}
h3 {
	margin: 10px 0 -10px 60px;
}
.btn-primary{
	margin-left: 20px;
}
</style>
</head>
<body>
	<h3>이벤트 : '${search }' 검색결과 조회</h3>
<div class="total_content">
<div class="search_form">
	<form action="/moyac/views/board_event/eventSearch.do" class="d-flex">
		<select>
			<option>제목</option>
		</select>
		<input class="form-control search_form2" type="text" name="search" required="required" autofocus="autofocus"> 
		<input class="btn btn-primary" type="submit" value="검색">
	</form>
	</div>
	<table border="1" class="table table-hover table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
	</thead>
		<c:if test="${empty list2 }">
			<tr>
				<th colspan="6">검색결과가 없습니다.</th>
			</tr>
		</c:if>
		<c:if test="${not empty list2}">
			<c:forEach var="board_event" items="${list2}">
				<tr>
					<td>${number }<c:set var="number" value="${number-1 }"></c:set></td>
					<c:if test="${board_event.del=='y' }">
						<th colspan="5">삭제된 게시물입니다.</th>
					</c:if>
					<c:if test="${board_event.del != 'y' }">
						<td title="${board_event.content }">
						<a href='/moyac/views/board_event/list.do?boardno=${board_event.boardno}&pageNum=${currentPage}'>${board_event.subject }</a>
							<c:if test="${board_event.read_cnt > 50 }">
								<img alt="" src="../../images/hot.gif">
							</c:if>
						</td>
						<td>${board_event.nick_name }</td>
						<td>${board_event.reg_date }</td>
						<td>${board_event.read_cnt }</td>
						<td>${board_event.likes }</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
	<!-- paging -->
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/board_event/eventSearch.do?pageNum=${startPage-1 }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i}">
				<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/board_event/eventSearch.do?pageNum=${i}'" disabled="disabled">${i}</button>
			</c:if>
			<c:if test="${currentPage != i}">
				<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/board_event/eventSearch.do?pageNum=${i}'">${i}</button>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/board_event/eventSearch.do?pageNum=${endPage+1}'">다음</button>
		</c:if>
	</div>

	<!-- paging  끝-->
	<br>
	<c:if test="${id == 'admin' }">
	<button class="btn btn-primary" onclick="location.href='/moyac/views/board_event/writeForm.do?boardno=0&pageNum=${currentPage}'">글쓰기</button>
	</c:if>
</body>
</html>