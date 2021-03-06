<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ include file="../views/sessionChk.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
<link href="../../css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../css/main_navi.css">
<deco:head></deco:head>
<style type="text/css">
.container {
	display: flex;
	justify-content: space-between;
 	 margin-left: 70px; 
	 padding: 0;
	 margin-top: -30px;
	 margin-bottom: -50px;
	 background:rgba(0,0,0,0);
	 width:500px;
	 position: relative;
	 left: 0;
}
.container> div {
	 text-align: center;
	 text-decoration-line: none;
	 color: gray ;
	 font-size: 30px;
	 border: 0 15px;
	 cursor: pointer;
	 padding: 12px 15px;
}

div.on{
	background:#ededed;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var click_id = window.location.pathname
		if(click_id.includes('board_notice')) {
			$('.container div').removeClass();
			$('#a-1').addClass('on');
		}
		if(click_id.includes('board_QnA')) {
			$('.container div').removeClass();
			$('#a-2').addClass('on');
		}
		if(click_id.includes('board_event')) {
			$('.container div').removeClass();
			$('#a-3').addClass('on');
		}
	});	
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
						<a href='/moyac/views/board_notice/list.do'>?????????</a>			
					</div>
				</c:if>
				<c:if test="${not empty id}">
					<c:if test="${id != 'admin' }">
						<div>
							<a href='/moyac/views/board_notice/list.do'>?????????</a>		
						</div>
					</c:if>
					<c:if test="${id == 'admin' }">
						<div>
							<a href='/moyac/views/admin/adminMember.do'>????????????</a> <a
								href='/moyac/views/admin/adminBoard.do'>???????????????</a> <a
								href='/moyac/views/admin/adminMedicine.do'>????????????</a>
						</div>
					</c:if>
				</c:if>
			</div>
		</div>
		<div class="moyac_logo" align="center">
			<a href="/moyac/views/main/moyac_main.do"><img alt=""
				src="../../images/moyamoyac_logo.png" height="150" width="300"></a>
		</div>
		<div class='total font_family'>
			<c:if test="${empty id }">
				<div class='btn-group_btn font_family'>
					<button class="btn btn-primary font_family"
						onclick="location.href='/moyac/views/member/loginForm.do'">?????????</button>
					<button class="btn btn-primary font_family"
						onclick="location.href='/moyac/views/member/joinForm.do'">????????????</button>
				</div>
			</c:if>
			<c:if test="${not empty id}">
				<c:if test="${id != 'admin' }">
					<div class="btn-group">
						<div class="welcome">${nick_name_session }??? ???????????????</div>
						<div class='btn-group_btn'>
							<button class="btn btn-primary font_family"
								onclick="location.href='/moyac/views/member/logout.do'">????????????</button>
							<button class="btn btn-primary font_family"
								onclick="location.href='/moyac/views/myPage/myPageForm.do'">???????????????</button>
						</div>
					</div>
				</c:if>
				<c:if test="${id == 'admin' }">
					<div class="btn-group">
						<div class="welcome">???????????? ???????????????</div>
						<div class='btn-group_btn'>
							<button class="btn btn-primary font_family"
								onclick="location.href='/moyac/views/member/logout.do'">????????????</button>
						</div>
					</div>
				</c:if>
			</c:if>
		</div>
	</div>
	<div class="container">
		<div onclick="location.href='/moyac/views/board_notice/list.do'" id="a-1">????????????</div>
		<div onclick="location.href='/moyac/views/board_QnA/list.do'"  id="a-2">QnA?????????</div>
		<div onclick="location.href='/moyac/views/board_event/list.do'"  id="a-3">??????????????????</div>
	</div>
	<deco:body></deco:body>
</body>
</html>