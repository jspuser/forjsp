<%@page import="dao.ReviewDao"%>
<%@page import="dto.Review"%>
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

	function addtocart() {
	
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			addform.submit();
		}else{
			addform.reset();
		}
		
		
	}
	
	
</script>

	
	<%@include file ="menu.jsp"  %>
	
		<div class="jumbotron">
			<div class="container">
				<h1> 제품 정보 </h1>
			</div>
		</div>
		
		<%
			request.setCharacterEncoding("UTF-8");
			String ProductID = request.getParameter("ProductID");
			
			ProductDao dao = ProductDao.getinstance();
			Product product = dao.getProduct(ProductID);
			
			ArrayList<Review> listreviews = new ArrayList<Review>();
			ReviewDao rd = ReviewDao.getinstance();
			
			listreviews = rd.getreviews(ProductID);
			
			int totalrate = 0;
			int count = 0;
			int averagerate = 0;
			
			if(listreviews.size() != 0){
				for(int i = 0;i<listreviews.size();i++){
					Review review = listreviews.get(i);
					
					totalrate += review.getReview_rate();
					count ++;
				}
				averagerate = totalrate / count;
			}
		
		%>
		
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<img alt="" src="image/<%=product.getFilename() %>" style="width: 100%">
				</div>
				
				<div class="col-md-7">
					<h3><%=product.getPname() %></h3>
					<p><%=product.getDescription() %>
					<p>	상품 코드 : <%=product.getProductID() %>			평균 별점 :	<% out.print(averagerate); %>
					<p>	상품 제조사 : <%=product.getManufacturer() %>
					<p> 상품 분류 : <%=product.getCategory() %>
					<p> 상품 재고 : <%=product.getPinstock() %>
					<p> 상품 가격 : <%=product.getPprice() %>
					<p></p>
					<p></p>
					<p></p>
					
					<form name="addform" method="post" action="addcart.jsp?ProductID=<%=product.getProductID() %>">
						<a href="#" class="btn btn-info" onclick="addtocart()">상품담기</a>
						<a href="cartlist.jsp" class="btn btn-info">장바구니</a>
						<a href="#" class="btn btn-info">상품목록</a>
					</form>
					
				</div>
			</div>
		
		</div>
		
		<p>
		<p>
		<p>
		<p>
		<p>
		
		<div class="container">
			<%
			if(listreviews.size() == 0){
				%>
				<div>
					<h2>리뷰가 없습니다</h2>
				</div>
				<%
			}
			else{
				for(int i = 0;i<listreviews.size();i++){
					Review review = listreviews.get(i);
			%>
				<div class="col-sm-7">
					<table class="table table-hover">
						<tr>
							<th>유저 아이디</th>
							<th>별점</th>
							<th>리뷰</th>
						</tr>
					
						<tr>
							<td><%=review.getId() %></td>
							<td><%=review.getReview_rate() %>점</td>
							<td><%=review.getReview() %></td>
						</tr>
					</table>
				</div>
			
			
			<%	
				}
			}
			
			
			%>
		
		
		</div>
	
	<%@include file ="footer.jsp"  %>
	
	

</body>
</html>