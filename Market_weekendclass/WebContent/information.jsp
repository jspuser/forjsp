<%@page import="dao.OrderDao"%>
<%@page import="dto.Order"%>
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
					<h1> 주문 관리 </h1>
				</div>
			</div>
			
			<%		
				request.setCharacterEncoding("UTF-8");
				
				String key = request.getParameter("key");
				String keyword = request.getParameter("keyword");
				

				ArrayList<Order> listProducts = new ArrayList<Order>();
				
				OrderDao dao = OrderDao.getinstance();
				
				listProducts = dao.getorderlist();
				
				
				// 검색이 없을경우
				/*
				if(key == null || keyword == null){
					ProductDao dao = ProductDao.getinstance();
					listProducts = dao.getallProducts();
				}else{		// 검색이 있을경우
					ProductDao dao = ProductDao.getinstance();
					listProducts = dao.getsearchedProducts(key, keyword);
				}
				
				*/
				
				
			%>
			<div class="container">
				<div>
				 	
				 	<div style="padding-top: 50px">
				 				<div class="col-sm-2">
				 					<%@include file="membersidebar.jsp" %>
				 				</div>
				 						<%// 조회 %>
				 						
				 						<form action="orderlist.jsp">
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
								<th> 주문코드 </th>
								<th> 주문자 </th>
								<th> 주소 </th>
								<th> 전화번호 </th>
								<th> 요구사항 </th>
								<th> 주문일 </th>
							
							</tr>
							
						<%
						if(listProducts.size() == 0){
						
						%>	
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td><h2>검색 결과가 없습니다</h2></td>
									<td></td>
									<td></td>

								</tr>
						<%
						}
						else{
							for( int i = 0 ; i<listProducts.size(); i++ ){
								Order order = listProducts.get(i);
								if(order.getId().equals(session.getAttribute("ID"))){
						%>

								<tr onclick="location.href='orderdetail.jsp?orderID=<%=order.getOrder_id() %>'">
									<td><%=order.getOrder_id() %></td>
									<td><%=order.getId() %></td>
									<td><%=order.getOrder_address() %></td>
									<td><%=order.getOrder_phone() %></td>
									<td><%=order.getOrder_requests() %></td>
									<td><%=order.getOrder_date() %></td>
									

									
									</tr>
						
						<%		
								}
								}
							}
						%>
						</table>
					</div>
				</div>
			</div>
			

	

</body>
</html>