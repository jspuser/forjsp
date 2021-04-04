<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	
	<style type="text/css">
		
		body{
			background-color: yellow; 
		}
		
		h2 {
			font-family: "궁서";
			color: blue;
		}
		p{
			font-family: "돋움";
			color: green;
			background-color: white;
		
		}
		.blue{
			color: blue;
		
		}
		#blue2{
			color: blue;
			background-color: rgb(0, 255, 255);
		}
	
	
	</style>


</head>
<body>
	<p> CSS : HTML 효과 입히기
		<p> 1. HTML 태그 안에서 style 속성으로 꾸미기
		<p> 2. 선택자를 이용한 style 태그 내에서 선언
			<p> 1. 태그			선택자{}
			<p> 2. class="선택자"	.클래스명 {}
			<p> 3. id = "id명"	#id
			<p> 우선순위 : id > class > 태그
		<p> 주석 : /* 주석 */
		<p> html 주석 : <!-- 주석 -->
			
	<p> 해더 head 태그 안에 style 태그 작성
	<p> 선택자 : 꾸미기 대상
	<p> h2{속성 : 속성값}
	
	<p> 텍스트 속성
	<p> font-family : 글꼴 	[디바이스에 설치된 폰트 기준]
	
	<h2>반려동물</h2>
	<p class="blue">반려동물 또는 애완동물은 인간이 주로 즐거움을 위해 사육하는 동물을 말한다. 오늘날에는 애완동물을 인간의 즐거움을 위한 소유물이 아니라, 반려자로서 대우하자는 의미에서 '반려동물'이란 표현이 점점 대중화되고 있다. 
	<p id="blue2">반려동물 또는 애완동물은 인간이 주로 즐거움을 위해 사육하는 동물을 말한다. 오늘날에는 애완동물을 인간의 즐거움을 위한 소유물이 아니라, 반려자로서 대우하자는 의미에서 '반려동물'이란 표현이 점점 대중화되고 있다. 

</body>
</html>