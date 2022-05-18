<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0}">
		<c:if test="${idSession=='admin' }">
			<script type="text/javascript">
				alert("탈퇴 완료");
				location.href = "/moyac/views/admin/adminMember.do";
			</script>
		</c:if>
		<script type="text/javascript">
			alert("탈퇴 완료");
			location.href = "/moyac/views/member/loginForm.do";
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("탈퇴 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>