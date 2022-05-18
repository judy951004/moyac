<%@page import="java.sql.Date"%>
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
	Board_eventDao bd = Board_eventDao.getInstance();
	Board_event board_event = new Board_event();
	for (int i = 1; i <= 20; i++) {
		
		int boardno1 = bd.board_newno();
		board_event.setBoardno(boardno1);
		board_event.setSubject("테스트"+i);
		board_event.setId("w1");
		board_event.setContent("내용"+i);
		bd.insert(board_event);
	}
%>
입력되었습니다.
</body>
</html>