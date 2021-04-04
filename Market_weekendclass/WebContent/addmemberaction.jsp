<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="dto.User"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.ProductDao"%>
<%@page import="dto.Product"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	
    	// 파일 저장 위치
    	
    	String id = request.getParameter("id");
    	String password = request.getParameter("password");
    	String name = request.getParameter("name");
    	String gender = request.getParameter("gender");
    	
	    	String birthy = request.getParameter("birthy");
	    	String birthm = request.getParameter("birthm");
	    	String birthd = request.getParameter("birthd");
    	String birth = birthy +"/"+birthm+"/"+birthd;
    	
    		String mail1 = request.getParameter("mail");
    		String mail2 = request.getParameter("mail2");
    	String email = mail1+"@"+mail2;
    	
    		String phone1 = request.getParameter("phone1");
    		String phone2 = request.getParameter("phone2");
    		String phone3 = request.getParameter("phone3");
    	String phone = phone1+"-"+phone2+"-"+phone3;
    	
    		String address1 = request.getParameter("address1");
    		String address2 = request.getParameter("address2");
    		String address3 = request.getParameter("address3");
    		String address4 = request.getParameter("address4");
    		String address5 = request.getParameter("address5");
    	String address = address1+","+address2+","+address3+","+address4+","+address5;
    	
    	// 가입 날짜 = SQL 시간
    			Date date = new Date(System.currentTimeMillis());
    			Date sqldate = new Date(date.getTime());
    			Timestamp timestamp = new Timestamp(date.getTime());
    			
    	
    	UserDao dao = UserDao.getinstance();
    	User user = new User();
    	
    	user.setId(id);
    	user.setPassword(password);
    	user.setName(name);
    	user.setGender(gender);
    	user.setBirth(birth);
    	user.setEmail(email);
    	user.setPhone(phone);
    	user.setAddress(address);
    	user.setEnterday(String.valueOf(timestamp));
    	user.setAdmin(0);
    	
    	dao.setuser(user);
    	
    	
    	response.sendRedirect("main.jsp");
    	
    	
    %>
    
    