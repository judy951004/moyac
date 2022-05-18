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
 
	for (int i = 0; i <= 30; i++) {
		Medicine medicine = new Medicine();
		
		medicine.setDel("n");
		medicine.setMe_capacity(""+i);
		medicine.setMe_color(""+i);
		medicine.setMe_effect(""+i);
		medicine.setMe_formulation(""+i);
		medicine.setMe_name("베아제"+i);
		medicine.setMe_pic(""+i);
		medicine.setMe_sales(""+i);
		medicine.setMe_shape(""+i);
		 
		md.insert(medicine);
	}
%>
</body>
</html>