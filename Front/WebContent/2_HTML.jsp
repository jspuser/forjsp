<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<p> 폼 : form
	<p> 1. input : 입력 요소
	
	<form>
		
		이름 : <input type="text" value="유재석">
		이름 : <input type="text" readonly="readonly" value="유재석">
		이름 : <input type="text" placeholder="성명입력" value="유재석">
		이름 : <input type="text" readonly="readonly" value="유재석" disabled="disabled">
		비밀번호 : <input type="password" autofocus="autofocus">
		이메일 수신 : <input type="radio" name="email"> 예
				  <input type="radio" name="email"> 아니요
		분야[checkbox] : <input type="checkbox" name="item1"> 뉴스	
						<input type="checkbox" name="item2"> 드라마
						<input type="checkbox" name="item3"> 스포츠
						<input type="checkbox" name="item4"> 엔터
						<input type="checkbox" name="item5"> 기타	  <br> <br>
						
		파일[file] : <input type="file"> <br><br>
		
		버튼[] <button type="submit">보내기</button>
		버튼[] <button type="button">중복확인</button>
		버튼[] <button type="reset">다시작성</button>
		
		이메일 : <input type="email">
		
		이메일 : <input type="text">
			<select>
				<option> naver.com</option>
				<option>hanmail.net</option>
				<option>gmail.com</option>
				<option>nate.cm</option>
			
			</select>
		리뷰 : <textarea rows="6" cols="80"></textarea>
		
	</form>
	
	<p> 테이블 태그
	<p> 1. tr : 행 추가
	<p> 2. td : 데이터 입력
	<p> 3 th : 열 제목
	<p> 4. border : 테두리 선
	
	
	<table border="1">
		<tr>
			<th>지역</th><th colspan="2">최저기온/최고기온</th>
		</tr>
		
		<tr>
			<td>서울</td><td>20/30</td>
		</tr>
	
	</table>
	
	

</body>
</html>