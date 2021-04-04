<%@page import="java.io.PrintWriter"%>
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
	
	<%// 상품id => 상품 정보 호출 => 세션에 담기 => 리스트 세션에 저장 %>
	<%

	String productID = request.getParameter("ProductID");
	
	ProductDao dao = ProductDao.getinstance();
	
	Product product = dao.getProduct(productID);	// 담는 상품
	
	if(product == null){
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('없는 상품입니다')");
		script.println("location.href ='Main.jsp'");
		script.println("</script>");
	}
	
	ArrayList<Product> goodslist = dao.getallProducts();
	
	for(int i = 0; i<goodslist.size();i++){
		
		if(goodslist.get(i).getProductID().equals(productID)){
			
			product = goodslist.get(i);
			break;
			
		}
		
	}
	
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	
	if( list == null){	// 세션이 존재하지 않으면
		
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
		
	}
	int count = 0;	// 상품마다 담은 갯수
	
	// 모든 상품에서 해당 상품을 찾아서 =>
	for(int i = 0;i<list.size();i++){
		
		if(list.get(i).getProductID().equals(productID)){
			
			count++;
			list.get(i).setQuantity(list.get(i).getQuantity()+1);
		}
		
	}
	
	// 리스트 담기	// 상품의 담은갯수가 0이면
	if(count == 0){
		product.setQuantity(1);
		list.add(product);
	}
	
	response.sendRedirect("productpage.jsp?ProductID="+productID);
	
	
	
	
	%>

</body>
</html>