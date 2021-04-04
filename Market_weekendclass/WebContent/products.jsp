<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<%// 1.부트스트랩 연결  %>
	<link rel="stylesheet" href="css/bootstrap.css"> <%// css 가져오기  %>
	<meta http-equiv="content-Type" content="text/html" charset="UTF-8"> <%// 페이지속성  %>
	<meta name ="viewprot" content="width=device-width initial-scale-1"> <%// 반응형 웹 %>	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

<title>Insert title here</title>
</head>
<body>

		<%@include file ="menu.jsp" %>
			
			<div class="jumbotron">
				<div class="container">
					<h1> 컴퓨터 제품 </h1>
				</div>
			</div>
			
			<%		
				ProductDao dao = ProductDao.getinstance();
				ArrayList<Product> listProducts = dao.getallProducts();
				
				String category = request.getParameter("category");
				
				if(category.equals("all")){
			%>
			<div class="container">
				<div class="row" align="center">

				<%
					for( int i = 0 ; i<listProducts.size(); i++ ){
						Product product = listProducts.get(i);
						if(product.getPinstock()==0){
							dao.nactive(product.getProductID());
						}else{
							dao.active(product.getProductID());
						}
						if(product.getActivation() == 1){
				%>		
					<div class="col-md-4" >
						<a href="product.jsp?ProductID=<%=product.getProductID()%>"><img src="image/<%=product.getFilename() %>" style="width: 100%"></a>
						<h3> <%=product.getPname() %></h3>
						<p><%=product.getDescription() %>
						<p><%=product.getPprice() %>
						<p><a href="product.jsp?ProductID=<%=product.getProductID()%>" class="btn btn-primary" role="button"> 상세보기 </a>
					</div>
				<%		
						}
						}
				%>
				</div>
			</div>
			<%	
				}
			%>
			
			<%
				if(category.equals("laptop")){
			%>
			<div class="container">
				<div class="row" align="center">

				<%
					for( int i = 0 ; i<listProducts.size(); i++ ){
						Product product = listProducts.get(i);
						if(product.getPinstock()==0){
							dao.nactive(product.getProductID());
						}else{
							dao.active(product.getProductID());
						}
						if(product.getCategory().equals(category) && product.getActivation() == 1){
				%>		
					<div class="col-md-4" >
						<a href="product.jsp?ProductID=<%=product.getProductID()%>"><img src="image/<%=product.getFilename() %>" style="width: 100%"></a>
						<h3> <%=product.getPname() %></h3>
						<p><%=product.getDescription() %>
						<p><%=product.getPprice() %>
						<p><a href="product.jsp?ProductID=<%=product.getProductID()%>" class="btn btn-primary" role="button"> 상세보기 </a>
					</div>
				<%		
						}
					}
				%>
				</div>
			</div>
			<%	
				}
			%>
			
			<%
				if(category.equals("desktop")){
			%>
			<div class="container">
				<div class="row" align="center">

				<%
					for( int i = 0 ; i<listProducts.size(); i++ ){
						Product product = listProducts.get(i);
						if(product.getPinstock()==0){
							dao.nactive(product.getProductID());
						}else{
							dao.active(product.getProductID());
						}
						if(product.getCategory().equals(category) && product.getActivation() == 1){
				%>		
					<div class="col-md-4" >
						<a href="product.jsp?ProductID=<%=product.getProductID()%>"><img src="image/<%=product.getFilename() %>" style="width: 100%"></a>
						<h3> <%=product.getPname() %></h3>
						<p><%=product.getDescription() %>
						<p><%=product.getPprice() %>
						<p><a href="product.jsp?ProductID=<%=product.getProductID()%>" class="btn btn-primary" role="button"> 상세보기 </a>
					</div>
				<%		
						}
					}
				%>
				</div>
			</div>
			<%	
				}
			%>
			
			


		<%@include file ="footer.jsp" %>

	

</body>
</html>