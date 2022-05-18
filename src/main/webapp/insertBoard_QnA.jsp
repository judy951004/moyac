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
	Board_QnA_Dao bd = Board_QnA_Dao.getInstance();
	Board_QnA board_QnA = new Board_QnA();
	for (int i = 1; i <= 70; i++) {
		
		int boardno1 = bd.board_newno();
		board_QnA.setBoardno(boardno1);
		board_QnA.setRe_level(0);
		board_QnA.setRe_step(0);
		board_QnA.setSubject("테스트"+i);
		board_QnA.setId("w1");
		board_QnA.setContent("내용"+i);
		board_QnA.setRef(boardno1); 
		bd.insert(board_QnA);
	}
%>
입력되었습니다.
</body>
</html>