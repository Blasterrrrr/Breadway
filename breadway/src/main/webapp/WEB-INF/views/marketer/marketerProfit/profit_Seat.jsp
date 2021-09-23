<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<title>스케줄별 매출 현황</title>
</head>
<c:import url="/marketer_top" />
<div align="center"  class="container" style="margin-top:30px;">
<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
	<h2>뮤지컬&lt;${sessionScope.show_Name}&gt; 스케줄별 매출 현황</h2>
	<p>
	<table border="1" width="50%" class="table table-bordered">
		<thead>
			<tr align="center">
				<th>공연 날짜</th>
				<th>공연 시간</th>
				<th>좌석 보기</th>
				<th>상태</th>
				<th>예매 리스트</th>
			</tr>
		</thead>
		<c:if test="${empty schedulelist}">
		<tr>
			<td colspan="5" align="center">
				스케줄이 없습니다.
		</tr>
		</c:if>
		<c:forEach var="dto" items="${schedulelist}">
			<tr align="center" >
				<td>
					${fn:substring(dto.schedule_Date,0,10)}
					<c:set var="today" value="<%=new java.util.Date()%>" />
					<fmt:parseDate var="eDate" value="${dto.schedule_Date}" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd"/>
					<fmt:formatDate var="eDate" value="${eDate}" pattern="yyyyMMdd"/>
				</td>
				<td >${dto.schedule_Time}</td>
				<td>
					<button type="button" class="btn btn-secondary"  onclick="window.location='profit_Seat_Content.mkt?show_ID=${sessionScope.show_ID}&schedule_ID=${dto.schedule_ID}'">좌석 보기</button>
				</td>
				<td >
					<c:choose>
						<c:when test="${dto.reserve_seat_qty >= 0}">
							<c:choose>
								<c:when test="${eDate > today}">
									판매 중
								</c:when>
								<c:when test="${eDate == today}">
									판매 종료일
								</c:when>
								<c:when test="${eDate < today}">
									판매 종료
								</c:when>
							</c:choose>
						</c:when>
						<c:when test="${dto.reserve_seat_qty == totalSeatNum}">매진</c:when>
						<c:when test="${dto.reserve_seat_qty < 0}">오류 발생</c:when>
					</c:choose>
				</td>
				<td>
					<button type="button" class="btn btn-secondary"  onclick="window.location='profit_Seat_Reserved.mkt?schedule_ID=${dto.schedule_ID}&schedule_Date=${dto.schedule_Date}'">예매 리스트 보기</button>
				</td>
				<c:set var="show_ID" value="${sessionScope.show_ID}"/>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${rowCount>0}">
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}"></c:set>
		</c:if>
		<c:if test="${startPage > pageBlock}">
			<a href="profit_Seat.mkt?pageNum=${startPage - pageBlock}&show_ID=${sessionScope.show_ID}">[이전]</a>
			</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="profit_Seat.mkt?pageNum=${i}&show_ID=${sessionScope.show_ID}"> [${i}] </a>
		</c:forEach>
			<c:if test="${endPage < pageCount}">				
			<a href="profit_Seat.mkt?pageNum=${startPage + pageBlock}&show_ID=${sessionScope.show_ID}">[다음]</a>
		</c:if>
	</c:if>
	<p><p><p><p>
	<table border="1" width="30%" class="table table-bordered">
		<tr>
			<td class="text-center" width="30%" bgcolor="#ffd6b3" style="font-weight:bold">공연 총매출</td>
			<td align="right">
				<fmt:formatNumber value="${profitAll}" pattern="###,###원"/>
				<input type="hidden" name="profitAll" value="${profitAll}">
			</td>
		</tr>
	</table>
	<p><p>
	<button type="button" class="btn btn-secondary" onclick="window.location='show_Detail.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">뮤지컬 정보로 돌아가기</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">마이페이지 돌아가기</button>
</div>