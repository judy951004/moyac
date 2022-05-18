<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/find.css">
</head>
<form class = "content join_form" action="findId.do" method="post">
<div class="join_total">
	<div class="title_size">아이디 찾기</div>
	<div class="textbox join_content">
  		<input id="text" class="form-control" name=name required type="text" placeholder="이름" />
 	</div>
	<div class="textbox join_content">
  		<input id="email" class="form-control" name=email required type="email" placeholder="이메일" />
	</div><br><br>
   	<input class="btn btn-primary btn_size" type="submit" id="check" value="아이디찾기">
</div>
</form>
</html>