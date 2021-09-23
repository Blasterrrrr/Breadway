<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 예매 정보 -->
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>예매 페이지</title>
</head>
<body>
<div class="container bg-light">
	<div class="container" style="padding-top:30px">
	<div class="row">
	<div class="col">
	<figure>
	<blockquote class="blockquote">
		<dt>예매하기</dt>
	</blockquote>
	</figure>
	</div>
	<div class="col text-right">		
		<span aria-hidden="true">
			<a type="button" style="color: #505050;" id="exit_btn">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
			<path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
			</svg>			
			나가기
			</a>
		</span>		
	</div>
	</div>	
	</div>

	<div class="container">
	
	<ul class="list-group">
	<c:forEach var="seat" items="${seat_dto}">
	<li class="list-group-item">
	<div class="row align-items-center">
		<div class="col-2">
		<div class="text-center">
		<img src="<spring:url value='/resources/files/show/${getShow.POSTERNAME}' />" class="img-thumbnail" width="100" height="150"></div>
		</div>
		<div class="col">
		<div class="text-center">${getShow.SHOW_NAME} 
		<span class="badge badge-secondary" name="genre">${getShow.GENRE}</span></div>
		</div>
		<div class="col">
		<div class="text-center">${seat.seat_Name}</div>
		</div>
		<div class="col">
		<div class="text-center">${schedule_date.schedule_date}<br>(${schedule_date.schedule_time})</div>
		</div>
		<div class="col">
		<div class="text-center" name="text_seatPrice"></div>
		</div>
	</div>
		
	</li>
	</c:forEach>
	</ul>
	</div>
	
	<br>
	
	<div class="container-fluid">
	<form action="show_reserve.do" method="post">
		<c:forEach var="seat" items="${seat_dto}">
			<input type="hidden" name="seatNum" value="${seat.seat_Number}">
			<input type="hidden" name="seatName" value="${seat.seat_Name}">
			<input type="hidden" name="seatPrice" value="${seat.seat_Price}">
			<input type="hidden" name="seatDiscount" value="${seat.seat_Discount}">
		</c:forEach>
			<input type="hidden" name="schedule" value="${schedule_date.schedule_id}">
			<input type="hidden" name="showID" value="${getShow.SHOW_ID}">
	
		<div class="row">
			<div class="col-sm-8">
				<div class="card">
				<div class="card-body">
					<div class="row">
					<div class="col-sm">
					<p>예매자 정보</p>
					</div>
					<div class="col-sm">
					<p>수령 방식</p>
					</div>
					</div>
					
					<div class="row">
					<div class="col-sm">
						<div class="form-group">
						<label for="name" class="small text-muted mb-1">이름</label>
						<input type="text" class="form-control form-control-sm"
								id="name" placeholder="이름을 입력해주세요." name="name"
								value="${sessionScope.consumer.consumer_Name}">
						</div>
					</div>
					<div class="col-sm">
						<label class="small text-muted mb-1" data-placement="right"
								data-toggle="tooltip" title="현재 티켓을 현장 수령 방식으로만 진행하고 있습니다.">현장 수령</label> 
					</div>
					</div>
					
					<div class="row">
					<div class="col-sm">
						<div class="form-group">
						<label for="email" class="small text-muted mb-1">이메일</label>
						<input type="email" class="form-control form-control-sm"
								id="email" placeholder="이메일을 입력해주세요." name="email"
								value="${sessionScope.consumer.consumer_Email}">
						</div>
					</div>
					<div class="col-sm">
					<!-- <p>결제 방식</p> -->
						<div class="row">
						<div class="col-sm">
							<!-- <div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="kakaoPay" name="kakaoPay">
							<label class="custom-control-label" for="kakaoPay">
							<img src="http://res.heraldm.com/content/image/2021/06/29/20210629000599_0.jpg" width="60" height="25">
							</label>
							</div> -->
						</div>
						<div class="col-sm"></div>
						</div>
					</div>
					</div>
					
					<div class="row">
					<div class="col-sm">
						<div class="form-group">
						<label for="phone" class="small text-muted mb-1">연락처</label>
						<input type="text" class="form-control form-control-sm"
								id="phone" placeholder="번호를 입력해주세요." name="phone"
								value="${sessionScope.consumer.consumer_Phone}">
						</div>
					</div>
					<div class="col-sm">
					</div>
					</div>
				</div>
				</div>
			</div>
			<div class="col-sm-4" style="padding-bottom:40px">
				<div class="card">
				<div class="card-body">
					<div class="row">
					<div class="col-sm">
					<p>가격</p>
					</div>
					</div>
					
					<div class="row">
					<div class="col-sm">
					<label class="text-muted mb-1">티켓 가격 </label>
					</div>
					<div class="col-sm">
					<p class="text-right" id="ticket_price"></p>
					</div>
					</div>
					
					<div class="row">
					<div class="col-sm">
					<label class="text-muted mb-1">할인가</label>
					</div>
					<div class="col-sm">
					<p class="text-right" id="ticket_discount"></p>
					</div>
					</div>
					
					<hr>
					
					<div class="row">
					<div class="col-sm">
					<label class="text-muted mb-1">합계 </label>
					</div>
					<div class="col-sm">
					<p class="text-right" id="total_price"></p>
					</div>
					</div>
				
					<div class="row" style="padding-top:18px">
					<div class="col-sm  text-center">
					<button type="submit" class="btn btn-secondary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-credit-card-2-back-fill" viewBox="0 0 16 16">
					<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v5H0V4zm11.5 1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-2zM0 11v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1H0z"/>
					</svg>&nbsp;결제하기
					</button>
					</div>
					</div>			
				</div>
				</div>
			</div>			
		</div>		
	</form>
	</div>
