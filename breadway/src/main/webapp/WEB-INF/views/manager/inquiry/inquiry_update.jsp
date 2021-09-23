<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- faq_update.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 1:1문의 수정"></c:param>
</c:import>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
<style>
	.w3-lobster {
	  font-family: "Lobster", serif;
	}
	.w3-button {width:150px;}
</style>

<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("이름를 입력해 주세요!!")
				f.name.focus()
				return
				}
			if (f.email.value==""){
				alert("이메일을 입력해 주세요!!")
				f.email.focus()
				return
			}
			if (f.subject.value==""){
				alert("제목을 입력해 주세요!!")
				f.subject.focus()
				return
			}
			if (f.content.value==""){
				alert("내용을 입력해 주세요!!")
				f.content.focus()
				return
			}
				document.f.submit()
			}
</script>
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">1:1 Inquiry Update Page</p>
		</div>
	<br>
	<div align = "center" style="width:50%">
	<form name = "f" action = "managerinquiry_updateok.do" method = "post">
		<input type="hidden" name="num" value="${getInquiry.num}"/>
		<input type="hidden" name="re_level" value="${getInquiry.re_level}"/>
		<input type="hidden" name="re_group" value="${getInquiry.re_group}"/>
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<th>작성자</th>
				<td><input class="w3-input w3-border w3-round-large" type = "text" name = "name" value = "${getInquiry.name}" maxlength='20'></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input class="w3-input w3-border w3-round-large" type = "text" name = "subject" value = "${getInquiry.subject}" maxlength='100'></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input class="w3-input w3-border w3-round-large" type = "text" name = "email" value = "${getInquiry.email}" maxlength='30'></td>
			</tr>
			<tr>
			<tr>
				<th>내 용</th>
				<td><textarea class="w3-input w3-border w3-round-large" rows="4" cols="50" name="content" class="box">${getInquiry.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
					<div align = "center">
						<input class="w3-button w3-dark-grey" type = "button" value = "전송" onclick = "javascript:check();">
						<input class="w3-button w3-dark-grey" type = "reset" value = "다시 작성">
					</div>
					<!-- <a href="javascript:check()">[전송]</a>
					<a href="#">[취소]</a> -->
				</td>
			</tr>
		</table>
	</form>
</div>