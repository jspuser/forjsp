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
		session.setAttribute("ID", null);
		
	%>
	<script type="text/javascript">
			alert('로그아웃 되었습니다');
			location.href="main.jsp";
			
	</script>


</body>
</html>