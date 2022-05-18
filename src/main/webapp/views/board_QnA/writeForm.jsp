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
	<h2>QnA 작성</h2>
	<div class="total_content">
		<form action="/moyac/views/board_QnA/write.do" method="post">
			<input type="hidden" name="boardno" value="${boardno }"> 
			<input type="hidden" name="id" value=${id }> 
			<input type="hidden" name="nick_name" value="${nick_name }"> 
			<input type="hidden" name="pageNum" value="${pageNum }"> 
			<input type="hidden" name="ref" value="${ref }"> 
			<input type="hidden" name="re_level" value="${re_level }"> 
			<input type="hidden" name="re_step" value="${re_step }"> 
			<input type="hidden" name="id" value="${id }">

			<c:if test="${boardno == 0 }">

				<div>제목</div>
				<div class="subject_css">
					<input class="form-control" type="text" name="subject" maxlength="50"
						required="required" autofocus="autofocus">
				</div>

			</c:if>
			<c:if test="${boardno != 0 }">

				<div>제목</div>
				<div class="subject_css">${subject} =><input class="form-control" type="text" name="subject"
						required="required" autofocus="autofocus">
				</div>

			</c:if>
			<p>
			<div>질문</div>
			<div>
				<textarea class="form-control" rows="16" cols="40" name="content" required="required">${board_QnA.content }</textarea>
				<script type="text/javascript">
					CKEDITOR.replace('content', {
						height : 500
					});
				</script>
			</div>


			<div align="center" class="write_ok">
				<input class="btn btn-primary" type="submit" value="확인">
			</div>
		</form>
	</div>
</body>
</html>