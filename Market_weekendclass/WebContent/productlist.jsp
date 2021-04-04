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
				request.setCharacterEncoding("UTF-8");
				
				String key = request.getParameter("key");
				String keyword = request.getParameter("keyword");
				

				ArrayList<Product> listProducts = new ArrayList<Product>();
				
				// 검색이 없을경우
				if(key == null || keyword == null){
					ProductDao dao = ProductDao.getinstance();
					listProducts = dao.getallProducts();
				}else{		// 검색이 있을경우
					ProductDao dao = ProductDao.getinstance();
					listProducts = dao.getsearchedProducts(key, keyword);
				}

				
				
			%>
			<div class="container">
				
				<div class="col-sm-2">
					<%@include file="adminsidebar.jsp" %>
				</div>
				
				<div class="col-sm-10">
					<table>
						<tr>
							<td align="left" style="padding-left: 20px"><a href="addproduct.jsp" class="btn btn-success">제품등록</a></td>
					 	</tr>
				 	</table>
				 	
				 	<div style="padding-top: 50px">
				 				
				 						<%// 조회 %>
				 						
				 						<form action="productlist.jsp">
				 							<div class="form-group row">
				 								<div class="col-sm-6">
				 								</div>
					 							<div class="col-sm-2">
					 								<select name="key" class="form-control">
					 									<option value="productid">상품코드</option>
					 									<option value="pname"> 상품명 </option>
					 									<option value="manufacturer"> 제조사 </option>
					 									<option value="category"> 분류 </option>
					 								</select>
					 							</div>
					 							
					 							<div class="col-sm-3">
					 								<input type="text" name="keyword" placeholder="Search" class="form-control">
					 							</div>
					 							
					 							<div class="col-sm-1">
					 								<input type="submit" value="조회" class="btn btn-default">
					 							</div>
				 							</div>
				 						</form>
				 	
				 	
				 	<%// 제품 테이블 %>
						<table class="table table-hover">
							
							<tr>
								<th> 상품 이미지 </th>
								<th> 상품코드 </th>
								<th> 상품명 </th>
								<th> 상품가격 </th>
								<th> 상품설명 </th>
								<th> 제조사 </th>
								<th> 분류 </th>
								<th> 재고 수 </th>
								<th> 상태 </th>
								<th> 활성화여부 </th>
							
							</tr>
							
						<%
						if(listProducts.size() == 0){
						
						%>	
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><h2>검색 결과가 없습니다</h2></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
						<%
						}
						else{
							for( int i = 0 ; i<listProducts.size(); i++ ){
								Product product = listProducts.get(i);
						%>

								<tr onclick="location.href='product.jsp?ProductID=<%=product.getProductID() %>'">
									<td width="200" style="word-break:break-all"><img src="image/<%=product.getFilename() %>" style="width: 50%"><br>
									<%=product.getFilename() %></td>
									
									<td><%=product.getProductID() %></td>
									<td><%=product.getPname() %></td>
									<td><%=product.getPprice() %></td>
									<td><%=product.getDescription() %></td>
									<td><%=product.getManufacturer() %></td>
									<td><%=product.getCategory() %></td>
									<td><%=product.getPinstock() %></td>
									<td><%=product.getconditions() %></td>

									<%
									if(product.getActivation() == 1){
									%>
										<td>판매중</td>
									<%
									}
									else{
									%>
										<td>미판매[판매준비중, 매진]</td>
									<%
									}
									%>
									</tr>
						
						<%		
								}
							}
						%>
						</table>
					</div>
				</div>
			</div>
			

	

</body>
</html>