<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="../../css/content.css" rel="stylesheet">
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
/* 	$(function() {  // jquey문법으로 처음 화면이 띄면 바로 작동
		$('#disp').load('/moyac/views/board_notice/list.do?pageNum=${pageNum}');
	}); */
	
	function likesClick(boardno) {
			$.post("noticeLikes.do", "boardno="+boardno, function(data) {
				var likes = data.split(",")[0];
				var imgSrc = data.split(",")[1];
				$(".likes_cnt").text(likes);
				$(".likes_cnt").siblings("img").attr("src", imgSrc);
			});
	} 
</script>
</head>
<body>
	<h3>공지사항</h3>
	<div align="center" class="total_content">
		<div class="table">
			<div class="table_form1">
				<div class="first">${board_notice.subject }</div>
				<div class="second">| ${nick_name }</div>
				<div class="fourth">조회수 : ${board_notice.read_cnt }</div>
				<div class="third">${reg_date}</div>
			</div>
			<div class="tabel_form2">${board_notice.content}</div>
			<div>
				<img class="likes" onclick="likesClick(${board_notice.boardno})"
					alt="하트" src="${imgSrc}"> <span class="likes_cnt">${board_notice.likes}</span>
			</div>
		</div>
		<!-- 수정,삭제,목록 -->
		<div align="center">
			<c:if test="${id == 'admin'}">
				<button class="btn btn-primary"
					onclick="location.href='/moyac/views/board_notice/updateForm.do?boardno=${board_notice.boardno}&pageNum=${pageNum }'">수정</button>
				<button class="btn btn-primary"
					onclick="location.href='/moyac/views/board_notice/delete.do?boardno=${board_notice.boardno}&pageNum=${pageNum }'">삭제</button>
			</c:if>
			<button class="btn btn-primary"
				onclick="location.href='/moyac/views/board_notice/list.do?pageNum=${pageNum }'">목록</button>
		</div>
		<!-- 수정,삭제,목록 끝-->
	</div>
	<div id="disp"></div>
</body>
</html>