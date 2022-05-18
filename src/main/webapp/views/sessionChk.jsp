<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value='${sessionScope.id}'></c:set>
<c:if test="${empty id }">
	<script type="text/javascript">
		alert("로그인하고 하세요");
		location.href="/moyac/views/member/loginForm.do"
	</script>
</c:if>