<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file ="menu.jsp"  %>
    
    <%
    String ProductID = request.getParameter("ProductID");
    ProductDao dao = ProductDao.getinstance();
    ArrayList<Product> listProducts = dao.getallProducts();
    
    for( int i = 0 ; i<listProducts.size(); i++ ){
		Product product = listProducts.get(i);
		if(product.getProductID().equals(ProductID)){
			int activation = product.getActivation();
			
		    
		    dao.activeupdate(ProductID, activation);
		    
		    break;
		}
    }

    
    
    response.sendRedirect("editproduct.jsp");
    
    %>
    
    
    <%@include file ="footer.jsp"  %>
    