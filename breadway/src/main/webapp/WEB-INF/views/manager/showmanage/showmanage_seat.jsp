<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 공연 스케쥴 정보"></c:param>
</c:import>
<script type="text/javascript">
	function ScheduleUpdateWindowOpen(show_id,schedule_id){
		var win = window.open("showmanage_scheduleupdate.do?show_id="+show_id+"&schedule_id="+schedule_id,"좌석 정보", "width=900, height=400, left = 300, top = 300, resizable=no, scrollbars=no");
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
<div align = "center">
	<br>
		<div class="w3-container w3-lobster">
			<p class="w3-xxxlarge">Show Seat Manage Page</p>
		</div>
	<br>
	<br>
	<div align = "center" style="width:70%">
	<table border = "1" class="w3-table w3-striped w3-border">
		<tr> 
			<th align = "center" width = "14%">공연 날짜</th>
			<th align = "center" width = "14%">공연 시간</th>
			<th align = "center" width = "14%">**공연 일정 **<br>수정 및 삭제</th>
			<th align = "center" width = "14%">**좌석 보기**</th>
			<th align = "center" width = "14%">**요청 좌석 보기**</th>
		</tr>
		<c:if test = "${empty schedulelist}">
		<tr>
			<td colspan = "5" align = "center">
				<div class="w3-container w3-lobster">
					<p class="w3-xlarge w3-center">
						No Infomation<br>
						<a href = "javascript:history.back();">Back</a>
					</p>
				</div>
			</td>
		</tr>
		</c:if>
		<c:forEach var = "dto" items = "${schedulelist}">
			<tr>
				<td align = "center">${fn:substring(dto.schedule_date,0,10)}</td>
				<td align = "center">${dto.schedule_time}</td>
				<th>
					<div align = "center">
					<a href = "javascript:ScheduleUpdateWindowOpen(${dto.show_id},${dto.schedule_id});">수정</a> |
					<a href = "showmanage_scheduledelete.do?show_id=${dto.show_id}&schedule_id=${dto.schedule_id}">삭제</a>
					</div>
				</th>
				<td>
					<div align = "center">
					<input class="w3-button w3-dark-grey" type = "button" value = "확인" onclick = "location = 'showmanage_seatcontent.do?show_id=${dto.show_id}&schedule_id=${dto.schedule_id}'">
					</div>
					<%-- <a href = "showmanage_seatcontent.do?show_id=${dto.show_id}&schedule_id=${dto.schedule_id}">(확인)</a> --%>
				</td>
				<td>
					<div align = "center">
					<input class="w3-button w3-dark-grey" type = "button" value = "확인" onclick = "location = 'showmanage_seatrequest.do?show_id=${dto.show_id}&schedule_id=${dto.schedule_id}'">
					<%-- <a href = "showmanage_seatrequest.do?show_id=${dto.show_id}&schedule_id=${dto.schedule_id}">(확인)</a> --%>
					</div>
				</td>
			</tr>
			<c:set var = "id" value = "${dto.show_id}"/>
		</c:forEach>	
	</table>
	</div>
	<c:if test = "${not empty schedulelist}">
		<div align = "center" style="width:70%">
		<table border = "1" class="w3-table w3-striped w3-border">
			<c:forEach var = "totaldto" items ="${totalprofit}">
				<c:set var = "day" value = "${totaldto.seat_price-(totaldto.seat_price*totaldto.seat_discount/100)}"/>
				<c:set var = "dayprofit" value = "${dayprofit+day}"/>
			</c:forEach>
			<tr>
				<td align="center" colspan = "1" width = "28%">공연 총수익</td>
				<td align="center" colspan = "3" width = "42%"><fmt:formatNumber value="${dayprofit}" type="number"/>원</td>
			</tr>
		</table>
		</div>
		<br>
		<br>
		<div class = "w3-center">
		<div class="w3-bar">
		<c:if test="${rowCount>0}">
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}"></c:set>
				</c:if>
				<c:if test="${startPage > pageBlock}">
					<a href="show_seat.do?pageNum=${startPage - pageBlock}&show_id=${id}" class="w3-button w3-bar-item">&laquo;</a>
					</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="show_seat.do?pageNum=${i}&show_id=${id}" class="w3-button w3-bar-item">${i}</a>
				</c:forEach> 
					<c:if test="${endPage < pageCount}">				
					<a href="show_seat.do?pageNum=${startPage + pageBlock}&show_id=${id}" class="w3-button w3-bar-item">&raquo;</a>
				</c:if>
		</c:if>
		</div>
		</div>
	</c:if>
</div>