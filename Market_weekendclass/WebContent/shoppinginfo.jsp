<%@page import="dao.Order_detailDao"%>
<%@page import="dto.Order_detail"%>
<%@page import="dto.Order"%>
<%@page import="dao.OrderDao"%>
<%@page import="java.net.URLDecoder"%>
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
				    function sample4_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var roadAddr = data.roadAddress; // 도로명 주소 변수
				                var extraRoadAddr = ''; // 참고 항목 변수
				
				                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                    extraRoadAddr += data.bname;
				                }
				                // 건물명이 있고, 공동주택일 경우 추가한다.
				                if(data.buildingName !== '' && data.apartment === 'Y'){
				                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                }
				                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                if(extraRoadAddr !== ''){
				                    extraRoadAddr = ' (' + extraRoadAddr + ')';
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('sample4_postcode').value = data.zonecode;
				                document.getElementById("sample4_roadAddress").value = roadAddr;
				                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
				                
				                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				                if(roadAddr !== ''){
				                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
				                } else {
				                    document.getElementById("sample4_extraAddress").value = '';
				                }
				
				                var guideTextBox = document.getElementById("guide");
				                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				                if(data.autoRoadAddress) {
				                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				                    guideTextBox.style.display = 'block';
				
				                } else if(data.autoJibunAddress) {
				                    var expJibunAddr = data.autoJibunAddress;
				                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				                    guideTextBox.style.display = 'block';
				                } else {
				                    guideTextBox.innerHTML = '';
				                    guideTextBox.style.display = 'none';
				                }
				            }
				        }).open();
				    }
				</script>

<script type="text/javascript">

	function deletef() {
	
		if(confirm("상품을 장바구니에서 제거하시겠습니까?")){
			deleteform.submit();
		}else{
			deleteform.reset();
		}
		
		
	}
	function checkadd() {
		if(!newmember.name.value){
			alert("이름을 입력해주세요")
			return false;
		}
		if(!newmember.password.value){
			alert("비밀번호를 입력해주세요")
			return false;
		}
		if(!newmember.password_check.value){
			alert("비밀번호확인을 입력해주세요")
			return false;
		}
		if(!newmember.phone.value){
			alert("전화번호를 입력해주세요")
			return false;
		}
	}
	
	
</script>

		<%@include file ="menu.jsp" %>
			
			<div class="jumbotron">
				<div class="container">
					<h1> 장바구니목록 </h1>
				</div>
			</div>
			
			<%		
				request.setCharacterEncoding("UTF-8");
				
				String key = request.getParameter("key");
				String keyword = request.getParameter("keyword");
				

				ArrayList<Product> listProducts = new ArrayList<Product>();
				
				listProducts = (ArrayList<Product>)session.getAttribute("cartlist");
				if(listProducts == null){
					listProducts = new ArrayList<>();
				}
				int tp = 0;
				int tpp;
				
				String password = "";
				String name = "";
				String phone = "";
				String address1 = "";
				String requests = "";
				String timestamps = "";
				int total=0;
				
				UserDao ud = UserDao.getinstance();
				
				Cookie[] cookies = request.getCookies();
				
				if(cookies != null){
					for(int i=0;i<cookies.length;i++){
						
						if(cookies[i].getName().equals("password")){
							password = cookies[i].getValue();
						}
						if(cookies[i].getName().equals("name")){
							name = cookies[i].getValue();
						}
						if(cookies[i].getName().equals("phone")){
							phone = URLDecoder.decode(cookies[i].getValue());
						}
						if(cookies[i].getName().equals("address")){
							address1 = URLDecoder.decode(cookies[i].getValue());
						}
						if(cookies[i].getName().equals("requests")){
							requests = cookies[i].getValue();
						}
						if(cookies[i].getName().equals("timestamps")){
							timestamps = URLDecoder.decode(cookies[i].getValue());
						}
						if(cookies[i].getName().equals("total")){
							total = Integer.parseInt(cookies[i].getValue());
						}
						
						
					}
					
					
				}
				
				Order_detailDao detaildao = Order_detailDao.getinstance();
				OrderDao dao = OrderDao.getinstance();
				
				
				
				

				
				
			%>
			<div class="container">
				<div class="col-sm-3">
					
				</div>
				<div class="col-sm-5">
				<table>
					<tr>
					<td align="center"><h3>주문해주셔서 감사합니다</h3></td>
					</tr>
				</table>
				</div>
				<div class="col-sm-10">
				 	
				 	<div style="padding-top: 50px">
				 	
				 	
				 	<%// 제품 테이블 %>
						<table class="table table-hover">
							
							<tr>
								<th> 상품 이미지 </th>
								<th> 상품명 </th>
								<th> 상품가격 </th>
								<th> 분류 </th>
								<th> 주문 수 </th>
								<th> 총 금액 </th>
								<th></th>
							
							</tr>
							
						<%
						if(listProducts.size() == 0){
						
						%>	
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td><h2>장바구니에 넣은 물건이 없습니다</h2></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
						<%
						}
						else{
							for( int i = 0 ; i<listProducts.size(); i++ ){
								Product product = listProducts.get(i);
								int price = product.getQuantity() * product.getPprice();
								tpp = tp;
								tp = tpp + price;
								
						%>

								<tr onclick="location.href='product.jsp?ProductID=<%=product.getProductID() %>'">
									<td width="200" style="word-break:break-all"><img src="image/<%=product.getFilename() %>" style="width: 50%"><br>
							
							
									<td><%=product.getPname() %></td>
									<td><%=product.getPprice() %></td>
									<td><%=product.getCategory() %></td>
									<td><%=product.getQuantity() %></td>
									<td><%=price %></td>
									</tr>
						
						<%		
							
						Order_detail detail = new Order_detail();


						
						
						
						
						detail.setDetail_order_id(dao.getorderid());
						detail.setDetail_productid(product.getProductID());
						detail.setDetail_quantity(product.getQuantity());
						
						out.print( detail.getDetail_order_id() );
						out.print( detail.getDetail_productid());
						out.print( detail.getDetail_quantity() );
						
						
						
						int rst = detaildao.setorderdetail(detail);
							
							
								}
							}
						
						Order order = new Order();
						
						order.setId(ID);
						order.setOrder_address(address1);
						order.setOrder_phone(phone);
						order.setOrder_requests(requests);
						order.setOrder_date(timestamps);
						order.setOrder_total_price(total);
						

						
						int result =dao.setorder(order);
						%>
						</table>
						<h2>총합 가격 : <%=tp %></h2>
						<h4> 주문자 </h4>
			<div class="jumptron">	
				<div class="col-sm-4">주문자</div>
				<div class="col-sm-8"><%=name %></div>
				
				<div class="col-sm-4">전화번호</div>
				<div class="col-sm-8"><%=phone %></div>
				
				<div class="col-sm-4">주소</div>
				<div class="col-sm-8"><%=address1 %></div>
				
				<div class="col-sm-4">요구사항</div>
				<div class="col-sm-8"><%=requests %></div>
				
				<div class="col-sm-4">주문일</div>
				<div class="col-sm-8"><%=timestamps %></div>
			</div>
		</div>
		</div>
		</div>
			

	

</body>
</html>