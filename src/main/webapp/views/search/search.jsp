<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	margin-bottom: 10px;
}
.search_form2 {
	margin-left: 10px;
	margin-right: 10px;
	width: 200px;
	right: 10px;
}
h2 {
	margin: 0 0 -40px 60px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#disp').load('/moyac/views/main/filter.jsp');
	})
	function del(delMe_no) {
		var con = confirm("삭제처리 하시겠습니까?");
		if(con) {
			location.href="/moyac/views/medicine/delete.do?pageNum=${currentPage}&search=${search}&me_no="+delMe_no;
		}
	}
</script>
</head>
<body>
	<h2>검색결과 : '${search}'</h2>
	<div class="total_content">
	<div class="search_form" >
		<form action="/moyac/views/search/search.do" class="d-flex">
		<button class="filter btn btn-primary font_family">모양검색</button>
		<input class="form-control search_form2" type="text" name="search" required="required" autofocus="autofocus"> 
		<input type="submit" value="검색" class="btn btn-primary">
	</form>
	</div>
	<table border="1" class="table table-hover table-striped">
		<thead>
		<tr>
			<th>사진</th>
			<th>이름</th>
			<th>모양</th>
			<th>색</th>
			<th>제형</th>
		</tr>
		</thead>
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">일치하는 약품이 없습니다.</th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="medicine" items="${list }">
				<tr>
					<c:if test="${medicine.del != 'y' }">
						<td><img alt="" src="${medicine.me_pic }" height="40"></td>	
						<td style="cursor:pointer;" onclick="location.href='/moyac/views/medicine/medicine_info.do?me_no=${medicine.me_no}&pageNum=${currentPage}&search=${search}'">${medicine.me_name }</td>
						<td>${medicine.me_shape }</td>
						<td>${medicine.me_color }</td>
						<td>${medicine.me_formulation }</td>
						<c:if test= "${id=='admin' }">
						<td><a class="btn btn-primary" onclick="del('${medicine.me_no}')">삭제</a></td>
						</c:if>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<!-- paging -->
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button class="btn btn-outline-primary" onclick="location.href='search.do?pageNum=${startPage-1}&search=${search}'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${currentPage== i }">
				<button class="btn btn-outline-primary" onclick="location.href='search.do?pageNum=${i}&search=${search}'" disabled="disabled">${i}</button>
			</c:if>
			<c:if test="${currentPage!= i }">
				<button class="btn btn-outline-primary" onclick="location.href='search.do?pageNum=${i}&search=${search}'">${i}</button>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<button class="btn btn-outline-primary" onclick="location.href='search.do?pageNum=${endPage+1}&search=${search}'">다음</button>
		</c:if>
	</div>
	</div>
	<!-- paging  끝-->
	<div id="disp"></div>
</body>
</html>