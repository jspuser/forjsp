<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	
	<style type="text/css">
	
	@font-face {
	    font-family: 'TmoneyRoundWindExtraBold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	
		*{
			margin: 0px;
			padding: 0px;
		}
		li{
			list-style-type: none;
		}
		header{
			height: 170px;
		}
		.box{
			width: 1100px;
			margin: 0 auto;
		}
		#logo{
			float: left;
			margin: 50px 0 0 60px;
		}
		#menu{
			float: right;
			text-align: right;
			margin-right: 20px;
		}
		#menu li{
			list-style-type: none;
			display: inline-block;
		}
		#top_menu li{
			margin: 30px 0 0 10px;
			font-family: 'TmoneyRoundWindExtraBold';
			font-size: 13px;
		}
		#main_menu li{
			margin: 50px 0 0 80px;
			font-family: 'TmoneyRoundWindExtraBold';
		}
		
		#main_image{
			height: 200px;
			background-image: url("image/mainimage.jpg");
			background-repeat: no-repeat;
			background-position: center; 
			padding: 230px;
		}
		aside{
			width: 250px;
			nmargin: 70px 0;
			float: left;
		}
		aside .title1{
			
			padding: 12px;
			background-color: #0ca9a3;
			color: white;
			font-size: 18px;
		
		}
		aside .comment{
			padding: 20px 10px;
			line-height: 150%;
		}
		aside .search input{
			width: 160px;
			height: 32px;
			border: solid 1px black;
			vertical-align: top;
		}
		aside .search button{
			margin-left: 5px;
			padding: 7px 10px;
			border: solid 1px black;
		}
		aside .title2{
			margin-top: 20px;
			padding: 12px;
			border-top: solid 2px black;
			border-bottom: solid 1px #cccccc;
			font-size: 18px;
		}
		aside .list2{
			margin: 20px 0;
		}
		aside .list2 li{
			margin: 10px 12px;
		}
		aside .ripple{
			
			border: solid 1px #0ca9a3;
			padding: 12px;
		}
		aside .ripple h2{
			font-size: 18px;
			margin: 10px 0 15px 0;
		}
		
		
		
		
		#main{
			width: 840px;
			float: left;
		}
		footer{
			clear: both;
			height: 260px;
			background-color: #05354e;
			color: white;
			margin-top: 50px;
		}
		#bottom_menu ul{
		
			padding: 20px 0 0 10px;
			font-weight: bold;
		
		}
		#bottom_menu li{
			display: inline;
			margin-right: 30px;
		}
		footer .items2{
			float: left;
			margin: 40px 0 0 100px;
		}
		footer h3{color: #0ca9a3;}
		footer .items2 ul{margin-top: 15px;}
		footer .items2 li{margin-top: 5px;}
	</style>
	
</head>
<body>
	
	<header>
		<div class="box">
			<div id="logo">
				<img alt="" src="image/logo.jpg" width="100px">
			</div>
			<nav id="menu">
				<ul id="top_menu">
					<li> 유재석(qwe)님 </li>
					<li> 로그아웃 </li>
					<li> 정보수정 </li>
				</ul>
				<ul id="main_menu">
					<li> HOME </li>
					<li> 출석부 </li>
					<li> 작품갤러리 </li>
					<li> 게시판 </li>
				</ul>
			</nav>
		</div>
	</header>
	
	<section id="main_image">
	</section>
	
	<div class="box">
		<aside>
			<h2 class="title1">bmw</h2>
				<p class="comment"> 안녕하세요 bmw 코리아입니다
			
			<div class="search">
				<input type="text"><button>검색</button>
			</div>
			
			<h2 class="title2">판매 목록</h2>
				<ul  class="list2">
					<li>roadster</li>
					<li>spyder</li>
					<li>gt</li>
				</ul>
			
			<div class="ripple">
				<h2>최근 댓글</h2>
				<ul>
					<li>안녕하세요</li>
					<li>안녕하세요</li>
					<li>안녕하세요</li>
				</ul>
				
			</div>
			
			
			
		</aside>
		
		<section id="main">
			<%@include file="10_layout7.jsp" %>
		</section>
	
	</div>
	
	<footer>
		<div class="box">
			<nav id="bottom_menu">
				<ul>
					<li>회사 소개</li>
					<li>개인정보처리방침</li>
					<li>저작권 정보</li>
					<li>이용 안내</li>
				</ul>
			</nav>
			
			<div class="items2">
				<h3>문의 전화</h3>
				<ul>
					<li>123-1234</li>
					<li>10:00 ~ 18:00( lunch 12:00 ~ 13:00)</li>
				</ul>
			</div>
			
			<div class="items2">
				<h3>회사 정보</h3>
				<ul>
					<li>주소 : 서울특별시 신촌</li>
					<li>전화 : 000-000-0000</li>
					<li>팩스 : 000-000-0000</li>
					<li>이메일 : 000-000-0000</li>
				</ul>
			</div>
			
			<div class="items2">
				<h3>입금 정보</h3>
				<ul>
					<li>국민은행 : 000-000-000000</li>
					<li>BMW</li>
				</ul>
			</div>
			
		</div>
	</footer>
	
	
	
	
	
</body>
</html>