<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 구매자 관리 메인"></c:param>
</c:import>
<!--consumermanage_index.jsp -->
<html>
<head>
	<title>회원 관리</title>
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
			  <p class="w3-xxxlarge">Consumer Manage Page</p>
			</div>
		<br>
		<div class="w3-container w3-center" style="width:35%">
			<form action="managerconsumer_search.do" method="post" class="w3-container w3-card-4 w3-light-grey">
				<select name = "consumersearch">
					<option value = "consumer_Name">구매자 이름</option>
					<option value = "consumer_ID">구매자 아이디</option>
					<option value = "consumer_Phone">구매자 전화번호</option>
				</select>
				선택검색 :&nbsp;
				<input type="text" name = "consumerString" width="50%">&nbsp;&nbsp;
				<input class="w3-button w3-dark-grey" type="submit" value="검색">
			</form>
		<br>
		<br>
		</div>
		<div align = "center" style="width:50%">
		<table border = "1" class="w3-table w3-striped w3-border">
			<tr>
				<th align = "center">회원명</th>
				<th align = "center">회원 아이디</th>
				<th align = "center">이메일</th>
				<th align = "center">전화번호</th>
				<th align = "center">기능</th><!-- 수정은 수정창으로 이동하고 삭제는 알람 창 띄어서 처리 -->
			</tr>
			<c:if test = "${empty listConsumer}">
				<tr>
					<td colspan = "5">등록된 정보가 없습니다.</td><!-- 회원정보 뜨는 곳 -->
				</tr>
			</c:if>
			<c:forEach var = "dto" items = "${listConsumer}">
				<tr>
					<td align="center">${dto.consumer_Name}</td>
					<td align="center">${dto.consumer_ID}</td>
					<td align="center">${dto.consumer_Email}</td>
					<td align="center">${dto.consumer_Phone}</td>
					<td align="center">
						<a href = "managerconsumer_update.do?uid=${dto.consumer_UID}">수정</a> |
						<a href = "managerconsumer_delete.do?uid=${dto.consumer_UID}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<br>
		<div class = "w3-center">
		<div class="w3-bar">
			<c:if test="${rowCount>0}">
			<c:if test="${startPage>pageBlock}">
				<a href="managerconsumer_index.do?pageNum=${startPage-pageBlock}" class="w3-button w3-bar-item">&laquo;</a>
			</c:if>
			<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
				<a href = "managerconsumer_index.do?pageNum=${i}" class="w3-button w3-bar-item">${i}</a>
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				<a href = "managerconsumer_index.do?pageNum=${startPage + pageBlock}" class="w3-button w3-bar-item">&raquo;</a>
			</c:if>	
			</c:if>
		</div>
		</div>
	</div>
	</div>
</body>
</html>