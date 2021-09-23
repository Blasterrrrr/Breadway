<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 1:1문의 검색"></c:param>
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
			<p class="w3-xxxlarge">1:1 Inquiry Search Result</p>
		  	<p class="w3-xxlarge">Search Result</p>
		</div>
	<br>
	<br>
	<c:choose>
		<c:when test="${empty keyword_list}">
			<div class="w3-container w3-lobster">
				<p class="w3-xxlarge">Inquiry Search Failed</p>
				<br>
				<p class="w3-xxlarge"><a href = "javascript:history.back();">Back</a></p>
			</div>
		</c:when>
		<c:otherwise>
		<div align = "center" style="width:50%">
			<table border = "1" class="w3-table w3-striped w3-border">
				<tr>
					<th width = "25%" align = "center">제목</th>
					<th width = "25%" align = "center">작성자</th>
				</tr>
				<c:forEach var="dto" items="${keyword_list}">
					<tr>
						<td align="center">
							<c:if test="${dto.re_step > 0}">
							[답글]
							</c:if>	
							<a href="managerinquiry_content.do?num=${dto.num}&re_step=${dto.re_step}&re_level=${dto.re_level}&re_group=${dto.re_group}">${dto.subject}</a>
							</td>
						<td align="center">${dto.name}</td>
					</tr>	
				</c:forEach>
			</table>
		</div>
		</c:otherwise>
	</c:choose>
</div>
