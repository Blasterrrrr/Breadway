<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 공연관리 메인"></c:param>
</c:import>
<script type="text/javascript">
	function TheatreWindowOpen(theatre_id){
		var win = window.open("showmanage_theatrecontent.do?theatre_id="+theatre_id,"공연 장소 정보", "width=900, height=500, left = 300, top = 300, resizable=no, scrollbars=no");
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
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">Show Manage Page</p>
		</div>
	<br>
	<div class="w3-container w3-center" style="width:35%">
		<form action="show_keyword.do" method="post" class="w3-container w3-card-4 w3-light-grey">
			<select name = "showsearch">
				<option value = "show_name">공연 이름</option>
				<option value = "show_organizer">공연 주최자</option>
				<option value = "theatre_name">공연 장소</option>
				<option value = "genre">공연 장르</option>
			</select>
			&nbsp;검색:&nbsp;
			<input type="text" name = "showString" width="50%" maxlength='40'>&nbsp;&nbsp;
			<input class="w3-button w3-dark-grey" type="submit" value="검색">
		</form>
	</div>	
	<br>
	<br>
	<div align = "center" style="width:70%">
	<table border="1" class="w3-table w3-striped w3-border">
		<tr>
			<th colspan = "6" align = "left"><a href = "showmanage_theatrerequest.do">[극장별 공연 스케쥴 확인]</a></th>
			<th colspan = "1" align = "right">** : Page Connect</th>
		</tr>
		<tr>
			<th align = "center">**공연명**</th>
			<th align = "center">공연 주최자</th>
			<th align = "center">**공연 장소**</th>
			<th align = "center">공연 기간</th>
			<th align = "center">공연 장르</th>
			<th align = "center">공연 삭제 요청</th>
			<th align = "center">**좌석 및 스케쥴**</th>
		</tr>
		<c:if test="${empty show_list}">
			<tr>
				<th colspan = "7" align = "center">내용이 없습니다.</th>
			</tr>	
		</c:if>
		<c:forEach var="dto" items="${show_list}">
			<tr>
				<td align="center"><a href="show_content.do?show_id=${dto.show_ID}">${dto.show_name}</a></td>
				<td align="center">${dto.show_organizer}</td>
				<td align="center"><a href = "javascript:TheatreWindowOpen(${dto.theatre_id})">${dto.theatre_name}</a></td>
				<td align="center">${fn:substring(dto.startDate,0,10)}~${fn:substring(dto.endDate,0,10)}</td>
				<td align="center">${dto.genre}</td>
				<c:choose>
					<c:when test = "${dto.show_Status == 3}">
						<td align = "center">
							<form name = "delete" method = "post" action = "showmanage_delete.do">
								<input type = "hidden" name = "id" value = "${dto.show_ID}">
								<input type = "hidden" name = "name" value = "${dto.show_name}">
								<input class="w3-button w3-dark-grey" type = "submit" value = "공연 삭제 요청">
							</form>
						</td>
					</c:when>
					<c:otherwise>
						<td align="center">없음</td>
					</c:otherwise>
				</c:choose>
				<td align="center"><a href = "show_seat.do?show_id=${dto.show_ID}">좌석 정보 이동</a></td>
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
					<a href="showmanage_main.do?pageNum=${startPage - pageBlock}" class="w3-button w3-bar-item">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="showmanage_main.do?pageNum=${i}" class="w3-button w3-bar-item">${i}</a>
				</c:forEach> 
				<c:if test="${endPage < pageCount}">
					<a href="showmanage_main.do?pageNum=${startPage + pageBlock}" class="w3-button w3-bar-item">&raquo;</a>
				</c:if>
			</c:if>
		</div>	
		</div>
	</div>
</div>