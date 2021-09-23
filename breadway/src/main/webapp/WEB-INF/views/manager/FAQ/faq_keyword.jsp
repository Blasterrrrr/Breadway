<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 FAQ검색"></c:param>
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
			<p class="w3-xxxlarge">Frequently Asked Questions Search Result</p>
		  <p class="w3-xxlarge">Search Result</p>
		</div>
	<br>
	<br>
	<c:choose>
		<c:when test="${empty keyword_list}">
			<div class="w3-container w3-lobster">
				<p class="w3-xxlarge">FAQ Search Failed</p>
				<br>
				<p class="w3-xxlarge"><a href = "javascript:history.back();">Back</a></p>
			</div>
		</c:when>
		<c:otherwise>
		<div align = "center" style="width:50%">
			<table border = "1" class="w3-table w3-striped w3-border">
				<tr>
					<th align = "center">키워드</th>
					<th align = "center">**제목**</th>
					<th align = "center">기능</th>
				</tr>
				<c:forEach var="dto" items="${keyword_list}">
					<tr>
						<td align="center">${dto.keyword}</td>
						<td align="center"><a href="managerfaq_content.do?num=${dto.num}">${dto.question}</a></td>
						<td align = "center">
							<a href = "managerfaq_update.do?num=${dto.num}">수정</a> |
							<a href = "managerfaq_delete.do?num=${dto.num}">삭제</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</div>
		</c:otherwise>
	</c:choose>
</div>