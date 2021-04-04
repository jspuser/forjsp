<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<style type="text/css">
		form{
			margin: 0 auto;
		
		}
	
	</style>


</head>
<body>
	
	<h2>회원가입 폼</h2>
	
	<form>
		<table>
			<tr>
				<td>아이디</td><td><input type="text"></td>
			</tr>
			<tr>
				<td>비밀번호</td><td><input type="password"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td><td><input type="text"></td>
			</tr>
			<tr>
				<td>이름</td><td><input type="text"></td>
			</tr>
			<tr>
				<td>이메일</td><td><input type="text">@<select name="mail2">
														<option>직접 입력</option>
														<option>gmail.com</option>
														<option>hanmail.net</option>
													</select></td>
			</tr>
			<tr>
				<td>이메일 수신</td><td>
					<input type="radio" name="emailget" value="0">비수신
					<input type="radio" name="emailget" value="1">수신
				</td>
			</tr>
			<tr>
				<td>가입 경로</td><td><input type="checkbox" name="how" value="친구추천">친구추천
									<input type="checkbox" name="how" value="인터넷검색">인터넷검색
									<input type="checkbox" name="how" value="기타">기타
				</td>
			</tr>
			<tr>
				<td>인사말</td><td><textarea name="hello"></textarea></td>
			</tr>
			
			<tr>
				<td align="right"><input type="submit">저장하기</td><td align="right"><input type="reset">취소하기</td>
			</tr>
		
		</table>
	
	
	</form>

</body>
</html>