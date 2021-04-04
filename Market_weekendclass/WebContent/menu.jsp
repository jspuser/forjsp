<%@page import="dto.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	    String ID = null;
		UserDao dao1 = UserDao.getinstance();
		User user = new User();
	
		if(session.getAttribute("ID") != null ){ //로그인 되어있으면
			ID = (String) session.getAttribute("ID"); //세션값 가져와서 저장

	    	user = dao1.getUser(ID);
			
		}

    
    %>
    
    
    
    <nav class="navbar-default">
    
    	<div class="container">
    		<div class="navbar-header">
    			<a class="navbar-brand" href="main.jsp"> <img alt="" src="image/메뉴.jpg"> </a>
    		</div>
    		
			<div>
				<ul class="nav navbar-nav" style="height: 30px">

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="false">
							컴퓨터제품 <span class="caret"></span>
						</a>
						
						<ul class="dropdown-menu">
							<li><a href="products.jsp?category=all">모든제품</a>
							<li><a href="products.jsp?category=laptop">노트북</a>
							<li><a href="products.jsp?category=desktop">데스크탑</a>
						</ul>
					
					</li>
				</ul>
				
					<ul class="nav navbar-nav navbar-right">	
						<li>
							<a href="cartlist.jsp" role="button" aria-haspopup="false"><img alt="" src="image/realbasket.jpg"></a>
						</li>
							<%
				if(user != null){
					if(user.getAdmin() == 1){
				%>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="false">
								관리자메뉴 <span class="caret"></span>
							</a>
							
							<ul class="dropdown-menu">
								<li><a href="editproduct.jsp"> 제품관리[등록, 수정, 삭제] </a>
							</ul>
						
						</li>
					
					
					<% 
					}
				}
					
						if(ID == null){
					
					%>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="false">
							<img alt="" src="image/로메뉴.jpg"><span class="caret"></span>
						</a>
						
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a>
							<li><a href="addmember.jsp">회원가입</a>
						</ul>
					
					</li>
					
					<%
					
						}
						else{
					%>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="false">
							<img alt="" src="image/로메뉴.jpg"><span class="caret"></span>
						</a>
						
						<ul class="dropdown-menu">
							<li><a href="information.jsp">회원정보</a>
							<li><a href="logoutaction.jsp">로그아웃</a>
						</ul>

					</li>
					
					<%} %>
				</ul>
			</div>	
    		
    	</div>
    
    </nav>