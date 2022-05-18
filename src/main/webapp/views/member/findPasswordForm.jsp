<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/find.css">
</head>
<body>
	<form action="findPw.do" method="post" class="content join_form">
		<div class="join_total">
			<div class="title_size">비밀번호 찾기</div>
			<input type="text" class="form-control" name="id" placeholder="아이디" required="required"> 
			<input type="text" class="form-control" name="email" placeholder="이메일" required="required"> 
			<input type="submit" class="btn btn-primary btn_size" value="비밀번호 찾기">
		</div>
	</form>
</body>
</html>