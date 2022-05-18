<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 필터용 css */
.filter_form {
	display: none;
	position: fixed;
	width: 100%;
	height: 100vh;
	z-index: 100;
	top: 0;
}

.filter_form .filter_dis {
	height: 100%;
	width: 100%;
	background-color: black;
	opacity: 0.3;
}
.filter_form .close {
	position: absolute;
	width: 20px;
	top: 24px;
	right: 24px;
	cursor: pointer;
}
.filter_form .filter_content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 35%;
	height: 80%;
	min-height: 50vh;
	padding: 30px;
	overflow: auto;
}
.filter_content::-webkit-scrollbar {
	width: 10px;
}
.filter_content::-webkit-scrollbar-thumb {
    background-color: rgba(147, 207, 206, 0.7);
    border-radius: 10px;
    opacity: 0.2;
  }
.filter_content::-webkit-scrollbar-track {
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
.content_box .color_box{
	position: relative;
	display: inline-block;
	margin: 0 10px;
	padding-bottom: 5px;
}
.formulation_box {
	position: relative;
	display: inline-block;
	margin: 0 10px;
	padding-bottom: 5px;
}
.shape_box {
	position: relative;
	display: inline-block;
	margin: 0 10px;
	padding-bottom: 5px;
	width: 100px;
	font-size: 15px;
}
.content_box .color .shape .formulation {
	color: blue;
	border: 1px solid gray;
	padding: 6px 12px 4px 12px;
	border-radius: 16px;
	font-size: 14px;
	cursor: pointer;
	background: white;
}
.content_box input {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: inherit;
	height: inherit;
	margin-bottom: 0;
	z-index: -1;
	opacity: 0;
}
.filter_choice {
	display: flex;
}
#choice_color {
	margin-bottom: 10px;
	margin-left: 10px;
}
#choice_formulation {
	margin-bottom: 10px;
	margin-left: 10px;
}
#choice_shape {
	margin-bottom: 10px;
	margin-left: 10px;
}
.choice_color {
	margin-bottom: 10px;
}
.choice_formulation {
	margin-bottom: 10px;
}
.choice_shape {
	margin-bottom: 10px;
}	
.font_family {
	font-family: InfinitySans-RegularA1;
}
.btn-outline-primary {
	font-weight: bold;
	color: #ac571c;
	border-radius: 18px;
	border-color: #ac571c;
	font-size: 14px;
	font-family: InfinitySans-RegularA1;
}
.selectCon {
	font-weight: bold;
	color: black;
}
.seach_mdi {
	margin-top: 20px;
}
/* 필터용 css 끝 */
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
/* 필터용 j쿼리 */
	$(function() {
		$('.filter').on('click', function(){
			$('.filter_form').show();
			('html body').css('overflow', 'hidden');
		})
		$('.close, .filter_dis, .seach_mdi').on('click', function() {
			$('.filter_form').hide();
			$('html body').css('overflow', 'auto');
		});
		$('input[name="color"]').change(function() {
			$('#choice_color').text(frm_01.color.value);
		});
		$('input[name="shape"]').change(function() {
			$('#choice_shape').text(frm_01.shape.value);
		});
		$('input[name="formulation"]').change(function() {
			$('#choice_formulation').text(frm_01.formulation.value);
		});
	});
/* 필터용 j쿼리 끝*/
</script>
</head>
<body>
	<!-- 필터 구현 -->
