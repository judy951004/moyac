<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.jumbotron {
	text-align: center;
		width:400px;
}
.container {
justify-content:center;
margin-top: 200px;
}
.login_dis {
	position:relative;
	justify-content: center;
	left: 50%;
	margin-left: -200px;
}
.login_formDis {
	justify-content: center;
	width:400px;
}
.form-group {
	padding: 0 30px;
	width:100%;
	padding-bottom: 5px;
}
.btn-group {
	width:340px;
	padding: 5px 0;
}
</style>
</head>
<body>
	<div class="container">
		<div class="login_dis">
			<div class="jumbotron">
				<form action="/moyac/views/member/login.do" class="login_formDis">
					<h3 style="text-align: center; padding-bottom:15px;">Welcome!</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="id" maxlength="20" required="required">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="Password" name="password" maxlength="20" required="required">
					</div>
					<div class="btn-group">
						<input type="submit" class="btn btn-primary form-control" value="Login">
					</div>
				</form>
				<button class="btn btn-primary" onclick="location.href='joinForm.do'">회원가입</button>
				<button class="btn btn-primary" onclick="location.href='findIdForm.do'">아이디 찾기</button>
				<button class="btn btn-primary" onclick="location.href='findPasswordForm.do'">비밀번호 찾기</button>
			</div>
		</div>
	</div>
</body>
</html>