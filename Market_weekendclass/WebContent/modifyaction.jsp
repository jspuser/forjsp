<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	
    	// 파일 저장 위치
    	String realFolder = "C:/Users/User/eclipse-workspace/Market_weekendclass/WebContent/image";
    	
    	MultipartRequest multi = new MultipartRequest(
    			request, realFolder, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
    			// 요청방식, 저장폴더위치, 용량, 인코딩 방식, 보안방식
    			
    	//
    	String ProductID = multi.getParameter("ProductID");
    	String pname = multi.getParameter("pname");
    	String pprice = multi.getParameter("pprice");
    	String description = multi.getParameter("description");
    	String manufacturer = multi.getParameter("manufacturer");
    	String pinstock = multi.getParameter("pinstock");
    	String category = multi.getParameter("category");
    	String conditions = multi.getParameter("conditions");
    	String filename = multi.getFilesystemName("filename");
    	
    	if(filename == null){
    		filename = multi.getParameter("filename2");
    	}
    	
    	//
    	Integer price;
    	
    	if( pprice.isEmpty()){
    		price = 0;
    	}
    	else{
    		price = Integer.valueOf(pprice);
    	}
    	
		Integer stock;
    	
    	if( pinstock.isEmpty()){
    		stock = 0;
    	}
    	else{
    		stock = Integer.valueOf(pinstock);
    	}
    	
    	ProductDao dao = ProductDao.getinstance();
    	Product product = new Product();
    	
    	product.setProductID(ProductID);
    	product.setPname(pname);
    	product.setPprice(price);
    	product.setPinstock(stock);
    	product.setDescription(description);
    	product.setManufacturer(manufacturer);
    	product.setCategory(category);
    	product.setconditions(conditions);
    	product.setFilename(filename);
    	product.setActivation(1);
    	
    	
    	dao.modifyProduct(product);
    	
    	response.sendRedirect("editproduct.jsp");
    	
    	
    %>
    
    