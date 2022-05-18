
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
Reply_eventDao rd = Reply_eventDao.getInstance();
	Reply_event reply = new Reply_event();
	for (int i = 1; i <= 5; i++) {
	reply.setContent("댓글내용");
	reply.setId("admin");
	reply.setBoardno(62);
	rd.insert(reply);
	}
	
	
	/* for (int i = 1; i <= 5; i++) {
		
		
		int reply_no1 = rd.reply_newno();
		reply.setReply_no(reply_no1);
		reply.setBoardno(62);
		reply.setId("admin");
		reply.setContent("댓글내용"+i);
		
		rd.insert(reply);
	} */
%>
입력되었습니다.
</body>
</html>