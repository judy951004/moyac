<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/writeForm.css" rel="stylesheet">
<script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>
</head>
<body>
	<h3>공지사항 수정</h3>
	<div class="total_content">
		<form action="/moyac/views/board_notice/update.do" method="post">
			<input type="hidden" name="boardno" value="${board_notice.boardno }">
			<input type="hidden" name="pageNum" value="${pageNum }"> <input
				type="hidden" name="nick_name" value="${nick_name }">
			<div>제목</div>
			<div>
				<input class="form-control" type="text" name="subject" required="required" maxlength="50"
					autofocus="autofocus" value="${board_notice.subject }">
			</div>
			<p>
			<div>내용</div>
			<div>
				<textarea class="form-control" rows="16" cols="40" name="content" required="required">${board_notice.content }</textarea>
				<script type="text/javascript">
 					CKEDITOR.replace('content'
                		, {height: 500                                                  
             	    });
				</script>
			</div>
			<div class="content_write" align="center">
				<input class="btn btn-primary" type="submit" value="확인">
			</div>
		</form>
	</div>
</body>
</html>