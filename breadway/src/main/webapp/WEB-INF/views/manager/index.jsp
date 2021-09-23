<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- index.jsp -->
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 메인"></c:param>
</c:import>
<html>
<head>
	<title>Manager Page</title>
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
		  <p class="w3-xxxlarge">Manager Page</p>
		</div>
		<br>
		<table border = "0" width = "200" heignt = "200">
			<tr>
				<td><input type = "button" class="w3-button w3-dark-grey" title="판매자의 대한 관리입니다.판매자의 요청을 받는 작업 및 정보 수정 삭제 같은 작업이 가능합니다." style="width:200pt;height:150pt;" value = "판매자 관리" onclick = "location ='managermarketer_index.do'"></td>
				<td>&nbsp;&nbsp;</td>
				<td><input type = "button" class="w3-button w3-dark-grey" title="구매자의 대한 관리입니다 구매자의 대한 정보 수정 삭제 같은 작업이 가능합니다." style="width:200pt;height:150pt;" value = "회원 관리" onclick = "location ='managerconsumer_index.do'"></td>
				<td>&nbsp;&nbsp;</td>
				<td><input type = "button" class="w3-button w3-dark-grey" title="자주묻는질문에대한 작업들이 가능합니다." style="width:200pt;height:150pt;" value = "FAQ" onclick = "location ='managerfaq_main.do'"></td>
				<td>&nbsp;&nbsp;</td>
				<td><input type = "button" class="w3-button w3-dark-grey" title="1:1문의에 대한 작업들이 가능합니다." style="width:200pt;height:150pt;" value = "1 : 1 문의" onclick = "location ='managerinquiry_main.do'"></td>
				<td>&nbsp;&nbsp;</td>
				<td><input type = "button" class="w3-button w3-dark-grey" title="공연들의 관한 전체적인 작업들이 가능합니다.(공연 정보,좌석 정보,스케쥴 정보)" style="width:200pt;height:150pt;" value = "공연 관리" onclick = "location ='showmanage_main.do'"></td>
			</tr>
		</table>
	</div>
</body>
</html>