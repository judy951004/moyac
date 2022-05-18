<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery.js"></script>

<script type="text/javascript">
	function chk() {
		if (frm.nickchk.value == 0) {
			alert("닉네임를 확인 해주세요.");
			return false;
		}
		if (frm.emailchk.value == 0) {
			alert("이메일를 확인 해해주세요.");
			return false;
		}
	}
	function chk3() { // 닉네임 중복체크
		if (!frm.nick_name.value) {
			alert("닉네임을 입력하고 중복체크 하시오");
			frm.nick_name.focus();
			return false;
		}
		$.post('/moyac/views/member/confirmNick.do', "nick_name="
				+ frm.nick_name.value, function(data) {
			if (data == 0) {
				$('#err2').html("이미 사용중인 닉네임 입니다.");
				$('#err2').css("color", "red");
				return false;
			} else {
				$('#err2').html("사용 가능한 닉네임 입니다.");
				$('#err2').css("color", "blue");
				frm.nickchk.value = "1";
				return false;
			}
		});
	}
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
	function chk4() { // 이메일 중복체크
		if (!frm.email.value) {
			alert("이메일을 입력하고 중복체크 하시오");
			frm.email.focus();
			return false;
		}
		$.post('/moyac/views/member/confirmEmail.do', "email=" + frm.email.value, function(data) {
			if (data == 0) {
				$('#err3').html("이미 사용중인 이메일 입니다.");
				$('#err3').css("color", "red");
				return false;
			} else {
				$('#err3').html("사용 가능한 이메일입니다.");
				$('#err3').css("color", "blue");
				frm.emailchk.value = "1";
				return false;
			}
		});
	}
</script>
<style type="text/css">
.join_total {
	display: -webkit-box; 
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items:center;
	width: 100%;

}

.join_content {
	display: -webkit-box; 
	display: flex;
	align-items: flex-start;
}

.form-control {
	width: 400px;
	border: none;
	border-bottom: 1px solid #93cfce;
	margin-bottom: 10px;
}
.content_id {
	margin-left: 95px;
	margin-bottom: 0;
}
.err_form {
	height: 30px;
}
.btn_size {
	padding-bottom: 8px;
	margin-left: 10px;
	height: 40px;
}
.form-check-label {
	margin-right: 60px;
}
.form-check-input {
	margin-left: 60px;
}
.gender_form {
	display: -webkit-box; 
	display: flex;
	margin: 10px 0;
}
.id_css {
	border-bottom: none;
}
.main_btn {
	margin-left: 20px;
}
</style>
</head>
<body>
	<form class="join_form" action="update.do" method="post" name="frm" onsubmit="return chk()">
		<input type="hidden" name="nickchk" value="0"> 
		<input type="hidden" name="emailchk" value="0">
		<div class="join_total">
	
			<div>회원정보 수정</div>
			<!-- 아이디 -->
			<div class="join_content">
				<input class="form-control id_css" type="text" name="id" value="${member.id }" placeholder="아이디" required readonly> 
			</div>
				<!-- 아이디 중복체크 메세지 -->
				<div id="err" class="err_form"></div>
				<!-- 비밀번호 -->
				<div class="join_content">
					<input class="form-control" type="password" name="password" placeholder="암호" required>
				</div>
				<!-- 비밀번호 확인 -->
				<div class="join_content">
					<input class="form-control" type="password" name="password2" placeholder="암호확인" required onchange="pass_chk()">
				</div>
					<!-- 쓰고 다른곳을 클릭하면 실행 -->
					<div id="same" class="err_form"></div>
					<!-- 이름 -->
				<div class="join_content">
					<input class="form-control" type="text" value="${member.name }" name="name" placeholder="이름" required>
				</div>
				<!-- 닉네임 -->
				<div class="join_content content_id">
					<input class="form-control" type="text" name="nick_name" placeholder="닉네임" value="${member.nick_name }" required> 
					<input type="button" class="btn btn-primary btn_size" onclick="chk3()" value="중복체크">
				</div>
					<!-- 닉네임 중복체크 메세지 -->
					<div id="err2" class="err_form"></div>
					<!-- 연락처 -->
				<div class="join_content">
					<input class="form-control" type="tel" name="phone" value="${member.phone }" required pattern="010-\d{3,4}-\d{4}"
						placeholder="연락처 ex)010-1111-1111" title="전화현식 010-숫자3/4-숫자4">
				</div>
				<!-- 나이 -->
				<div class="join_content">
					<input class="form-control" type="number" name="age" value="${member.age }" placeholder="나이" required>
				</div>
				<!-- 성별 -->
			<div class="gender_form">
				<div>성별</div>
				<input class="form-check-input" type="radio" name="gender" value="m" checked>
				<label class="form-check-label radio-left" for="mal">남자</label> 
				<input class="form-check-input" type="radio" name="gender" value="f"> 
				<label class="form-check-label" for="fem">여자</label>
			</div>
			<!-- 이메일 -->
				<div class="join_content content_id">
					<input class="form-control" type="email" name="email" required autofocus value="${member.email }" placeholder="이메일"> 
					<input type="button" class="btn btn-primary btn_size" onclick="chk4()" value="중복체크">
				</div>
					<!-- 이메일 중복체크 메세지 -->
					<div id="err3" class="err_form"></div>
				<div>
					<input class="btn btn-primary btn_size" type="submit" value="회원정보 수정">
				</div>
		</div>
	</form>
	<button class="btn btn-primary main_btn" onclick="location.href='/moyac/views/main/moyac_main.do'">메인페이지</button>
</body>
</body>
</html>