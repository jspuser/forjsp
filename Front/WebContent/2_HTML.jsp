<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<p> �� : form
	<p> 1. input : �Է� ���
	
	<form>
		
		�̸� : <input type="text" value="���缮">
		�̸� : <input type="text" readonly="readonly" value="���缮">
		�̸� : <input type="text" placeholder="�����Է�" value="���缮">
		�̸� : <input type="text" readonly="readonly" value="���缮" disabled="disabled">
		��й�ȣ : <input type="password" autofocus="autofocus">
		�̸��� ���� : <input type="radio" name="email"> ��
				  <input type="radio" name="email"> �ƴϿ�
		�о�[checkbox] : <input type="checkbox" name="item1"> ����	
						<input type="checkbox" name="item2"> ���
						<input type="checkbox" name="item3"> ������
						<input type="checkbox" name="item4"> ����
						<input type="checkbox" name="item5"> ��Ÿ	  <br> <br>
						
		����[file] : <input type="file"> <br><br>
		
		��ư[] <button type="submit">������</button>
		��ư[] <button type="button">�ߺ�Ȯ��</button>
		��ư[] <button type="reset">�ٽ��ۼ�</button>
		
		�̸��� : <input type="email">
		
		�̸��� : <input type="text">
			<select>
				<option> naver.com</option>
				<option>hanmail.net</option>
				<option>gmail.com</option>
				<option>nate.cm</option>
			
			</select>
		���� : <textarea rows="6" cols="80"></textarea>
		
	</form>
	
	<p> ���̺� �±�
	<p> 1. tr : �� �߰�
	<p> 2. td : ������ �Է�
	<p> 3 th : �� ����
	<p> 4. border : �׵θ� ��
	
	
	<table border="1">
		<tr>
			<th>����</th><th colspan="2">�������/�ְ���</th>
		</tr>
		
		<tr>
			<td>����</td><td>20/30</td>
		</tr>
	
	</table>
	
	

</body>
</html>