</div>

<div class="container">
<div class="modal fade" id="timeout_info" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-dialog-centered">
	<div class="align-self-center mx-auto">      
	<div class="alert alert-secondary">
    <strong>
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-alarm" viewBox="0 0 16 16">
	<path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z"/>
	<path d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z"/>
	</svg>
	예매 페이지 유지시간 만료
    </strong><hr>
	예매 페이지 유지시간 1분이 경과하여<br>
	예매 악용 방지를 위해 5초 후 좌석 페이지로 이동합니다.
  	</div>
  	</div>
	</div>
</div>
</div>

<div class="container">
	<div class="modal fade" id="exit_info" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-dialog-centered modal-sm">	
	<div class="modal-content">
		<div class="modal-body">
			<div class="col-sm  text-center ">
			<strong>예매 진행을 취소하실건가요?</strong>
			</div><hr>
			<div class="col-sm  text-center ">
			<button type="button" class="btn btn-outline-secondary" id="exit_ok_btn">예</button>
			<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">아니오</button>
			</div>
		</div>        
	</div>	
	</div>
	</div>
</div>
</body>
</html>

<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
  
	$('#exit_btn').click( function() {
		$('#exit_info').modal('show');
	});
	
	$('#exit_ok_btn').click( function() {
		$('#exit_info').modal('hide');
		location.href = "show_seats.do?schedule=${schedule_date.schedule_id}";
	});
  
	setTimeout("getSessionTimeoutMsg()", 1000*60);
});

var price = [];
var ticket_total = 0;
var discount = [];
var discount_total = 0;
var discount_price = [];

$("input[name=seatPrice]").each(function(index, item){
	price[index] = parseInt($(item).val());	
	ticket_total+=price[index];
});

$("input[name=seatDiscount]").each(function(index, item){
	discount[index] = price[index] * (parseInt($(item).val())/100);	
	discount_price[index] = price[index] - discount[index];
	discount_total+=discount[index];
	
	$("div[name=text_seatPrice]").eq(index).text(discount_price[index].toLocaleString()+ '원 (' + $(item).val() + '% 할인)');
});

$("#ticket_price").text(ticket_total.toLocaleString() + '원');
$("#ticket_discount").text('-' + discount_total.toLocaleString() + '원');
$("#total_price").text((ticket_total-discount_total).toLocaleString() + '원');

function getSessionTimeoutMsg(){
	$('#timeout_info').modal('show');
	setTimeout("moveSeatPage()", 1000*5);
}

function moveSeatPage(){
	 location.href = "show_seats.do?schedule=${schedule_date.schedule_id}";
}

if('${getShow.GENRE }'=='drama'){	
	$("span[name=genre]").text('드라마');
}else if('${getShow.GENRE }'=='fantasy'){
	$("span[name=genre]").text('판타지');
}else if('${getShow.GENRE }'=='horror'){
	$("span[name=genre]").text('호러');
}else if('${getShow.GENRE }'=='comedy'){
	$("span[name=genre]").text('희극');
}else if('${getShow.GENRE }'=='tragedy'){
	$("span[name=genre]").text('비극');
}

history.pushState(null, document.title, location.href);
window.addEventListener('popstate', function (event)
{
  history.pushState(null, document.title, location.href);
});
</script>