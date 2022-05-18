<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.only_image {
	width: 200px;
	height: 200px;
	float: left;
	margin-right: 80px; 
	margin-bottom: 10px; 
}
.myPage {
	display: flex;
	justify-content: center;
	align-items: center;
}

.myPage_Button {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 150px;
	width: 150px;
	border: 1px solid;
	margin: 0px 25px;
}
/* 내가 쓴글 css */
.myWrite  {
	display: none;
	position: fixed;
	width: 100%;
	height: 100vh;
	z-index: 100;
	top: 0;
}

.myWrite .myWrite_dis {
	height: 100%;
	width: 100%;
	background-color: black;
	opacity: 0.3;
}

.myWrite .myWrite_content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 60%;
 	min-height: 50vh; 
	height: 70%;
	padding: 30px;
}
.myWrite1{
	font-size: 25px;
	text-align: center;
}
.myWrite2{
	font-size: 18px;
}
.myWrite3 {
	font-size: 13px;
	margin-left: 5px;
}
.myWrite_title{
	display: flex;
	align-items: flex-end;
	margin-bottom: 5px;
}
.content_table{
	overflow: scroll;
	height: 250px;
}
.myQnA{
	margin: 10px 0;
}
/* 내가 쓴글 css 끝*/
/* 북마크 css*/
.myBookmark  {
	display: none;
	position: fixed;
	width: 100%;
	height: 100vh;
	z-index: 100;
	top: 0;
}

.myBookmark .myBookmark_dis {
	height: 100%;
	width: 100%;
	background-color: black;
	opacity: 0.3;
}

.myBookmark .myBookmark_content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 50%;
	min-height: 50vh;
	height: 70%;
	padding: 30px;
}

.scroll-container {
	width: 270px;
	height: 350px;
	overflow-y: scroll;
	scroll-behavior: smooth;
	background-color: rgba(147, 207, 206, 0.7);

}
.one {
	display: flex;
	flex-direction: column;
	align-items: center;
	border:1px solid; 
	padding: 5px;
	margin: 10px;
	border-radius: 25px;
	width: 120px;
	height: 140px;
	float: left;
	cursor: pointer;
/* 	justify-content: center; */
}
.del_btn {
  position: fixed;
     bottom: 30px;
     right: 30px;
}
.myWrite_content::-webkit-scrollbar {
	width: 10px;
}
.myWrite_content::-webkit-scrollbar-thumb {
    background-color: rgba(147, 207, 206, 0.7);
    border-radius: 10px;
    opacity: 0.2;
  }
