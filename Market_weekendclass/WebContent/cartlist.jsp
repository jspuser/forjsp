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
<script type="text/javascript">

	function deletef() {
	
		if(confirm("상품을 장바구니에서 제거하시겠습니까?")){
			deleteform.submit();
		}else{
			deleteform.reset();
		}
		
		
	}
	
	
</script>

		<%@include file ="menu.jsp" %>
			
			<div class="jumbotron">
				<div class="container">
					<h1> 장바구니목록 </h1>
				</div>
			</div>
			
			<%		
				request.setCharacterEncoding("UTF-8");
				
				String key = request.getParameter("key");
				String keyword = request.getParameter("keyword");
				

				ArrayList<Product> listProducts = new ArrayList<Product>();
				
				listProducts = (ArrayList<Product>)session.getAttribute("cartlist");
				if(listProducts == null){
					listProducts = new ArrayList<>();
				}
				int tp = 0;
				int tpp;
				
				

				
				
			%>
			<div class="container">
				<div class="col-sm-10">
				 	
				 	<div style="padding-top: 50px">
				 	
				 	
				 	<%// 제품 테이블 %>
						<table class="table table-hover">
							
							<tr>
								<th> 상품 이미지 </th>
								<th> 상품명 </th>
								<th> 상품가격 </th>
								<th> 분류 </th>
								<th> 주문 수 </th>
								<th> 총 금액 </th>
								<th></th>
							
							</tr>
							
						<%
						if(listProducts.size() == 0){
						
						%>	
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td><h2>장바구니에 넣은 물건이 없습니다</h2></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
						<%
						}
						else{
							for( int i = 0 ; i<listProducts.size(); i++ ){
								Product product = listProducts.get(i);
								int price = product.getQuantity() * product.getPprice();
								tpp = tp;
								tp = tpp + price;
								
						%>

								<tr onclick="location.href='product.jsp?ProductID=<%=product.getProductID() %>'">
									<td width="200" style="word-break:break-all"><img src="image/<%=product.getFilename() %>" style="width: 50%"><br>
									
									<td><%=product.getPname() %></td>
									<td><%=product.getPprice() %></td>
									<td><%=product.getCategory() %></td>
									<td><%=product.getQuantity() %></td>
									<td><%=price %></td>
									<td>
									<form name="deleteform" method="post" action="deletecartproduct.jsp?ProductID=<%=product.getProductID() %>">
									<a href="deletecartproduct.jsp?ProductID=<%=product.getProductID() %>" class="btn btn-primary" onclick="deletef()">제품 삭제</a>
									</form>
									</td>
									</tr>
						
						<%		
								}
							}
						%>
						</table>
						<h2>총합 가격 : <%=tp %></h2>
					</div>
					<div class="col-sm-2">
						<table>
							<tr>
								<td align="left"><a href="deletecartlist.jsp" class="btn btn-info">모두 비우기</a></td>
								<td align="center"><a href="customer.jsp" class="btn btn-info">결제하기</a></td>
							</tr>
						</table>
					
					</div>
				</div>
			</div>
			

	

</body>
</html>