<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	HTML : ������ �±׾��
	
	1. h1 ~ h6 : �� ���� �±�
	<h1> HTML1 ���� </h1>
	<h2> HTML2 ����</h2>
	<h3> HTML3 ����</h3>
	<h4> HTML4 ����</h4>
	<h5> HTML5 ���� </h5>
	<h6> HTML6 ���� </h6>
	
	2. �ܶ� : p
	<h2> �� �������� ? </h2>
	<p>
	�������ؽ�Ʈ ��ũ�� ���� �� �������� ���� �������� ��ũ�� ����. ����, HTML�� ����, �ܶ�, ��� ��� ���� ������ ���� ������ �ǹ̸� ��Ÿ���� �ͻӸ� �ƴ϶� ��ũ, �ο�� �� ���� �׸����� ������ ������ ���� �� �ִ� ����� �����Ѵ�.
	<p>
	�������ؽ�Ʈ ��ũ�� ���� �� �������� ���� �������� ��ũ�� ����. ����, HTML�� ����, �ܶ�, ��� ��� ���� ������ ���� ������ �ǹ̸� ��Ÿ���� �ͻӸ� �ƴ϶� ��ũ, �ο�� �� ���� �׸����� ������ ������ ���� �� �ִ� ����� �����Ѵ�.
	<p>
	
	
	3. �ٹٲ� br
	
	<p> �������ؽ�Ʈ ��ũ�� ���� �� �������� ���� �������� ��ũ�� ����. <br>
	 ����, HTML�� ����, �ܶ�, ��� ��� ���� ������ ���� ������ �ǹ̸� ��Ÿ���� �ͻӸ� �ƴ϶� <br>
	 ��ũ, �ο�� �� ���� �׸����� ������ ������ ���� �� �ִ� ����� �����Ѵ�. <br>
	 <p>
	 
	 
	 4. Ư������ : &��ȣǥ��
	 
	 <p> &nbsp; &lt; ��¼�� ��¼�� &gt; �������ؽ�Ʈ ��ũ�� ���� �� �������� ���� �������� ��ũ�� ����. <br>
	 &amp; &quot; &#39; ����, HTML�� ����, �ܶ�, ��� ��� ���� ������ ���� ������ �ǹ̸� ��Ÿ���� �ͻӸ� �ƴ϶� <br>
	 ��ũ, �ο�� �� ���� �׸����� ������ ������ ���� �� �ִ� ����� �����Ѵ�. <br>
	 
	 
	 5. �̹��� : img
	 <p> 1. alt : ���� ����
	 <p> 2. src : ���� ���
	 <p> 3. ũ�� ���� : width : ���α��� // height : ���α���
	 <p>		// �ȼ�[����ũ��] : ��[ �̹����� ǥ���ϴ� �� ] : 
	 			// �ۼ�Ʈ[���ũ��]  : ���� ���ũ��
	 
	 <p>
	 <img alt="" src="image/4.jpg" width="300">
	 <img alt="" src="image/4.jpg" width="200" height="200">
	 <img alt="" src="image/4.jpg" width="30%">
	 
	 <p> ���� ���� :	// 1.jpg	// 2.png	// 3.gif	// 4.svg
	 
	 
	 <p> ���� ���
	 <p> ��� ��� : ../4.jpg
	 <p> ���� ��� : 
	 
	 <img alt="" src="image/4.jpg">
	 <img alt="" src="./image/4.jpg">
	 <img alt="" src="./image/test/4.jpg">
	 <img alt="" src="../image/4.jpg">
	 
	 <p> 6. ����� �±� audio
	 <p>	// 1. controls = ȭ�鿡 �÷��̾� ǥ��
	 <p> 	// 2. autoplay = �ڵ�����
	 
	 <audio controls="controls" src="image/audio_aaf76c27ad.mp3"></audio>
	 
	 <p> 7. ���� �±� video
	 
	 <video controls="controls" width="300" height="300">
	 
	 	 <source src="image/videoforthis.mp4" type="video/mp4">
	 
	 </video>
	 
	 <p> ��Ʃ��[�ܺ�] ����
	 <iframe width="560" height="315" src="https://www.youtube.com/embed/qCq-V6qDqu4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		
	<p> 8. ����[��ȣ]���� ��� : ul li	
	<h2> ��� ������ </h2>
		<ul>
			<li>�̰� ���� �ְ� �̰� �ְ� �����ִ� ���� �ֱ�</li>
			<li>���ųְ� ���� �ι� �ְ� �̰� 1L �ֱ�</li>
			<li>���� ���� ���� ���� �ϱ�</li>
			<li>�˾Ƽ� ��</li>
		
		</ul>
		
	<p> 8. ����[��ȣ]���� ��� : ol li	
	<p> 1. target="_blank" : ��â���� ����
	<h2> ��� ������ </h2>
		<ol>
			<li> <a href="http://www.naver.com" target="_blank">�̰� ���� �ְ� �̰� �ְ� �����ִ� ���� �ֱ�</a></li>
			<li> <a href="http://www.naver.com">���ųְ� ���� �ι� �ְ� �̰� 1L �ֱ�</a></li>
			<li> <a href="http://www.naver.com">���� ���� ���� ���� �ϱ�</a></li>
			<li> <a href="http://www.naver.com">�˾Ƽ� ��</a></li>
		
		</ol>
		
		
</body>
</html>