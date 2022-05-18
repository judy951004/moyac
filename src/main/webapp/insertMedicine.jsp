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
	MedicineDao md = MedicineDao.getInstance();
 
	for (int i = 1; i <= 2; i++) {
		Medicine medicine = new Medicine();
		
		medicine.setDel("n");
		medicine.setMe_capacity("용량"+i);
		medicine.setMe_color("하양");
		medicine.setMe_shape("삼각형");
		medicine.setMe_formulation("경질캡슐");
		medicine.setMe_effect("효과"+i);
		medicine.setMe_name("타이레놀"+i);
		medicine.setMe_pic("사진"+i);
		medicine.setMe_sales("판매사"+i);
		
		 
		md.insert(medicine);
	}
%>
입력되었습니다.
</body>
</html>