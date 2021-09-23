<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- showmanage_seatrequestresult.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
	<style>
		.w3-lobster {
		  font-family: "Lobster", serif;
		}
		.w3-button {width:150px;}
</style>
<div align = "center">
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">Cancel Request Result</p>
		</div>
	<br>
	<div align = "center" style="width:50%">
	<table border = "1" class="w3-table w3-striped w3-border">
		<tr>
			<th align = "center">예매 날짜</th>
			<th align = "center">예매 좌석</th>
			<th align = "center">예매 좌석 가격</th>
			<th align = "center">주문 번호</th>
			<th align = "center">취소 날짜</th>
		</tr>
		<c:set var = "count" value = "0"/>
		<c:forEach var = "dto" items = "${requestcompletelist}">
			<tr>
				<td align = "center">${fn:substring(dto.reserve_Date,0,10)}</td>
				<td align = "center">${dto.seat_Name}</td>
				<td align = "center">${dto.seat_Price}</td>
				<td align = "center">${dto.order_Num}</td>
				<td align = "center">${dto.reserve_Cancel_Date}</td>
			</tr>
			<c:set var = "count" value = "${count+1}"/>
		</c:forEach>
		<tr>
			<td colspan = "5">총 ${count}개의 좌석이 취소 되었습니다.</td>
		</tr>
	</table>
</div>
</div>