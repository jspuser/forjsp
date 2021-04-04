<%@page import="dao.Order_detailDao"%>
<%@page import="dto.Order_detail"%>
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
				
				int order_id = Integer.parseInt(request.getParameter("orderID"));
				
				int detailID = 0;
				
				if(request.getParameter("detailID") != null){
					detailID = Integer.parseInt(request.getParameter("detailID"));
				}
				
				int forreview = 0;
				if(request.getParameter("forreview") != null){
					forreview = Integer.parseInt(request.getParameter("forreview"));
				}
				
				
				
				
				ArrayList<Order_detail> listProducts = new ArrayList<>();
				
				OrderDao dao = OrderDao.getinstance();
				
				Order_detailDao detaildao = new Order_detailDao();
				
				listProducts = detaildao.getdetails(order_id);
				
				
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
				 				<div class="col-sm-10">
				 						<%// 조회 %>
				 						
				 						<form action="orderdetail.jsp">
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
								<th> 상세 번호 </th>
								<th> 주문코드 </th>
								<th> 제품번호 </th>
								<th> 수량 </th>
								<th></th>
								<th></th>
								<th> 비고 </th>
							
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
								Order_detail detail = listProducts.get(i);
								if(detail.getDetail_order_id().equals(order_id)){
						%>

								<tr >
									<td><%=detail.getDetail_id() %></td>
									<td><%=detail.getDetail_order_id() %></td>
									<td><%=detail.getDetail_productid() %></td>
									<td><%=detail.getDetail_quantity() %></td>
									<td><a href="orderdetail.jsp?detailID=<%=detail.getDetail_id() %>&orderID=<%=order_id %>" class="badge badge-default">주문 취소</a></td>
									<td><a href="orderdetail.jsp?detailID=<%=detail.getDetail_id() %>&orderID=<%=order_id %>&forreview=1" class="badge badge-default">리뷰 쓰기</a></td>
									<td> 배송 대기 </td>
									
									</tr>
						
						<%		
								}
								}
							}
						%>
						</table>
					</div>
					<%
					if(detailID != 0 && forreview != 1){
					%>

					<div class="container">
						<div class="col-sm-5">
						</div>
						<div class="col-sm-7">
							<form action="cancelaction.jsp">
								<input type="hidden" name="orderID" value="<%=order_id %>">
								<div>
									상세 번호 :
									<input type="text" name="detailID" value="<%=detailID %>">
								</div>
								<div>
									취소 사유 : 
									<textarea rows="10" cols="50" name="reason"></textarea>
								</div>
								<div>
									<input type="submit" value="주문 취소" class="btn btn-default">
								</div>
							</form>
						</div>
					
					</div>
					<%
					}
					else if(detailID !=0 && forreview == 1){
					%>
						<div class="container">
						<div class="col-sm-5">
						</div>
						<div class="col-sm-7">
							<form action="reviewaction.jsp">
								<input type="hidden" name="orderID" value="<%=order_id %>">
								<div>
									<div>
										상세 번호 :
										<input type="text" name="detailID" value="<%=detailID %>">
									</div>
									<div>
										별점 : 
										<select name="review_rate" class="form-control">
					 									<option value="1">1점</option>
					 									<option value="2">2점</option>
					 									<option value="3">3점</option>
					 									<option value="4">4점</option>
					 									<option value="5">5점</option>
					 					</select>
									</div>
								</div>
								<div>
									리뷰 : 
									<textarea rows="10" cols="50" name="review"></textarea>
								</div>
								<div>
									<input type="submit" value="리뷰 등록" class="btn btn-default">
								</div>
							</form>
						</div>
					<%
					}
					%>
					
					
					
					</div>
				</div>
			</div>
			

	

</body>
</html>