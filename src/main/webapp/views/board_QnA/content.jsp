<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/content.css" rel="stylesheet">
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	/* $(function() {  //아래 list나오게
		$('#disp').load('/moyac/views/board_QnA/list.do?pageNum=${pageNum}');
	}); */
	
	/* 좋아요 구현 */
	function likesClick(boardno) {
			// 게시글 좋아요 클릭
				$.post("qnALikes.do", "boardno="+boardno, function(data) {
					var likes = data.split(",")[0];
					var imgSrc = data.split(",")[1];
					$(".likes_cnt").text(likes);
					$(".likes_cnt").siblings("img").attr("src", imgSrc);
				});
		} 
</script>
</head>
<body>
	<h3>QnA 게시글</h3>
	<div align="center" class="total_content">
		<div class="table">
			<div class="table_form1">
				<div class="first">${board_QnA.subject }</div>
				<div class="second">| ${nick_name }</div>
				<div class="fourth">조회수 : ${board_QnA.read_cnt }</div>
				<div class="third">${reg_date}</div>

			</div>
			<div class="tabel_form2">${board_QnA.content}</div>
			<div>
				<img class="likes" onclick="likesClick(${board_QnA.boardno})" alt="하트"
					src="${imgSrc}"> <span class="likes_cnt">${board_QnA.likes}</span>
			</div>
		</div>
		<!-- 수정,삭제,목록 -->
		<div align="center">
			<c:if test="${id == board_QnA.id || id == 'admin'}">
				<button class="btn btn-primary"
					onclick="location.href='/moyac/views/board_QnA/updateForm.do?boardno=${board_QnA.boardno}&pageNum=${pageNum }'">수정</button>
				<button class="btn btn-primary"
					onclick="location.href='/moyac/views/board_QnA/delete.do?boardno=${board_QnA.boardno}&pageNum=${pageNum }'">삭제</button>
			</c:if>
			<!-- num은 읽은 글 번호 num이 0이 아니다 -->
			<c:if test="${ id == 'admin'}">
				<button class="btn btn-primary"
					onclick="location.href='/moyac/views/board_QnA/writeForm.do?boardno=${board_QnA.boardno}&pageNum=${pageNum }'">답변</button>
			</c:if>
			<button class="btn btn-primary"
				onclick="location.href='/moyac/views/board_QnA/list.do?pageNum=${pageNum }'">목록</button>
		</div>
		<!-- 수정,삭제,목록 끝-->
	</div>
</body>
</html>