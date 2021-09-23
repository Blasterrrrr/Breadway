<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지  1:1문의 상세보기"></c:param>
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
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">1:1 inquiry</p>
		</div>
	<br>
	<div align = "center" style="width:50%">
	<table border="1" class="w3-table w3-striped w3-border">
		<tr>
			<th width="25%" >작성자</th>
			<td width="25%">${getInquiry.name}</td>
		</tr>
		<tr>
			<th width="25%">이메일</th>
			<td width="25%">${getInquiry.email}</td>
		</tr>
		<tr>
			<th width="25%">작성일</th>
			<td width="25%">${getInquiry.inqdate}</td>
		</tr>
		<tr>
			<th width="25%">제목</th>
			<td width="25%">${getInquiry.subject}</td>
		</tr>
		<tr><!-- 문의 내용 -->
			<th width="25%">내용</th>
			<td align = "center" colspan = "2">${getInquiry.content}</td>
		</tr>
		<tr>
			<td align = "center" colspan = "2">
			<div align = "center">
				<c:choose>
				<c:when test = "${getInquiry.re_step == 0}">
				<input class="w3-button w3-dark-grey" type = "button" value = "답글 쓰기" onclick = "location = 'managerinquiry_writeForm.do?num=${getInquiry.num}&re_level=${getInquiry.re_level}&re_group=${getInquiry.re_group}'">
				&nbsp;
					<%-- <a href = "managerinquiry_writeForm.do?num=${getInquiry.num}&re_level=${getInquiry.re_level}&re_group=${getInquiry.re_group}">답글 쓰기</a> --%>
				</c:when>
				<c:when test = "${getInquiry.re_step == 1}">
					<input class="w3-button w3-dark-grey" type = "button" value = "수정" onclick = "location = 'managerinquiry_updateForm.do?num=${getInquiry.num}&re_step=${getInquiry.re_step}&re_level=${getInquiry.re_level}&re_group=${getInquiry.re_group}'">
					&nbsp;
				</c:when>
				</c:choose>
				<%-- <a href = "managerinquiry_updateForm.do?num=${getInquiry.num}&re_step=${getInquiry.re_step}&re_level=${getInquiry.re_level}&re_group=${getInquiry.re_group}">수정</a> --%>
				<input class="w3-button w3-dark-grey" type="button" value="삭제" onclick="window.location='managerinquiry_delete.do?num=${getInquiry.num}'">
				<%-- <a href = "managerinquiry_delete.do?num=${getInquiry.num}">삭제</a> --%>
				&nbsp;
				<input class="w3-button w3-dark-grey" type="button" value="1:1 문의 목록" onclick="window.location='managerinquiry_main.do'">
			</div>
			</td>
		</tr>
	</table>
	</div>
</div>