<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	
		// 세션 없애기 // 장바구니 없어짐
		session.setAttribute("cartlist", null);
	
		response.sendRedirect("cartlist.jsp");
		
	%>


</body>
</html>