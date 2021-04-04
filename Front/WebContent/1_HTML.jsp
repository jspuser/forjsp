<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	HTML : 웹문서 태그언어
	
	1. h1 ~ h6 : 글 제목 태그
	<h1> HTML1 제목 </h1>
	<h2> HTML2 제목</h2>
	<h3> HTML3 제목</h3>
	<h4> HTML4 제목</h4>
	<h5> HTML5 제목 </h5>
	<h6> HTML6 제목 </h6>
	
	2. 단락 : p
	<h2> 웹 페이지란 ? </h2>
	<p>
	하이퍼텍스트 마크업 언어는 웹 페이지를 위한 지배적인 마크업 언어다. 또한, HTML은 제목, 단락, 목록 등과 같은 본문을 위한 구조적 의미를 나타내는 것뿐만 아니라 링크, 인용과 그 밖의 항목으로 구조적 문서를 만들 수 있는 방법을 제공한다.
	<p>
	하이퍼텍스트 마크업 언어는 웹 페이지를 위한 지배적인 마크업 언어다. 또한, HTML은 제목, 단락, 목록 등과 같은 본문을 위한 구조적 의미를 나타내는 것뿐만 아니라 링크, 인용과 그 밖의 항목으로 구조적 문서를 만들 수 있는 방법을 제공한다.
	<p>
	
	
	3. 줄바꿈 br
	
	<p> 하이퍼텍스트 마크업 언어는 웹 페이지를 위한 지배적인 마크업 언어다. <br>
	 또한, HTML은 제목, 단락, 목록 등과 같은 본문을 위한 구조적 의미를 나타내는 것뿐만 아니라 <br>
	 링크, 인용과 그 밖의 항목으로 구조적 문서를 만들 수 있는 방법을 제공한다. <br>
	 <p>
	 
	 
	 4. 특수문자 : &기호표기
	 
	 <p> &nbsp; &lt; 어쩌구 저쩌구 &gt; 하이퍼텍스트 마크업 언어는 웹 페이지를 위한 지배적인 마크업 언어다. <br>
	 &amp; &quot; &#39; 또한, HTML은 제목, 단락, 목록 등과 같은 본문을 위한 구조적 의미를 나타내는 것뿐만 아니라 <br>
	 링크, 인용과 그 밖의 항목으로 구조적 문서를 만들 수 있는 방법을 제공한다. <br>
	 
	 
	 5. 이미지 : img
	 <p> 1. alt : 사진 설명
	 <p> 2. src : 사진 경로
	 <p> 3. 크기 조절 : width : 가로길이 // height : 세로길이
	 <p>		// 픽셀[절대크기] : 점[ 이미지를 표현하는 점 ] : 
	 			// 퍼센트[상대크기]  : 사진 상대크기
	 
	 <p>
	 <img alt="" src="image/4.jpg" width="300">
	 <img alt="" src="image/4.jpg" width="200" height="200">
	 <img alt="" src="image/4.jpg" width="30%">
	 
	 <p> 사진 포멧 :	// 1.jpg	// 2.png	// 3.gif	// 4.svg
	 
	 
	 <p> 파일 경로
	 <p> 상대 경로 : ../4.jpg
	 <p> 절대 경로 : 
	 
	 <img alt="" src="image/4.jpg">
	 <img alt="" src="./image/4.jpg">
	 <img alt="" src="./image/test/4.jpg">
	 <img alt="" src="../image/4.jpg">
	 
	 <p> 6. 오디오 태그 audio
	 <p>	// 1. controls = 화면에 플레이어 표시
	 <p> 	// 2. autoplay = 자동실행
	 
	 <audio controls="controls" src="image/audio_aaf76c27ad.mp3"></audio>
	 
	 <p> 7. 비디오 태그 video
	 
	 <video controls="controls" width="300" height="300">
	 
	 	 <source src="image/videoforthis.mp4" type="video/mp4">
	 
	 </video>
	 
	 <p> 유튜브[외부] 영상
	 <iframe width="560" height="315" src="https://www.youtube.com/embed/qCq-V6qDqu4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		
	<p> 8. 순서[번호]없는 목록 : ul li	
	<h2> 라면 레시피 </h2>
		<ul>
			<li>이거 저거 넣고 이거 넣고 저기있는 저거 넣기</li>
			<li>저거넣고 저거 두번 넣고 이거 1L 넣기</li>
			<li>일케 절케 요케 저케 하기</li>
			<li>알아서 해</li>
		
		</ul>
		
	<p> 8. 순서[번호]없는 목록 : ol li	
	<p> 1. target="_blank" : 새창으로 열기
	<h2> 라면 레시피 </h2>
		<ol>
			<li> <a href="http://www.naver.com" target="_blank">이거 저거 넣고 이거 넣고 저기있는 저거 넣기</a></li>
			<li> <a href="http://www.naver.com">저거넣고 저거 두번 넣고 이거 1L 넣기</a></li>
			<li> <a href="http://www.naver.com">일케 절케 요케 저케 하기</a></li>
			<li> <a href="http://www.naver.com">알아서 해</a></li>
		
		</ol>
		
		
</body>
</html>