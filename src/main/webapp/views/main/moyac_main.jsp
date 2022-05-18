<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
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
<script src="../../js/jquery.js"></script>
<style type="text/css">
.main_search {
	display: flax;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	text-align: center;
	padding-top: 50px;
}

.font_family {
	font-family: InfinitySans-RegularA1;
}

.main_search img {
	width: 450px;
	cursor: pointer;
}

.d-flex {
	display: flax;
	justify-content: center;
	align-items: center;
		width: 100%;
	height: 100%;
}

.search_form {
	padding: 60px;
}

.search_form2 {
	margin-left: 10px;
	width: 500px;
}
.navigationbar{
	display: flax;
	padding: 20px;
}
.dropdown{
/*   position : relative; */
  width: 50px;
}

.dropbtn_icon{
  font-family : 'Material Icons';
}
.dropbtn{
  border : 1px solid rgb(147, 207, 206);
  border-radius : 4px;
  background-color: rgb(147, 207, 206);
  font-weight: 400;
  color : white;
  padding : 12px;
  width :50px;
  text-align: left;
  cursor : pointer;
  font-size : 12px;
}
.dropdown-content{
	display : none;
  position : absolute;
  z-index : 1; /*다른 요소들보다 앞에 배치*/
  font-weight: 400;
  background-color: rgba(0,0,0,0);
  min-width : 150px;
}

.dropdown-content a{
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 12px;
  padding : 12px 20px;
}

.dropdown-content a:hover{
  background-color : #ececec
}

.dropdown:hover .dropdown-content {
  display: block;
}

.total {
	position: absolute;
	right: 0px;
	top: 0px;
	float: right;
	padding: 20px;
}
.btn-group {
	display: flax;
	align-items: center;
	justify-content: between;
}
.welcome {
	margin-right: 5px;
	font-size: 15px;
	color: black;
	opacity: 0.5;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#disp').load('/moyac/views/main/filter.jsp');
	})
</script>
</head>
<body>
<div class="navigationbar">
	<div class="dropdown">
		<button class="dropbtn">
			<span class="dropbtn_icon"><i class="fas fa-bars fa-2x"></i></span>
		</button>
		<div class="dropdown-content font_family">
				<c:if test="${empty id }">
					<div>
						<a href='/moyac/views/board_notice/list.do'>게시판</a>
					</div>
				</c:if>
				<c:if test="${not empty id}">
					<c:if test="${id != 'admin' }">
						<div>
							 <a href='/moyac/views/board_notice/list.do'>게시판</a>					
 					</div>
					</c:if>
					<c:if test="${id == 'admin' }">
						<div>
							<a href='/moyac/views/admin/adminMember.do'>회원관리</a> <a
								href='/moyac/views/admin/adminBoard.do'>게시글관리</a> <a
								href='/moyac/views/admin/adminMedicine.do'>약품관리</a>
						</div>
					</c:if>
				</c:if>
		</div>
	</div>
	<div class='total font_family'>
		<c:if test="${empty id }">
			<div class='btn-group_btn font_family'>
				<button class="btn btn-primary font_family" onclick="location.href='/moyac/views/member/loginForm.do'">로그인</button>
				<button class="btn btn-primary font_family" onclick="location.href='/moyac/views/member/joinForm.do'">회원가입</button>
			</div>
		</c:if>
		<c:if test="${not empty id}">
			<c:if test="${id != 'admin' }">
				<div class="btn-group">
					<div class="welcome">${nick_name_session }님 환영합니다</div>
					<div class='btn-group_btn'>
						<button class="btn btn-primary font_family" onclick="location.href='/moyac/views/member/logout.do'">로그아웃</button>
						<button class="btn btn-primary font_family"
							onclick="location.href='/moyac/views/myPage/myPageForm.do'">마이페이지</button>
					</div>
				</div>
			</c:if>
			<c:if test="${id == 'admin' }">
				<div class="btn-group">
					<div class="welcome">관리자님 환영합니다</div>
					<div class='btn-group_btn'>
						<button class="btn btn-primary font_family" onclick="location.href='/moyac/views/member/logout.do'">로그아웃</button>
					</div>
				</div>
			</c:if>
		</c:if>
	</div>
	</div>
	<div class="main_search">
		<img alt="" src="../../images/moyamoyac_logo.png"
			onclick="location.href='/moyac/views/main/moyac_main.do'">
		<div class="search_form">
			<form action='/moyac/views/search/search.do' class="d-flex">
				<input type="button" class="filter btn btn-primary font_family" name="filter" value="모양검색"> 
				<input class="form-control me-sm-2 search_form2" type="text" name="search" required="required" autofocus="autofocus"> 
				<input class="btn btn-primary font_family" type="submit" value="검색">
			</form>
		</div>
		<div id="disp"></div>
	</div>
</body>
</html>