<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
<link href="../../css/bootstrap.css" rel="stylesheet">
<style type="text/css">
.font_family {
	font-family: InfinitySans-RegularA1;
	margin: 0 50px;
}
.reply_likes{
	width: 50px;
	font-size: 12px;
	height: 30px;
	margin: 0 1px;
}
.reply_list{
	display: flex;
	width: 100%;
	align-items: center;
}
.reply_btn {
	display: flex;
	width: 100%;
	justify-content: flex-end;
	align-items: center;
}
.reply_writer{
	display:flex;
	width: 100%;
	align-items: flex-end;
}
.reply_reg_date{
	margin-left: 5px;
	font-size: 4px;
}
</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//시작 시 수정 폼 hide
		$(".update_form").css("display", "none");
		$(".update_hide").css("display", "none");
		// 댓글 수정 폼 show
		$(".update_view").click(
				function() {
					$(this).parents(".reply_update").find(".update_form").css(
							"display", "block");
					$(this).parents(".reply_update").find(".origin_content").css(
							"display", "none");
					$(this).css("display", "none");
					$(this).siblings().css("display", "block");	
					
				});
		// 댓글 수정 폼 hide
		$(".update_hide").click(
				function() {
					$(this).parents(".reply_update").find(".update_form").css(
							"display", "none");
					$(this).parents(".reply_update").find(".origin_content").css(
							"display", "block");
					$(this).css("display", "none");
	
					$(this).siblings().css("display", "block");	
				});
		
	});
	function update() {
		alert("댓글이 수정되었습니다.");
	}
	
	function del() {
		var con = confirm("정말로 삭제하시겠습니까?")
		if (con) {
			alert("삭제되었습니다.")
			return
		} else
			alert("삭제가 취소되었습니다.")
			return false
	}
</script>
</head>
<body>
	<div class ="font_family">
		<div>
			<c:if test="${empty list }">
				<div>댓글이 없습니다.</div>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="reply_event" items="${list }">
					<hr>
					<div class="reply_update">
						<c:if test="${reply_event.del=='y' }">
							<div><br>
							<span>삭제된 댓글입니다.</span><br>
							</div>
						</c:if>
						<c:if test="${reply_event.del != 'y' }">
							<div class="reply_list">
								<div class="reply_writer">
								<div style="color:black;">${reply_event.nick_name}</div> 
								<div class="reply_reg_date">(${reg_date }) </div> 
								</div>
								<div class="reply_btn">
									<c:if test="${ reply_event.likesConfirm == 0}">									
										<div onclick="location.href='/moyac/views/reply/replyLikes.do?pageNum=${pageNum}&reply_no=${reply_event.reply_no}'" class="btn btn-primary likes reply_likes"><i class="far fa-thumbs-up"></i>${reply_event.likes }</div>
									</c:if>
									<!-- 추천을 한 사람 일때 -->
									<c:if test="${ reply_event.likesConfirm == 1}">
										<div onclick="location.href='/moyac/views/reply/replyLikes.do?pageNum=${pageNum}&reply_no=${reply_event.reply_no}'" class="btn btn-warning likes_cancel reply_likes"><i class="far fa-thumbs-down"></i>${reply_event.likes }</div>
									</c:if>
									<c:if test="${id == reply_event.id || id == 'admin'}">
										<div class="btn btn-primary update_view reply_likes"><i class="far fa-edit"></i></div>
										<div class="btn btn-primary update_hide reply_likes"><i class="fas fa-times"></i></div>
									</c:if>
									<c:if test="${id == reply_event.id || id == 'admin'}">
									<form action="/moyac/views/board_event/content.do" onsubmit="return del()">
										<input type="hidden" value="${reply_event.boardno}" name="boardno">
										<input type="hidden" value="1" name="delete">
										<input type="hidden" value="${reply_event.reply_no}" name="reply_no">
										<input type="hidden" value="${pageNum}" name="pageNum">
										<input class="btn btn-danger reply_likes" type="submit" value="삭제">
									</form>
								</c:if>
									</div>
								<!-- 수정버튼 끝 -->
								<br>
								<!-- 삭제기능 끝 -->
							</div>
								<div class="origin_content">${reply_event.content}</div>
								<!-- 수정 기능 -->
								<div class="update_form">
									<form action="/moyac/views/board_event/content.do" onsubmit="return update()">
											<textarea class="form-control" id="exampleTextarea" rows="5" cols="20" name="update_content" style="resize: none;" required="required">${reply_event.content}</textarea><br>
											<input type="hidden" value="${reply_event.boardno}" name="boardno"> 
											<input type="hidden" value="${pageNum}" name="pageNum"> 
											<input type="hidden" value="${reply_event.reply_no}" name="reply_no"> 
											<input class="btn btn-primary" type="submit" value="확인">
									</form>
								</div>
						</c:if>
					</div><br>
				</c:forEach><br><br>
			</c:if>
		</div>
	</div>
</body>
</html>