<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
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
	<%
		String name ="";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies !=null){
			
			for(int i=0;i<cookies.length;i++){
				
				String temp = cookies[i].getName();
				
				if(temp.equals(name)){
					name = cookies[i].getValue();
				}
				
				
			}
			
		}
	
	%>

	
	<%@include file ="menu.jsp"  %>
	
	<%// 캐러셀 %>
	
	<div class="container">
	 	<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
	 		
	 		<ol class="carousel-indicators">
	 			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	 			<li data-target="#myCarousel" data-slide-to="1" ></li>
	 			<li data-target="#myCarousel" data-slide-to="2" ></li>
	 		</ol>
	 		
		 			<div class="carousel-inner">
		 				<div class="item active">
		 					<img alt="" src="image/carousel1.jpg">
		 				</div>
		 				<div class="item">
		 					<img alt="" src="image/carousel2.jpg">
		 				</div>
		 				<div class="item">
		 					<img alt="" src="image/carousel3.jpg">
		 				</div>
					</div>
	 			
							 		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
							 			<span class="glyphicon glyphicon-chevron-left"></span>
							 		</a>
							 		<a class="right carousel-control" href="#myCarousel" data-slide="next">
							 			<span class="glyphicon glyphicon-chevron-right"></span>
							 		</a>
	</div>
	</div>
	
	<%
		ProductDao dao2 = new ProductDao();
		ArrayList<Product> listProducts = dao2.getallProducts();
		
	%>
	<div class="container">
		<div class="row" align="center">
		<%
			for(int i=0;i<listProducts.size();i++){
				Product product = listProducts.get(i);
				if(product.getPinstock()==0){
					dao2.nactive(product.getProductID());
				}else{
					dao2.active(product.getProductID());
				}
				if(product.getconditions().equals("NEW") && product.getActivation() == 1){
		%>
			<div class="col-md-4">
				<a href="productpage.jsp?ProductID=<%=product.getProductID()%>"><img src="image/<%=product.getFilename() %>" style="width: 100%"></a>
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><%=product.getPprice() %>
				<p><a href="productpage.jsp?ProductID=<%=product.getProductID()%>" class="btn btn-primary" role="button">상세보기</a>
			
			
			</div>
		
				
		<%		
				}
			}
		%>
		
		</div>
	</div>
	
	
	
		
	<%@include file ="footer.jsp"  %>
	
	

</body>
</html>