<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- showmanage_seatcontent.jsp -->  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 공연 좌석 정보"></c:param>
</c:import>
<script type="text/javascript">
	function fnWindowOpen(seat_ID){
		var win = window.open("showmanage_seatdetail.do?seat_ID="+seat_ID,"좌석 정보", "width=400, height=300, left = 300, top = 300, resizable=no, scrollbars=no");
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
		<c:forEach var = "dto" items ="${framelist}">
			<c:set var = "count" value = "0"/>
			<c:set var = "blankseat" value = "0"/>
			<c:set var = "reserveseat" value = "0"/>
			<c:forEach var = "i" begin = "1" end = "${dto.seat_Row}">
				<c:if test = "${i == 1}">
					<tr>
						<td align="center" colspan = "${dto.seat_Qty/dto.seat_Row}" class="w3-blue">
							${dto.seat_Section}
						</td>
					</tr><!--XX석 시작-->
				</c:if>
				<tr>
				<c:forEach var = "j" begin = "1" end = "${dto.seat_Qty/dto.seat_Row}">
					<c:set var = "count" value = "${count+1}"/>
					<th class = "w3-center" width = "50">
						<c:if test = "${count < 11}">
							<c:forEach var = "sdto" items ="${seatdto}">
								<c:if test = "${fn:contains(sdto.seat_Number,below[count])&&fn:contains(sdto.seat_Number, dto.seat_Section)}">
									<a href = "javascript:fnWindowOpen(${sdto.seat_ID});">${sdto.seat_Number}</a><!-- 좌석을 누르면 좌석의 대한 정보가 뜨게됨 -->
									<c:set var = "reserveseat" value = "${reserveseat+1}"/>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test = "${count>10}">
							<c:forEach var = "sdto" items ="${seatdto}">
								<c:if test = "${fn:contains(sdto.seat_Number,count)&&fn:contains(sdto.seat_Number, dto.seat_Section)}">
									<a href = "javascript:fnWindowOpen(${sdto.seat_ID});">${sdto.seat_Number}</a>
									<c:set var = "reserveseat" value = "${reserveseat+1}"/>
								</c:if>
							</c:forEach>
						</c:if>
						&nbsp;
						<c:set var = "blankseat" value = "${blankseat+1}"/>
					</th>
				</c:forEach>
				</tr>
			</c:forEach><!--XX석 종료-->
			<tr>
				<td align="left" colspan = "${dto.seat_Qty/dto.seat_Row}" class="w3-orange">공석 : ${blankseat-reserveseat} / 예매석 : ${reserveseat} <br> 총 좌석 수 : ${dto.seat_Qty}</td>
			</tr>
			<c:set var = "count" value = "0"/>
		</c:forEach>	
	</table>
	</div>
	<c:set var = "dayprofit" value = "0"/>
	<div align = "center" style="width:70%">
		<table border = "1" class="w3-table w3-striped w3-border">
			<c:forEach var = "sdto" items ="${seatdto}">
				<c:set var = "day" value = "${sdto.seat_Price-(sdto.seat_Price*sdto.seat_Discount/100)}"/>
				<c:set var = "dayprofit" value = "${dayprofit+day}"/>
			</c:forEach>
			<tr>
				<th align="center" colspan = "2" class="w3-blue">해당 날짜에 벌어들인 공연의 수익</th>
				<th align="center" class="w3-orange"><fmt:formatNumber value="${dayprofit}" type="number" />원</th>
			</tr>
		</table>
	</div>
</div>