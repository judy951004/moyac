<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/content.css" rel="stylesheet">
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	/* $(function() {  // jquey문법으로 처음 화면이 띄면 바로 작동
		$('#disp').load('/moyac/views/board_event/list.do?pageNum=${pageNum}');
	}); */
	$(function() {  // 아래 댓글 출력
		$('#disp').load('/moyac/views/reply/replyList.do?boardno=${boardno}&pageNum=${pageNum }');
	});
	function likesClick(boardno) {
				// 게시글 좋아요 클릭
				$.post("eventLikes.do", "boardno="+boardno, function(data) {
					var likes = data.split(",")[0];
					var imgSrc = data.split(",")[1];
					$(".likes_cnt").text(likes);
					$(".likes_cnt").siblings("img").attr("src", imgSrc);
				});
		}
	
</script>
</head>
<body>
	<h3>이벤트</h3>
	<div align="center" class="total_content">
		<div class="table">
			<div class="table_form1">
				<div class="first">${board_event.subject }</div>
				<div class="second">| ${nick_name }</div>
				<div class="fourth">조회수 : ${board_event.read_cnt }</div>
				<div class="third">${reg_date}</div>


			</div>
			<div class="tabel_form2">${board_event.content}</div>
			<div>
				<img class="likes" onclick="likesClick(${board_event.boardno})"
					alt="하트" src="${imgSrc}"> <span class="likes_cnt">${board_event.likes}</span>
			</div>
		</div>
		<!-- 게시글 수정, 삭제, 목록 -->
		<div align="center">
			<c:if test="${id == 'admin'}">
				<button class="btn btn-primary"
					onclick="location.href='/moyac/views/board_event/updateForm.do?boardno=${board_event.boardno}&pageNum=${pageNum }'">수정</button>
				<button class="btn btn-primary"
					onclick="location.href='/moyac/views/board_event/delete.do?boardno=${board_event.boardno}&pageNum=${pageNum }'">삭제</button>
			</c:if>
			<button class="btn btn-primary"
				onclick="location.href='/moyac/views/board_event/list.do?pageNum=${pageNum }'">목록</button>
		</div>
		<!-- 게시글 수정, 삭제, 목록 끝-->
		<!-- 댓글 입력-->
		<div align="center">
			<form action="/moyac/views/reply/write.do">
				<input type="hidden" name="boardno" value="${board_event.boardno }">
				<input type="hidden" name="pageNum" value="${pageNum }">
				<div class="reply_title">댓글작성</div>
				<textarea style="resize: none;" rows="5" cols="40"
					name="reply_content" required="required"></textarea>
				<div>
					<input type="submit" value="확인" class="btn btn-primary">
				</div>
			</form>
		</div>
	</div>
	<br>
	<!-- 댓글 입력 끝-->
	<!-- 제이쿼리를 통한 댓글목록 -->
	<div id="disp"></div>

</body>
</html>