<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("수정 성공 !!");
		location.href="/moyac/views/board_notice/list.do?pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("수정 실패 !!");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result < 0 }">
	<script type="text/javascript">
		alert("암호가 다릅니다");
		history.go(-1);
	</script>
</c:if>
</head>
<body>

</body>
</html>