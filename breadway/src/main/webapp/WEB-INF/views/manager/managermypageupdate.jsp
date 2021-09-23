<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 마이페이지 수정"></c:param>
</c:import>
<!-- managermypageupdate -->
<html>
<head>
<title>관리자 정보 수정 페이지</title>
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
	<c:choose>
		<c:when test = "${empty managerinfo.marketer_Name}">
		<div align = "center">
			<br>
				<div class="w3-container w3-lobster">
				  <p class="w3-xxxlarge">Manager Info Update Complete</p>
				  <p class="w3-xxlarge">Please close the Window</p>
				</div>
			<br>
		</div>
		</c:when>
		<c:otherwise>
		<div class="w3-center" style="width:50%">
		<br>
		<br>
		<form name = "managerupdate" method = "post" action = "showmanage_managermypageupdateok.do" class="w3-light-grey">
			<table class="w3-table w3-striped w3-border">
				<tr>
					<th>관리자 명</th>
					<td><input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_Name" value = "${managerinfo.marketer_Name}" required></td>
				</tr>
				<tr>
					<th>관리자 아이디</th>
					<td><input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_ID" value = "${managerinfo.marketer_ID}" required></td>
				</tr>
				<tr>
					<th>관리자 비밀번호</th>
					<td><input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_Password" value = "${managerinfo.marketer_Password}" required></td>
				</tr>
				<tr>
					<th>관리자 이메일</th>
					<td><input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_Email" value = "${managerinfo.marketer_Email}" required></td>
				</tr>
				<tr>
					<th>관리자 전화번호</th>
					<td><input class="w3-input w3-border w3-round-large" type = "text" name = "marketer_Phone" value = "${managerinfo.marketer_Phone}" required></td>
				</tr>
				<tr>
					<td colspan = "2">
					<div align = "center">
						<input class="w3-button w3-dark-grey" type = "submit" value = "수정">
						<input class="w3-button w3-dark-grey" type = "reset" value = "다시쓰기">
					</div>
					</td>
				</tr>
			</table>
		</form>
		</div>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>