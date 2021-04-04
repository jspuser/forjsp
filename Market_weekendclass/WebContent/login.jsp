<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/bootstrap.css"> <%// css 가져오기 %>
	<meta http-equiv="content-Type" content="text/html" charset="UTF-8"> <%// 페이지속성 %>
	<meta name="viewport" content="width=device-width initial-scale-1">	<%// 반응형 웹 %>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	
	function checkadd() {
		
		var regx = /^[a-zA-Z0-9]*$/;
		
		if(!regx.test(newmember.id.value)){
			alert("영문 또는 숫자만 입력해주세요");
			return false;
		}
		
		if( !newmember.id.value ){
			alert(" 아이디를 입력해주세요 ");
			return false;
		}
		if ( !newmember.password.value ){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		
	}
	

</script>
	
	<%@include file ="menu.jsp"  %>
	
	<div class="jumbotron">
		<div class="container">
			<h1> 로그인 </h1>
		</div>
	</div>
	
	
	<div class="container" style="padding-top: 50px">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="jumptron">
				<form name="newmember" method="post" action="loginaction.jsp" onsubmit="return checkadd()">
					<br>
					<div class="form-group row">
						<label class="col-sm-3">아이디</label>
						<div class="col-sm-9">
							<input type="text" name="id" class="form-control" placeholder="사용자 아이디" maxlength="20">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">비밀번호</label>
						<div class="col-sm-9">
							<input type="password" name="password" class="form-control" placeholder="비밀번호" maxlength="20">
						</div>
					</div>
					
					
					<div class="form-group row">
						
						<div class="col-sm-10"></div>
						<div style="padding-left: 10px">
							<button type="submit" class="btn btn btn-lg btn-success btn-black"> 로그인 </button>
							
						</div>
					
					</div>
					
					
				
				</form>
				
				
			</div>
		</div>
	</div>
	<%@include file ="footer.jsp"  %>
	
	

</body>
</html>