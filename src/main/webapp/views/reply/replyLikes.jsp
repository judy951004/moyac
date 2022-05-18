<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		location.href = "/moyac/views/board_event/content.do?pageNum=${pageNum}&boardno=${boardno}";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		location.href = "/moyac/views/board_event/content.do?pageNum=${pageNum}&boardno=${boardno}";
	</script>
</c:if>
</head>
<body>

</body>
</html>