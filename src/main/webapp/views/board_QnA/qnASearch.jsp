<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="../../css/bootstrap.css" rel="stylesheet">
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
h4 {
	margin: 10px 0 -10px 60px;
}
.btn-primary{
	margin-left: 20px;
}
</style>
</head>
<body>
<h4>QnA게시판: '${searchValue}' 검색결과 조회</h4>
<div class="total_content">
<div class="search_form">
<form action="/moyac/views/board_QnA/qnASearch.do" class="d-flex">
	<select name="searchKey">
		<option value="subject">제목</option>
		<option value="nick_name">닉네임</option>
	</select>
	<input class="form-control search_form2" type="text" name="searchValue" required="required" autofocus="autofocus"> 
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
		<c:if test="${not empty list2 }">
			<c:forEach var="board_QnA" items="${list2 }">
				<tr>
					<td>${number }<c:set var="number" value="${number-1 }"></c:set></td>
					<c:if test="${board_QnA.del=='y' }">
						<th colspan="5">삭제된 게시물입니다.</th>
					</c:if>
					<c:if test="${board_QnA.del != 'y' }">
						<td title="${board_QnA.content }"><c:if test="${board_QnA.re_level > 0 }">
								<img alt="" src="../../images/level.gif" height="5" width="${board_QnA.re_level*10}">
								<img alt="" src="../../images/re.gif">
							</c:if> <a href='/moyac/views/board_QnA/content.do?boardno=${board_QnA.boardno}&pageNum=${currentPage}'>${board_QnA.subject }</a>
							<c:if test="${board_QnA.read_cnt > 50 }">
								<img alt="" src="../../images/hot.gif">
							</c:if></td>
						<td>${board_QnA.nick_name }</td>
						<td>${board_QnA.reg_date }</td>
						<td>${board_QnA.read_cnt }</td>
						<td>${board_QnA.likes }</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
	<!-- paging -->
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button class="btn btn-outline-primary"
				onclick="location.href='/moyac/views/board_QnA/qnASearch.do?pageNum=${startPage-1 }&searcKey=${searchKey}&searchValue=${searchValue}'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i}">
				<button class="btn btn-outline-primary"
					onclick="location.href='/moyac/views/board_QnA/qnASearch.do?pageNum=${i}&searcKey=${searchKey}&searchValue=${searchValue}'"
					disabled="disabled">${i}</button>
			</c:if>
			<c:if test="${currentPage != i}">
				<button class="btn btn-outline-primary"
					onclick="location.href='/moyac/views/board_QnA/qnASearch.do?pageNum=${i}&searcKey=${searchKey}&searchValue=${searchValue}'">${i}</button>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<button class="btn btn-outline-primary"
				onclick="location.href='/moyac/views/board_QnA/qnASearch.do?pageNum=${endPage+1}&searcKey=${searchKey}&searchValue=${searchValue}'">다음</button>
		</c:if>
	</div>
	<!-- paging  끝-->
	<br>
	<button class="btn btn-primary" onclick="location.href='/moyac/views/board_QnA/writeForm.do?boardno=0&pageNum=${currentPage}'">글쓰기</button>
</body>
</html>