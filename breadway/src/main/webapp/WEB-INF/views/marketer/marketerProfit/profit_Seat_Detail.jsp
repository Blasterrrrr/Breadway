<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<title>좌석 예매 정보</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div align="center" class="container" style="margin-top:30px;">
		<form name="f" action="cancel_Seat" method="post">
			<table border="1" class="table table-bordered">
				<tr align="center">
					<th class="text-center" width="30%" style="background-color: #c9e5ff">좌석 이름</th>
					<td align="center">${detail_list.seat_Name}</td>
				</tr>
				<tr align="center">
					<th class="text-center" width="30%" style="background-color: #c9e5ff">좌석 가격</th>
					<td align="center">
						<fmt:formatNumber value="${detail_list.seat_Price}" pattern="###,###원"/>
					</td>
				</tr>
				<tr align="center">
					<th class="text-center" width="30%" style="background-color: #c9e5ff">좌석 할인</th>
					<td align="center">${detail_list.seat_Discount}%</td>
				</tr>
				<tr align="center">
					<th class="text-center" width="30%" style="background-color: #c9e5ff">예매자명</th>
					<td align="center">${cdto.consumer_Name}</td>
				</tr>
				<tr>
					<th class="text-center" width="30%" style="background-color: #c9e5ff">전화 번호</th>
					<td align="center">${cdto.consumer_Phone}</td>
				</tr>
				<tr>
					<th class="text-center" width="30%" style="background-color: #c9e5ff">예매 상태</th>
					<c:choose>
						<c:when test="${detail_list.reserve_Status == 1}"><td align="center">예매 완료</td></c:when>
						<c:when test="${detail_list.reserve_Status == 0}"><td align="center">예매 취소</td></c:when>
					</c:choose>
				</tr>
			</table>
			<p><p>
			<button type="button" class="btn btn-secondary" onclick="self.close()">창 닫기</button>
		</form>
	</div>
</body>