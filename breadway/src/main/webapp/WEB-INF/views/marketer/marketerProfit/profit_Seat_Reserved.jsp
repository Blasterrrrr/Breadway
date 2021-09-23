<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<title>스케줄별 예매 리스트</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function delCheck(order_Num, schedule_ID, today, schedule_Date){
		var select=confirm("예매를 취소하시겠습니까? 주문번호 기준으로 좌석이 모두 취소됩니다.");
		if(select){
			location.href="cancel_reserve.mkt?order_Num="+order_Num +"&schedule_ID="+schedule_ID;
			alert("취소되었습니다.");
		}
	}
</script>
<div align="center" class="container" style="margin-top:30px;">
<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
	<h2>뮤지컬&lt;${sessionScope.show_Name}&gt; 스케줄별 예매 리스트</h2>
	<table border="1" width="50%" class="table table-bordered">
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<fmt:parseDate var="sch_Date" value="${sessionScope.schedule_Date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd"/>
		<fmt:formatDate var="sch_Date" value="${sch_Date}" pattern="yyyyMMdd"/>
		<thead>
			<tr align="center">
				<th>주문 번호</th>
				<th>좌석 이름</th>
				<th>예매자명</th>
				<th>예매자 연락처</th>
				<th>예매 상태</th>
				<th>예매 취소</th>
			</tr>
		</thead>
		<c:if test="${empty reservedList}">
		<tr>
			<td colspan="6" align="center">
				예매 완료된 좌석이 없습니다.
			</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${reservedList}" varStatus="status">
			<tr>
				<td align="center">${dto.order_Num}</td>
				<td align="center">${dto.seat_Name}</td>
				<td align="center">${cInfo.get(status.index).getConsumer_Name()}</td>
				<td align="center">${cInfo.get(status.index).getConsumer_Phone()}</td>
				<c:choose>
					<c:when test="${dto.reserve_Status == 1}">
						<td align="center">예매 완료</td>
						<td align="center">
							<c:choose>
								<c:when test="${sch_Date < today}">
									취소 불가
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-secondary" onclick="javascript:delCheck(${dto.order_Num}, ${dto.schedule_ID});">예매 취소하기</button>
								</c:otherwise>
							</c:choose>
						</td>
					</c:when>
					<c:when test="${dto.reserve_Status == 0}">
						<td align="center">예매 취소됨</td>
						<td align="center"></td>
					</c:when>
					<c:otherwise><td align="center">오류 발생!</td><td></td></c:otherwise>
				</c:choose>
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
			<a href="profit_Seat.mkt?pageNum=${i}&show_ID=${sessionScope.show_ID}">[${i}]</a>
		</c:forEach> 
			<c:if test="${endPage < pageCount}">				
			<a href="profit_Seat.mkt?pageNum=${startPage + pageBlock}&show_ID=${sessionScope.show_ID}">[다음]</a>
		</c:if>
	</c:if>
	<p><p>
	<button type="button" class="btn btn-secondary" onclick="window.location='profit_Seat.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">매출 현황 페이지로 돌아가기</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='show_Detail.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">뮤지컬 정보로 돌아가기</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">마이페이지 돌아가기</button>
</div>