<%@page import="dao.ReviewDao"%>
<%@page import="dto.Review"%>
<%@page import="dao.PreturnDao"%>
<%@page import="dto.Preturn"%>
<%@page import="dto.Order_detail"%>
<%@page import="dao.Order_detailDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		
		int detailID = Integer.parseInt(request.getParameter("detailID"));
		
		Order_detailDao dao = Order_detailDao.getinstance();
		
		Order_detail detail = dao.getdetail(detailID);
		
		int orderID = Integer.parseInt(request.getParameter("orderID"));
		
		String review = request.getParameter("review");
		int review_rate = Integer.parseInt(request.getParameter("review_rate"));
		
		String id = (String)session.getAttribute("ID");
		
		Review rv = new Review();
		
		rv.setDetail_id(detailID);
		rv.setDetail_productid(detail.getDetail_productid());
		rv.setId(id);
		rv.setReview(review);
		rv.setReview_rate(review_rate);
		
		
		
		ReviewDao rd = ReviewDao.getinstance();
		int rs = rd.setreview(rv);
		
		

		
		
		if(rs == 1){
	%>
	<script type="text/javascript">
			alert('리뷰가 등록되었습니다');	
	</script>
	<%
		}else{
	%>
	<script type="text/javascript">
			alert('리뷰 등록을 실패하였습니다');
	</script>
	
	<%
		}
		
		response.sendRedirect("orderdetail.jsp?orderID="+orderID);
	%>


</body>
</html>