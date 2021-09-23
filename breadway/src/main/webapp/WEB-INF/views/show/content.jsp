<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/top.do">
	<c:param name="title" value="공연 상세 정보"/>
</c:import>
<c:import url="/show_summary.do" >
	<c:param name="page" value="content"/>
	<c:param name="show_id" value="${show_id}"/>	
</c:import>

<!-- 공연 상세 설명 -->

<div class="container" style="padding-top:30px; padding-bottom:30px;">
<div class="container justify-content-center">
	<div class="row">
		<div class="col font-weight-bold">
		<h5>캐스팅 </h5>
		</div>
	</div>

	<div class="row" style="padding-top:30px">				
		<c:forEach var="part" items="${getPart}" varStatus="status">			
			<div class="col-md">		
				<div class="row">
				<div class="col text-center">
				<img src="<spring:url value='/resources/files/cast/${part.cast_PhotoName}' />"
					 class="rounded-circle" alt="actor" width="130" height="130"> 
				</div>
				</div>
				
				<div class="row" style="padding-top:10px">
				<div class="col text-center font-weight-bold">
				${part.cast_Part}
				</div>
				</div>
				
				<div class="row">
				<div class="col text-center">
				${part.cast_Name}
				</div>
				</div>								
			</div>
		</c:forEach>
	</div>
	
	<div class="row" style="padding-top:60px">
		<div class="col font-weight-bold">
		<h5>공지사항 </h5>
		</div>
	</div>
	
	<div class="row" style="padding-top:20px">
		<div class="col">
		${getShow.NOTICE }
		</div>
	</div>
	
	<div class="row" style="padding-top:60px">
		<div class="col font-weight-bold">
		<h5>공연설명 </h5>
		</div>
	</div>
	
	<div class="row" style="padding-top:20px">
		<div class="col">
		${getShow.DETAIL }
		</div>
	</div>
	
	<div class="row text-center" style="padding-top:20px">
		<div class="col">
		<div class="ratio ratio-16x9">
		
		<iframe width="854" height="480" src="${getShow.VIDEOLINK }" 
				title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
				clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		</div>
	</div>
	
	<div class="row" style="padding-top:60px">
		<div class="col font-weight-bold">
		<h5>상품정보제공 공시 </h5>
		</div>
	</div>
	
	<div class="row" style="padding-top:20px">
		<div class="col">		
			<table class="table table-bordered" style = "table-layout: auto; width: 100%; table-layout: fixed;">
			<tbody>
				<tr>
				<th scope="col" class="bg-light text-center">주최/기획</td>
				<td>${getShow.SHOW_ORGANIZER }</td>
				<th scope="col" class="bg-light text-center">소비자상담</td>
				<td>BreadWay</td>
				</tr>
				
				<tr>
				<th scope="col" class="bg-light text-center">주연</td>
				<td id="actors"></td>
				<th scope="col" class="bg-light text-center">관람등급</td>
				<td>${getShow.RATE } 관람가</td>
				</tr>
				
				<tr>
				<th scope="col" class="bg-light text-center">공연시간</td>
				<td>${getShow.DURATION }분(인터미션 20분 포함)</td>
				<th scope="col" class="bg-light text-center">공연장소</td>
				<td>${getShow.THEATRE_NAME }</td>
				</tr>
				
				<tr>
				<th scope="col" class="bg-light text-center">취소/환불방법</td>
				<td colspan="3">

					<p>취소 일자에 따라 아래와 같이 취소수수료가 부과됩니다.<br> 예매일보다 관람일 기준이 우선 적용되오니 유의해주시기 바랍니다.</p>

					<table class="table text-center" style = "table-layout: auto; width: 100%; table-layout: fixed;">					
					<thead>
						<tr>
						<th scope="col" style="background-color:#FFE0B2;">취소일</th>
						<th scope="col" style="background-color:#FFE0B2;">취소수수료</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
						<td>관람일까지 10일 이후부터</td>
						<td>결제금액의 100% 환불</td>
						</tr>
						
						<tr>
						<td>관람일까지 9일 ~ 7일 전</td>
						<td>결제금액의 90% 환불</td>
						</tr>
						
						<tr>
						<td>관람일까지 6일 ~ 3일 전</td>
						<td>결제금액의 80% 환불</td>
						</tr>
						
						<tr>
						<td>관람일까지 2일 ~ 마감일 전</td>
						<td>결제금액의 70% 환불</td>
						</tr>
						
						<tr>
						<td>관람일 당일</td>
						<td>취소 불가능</td>
						</tr>
					</tbody>
					</table>
				</td>
				</tr>
			</tbody>
			</table>
		</div>
	</div>
</div>
</div>

</body>
</html>

<script>
var actor = new Array();

<c:forEach var="actors" items="${getPart }">
actor.push("${actors.cast_Name}");
</c:forEach>

actor.join(',');
$("#actors").text(actor);
</script>