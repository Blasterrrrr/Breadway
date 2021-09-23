<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 FAQ메인"></c:param>
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
		  <p class="w3-xxxlarge">Frequently Asked Questions</p>
		</div>
	<br>
<!-- 	<div class="w3-container w3-center" style="width:35%">
		<form action="managerfaq_keyword.do" method="post" class="w3-container w3-card-4 w3-light-grey">
			찾으시는 키워드 :
			<input type="text" name = "keyword" width="50%">&nbsp;&nbsp;
			<input class="w3-button w3-dark-grey" type="submit" value="검색">
		</form>키워드 검색하면 해당 키워드에대한 FAQ가 뜨게된다
		모든 FAQ의 대한 정보
		<br>
		<br>
	</div> -->
	<div align = "center" style="width:50%">
		<form action="managerfaq_keyword.do" method="post">
		<table class="w3-table w3-striped w3-border w3-center">
			<tr>
				<th colspan = "4" class="w3-center" >키워드별 구분</th>
			</tr>
			<tr>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "예매"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "취소"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "개인정보"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "공연정보"></th>
			</tr>
			<tr>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "결제방법"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "환불규정"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "기타"></th>
				<th class="w3-center"><input class="w3-button w3-dark-grey" type = "submit" name = "keyword" value = "1:1문의"></th>
			</tr>
		</table>
		</form>
		<br>
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<th align = "right" colspan = "3"><input class="w3-button w3-dark-grey" type = "button" value = "FAQ작성하기" onclick = "location = 'managerfaq_input.do'"></th>
			</tr>
			<tr>
				<th align = "center">키워드</th>
				<th align = "center">**질문**</th>
				<th align = "center">기능</th>
			</tr>
			<c:if test="${empty faq_list}">
				<tr>
					<td colspan = "3">내용이 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${faq_list}">
				<tr>
					<td align = "center">${dto.keyword}</td>
					<td align = "center"><a href="managerfaq_content.do?num=${dto.num}">${dto.question}</a></td>
					<td align = "center">
						<a href = "managerfaq_update.do?num=${dto.num}">수정</a> |
						<a href = "managerfaq_delete.do?num=${dto.num}">삭제</a>
					</td>
				</tr>							
			</c:forEach>
		</table>
		<br>
		<br>
		<div class = "w3-center">
		<div class="w3-bar">
			<c:if test="${rowCount>0}">
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}"></c:set>
				</c:if>
				<c:if test="${startPage > pageBlock}">
					<a href="managerfaq_main.do?pageNum=${startPage - pageBlock}" class="w3-button w3-bar-item">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="managerfaq_main.do?pageNum=${i}" class="w3-button w3-bar-item">${i}</a>
				</c:forEach> 
				<c:if test="${endPage < pageCount}">
					<a href="managerfaq_main.do?pageNum=${startPage + pageBlock}" class="w3-button w3-bar-item">&raquo;</a>
				</c:if>
			</c:if>
		</div>
		</div>
	</div>
	
</div>