<form class="filter_form" action="/moyac/views/search/filterSearch.do" method="post" name="frm_01">
		<div class="filter_dis"></div>
		<div class="filter_content">
		<div class="close"></div>
			<div class="content_inner">
				<div class="content">
					<h5 class="modal-title font_family">색상 선택</h5>
					<div class="filter_choice">
						<div class="choice_color font_family">선택한 색상 : </div>
						<div id="choice_color" class="font_family selectCon"></div>
					</div>
					<div class="content_box">
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c1">하양</label>
							<input type="radio" name="color" id="c1" value="하양">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c2">노랑</label>
							<input type="radio" name="color" id="c2" value="노랑">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c3">주황</label>
							<input type="radio" name="color" id="c3" value="주황">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c4">분홍</label>
							<input type="radio" name="color" id="c4" value="분홍">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c5">빨강</label>
							<input type="radio" name="color" id="c5" value="빨강">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c6">갈색</label>
							<input type="radio" name="color" id="c6" value="하양">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c7">연두</label>
							<input type="radio" name="color" id="c7" value="연두">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c8">초록</label>
							<input type="radio" name="color" id="c8" value="초록">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c9">청록</label>
							<input type="radio" name="color" id="c9" value="청록">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c10">파랑</label>
							<input type="radio" name="color" id="c10" value="파랑">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c11">남색</label>
							<input type="radio" name="color" id="c11" value="남색">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c12">자주</label>
							<input type="radio" name="color" id="c12" value="자주">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c13">보라</label>
							<input type="radio" name="color" id="c13" value="보라">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c14">회색</label>
							<input type="radio" name="color" id="c14" value="회색">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c15">검정</label>
							<input type="radio" name="color" id="c15" value="검정">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c16">투명</label>
							<input type="radio" name="color" id="c16" value="투명">
						</div>
						<div class="color_box">
							<label class="color btn btn-outline-primary" for="c17"><i class="fas fa-times-circle fa-lg"></i></label>
							<input type="radio" name="color" id="c17" value="">
						</div>
					</div>
				</div>
				<hr>
				<div class="content">
					<h5 class="content_title font_family">모양 선택</h5>
					<div class="filter_choice">
						<div class="choice_shape font_family">선택한 모양 : </div>
						<div id="choice_shape" class="font_family selectCon"></div>
					</div>
					<div class="content_box">
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s1">원형</label>
							<input type="radio" name="shape" id="s1" value="원형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s2">타원형</label>
							<input type="radio" name="shape" id="s2" value="타원형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s3">반원형</label>
							<input type="radio" name="shape" id="s3" value="반원형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s4">삼각형</label>
							<input type="radio" name="shape" id="s4" value="삼각형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s5">사각형</label>
							<input type="radio" name="shape" id="s5" value="사각형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s6">마름모형</label>
							<input type="radio" name="shape" id="s6" value="마름모형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s7">장방형</label>
							<input type="radio" name="shape" id="s7" value="장방형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s8">오각형</label>
							<input type="radio" name="shape" id="s8" value="오각형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s9">육각형</label>
							<input type="radio" name="shape" id="s9" value="육각형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s10">팔각형</label>
							<input type="radio" name="shape" id="s10" value="팔각형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s11">8자형</label>
							<input type="radio" name="shape" id="s11" value="8자형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s12">강낭콩형</label>
							<input type="radio" name="shape" id="s12" value="강낭콩형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s13">과일모양</label>
							<input type="radio" name="shape" id="s13" value="과일모양">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s14">구형</label>
							<input type="radio" name="shape" id="s14" value="구형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s15">나비넥타이</label>
							<input type="radio" name="shape" id="s15" value="나비넥타이">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s16">나비모양</label>
							<input type="radio" name="shape" id="s16" value="나비모양">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s17">다이아몬드</label>
							<input type="radio" name="shape" id="s17" value="다이아몬드">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s18">도넛형</label>
							<input type="radio" name="shape" id="s18" value="도넛형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s19">동물모양</label>
							<input type="radio" name="shape" id="s19" value="동물모양">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s20">땅콩형</label>
							<input type="radio" name="shape" id="s20" value="땅콩형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s21">레몬형</label>
							<input type="radio" name="shape" id="s21" value="레몬형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s22">물방울형</label>
							<input type="radio" name="shape" id="s22" value="물방울형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s23">방패형</label>
							<input type="radio" name="shape" id="s23" value="방패형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s24">사과형</label>
							<input type="radio" name="shape" id="s24" value="사과형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s25">심장형</label>
							<input type="radio" name="shape" id="s25" value="심장형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s26">십각형</label>
							<input type="radio" name="shape" id="s26" value="십각형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s27">오목삼각형</label>
							<input type="radio" name="shape" id="s27" value="오목삼각형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s28">클로버형</label>
							<input type="radio" name="shape" id="s28" value="클로버형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s29">탄환형</label>
							<input type="radio" name="shape" id="s29" value="탄환형">
						</div>
						<div class="shape_box">
							<label class="shape btn btn-outline-primary" for="s30"><i class="fas fa-times-circle fa-lg"></i></label>
							<input type="radio" name="shape" id="s30" value="">
						</div>
					</div>
				</div>
				<hr>
				<div class="content">
					<h5 class="content_title font_family">제형 선택</h5>
					<div class="filter_choice">
						<div class="choice_formulation font_family">선택한 제형 : </div>
						<div id="choice_formulation" class="font_family selectCon"></div>
					</div>
					<div class="content_box">
						<div class="formulation_box">
							<label class="formulation btn btn-outline-primary" for="t1">정제</label>
							<input type="radio" name="formulation" id="t1" value="정제">
						</div>
						<div class="formulation_box">
							<label class="formulation btn btn-outline-primary" for="t2">경질캡슐</label>
							<input type="radio" name="formulation" id="t2" value="경질캡슐">
						</div>
						<div class="formulation_box">
							<label class="formulation btn btn-outline-primary" for="t3">연질캡슐</label>
							<input type="radio" name="formulation" id="t3" value="연질캡슐">
						</div>
						<div class="formulation_box">
							<label class="formulation btn btn-outline-primary" for="t4">기타</label>
							<input type="radio" name="formulation" id="t4" value="기타">
						</div>
						<div class="formulation_box">
							<label class="formulation btn btn-outline-primary" for="t5"><i class="fas fa-times-circle fa-lg"></i></label>
							<input type="radio" name="formulation" id="t5" value="">
						</div>
					</div>
				</div>
			</div>
			<div class="btn_box">
				<input class="seach_mdi btn btn-primary" type="submit" value="확인">
			</div>
		</div>
	</form>
	<!-- 필터 구현 끝 -->

</body>
</html>