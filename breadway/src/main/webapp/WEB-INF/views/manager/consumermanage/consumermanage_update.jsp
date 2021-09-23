<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지  구매자 관리 수정"></c:param>
</c:import>
<!-- consumermanage_update.jsp -->
<html>
<head>
<title>회원 수정 페이지</title>
	<script type="text/javascript">
			function check(){
				if (f.consumer_Name.value==""){
					alert("구매자 명을 입력해 주세요!!")
					f.consumer_Name.focus()
					return
				}
				if (f.consumer_ID.value==""){
					alert("구매자 아이디를 입력해 주세요!!")
					f.consumer_ID.focus()
					return
				}
				if (f.consumer_Password.value==""){
					alert("구매자 비밀번호를 입력해 주세요!!")
					f.consumer_Password.focus()
					return
				}
				if (f.consumer_Email.value==""){
					alert("구매자 이메일을 입력해 주세요!!")
					f.consumer_Email.focus()
					return
				}
				if (f.consumer_Phone.value==""){
					alert("구매자 전화번호를 입력해 주세요!!")
					f.consumer_Phone.focus()
					return
				}
				document.f.submit()
			}
		</script>
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
		  <p class="w3-xxlarge">Consumer Update Page</p>
		</div>
	<br>
	<div class="w3-container">
	<form name = "f" action = "managerconsumer_update_ok.do" method = "post">
		<input type="hidden" name="consumer_UID" value="${getConsumer.consumer_UID}"/>
		<table border = "1" style="width:50%" class="w3-table w3-striped w3-bordered">
			<tr>
				<td align="center">회원명</td>
				<td align="center"><input class="w3-input w3-border w3-round-large" type = "text" name = "consumer_Name" value = "${getConsumer.consumer_Name}" maxlength='20'></td>
			</tr>
			<tr>
				<td align="center">회원 아이디</td>
				<td align="center"><input class="w3-input w3-border w3-round-large" type = "text" name = "consumer_ID" value = "${getConsumer.consumer_ID}" maxlength='20'></td>
			</tr>
			<tr>
				<td align="center">회원 비밀번호</td>
				<td align="center"><input class="w3-input w3-border w3-round-large" type = "text" name = "consumer_Password" value = "${getConsumer.consumer_Password}" maxlength='20'></td>
			</tr>
			<tr>
				<td align="center">회원 이메일</td>
				<td align="center"><input class="w3-input w3-border w3-round-large" type = "text" name = "consumer_Email" value = "${getConsumer.consumer_Email}" maxlength='30'></td>
			</tr>
			<tr>
				<td align="center">회원 전화번호</td>
				<td align="center"><input class="w3-input w3-border w3-round-large" type = "text" name = "consumer_Phone" value = "${getConsumer.consumer_Phone}"  maxlength='12'></td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
				<div align = "center">
					<input class="w3-button w3-dark-grey" type = "button" value = "전송" onclick = "javascript:check();">
					<input class="w3-button w3-dark-grey" type = "reset" value = "다시 작성">
				</div>
				</td>
			</tr>
		</table>
	</form>	
	</div>
	</div>
</body>
</html>