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
	justify-content: center;
	align-items: center;
	padding: 0;
	width: 40%;
	margin-top: 50px;
}

.bookmark_head {
	display: -webkit-box;
	display: flex;
	align-items: center;
	font-size: 25px;
}

.content {
	justify-content: center;
	margin-right: auto;
}

.me_name {
	margin-left: 10px;
}

.content_detail {
	display: flex;
	align-items: center;
	margin: 5px 0;
}
.content_margin {
	margin-bottom: 20px;
}
.content_title {
	width: 100px;
	margin-right: 20px;
	font-weight: bold; 
}
.content_img {
	display: flex;
}
.content_text {
	text-align: left;
	width: 100%;
}

</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
function bookmarkClick(me_no) {
		// 약품 북마크 클릭
		$.post("/moyac/views/medicine/bookmark.do", "me_no="+me_no, function(data) {
			var imgSrc = data;
			$(".bookmark").attr("src", imgSrc);
		});
} 
function del(delMe_no) {
	var con = confirm("삭제처리 하시겠습니까?");
	if(con) {
		location.href="/moyac/views/medicine/delete.do?pageNum=${pageNum}&me_no="+delMe_no;
	}
}
</script>
</head>
<body>
	<div align="center">
		<div class="total_content">
			<div class="content">
				<!-- 북마크 -->
				<div class="bookmark_head">
					<c:if test="${id != 'admin' }">
						<img class="bookmark" onclick="bookmarkClick(${medicine.me_no})"
							alt="북마크" src="${imgSrc}" width="4%">
					</c:if>
					<!-- 북마크 끝 -->
					<div class="me_name">${medicine.me_name }</div>
				</div>
				<hr>
				<div class="content_detail content_margin">
					<div class="content_title">그림</div>
					<div class="content_text content_img">
						<img alt="" src="${medicine.me_pic }"
							height="180">
					</div>
				</div>
				<p>
				<div class="content_detail">
					<div class="content_title">색상</div>
					<div class="content_text">${medicine.me_color}</div>
				</div>
				<p>
				<div class="content_detail">
					<div class="content_title">모양</div>
					<div class="content_text">${medicine.me_shape}</div>
				</div>
				<p>
				<div class="content_detail">
					<div class="content_title">제형</div>
					<div class="content_text">${medicine.me_formulation}</div>
				</div>
				<p>
				<div class="content_detail">
					<div class="content_title">효과</div>
					<div class="content_text">${medicine.me_effect}</div>
				</div>
				<p>
				<div class="content_detail">
					<div class="content_title">용량</div>
					<div class="content_text">${medicine.me_capacity}</div>
				</div>
				<p>
				<div class="content_detail">
					<div class="content_title">판매사</div>
					<div class="content_text">${medicine.me_sales}</div>
				</div>
			</div>
			<c:if test="${empty bookmarkConfirm && empty adminConfirm}">
				<!-- 북마크, 관리자 페이지에서 들어가면 보이지 않게 -->
				<c:if test="${not empty search}">
					<button class="btn btn-primary button_write"
						onclick="location.href='/moyac/views/search/search.do?pageNum=${pageNum }&search=${search}'">목록</button>
				</c:if>
				<c:if test="${empty search}">
					<button class="btn btn-primary button_write"
						onclick="location.href='/moyac/views/search/filterSearch.do?pageNum=${pageNum }&color=${color}&shape=${shape }&formulation=${formulation }'">목록</button>
				</c:if>
			</c:if>
			<c:if test="${not empty adminConfirm}">
				<button class="btn btn-primary button_write"
					onclick="location.href='/moyac/views/admin/adminMedicine.do?pageNum=${pageNum }'">목록</button>
			</c:if>
			<c:if test="${id == 'admin'}">
				<button class="btn btn-primary button_write"
					onclick="del('${medicine.me_no}')">삭제</button>
			</c:if>
		</div>
	</div>
</body>
</html>