<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	
	<style>
		body{
			
			background-image: url("image/���.jpg");
			background-repeat: no-repeat;
			background-position: right top;
		
		}
		p{
			
			width: 400px;
			line-height: 150px;
		
		}
		table{
			border-collapse: collapse;	/*	���� �׵θ� */
		
		}
		table, th, td{
			
			border: solid 1px #cccccc;
			
		
		}
		table{
			
			border-top: solid 3px orange;
		
		}
		th{
			padding: 10px;
			background-color: #eeeeee;
		
		}
		td{
			padding: 10px;
			text-align: center;
		}
		
		#col1, #col2, #col3{
			width: 100px;
			
		}
		#col4{
			width: 250px;
		
		}
		.bold{
		
			font-weight: bold;
		
		}
	
	
	</style>


</head>
<body>
	
	<p> css Ȱ��
	<p> 1. ����̹��� ����
		<p> ������ ������� �ڵ����� ä��
		
	<p> 2. ���̺� �ٹ̱�
		
		<h3> ���̰��� �̿��</h3>
	<table>

		
		<tr>
			<th id="col1">����</th><th id="col2">����</th><th id="col3">����</th><th id="col4">���</th>
		</tr>
		
		<tr>
			<td class="bold">�ְ���</td><td>20,000��</td><td>10,000��</td><td rowspan="3">���� ���� �� ���̽ü� �̿�(�Ϻ� ���̱ⱸ ���� ���)</td>
		</tr>
		
		<tr>
			<td class="bold">�߰���</td><td>20,000��</td><td>10,000��</td>
		</tr>
		
		<tr>
			<td class="bold">2�ϱ�</td><td>20,000��</td><td>10,000��</td>
		</tr>
		
		
	
	</table>
	
	

</body>
</html>