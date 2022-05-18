<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/find.css">
<script type="text/javascript">
	function pass_chk() { // 암호 확인
		if (frm.password.value != '' && frm.password2.value != '') {
			if (frm.password.value == frm.password2.value) {
				document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
				document.getElementById('same').style.color = 'blue';
			} else {
				document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('same').style.color = 'red';
				frm.password2.focus();
				frm.password2.value = "";
			}
		}
	}
</script>
<style type="text/css">
.btn_size {
	margin-top: 20px;
}
</style>
</head>
<body>
	<form action="changePw.do" name="frm" method="post" class = "content join_form">
		<div class="join_total">
			<div class="title_size">새로운 비밀번호</div>
				<div class="join_content">
					<input class="form-control id_css" type="text" name="id" value="${id }" readonly>
				</div>
				<div>
					<input type="password" class="form-control" name="password" placeholder="암호" required autofocus>
				</div>
				<div>
					<input type="password" class="form-control" name="password2" placeholder="암호확인" required onchange="pass_chk()">
					<div id="same" class="err_form"></div>
				</div>
			<div>
				<input class="btn btn-primary btn_size" type="submit" value="비밀번호 변경">
			</div>
		</div>
	</form>
</body>
</html>