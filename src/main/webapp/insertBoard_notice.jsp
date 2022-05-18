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
	Board_noticeDao bd = Board_noticeDao.getInstance();
	Board_notice Board_notice = new Board_notice();
	for (int i = 1; i <= 11; i++) {
		
		int boardno1 = bd.board_newno();
		Board_notice.setBoardno(boardno1);
		Board_notice.setSubject("테스트"+i);
		Board_notice.setId("w1");
		Board_notice.setContent("내용"+i);
		bd.insert(Board_notice);
	}
%>
입력되었습니다.
</body>
</html>