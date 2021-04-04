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
				
				UserDao ud = UserDao.getinstance();
				
				user = ud.getUser(ID);
				
				

				
				
			%>
			<div class="container">
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
								}
							}
						%>
						</table>
						<h2>총합 가격 : <%=tp %></h2>
					<%
					if(ID == null){
					%>
						<h4>받는 사람[비회원]</h4>
		<div class="col-sm-8">			
			<div class="jumptron">
				<form name="newmember" method="post" action="shoppingaction.jsp" onsubmit="return checkadd()">
					<div class="form group row">
						<div class="col-sm-6">
							<h4>* : 필수 입력사항</h4>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-3">받는사람 이름*</label>
						<div class="col-sm-6">
							<input type="text" name="name" class="form-control" placeholder="사용자 이름">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">비밀번호*</label>
						<div class="col-sm-6">
							<input type="password" name="password" class="form-control" placeholder="비밀번호" maxlength="20">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">비밀번호확인*</label>
						<div class="col-sm-6">
							<input type="password" name="password_check" class="form-control" placeholder="비밀번호">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">전화번호</label>
						
						<div class="col-sm-6">
							<select name="phone1">
								<option>010</option>
								<option>02</option>
								<option>031</option>
							</select>
							
							<input type="text" name="phone2" maxlength="4" size="5">
							<input type="text" name="phone3" maxlength="4" size="5">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">주소</label>
						
						<div class="col-sm-6">
							<input type="text" id="sample4_postcode" placeholder="우편번호" class="form-control" name="address1">
						</div>
						<div class="col-sm-3">
							<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색" class="form-control"><br>
						</div>
					</div>
					
					<div class="form-grouop row">
						<div class="col-sm-8">
							<input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" name="address3">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="sample4_detailAddress" placeholder="상세주소" class="form-control" name="address4">
						</div>
						<div class="col-sm-4">
							<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="form-control" name="address2">
							<input type="text" id="sample4_extraAddress" placeholder="참고항목" class="form-control" name="address5">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">요청사항</label>
						<div class="col-sm-6">
							<input type="text" name="requests" class="form-control" >
						</div>
					</div>
					
					<input type="hidden" name="total" value="<%=tp %>">
					
					<div class="form-group row">
						
						<div class="col-sm-5"></div>
						<div style="padding-left: 10px">
							<input type="submit" value="등록" class="btn btn-primary">
							<input type="submit" value="취소" class="btn btn-primary">
							
						</div>
					
					</div>
					
					
				
				</form>
				
			</div>
		</div>
						
			
					
					<%	
					}else{
					%>
						<h4> 받는사람[회원] </h4>
			<div class="col-sm-8">	
				<div class="jumptron">
				<form name="newmember" method="post" action="shoppingaction.jsp" onsubmit="return checkadd()">
					<div class="form group row">
						<div class="col-sm-6">
							<h4>* : 필수 입력사항</h4>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-3">받는사람[회원]*</label>
						<div class="col-sm-6">
							<input type="text" name="name" class="form-control" value="<%=user.getName() %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">전화번호*</label>
						
						<div class="col-sm-6">
						
						<%
						String[] phone = user.getPhone().split("-");
						
						%>
							<select name="phone1">
								<option>010</option>
								<option>02</option>
								<option>031</option>
							</select>
							
							<input type="text" name="phone2" maxlength="4" size="5" value="<%=phone[1] %>">
							<input type="text" name="phone3" maxlength="4" size="5" value="<%=phone[2] %>">
						</div>
					</div>
						<%
						String[] address = user.getAddress().split(",");
						for(int i=0;i<5;i++){
							if(address[i] == null){
								address[i] = "없음";
							}
						}
						%>
					<div class="form-group row">
						<label class="col-sm-3">주소*</label>
						
						<div class="col-sm-6">
							<input type="text" id="sample4_postcode" placeholder="우편번호" class="form-control" name="address1" value="<%=address[0] %>">
						</div>
						<div class="col-sm-3">
							<input type="button" onclick="sample4_execDaumPostcode()" value="주소검색" class="form-control"><br>
						</div>
					</div>
					
					<div class="form-grouop row">
						<div class="col-sm-8">
							<input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" name="address3"  value="<%=address[2] %>">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="sample4_detailAddress" placeholder="상세주소" class="form-control" name="address4"  value="<%=address[3] %>">
						</div>
						<div class="col-sm-4">
							<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="form-control" name="address2"  value="<%=address[1] %>">
							<input type="text" id="sample4_extraAddress" placeholder="참고항목" class="form-control" name="address5"  value="<%=address[4] %>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-3">요청사항</label>
						<div class="col-sm-6">
							<input type="text" name="requests" class="form-control" >
						</div>
					</div>
					
					<div class="form-group row">
						
						<div class="col-sm-5"></div>
						<div style="padding-left: 10px">
							<input type="submit" value="결제" class="btn btn-primary">
							<input type="submit" value="취소" class="btn btn-primary">
							
						</div>
					
					</div>
					
					
					
				
				</form>
				
				
			</div>
		</div>
					<%
					}
					%>
					</div>
					<div class="col-sm-2">
					
					</div>
				</div>
			</div>
			

	

</body>
</html>