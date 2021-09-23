<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- 공연 요약 페이지 -->  

<div class="container" style="padding-top:30px; padding-bottom:30px;">
	<div class="row">
		<div class="col-2 align-self-end">	
			<img src="<spring:url value='/resources/files/show/${getShow.POSTERNAME}' />" class="img-thumbnail" width="150" height="100">
		</div>
		
		<div class="col-6 align-self-end">		
			<div class="row">
				<div class="col">
				<h3>${getShow.SHOW_NAME }</h3>				
				</div>
			</div>
			
			<div class="row">
				<div class="col">
				<a type="button" onClick="openMap('${getShow.THEATRE_ID}')">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
				<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
				</svg>
				${getShow.THEATRE_NAME }
				</a>
				</div>
			</div>
			
			<div class="row">
				<div class="col" id="showdate">
				<fmt:formatDate value="${getShow.STARTDATE}" pattern="yyyy-MM-dd"/>
				~
				<fmt:formatDate value="${getShow.ENDDATE}" pattern="yyyy-MM-dd"/>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
				${getShow.DURATION }분(인터미션 20분)
				</div>
			</div>
			
			<div class="row">
				<div class="col" id="role_cast">
				</div>
			</div>
			
			<div class="row">
				<div class="col">
				<span class="badge badge-secondary" id="genre">
				${getShow.GENRE }
				</span>
				<span class="badge badge-secondary">
				${getShow.RATE } 관람가
				</span>
				</div>
			</div>
		</div>
		
		<div class="col align-self-end text-right" id="show_content_btn">		
		<button type="button" class="btn btn-secondary" onclick="showContentBtn()">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-reels-fill" viewBox="0 0 16 16">
		<path d="M6 3a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
		<path d="M9 6a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
		<path d="M9 6h.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 7.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 16H2a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h7z"/>
		</svg>
		공연 정보
		</button>
		</div>
		
		<div class="col align-self-end text-right" id="schedule_btn">
		<form action="show_calendar.do?show_id=${getShow.SHOW_ID }" method="post">
		<input type="hidden" name="last_date" value="${getShow.ENDDATE }">
		<input type="hidden" name="theatre_id" value="${getShow.THEATRE_ID }">
		<button type="submit" class="btn btn-secondary">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check-fill" viewBox="0 0 16 16">
		<path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zM16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zm-5.146-5.146-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708z"/>
		</svg>
		공연 일정
		</button>
		</form>
		</div>
	</div>
</div>

<div class="container" style="padding-top:30px" id="btn_tab">
<ul class="nav nav-tabs">
	<li class="nav-item">
		<a class="nav-link" style="color: #505050;" href="musical_content.do?show_ID=${getShow.SHOW_ID }">공연정보</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" style="color: #505050;" href="musical_reviewlist.do?show_ID=${getShow.SHOW_ID }">관람후기</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" style="color: #505050;" href="musical_qnalist.do?show_ID=${getShow.SHOW_ID }">Q&A</a>
	</li>
</ul>
</div>

<script>
function showContentBtn(){
    location.href = "musical_content.do?show_ID=${getShow.SHOW_ID }";
}

function openMap(placenum){
	window.open("mapload.do?placenum="+placenum, "_blank","width=500, height=300, resizable=no, scrollbars=no");
}

var role = new Array();
var actor = new Array();
var count = 0;
var page = '<c:out value="${page}"/>';

if(page == 'schedule'){
 	$("#btn_tab").remove();
	$("#schedule_btn").remove();
}else if(page == 'seats'){
	$("#btn_tab").remove();
	$("#show_content_btn").remove();
	$("#showdate").text('${schedule_date.schedule_date}(${schedule_date.schedule_time})');
}else if(page == 'content' || page == 'qnalist' || page == 'review'){
	$("#show_content_btn").remove();
}

<c:forEach var="role_data" items="${role }" varStatus="status">
	count = ${status.count};
	
	if(count>2){
		role.push('('+ "${role_data.value}" + ')');
	}
</c:forEach>

<c:forEach var="actor_data" items="${actor }" varStatus="status">
	count = ${status.count};
	var i = count - 3;
	
	if(count>2){
		actor.push("${actor_data.value}" + role[i]);
	}
</c:forEach>

actor.join(', ');
$("#role_cast").text(actor);


if('${getShow.GENRE }'=='drama'){	
	$("#genre").text('드라마');
}else if('${getShow.GENRE }'=='fantasy'){
	$("#genre").text('판타지');
}else if('${getShow.GENRE }'=='horror'){
	$("#genre").text('호러');
}else if('${getShow.GENRE }'=='comedy'){
	$("#genre").text('희극');
}else if('${getShow.GENRE }'=='tragedy'){
	$("#genre").text('비극');
}
</script>