.myWrite_content::-webkit-scrollbar-track {
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
table {
	table-layout: fixed;
}
td {
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis !important;
}
.content_table::-webkit-scrollbar {
	width: 10px;
}
.content_table::-webkit-scrollbar-thumb {
    background-color: rgba(147, 207, 206, 0.7);
    border-radius: 10px;
    opacity: 0.2;
  }
.content_table::-webkit-scrollbar-track {
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
.myBookmark_content::-webkit-scrollbar {
	width: 10px;
}
.myBookmark_content::-webkit-scrollbar-thumb {
    background-color: rgba(147, 207, 206, 0.7);
    border-radius: 10px;
    opacity: 0.2;
  }
.myBookmark_content::-webkit-scrollbar-track {
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
  .myBookmark1{
  	display: flex;
  	align-items: flex-end;
	margin-bottom: 5px;
  }
  .myBookmark2{
  	font-size: 18px;
  	margin-left: 30px;
  }
  .myBookmark3{
  	font-size: 13px;
  	margin-left: 5px;
  }
  .bookmark_name{
/* 	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap:break-word; 
    line-height: 1.2em;
    height: 3.6em;
    font-size: 12px;
    margin-top: 10px; */
    overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis !important;
	width: 100px;
	margin-top: 5px;
  }
#table_thead {
	background-color: white;
	position: sticky;
  	top : 0;
} 
.img_sizeSet{
	border-radius: 10px;
	width: 100px;
	height: 60px;
}
.one:hover{
	background:#ededed;
}
.button_x{
	width: 100%;
	justify-content: flex-end;
	display: flex;
	padding-right: 10px;
}
.button_x_hover{
	color: rgb(147,206,207);
}
.button_x_hover:hover{
	color: red;
}
/* 북마크 css 끝*/
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">


	/* 내가쓴글,북마크 제이쿼리 */
	$(function() {
		$('#myWrite').click(function() {
			if ($('.myWrite').css('display') == 'none') {
				$('.myWrite').show();
			}
		});
		$('.myWrite_dis').on('click', function() {
			$('.myWrite').hide();
			$('html body').css('overflow', 'auto');
		});
		$('#myBookmark').click(function() {
			if ($('.myBookmark').css('display') == 'none') {
				$('.myBookmark').show();
			}
		});
		$('.myBookmark_dis').on('click', function() {
			$('.myBookmark').hide();
			$('html body').css('overflow', 'auto');
		});
	});
	$(function() {
		if('${result}'==1){
			$(".myBookmark").css("display", "block");
		}
	});
	/* 내가쓴글,북마크 제이쿼리 끝 */
	/* 회원탈퇴 */
	function del() {
		var con = confirm("정말로 탈퇴하시겠습니까?")
		if (con) {
			location.href = "/moyac/views/myPage/delete.do"
		} else
			alert("삭제가 취소되었습니다.")
	}
	/* 회원탈퇴 끝 */
	
</script>

</head>
<body>
	<div class="myPage">
		<a href="/moyac/views/myPage/updateForm.do"><img src="/moyac/images/update_member.png" title="회원정보수정" class="only_image"></a>
		<a id="myBookmark"><img src="/moyac/images/bookmark.png" title="즐겨찾기" class="only_image"  style="cursor:pointer;"></a>
		<a id="myWrite"><img src="/moyac/images/write.png" title="내가쓴글" class="only_image"  style="cursor:pointer;"></a>
	</div>
	<div class="del_btn">
	<button onclick="return del()" class="btn btn-primary font_family">회원탈퇴</button>
	</div>
	<!-- 내가 쓴글 구현 -->
	<div class="myWrite" style="display: none;">
		<div class="myWrite_dis"></div>
		<div class="myWrite_content scroll-container">
			<!-- 내가 쓴글 - QnA게시판 -->
			<div class="myWrite1">내가 쓴 글</div>
			<div class="myQnA">
			<div class="myWrite_title">
			<div class="myWrite2">QnA 게시판</div>
			<div class="myWrite3">| ${total}개</div>
			</div>
			<div class="content_table">
				<table class="table table-hover table-striped table_top">
					<tr id="table_thead">
						<th>제목</th>
						<th>내용</th>
						<th>작성일자</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
					<c:if test="${list.size() == 0 }">
						<tr>
							<th colspan="5">작성한 QnA가 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${list.size() != 0 }">
						<c:forEach var="board_QnA" items="${list}">
							<tr>
								<td>${board_QnA.subject }</td>
								<td><a href='/moyac/views/board_QnA/content.do?boardno=${board_QnA.boardno}'>${board_QnA.subject }</a></td>
								<td>${board_QnA.reg_date }</td>
								<td>${board_QnA.read_cnt }</td>
								<td>${board_QnA.likes }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			</div>
			<hr>
			<!-- 내가 쓴글 - event게시판 -->
			<div class="myWrite_title">
			<div class="myWrite2">이벤트 게시판</div>
			<div class="myWrite3">| ${total1}개</div>
			</div>
			<div class="content_table">
				<table class="table table-hover table-striped">
					<tr id="table_thead">
						<th>내용</th>
						<th>작성일자</th>
						<th>추천</th>
					</tr>
					<c:if test="${list1.size() == 0 }">
						<tr>
							<th colspan="4">작성한 댓글이 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${list1.size() != 0 }">
						<c:forEach var="reply_event" items="${list1}">
							<tr onclick="location.href='/moyac/views/board_event/content.do?boardno=${reply_event.boardno}'">
								<td>${reply_event.content }</td>
								<td>${reply_event.reg_date }</td>
								<td>${reply_event.likes }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</div>
	<!-- 내가 쓴글 구현 끝-->
	<!-- 	북마크 목록 조회 시작 -->
	<div class="myBookmark" style="display: none;">
		<div class="myBookmark_dis"></div>
		<div class="myBookmark_content scroll-container">
		<div class="myBookmark1">
		<div class="myBookmark2">북마크</div>
		<div class="myBookmark3">| ${total2 }개</div>
		</div>
			<div>
				<c:if test="${list2.size() == 0 }">
					<div>
					즐겨찾기한 약품이 없습니다
					</div>
				</c:if>
				<c:if test="${list2.size() != 0 }">
					<c:forEach var="bookmark" items="${list2}">
						<div class="one" onclick="location.href='/moyac/views/medicine/medicine_info.do?me_no=${bookmark.me_no}&bookmarkConfirm=1'">
							<div class="button_x">
								<a href="/moyac/views/myPage/myPageForm.do?me_no=${bookmark.me_no}&deleteConfirm=1" class=" button_x_hover"><i class="fas fa-times-circle"></i></a>
							</div>
							<div><img class="img_sizeSet" alt="" src="${bookmark.me_pic }" height="50"></div>
							<div class="bookmark_name">${bookmark.me_name }</div>
						</div>
					</c:forEach>
				</c:if>
				<div><p></div>
			</div>
		</div>
	</div>
</body>
</html>