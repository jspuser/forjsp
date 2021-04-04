<%@page import="java.io.PrintWriter"%>
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
    	
    	UserDao dao = UserDao.getinstance();
    	User user = new User();
    	
    	user = dao.getUser(id);
    	int result = dao.login(id, password);
    	
    	if(result == 1){
	    	session.setAttribute("ID", id);
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href ='main.jsp'");
			script.println("</script>");
    	}
    	if(result == -2){
    		PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인에 실패하였습니다')");
			script.println("location.href ='Main.jsp'");
			script.println("</script>");
    	}
    	if(result == 0){
	    	session.setAttribute("ID", id);
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('잘못된 비밀번호입니다')");
			script.println("</script>");
    	}
    	if(result == -1){
	    	session.setAttribute("ID", id);
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 아이디입니다')");
			script.println("</script>");
    	}
    	
    	
    	
    	response.sendRedirect("main.jsp");
    	
    	
    %>
    
    