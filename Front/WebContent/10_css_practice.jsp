<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style type="text/css">
		input{
			border: solid 1px;
			width: 150px;
			height: 30px;
		
		}
		button{
			padding: 27px;
			margin: 5px;
		
		}
		#col1{
			width: 80px;
		}
	
	</style>


</head>
<body>
	
	<%@include file="css_home.jsp" %>
	
	<h2>로그인 폼</h2>
	
	<form>
	<table>
		<tr>
			<th></th><th></th><th></th>
		</tr>
		<tr>
			<td id="col1">아이디</td><td><input type="text"></td><td rowspan="2"><button>로그인</button></td>
		</tr>
		<tr>
			<td id="col1">비밀번호</td><td><input type="text"></td>
		</tr>
	
	</table>
	</form>

</body>
</html>