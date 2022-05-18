<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/admin.css" rel="stylesheet">
<script type="text/javascript">
	function del(delId) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="/moyac/views/myPage/delete.do?id="+delId;
		}
	}
	
	function chk(){
		if(!frm.searchValue.value){
			alert("검색어를 입력하세요");
			frm.searchValue.focus();
			return false;
		}
	}
</script>
</head>
<body>
<h2>회원관리</h2>
<section class="container_search">
	<div class="top">
		<div class="searchForm">
			<form action="/moyac/views/admin/adminFindMember.do" name="frm" onsubmit="return chk();"  class="d-flex">
				<select name="searchKey" class="searchTab">
					<option value="id" >아이디</option>
					<option value="name">이름</option>
					<option value="nick_name">별명</option>
				</select>
				<input class="form-control search_form2" type="text" name="searchValue" class="searchTab" placeholder="검색어를 입력해주세요.">
				<input class="btn btn-primary" type="submit" value="검색" class="searchTab">
			</form>
		</div>
	</div>
	<div class="container_table">
		<table border="1" class="table table-hover table-striped">
			<thead>
			<tr>
				<th>id</th><th>비밀번호</th><th>이름</th><th>별명</th><th>연락처</th><th>성별</th><th>연령</th><th>이메일</th><th>회원가입일</th><th>탈퇴여부</th><th>수정</th><th>탈퇴</th>
			</tr>
			</thead>
			<c:if test="${empty list} ">
				<tr><th colspan="14">회원 데이터가 존재하지 않습니다</th></tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="member" items="${list }">
					<tr>
						<td>${member.id}</td>
						<td>${member.password}</td>
						<td>${member.name}</td>
						<td>${member.nick_name}</td>
						<td>${member.phone}</td>
						<td>${member.gender}</td>
						<td>${member.age}</td>
						<td>${member.email}</td>
						<td>${member.reg_date}</td>
						<td>${member.del}</td>
						<td><a href="../myPage/updateForm.do?id=${member.id}" class="btn btn-primary">수정</a></td>
						<c:if test= "${member.del=='y' }">
						<td></td>
						</c:if>
						<c:if test= "${member.del=='n' }">
						<td><a onclick="del('${member.id}')" class="btn btn-primary">탈퇴</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
<!-- paging -->
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button class="btn btn-outline-primary"
				onclick="location.href='/moyac/views/admin/adminMember.do?pageNum=${startPage-1 }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i}">
				<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/admin/adminMember.do?pageNum=${i}'" 
					disabled="disabled">${i}</button>
			</c:if>
			<c:if test="${currentPage != i}">
				<button class="btn btn-outline-primary"
					onclick="location.href='/moyac/views/admin/adminMember.do?pageNum=${i}'">${i}</button>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<button class="btn btn-outline-primary" onclick="location.href='/moyac/views/admin/adminMember.do?pageNum=${endPage+1}'">다음</button>
		</c:if>
	</div>
</section>
</body>
</html>