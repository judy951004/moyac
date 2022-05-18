<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h2>공지사항 작성</h2>
	<div class="total_content">
		<form action="/moyac/views/board_notice/write.do" method="post">
			<input type="hidden" name="boardno" value="${boardno }"> <input
				type="hidden" name="id" value=${id }> <input type="hidden"
				name="nick_name" value="${nick_name }"> <input type="hidden"
				name="pageNum" value="${pageNum }"> <input type="hidden"
				name="id" value="${id }">
			<div>제목</div>
			<div>
				<input class="form-control" type="text" name="subject" maxlength="50"
					required="required" autofocus="autofocus">
			</div>
			<p>
			<div>질문</div>
			<textarea class="form-control" rows="16" cols="40" name="content"
				required="required"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('content', {
					height : 500
				});
			</script>

			<div align="center" class="write_content">
				<input class="btn btn-primary" type="submit" value="확인">
			</div>
		</form>
	</div>
</body>
</html>