<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<c:import url="/top.do">
	<c:param name="title" value="예약 완료"/>
</c:import>

<!-- 예약 완료 페이지 -->
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="EUC-KR">
<title>예약 완료</title>
</head>
<body>
	<div class="container" style="padding-top:30px">
		<div class="card" style="padding-top:30px">
		<div class="card-body">
			<div class="row justify-content-center">
			<div class="col-sm-8">
		
			<div class="row" style="padding-top:30px">
			<div class="col text-center">
			<h3><small>예매가 완료 되었습니다</small></h3>
			</div>
			</div>		
		
			<div class="row" style="padding-top:30px">
			<div class="col-sm-3">
				<img src="http://res.heraldm.com/content/image/2020/07/01/20200701000731_0.jpg" class="img-thumbnail" width="150" height="200">
			</div>
			
			<div class="col-sm-9">
				<div class="row">
				<div class="col-sm-8">
				<p class="h4">${getShow.SHOW_NAME}</p>
				</div>
	      		</div>
			
				<div class="row">
				<div class="col-sm-3">
				예매번호
				</div>
				<div class="col-sm-3" id="order_num">
				</div>
	      		</div>
	      			      		
	      		<div class="row">
				<div class="col-sm-3" >
				공연장
				</div>
				<div class="col-sm-8" id="theatre_name">
				</div>
	      		</div>
	      		
	      		<div class="row">
				<div class="col-sm-3">
				관람날짜
				</div>
				<div class="col-sm-3" id="show_date">
				</div>
	      		</div>
	      		
	      		<div class="row">
				<div class="col-sm-3">
				관람시간
				</div>
				<div class="col-sm-3" id="show_time">
				</div>
	      		</div>
	      		
	      		<div class="row">
				<div class="col-sm-3">
				관람인원
				</div>
				<div class="col-sm-3" id="visitor_num">
				</div>
	      		</div>
	      		
	      		</div>
	      		</div>
	      		
	      		<div class="row" style="padding-top:30px">
				<div class="col text-center">
					<ul class="list-group">
					
					<c:forEach var="reserveList" items="${reserve}">					
					
						<li class="list-group-item">
						<div class="row">
							<div class="col-3 text-left">
							${reserveList.reserve_Date }-${reserveList.reserve_ID }
							</div>
							<div class="col-3 text-left">
							${reserveList.seat_Name }
							</div>
							<div class="col-6 text-right" name="seat_price">
							</div>
						</div>
						</li>
					
					</c:forEach>
										
					</ul>
				</div>
				</div>
				
				<div class="row" style="padding-top:30px; padding-bottom:60px">
					<div class="col text-right">
					<button type="button" class="btn btn-secondary" onClick="reserveBtn()">예매확인</button>
					</div>
					<div class="col text-left">
					<button type="button" class="btn btn-secondary" onClick="reserveCancelBtn()">예매취소</button>
					</div>
				</div>		      		
	      	</div>
	      	</div>
		</div>
		</div>
	</div>
</body>
</html>

<script>
function reserveBtn(){
    location.href = "musical_myBuyPage.do";
}

function reserveCancelBtn(){
    location.href = "musical_myCancelPage.do";
}

	var reserve_seat = new Array();
	var reserve_price = new Array();
	var reserve_discount = new Array();
	var discount = new Array();
	var discount_price = new Array();	
	var order_num = 0;

	<c:forEach var="reserveList" items="${reserve}">
		reserve_seat.push("${reserveList.seat_Name }");
		reserve_price.push("${reserveList.seat_Price }");
		reserve_discount.push("${reserveList.seat_Discount }");
		order_num = ${reserveList.order_Num };		
	</c:forEach>

	$("#order_num").text(order_num);
	$("#theatre_name").text('<c:out value="${getShow.THEATRE_NAME}"/>');
	$("#show_date").text('<c:out value="${schedule_date.schedule_date}"/>');
	$("#show_time").text('<c:out value="${schedule_date.schedule_time}"/>');
	$("#visitor_num").text(reserve_seat.length + '명');
	
	$("div[name=seat_price]").each(function(index, item){
		discount[index] = reserve_price[index] * (reserve_discount[index]/100);	
		discount_price[index] = reserve_price[index] - discount[index];
		
		$("div[name=seat_price]").eq(index).text(discount_price[index].toLocaleString()+ '원 (' + reserve_discount[index] + '% 할인)');
	});
	
	history.pushState(null, document.title, location.href);
	window.addEventListener('popstate', function (event)
	{
	  history.pushState(null, document.title, location.href);
	});
</script>