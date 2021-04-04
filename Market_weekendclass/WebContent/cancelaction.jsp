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
		
		String reason = request.getParameter("reason");
		
		Preturn preturn = new Preturn();
		
		preturn.setDetail_id(detailID);
		preturn.setDetail_productid(detail.getDetail_productid());
		preturn.setDetail_quantity(detail.getDetail_quantity());
		preturn.setReason(reason);
		
		PreturnDao pd = PreturnDao.getinstance();
		
		int rs = pd.setreturn(preturn);
		
		

		
		
		if(rs == 1){
	%>
	<script type="text/javascript">
			alert('취소가 등록되었습니다');	
	</script>
	<%
		}else{
	%>
	<script type="text/javascript">
			alert('취소 등록을 실패하였습니다');
	</script>
	
	<%
		}
		
		response.sendRedirect("orderdetail.jsp?orderID="+orderID);
	%>


</body>
</html>