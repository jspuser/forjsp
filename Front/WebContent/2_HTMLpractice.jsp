<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<style type="text/css">
	
		table, tr, th, td {
			border: solid 1px black;
			border-collapse: collapse;
			padding: 10px;
		}
	
	</style>

</head>
<body>
	<h2>KTX 열차 시간표</h2>
	
	<table>
		<tr>
			<th>출발</th><th>도착</th><th colspan="2">객실/요금</th><th>예약</th>
		</tr>
		<tr>
			<td>서울(9:00)</td><td>부산(12:00)</td><td>일반실</td><td>50,000원</td><td><input type="button" value="예약신청"></td>
		</tr>
		<tr>
			<td>서울(10:00)</td><td>부산(13:00)</td><td>특실</td><td>50,000원</td><td><input type="button" value="예약불가"></td>
		</tr>
		<tr>
			<td>서울(11:00)</td><td>부산(14:00)</td><td>특실</td><td>50,000원</td><td><input type="button" value="예약신청"></td>
		</tr>	
	
	
	</table>

</body>
</html>