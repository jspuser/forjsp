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
	
	<h2>ȸ������ ��</h2>
	
	<form>
		<table>
			<tr>
				<td>���̵�</td><td><input type="text"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td><td><input type="password"></td>
			</tr>
			<tr>
				<td>��й�ȣȮ��</td><td><input type="text"></td>
			</tr>
			<tr>
				<td>�̸�</td><td><input type="text"></td>
			</tr>
			<tr>
				<td>�̸���</td><td><input type="text">@<select name="mail2">
														<option>���� �Է�</option>
														<option>gmail.com</option>
														<option>hanmail.net</option>
													</select></td>
			</tr>
			<tr>
				<td>�̸��� ����</td><td>
					<input type="radio" name="emailget" value="0">�����
					<input type="radio" name="emailget" value="1">����
				</td>
			</tr>
			<tr>
				<td>���� ���</td><td><input type="checkbox" name="how" value="ģ����õ">ģ����õ
									<input type="checkbox" name="how" value="���ͳݰ˻�">���ͳݰ˻�
									<input type="checkbox" name="how" value="��Ÿ">��Ÿ
				</td>
			</tr>
			<tr>
				<td>�λ縻</td><td><textarea name="hello"></textarea></td>
			</tr>
			
			<tr>
				<td align="right"><input type="submit">�����ϱ�</td><td align="right"><input type="reset">����ϱ�</td>
			</tr>
		
		</table>
	
	
	</form>

</body>
</html>