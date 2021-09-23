<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 1:1문의 메인"></c:param>
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
	<div class="w3-container w3-center" style="width:35%">
		<form action="managerinquiry_keyword.do" method="post" class="w3-container w3-card-4 w3-light-grey">
			찾으시는 제목 :
			<input type="text" name = "keyword" width="50%" maxlength='50'>&nbsp;
			<input class="w3-button w3-dark-grey" type="submit" value="검색">
		</form>
		<br>
		<br>
	</div>	
	<div align = "center" style="width:50%">
		<!-- re_step = 질문이냐 답변이냐 구분용도 re_level = 질문&답변의 통합 글번호 ex) 질문 1 == 답변 1-->
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<th align = "center" width = "25%">**제목**</th>
				<th align = "center" width = "25%">작성자</th>
			</tr>
			<c:if test="${empty inq_list}">
				<tr>
					<td colspan = "2">내용이 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${inq_list}">
				<tr>
					<td>
						<c:if test="${dto.re_step > 0}">
							[답글]
						</c:if>
						<a href="managerinquiry_content.do?num=${dto.num}&re_step=${dto.re_step}&re_level=${dto.re_level}&re_group=${dto.re_group}">${dto.subject}</a>
					</td>
					<td>${dto.name}</td>
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
					<a href="managerinquiry_main.do?pageNum=${startPage - pageBlock}" class="w3-button w3-bar-item">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="managerinquiry_main.do?pageNum=${i}" class="w3-button w3-bar-item">${i}</a>
				</c:forEach> 
				<c:if test="${endPage < pageCount}">
					<a href="managerinquiry_main.do?pageNum=${startPage + pageBlock}" class="w3-button w3-bar-item">&raquo;</a>
				</c:if>
			</c:if>
		</div>
		</div>
	</div>
</div>	