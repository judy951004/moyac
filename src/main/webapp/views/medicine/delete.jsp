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
		<c:if test="${empty search and empty color and empty shape and empty formulation}">
			<script type="text/javascript">
				alert("삭제 완료");
				location.href = "/moyac/views/admin/adminMedicine.do?pageNum=${pageNum}";
			</script>
		</c:if>
		<c:if test="${not empty color || not empty shape || not empty fotmulation}">
			<script type="text/javascript">
				alert("삭제 완료");
				location.href = "/moyac/views/search/filterSearch.do?pageNum=${pageNum}&&color=${color}&shape=${shape }&formulation=${formulation }";
			</script>
		</c:if>
		<c:if test="${not empty search }">
			<script type="text/javascript">
				alert("삭제 완료");
				location.href = "/moyac/views/search/search.do?pageNum=${pageNum}&search=${search}";
			</script>
		</c:if>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("삭제 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>