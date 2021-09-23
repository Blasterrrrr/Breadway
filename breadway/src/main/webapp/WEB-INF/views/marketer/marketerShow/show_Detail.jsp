<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
	<title>뮤지컬 상세보기페이지</title>
</head>
<c:import url="/marketer_top" />
<style>
    a:hover {
  		color : orange;
	}
</style>
<script type="text/javascript">
	function delCheck(reservedNum){
		var select = confirm("뮤지컬을 삭제하시겠습니까?");
		if(select){
			if(reservedNum > 0){
				alert("모든 예매 건에 대하여 환불을 먼저 진행해주세요!");
			}
			else if(reservedNum = 0){
			location.href="show_Detail_Delete_Ok.mkt";
			alert("삭제되었습니다.");
			}
		}
	}
</script>
<div align="center" class="container" style="margin-top:30px;">
	<form action="show_Detail_Update.mkt" method="post" enctype="multipart/form-data">
		<input type="hidden" name="marketer_UID" value="${sessionScope.marketer_UID}">
		<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
		<c:forEach var="sList" items="${list_showDetail}">
			<h2>뮤지컬&lt;${sList.show_Name}&gt; 정보</h2>
			<input type="hidden" name="show_Status" value="${sList.show_Status}">
			<table border="1" width="100%" class="table table-fixed table-bordered">
				<tr>
					<th class="text-center" width="20%">Musical Name</th>
					<td>
						${sList.show_Name}
						<input type="hidden" name="show_Name" value="${sList.show_Name}">
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Organizer</th>
					<td>${sList.show_Organizer}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Poster</th>
					<td>
					<img src="<spring:url value='/resources/files/show/${sList.posterName}' />" class="aligncenter" width="200" height="250">
					<p><p>
					Selected Poster Name: ${sList.posterName}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Held Location</th>
					<td>${area_Name} ${theatre_Name}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Start Date</th>
					<td>
						<fmt:parseDate value="${sList.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate"/>
						<fmt:formatDate value="${startDate}" pattern="yyyy년 MM월 dd일" />
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical End Date</th>
					<td>
						<fmt:parseDate value = "${sList.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
						<fmt:formatDate value="${endDate}" pattern="yyyy년 MM월 dd일" />
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Genre</th>
					<td>${sList.genre}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Rate</th>
					<td>${sList.rate} 관람가</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Duration</th>
					<td>${sList.duration}분</td>
				<tr>
					<th class="text-center" width="20%">Musical Role List</th>
					<td lang="zh">
						<p>
						<c:forEach var="roleList" items="${newRoleList}" varStatus="loop">
							${roleList} 役
							<c:if test="${!loop.last}">, </c:if>
						</c:forEach>
					</td>
				</tr>	
				<tr>
					<th class="text-center" width="20%">Musical Detail</th>
					<td>${sList.detail}</td>
				</tr>	
				<tr>
					<th class="text-center" width="20%">Musical Notice</th>
					<td>${sList.notice}</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Teaser Link</th>
					<td><a href="${sList.videoLink}" target='_blank'>${sList.videoLink}</a></td>
				</tr>	
			</table>
			<br>
				<c:if test="${empty mode}">
					<button type="submit" class="btn btn-secondary">수정하기</button>
					&nbsp;&nbsp;
					<button type=button class="btn btn-secondary" onclick="javascript:delCheck(${reservedNum})">삭제하기</button>
					&nbsp;&nbsp;
				</c:if>
			<button type="button" class="btn btn-secondary" onclick="window.location='cast_All.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">캐스트 리스트 조회</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary" onclick="window.location='schedule_All.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">스케줄 리스트 조회</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary" onclick="window.location='profit_Seat.mkt?show_ID=${sessionScope.show_ID}&mode=${sessionScope.mode}'">매출 현황 보기</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">마이페이지 돌아가기</button>
		</c:forEach>
	</form>
</div>