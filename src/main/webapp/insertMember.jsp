

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.*, dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberDao md = MemberDao.getInstance();

	for (int i = 0; i <= 30; i++) {
		Member member = new Member();

		member.setId("아이디" + i);
		member.setPassword("" + i);
		member.setName("닉네임" + i);
		member.setNick_name("" + i);
		member.setPhone(""+i);
		member.setGender("" + i);
		member.setAge(i);
		member.setEmail("이메일"+i);
		md.insert(member);
	}
	%>
	입력되었습니다.
</body>
</html>