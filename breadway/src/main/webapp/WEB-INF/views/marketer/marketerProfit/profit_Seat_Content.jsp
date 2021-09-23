<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<title>뮤지컬 좌석 현황</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function fnWindowOpen(seat_ID, schedule_ID){
		var win=window.open("profit_Seat_Detail.mkt?seat_ID="+seat_ID+"&schedule_ID="+schedule_ID,"좌석 정보", "width=500, height=400, resizable=no, scrollbars=no");
	}	
</script>
<div align="center" class="container" style="margin-top:30px;">
	<h2>뮤지컬&lt;${sessionScope.show_Name}&gt; 좌석 현황</h2>
	<c:choose>
		<c:when test="${empty framelist}">
			&nbsp;&nbsp;
			<h5>예매된 좌석이 없습니다.</h5>
		</c:when>
		<c:otherwise>
			<table border="1" width="50%" class="table table-bordered">
				<c:forEach var="dto" items ="${framelist}">
					<c:set var="count" value="0"/>
					<c:set var="blankseat" value="0"/>
					<c:set var="reserveseat" value="0"/>
					<c:forEach var="i" begin="1" end="${dto.seat_Row}">
						<c:if test="${i == 1}">
						<thead>
							<tr align="center" style="background-color: #c9e5ff; font-weight: bold">
								<td colspan="${dto.seat_Qty/dto.seat_Row}">${dto.seat_Section}</td>
							</tr>
						</thead>
						</c:if>
						<tr>
						<c:forEach var="j" begin="1" end="${dto.seat_Qty/dto.seat_Row}">
							<c:set var="count" value="${count+1}"/>
							<td align="center" width="50">
								<c:if test="${count < 11}">
									<c:forEach var="sdto" items ="${seatdto}">
										<c:if test="${fn:contains(sdto.seat_Number,below[count])&&fn:contains(sdto.seat_Number, dto.seat_Section)}">
											<a href="javascript:fnWindowOpen(${sdto.seat_ID}, ${sdto.schedule_ID});">${sdto.seat_Number}</a>
											<c:set var="reserveseat" value="${reserveseat+1}"/>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${count>10}">
									<c:forEach var="sdto" items ="${seatdto}">
										<c:if test="${fn:contains(sdto.seat_Number,count)&&fn:contains(sdto.seat_Number, dto.seat_Section)}">
											<a href="javascript:fnWindowOpen(${sdto.seat_ID}, ${sdto.schedule_ID});">${sdto.seat_Number}</a>
											<c:set var="reserveseat" value="${reserveseat+1}"/>
										</c:if>
									</c:forEach>
								</c:if>
								&nbsp;
								<c:set var="blankseat" value="${blankseat+1}"/>
							</td>
						</c:forEach>
						</tr>
					</c:forEach>
					<thead>
						<tr style="background-color:#ebebeb;">
							<td align="left" colspan="${dto.seat_Qty/dto.seat_Row}">예매석 : ${reserveseat} / 공석 : ${blankseat-reserveseat} <br> 총 좌석 수 : ${dto.seat_Qty}</td>
						</tr>
					</thead>
					<c:set var="count" value="0"/>
				</c:forEach>	
			</table>
		</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;
	<c:set var="dayprofit" value="0"/>
	<table border="1" width="30%" class="table table-bordered">
		<c:forEach var="sdto" items ="${seatdto}">
			<c:set var="day" value="${sdto.seat_Price - (sdto.seat_Price * sdto.seat_Discount / 100)}"/>
			<c:set var="dayprofit" value="${dayprofit + day}"/>
		</c:forEach>
		<tr>
			<td  class="text-center" width="50%" bgcolor="#ffd6b3" style="font-weight:bold">금일 매출</td>
			<td align="right">
				<fmt:formatNumber value="${dayprofit}" pattern="###,###원"/>
				<input type="hidden" name="dayprofit" value="${dayprofit}">
			</td>
		</tr>
	</table>
	<p><p>
	<button type="button" class="btn btn-secondary" onclick="window.location='profit_Seat.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">매출 현황 페이지로 돌아가기</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='show_Detail.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">뮤지컬 정보로 돌아가기</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">마이페이지 돌아가기</button>
</div>