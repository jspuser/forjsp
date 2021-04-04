<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file ="menu.jsp"  %>
    
    <%
    String ProductID = request.getParameter("ProductID");
    
    ProductDao dao = ProductDao.getinstance();
    
    int done = dao.delete(ProductID);
    
    if(done == 1)
    response.sendRedirect("editproduct.jsp");
    %>
    
    
    <%@include file ="footer.jsp"  %>
    
    
    
    