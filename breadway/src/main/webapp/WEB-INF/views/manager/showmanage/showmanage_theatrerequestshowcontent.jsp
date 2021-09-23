<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 극장별 공연 상세 보기"></c:param>
</c:import>
<!-- showmanage_theatrerequestshowcontent.jsp -->
<html>
<head>
<title>선택 극장 진행되는 공연</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
	<style>
		.w3-lobster {
		  font-family: "Lobster", serif;
		}
		.w3-button {width:150px;}
</style>
</head>
<body>
	<div align = "center">
		<br>
			<div class="w3-container w3-lobster">
			  <p class="w3-xxlarge">선택 극장에서 진행되는 공연입니다 이 페이지에서는 공연 요청 승인 수락 및 거절이 가능합니다.</p>
			</div>
		<br>
		<c:choose>
			<c:when test = "${empty tshowlist}">
				<br>
				  <h3>현재 진행중인 공연 정보가 없습니다.</p></h3>
				  <h2><a href = "javascript:history.back();">뒤로 가기</a></h2>
			</c:when>
			<c:otherwise>
			<div align = "center" style="width:70%">
			<table border = "1" class="w3-table w3-striped w3-border">
				<tr>
					<th align = "center" width = "14%">공연 명</th>
					<th align = "center" width = "14%">공연 주최자</th>
					<th align = "center" width = "14%">공연 기간</th>
					<th align = "center" width = "14%">공연 시간(러닝 타임)</th>
					<th align = "center" width = "14%">공연 승인 선택</th>
				</tr>
				<c:forEach var = "tshowdto" items = "${tshowlist}">	
					<tr>
						<td align = "center">${tshowdto.show_name}</td>
						<td align = "center">${tshowdto.show_organizer}</td>
						<td align = "center">${fn:substring(tshowdto.startDate,0,10)}~${fn:substring(tshowdto.endDate,0,10)}</td>
						<td align = "center">${tshowdto.duration}</td>
						<c:choose>
							<c:when test = "${tshowdto.show_Status == 0}">
								<td align = "center">
									<div align = "center">
									<input class="w3-button w3-dark-grey" type = "button" value = "승인" onclick = "location = 'showmanage_theatrerequestshowchoice.do?show_id=${tshowdto.show_ID}&mode=grant&theatre_id=${tshowdto.theatre_id}'">
									<input class="w3-button w3-dark-grey" type = "button" value = "거절" onclick = "location = 'showmanage_theatrerequestshowchoice.do?show_id=${tshowdto.show_ID}&mode=deny&theatre_id=${tshowdto.theatre_id}'">
									<%-- <a href = "showmanage_theatrerequestshowchoice.do?show_id=${tshowdto.show_ID}&mode=grant&theatre_id=${tshowdto.theatre_id}">승인</a> |
									<a href = "showmanage_theatrerequestshowchoice.do?show_id=${tshowdto.show_ID}&mode=deny&theatre_id=${tshowdto.theatre_id}">거절</a> --%>
									</div>
								</td>
							</c:when>
							<c:otherwise>
								<td align = "center">요청 완료</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>