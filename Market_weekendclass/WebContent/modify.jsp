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

	
	<%@include file ="menu.jsp"  %>
	
	<div class="jumbotron">
		<div class="container">
			<h1> 제품 등록</h1>
		</div>
	</div>
	
	<script type="text/javascript">
		
		function checkadd(){
			
			// 상품명은 최소 4글자이상
			if(newproduct.pname.value.length < 4 || newproduct.pname.value.length > 50){
				alert("[상품명]\n 최소 4글자 - 최대 50까지 입력해주세요");
				newproduct.pname.focus();
				return false;
			}
			if(newproduct.pprice.value.length == 0 || isNaN(newproduct.pprice.value)){
												// isNaN(값) : 해당 값의 널값 && 문자 여부 판단
				alert("[가격]\n 숫자만 입력해주세요 ")
				newproduct.pprice.focus();
				return false;
			}
			
			if(newproduct.pprice.value < 0){
				// isNaN(값) : 해당 값의 널값 && 문자 여부 판단
			alert("[가격]\n 양수를 입력해주세요 ")
			newproduct.pprice.focus();
			return false;
			}
			
			if(newproduct.pinstock.value.length == 0 || isNaN(newproduct.pinstock.value)){
				// isNaN(값) : 해당 값의 널값 && 문자 여부 판단
			alert("[재고 수]\n 숫자만 입력해주세요 ")
			newproduct.pinstock.focus();
			return false;
			}
			
			if(newproduct.pinstock.value < 0){
			// isNaN(값) : 해당 값의 널값 && 문자 여부 판단
			alert("[재고 수]\n 양수를 입력해주세요 ")
			newproduct.pinstock.focus();
			return false;
			}
			
			
		}
	
	
	</script>
	
	<%
		String ProductID = request.getParameter("ProductID");
		
		ProductDao dao = ProductDao.getinstance();
		
		Product product = dao.getProduct(ProductID);
	
	%>
	
	
	<div class="container">
		<form name="newproduct" method="post" action="modifyaction.jsp" enctype="multipart/form-data" onsubmit="return checkadd()">
			
			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type="text" name="ProductID" class="form-control" value="<%=product.getProductID() %>">
				</div>
				<label>*수정불가</label>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="pname" class="form-control" value="<%=product.getPname() %>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품가격</label>
				<div class="col-sm-3">
					<input type="text" name="pprice" class="form-control" value="<%=product.getPprice() %>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 설명</label>
				<div class="col-sm-3">
					<textarea rows="5" name="description" class="form-control" ><%=product.getDescription() %></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control" value="<%=product.getManufacturer() %>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value="<%=product.getCategory() %>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-3">
					<input type="text" name="pinstock" class="form-control" value="<%=product.getPinstock() %>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-3">
				<% if(product.getconditions().equals("NEW")){
					%>
					<input type="radio" name="conditions" value="NEW" checked="checked"> 신제품
					<input type="radio" name="conditions" value="OLD"> 기존제품
				<%
				}else{
				%>
					<input type="radio" name="conditions" value="NEW"> 신제품
					<input type="radio" name="conditions" value="OLD" checked="checked"> 기존제품
				<%
				}
				%>
					
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">이미지파일</label>
				<div class="col-sm-3">
					<input type="file" name="filename" class="form-control">
				</div>
				<label>*기존파일대로 하려면 입력 X</label>
					<input type="hidden" name="filename2" value="<%=product.getFilename() %>">
			</div>
			
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<input type="submit" class="btn btn-primary" value="등록">
			
			</div>
		
		</form>
	</div>
	<%@include file ="footer.jsp"  %>
	
	

</body>
</html>