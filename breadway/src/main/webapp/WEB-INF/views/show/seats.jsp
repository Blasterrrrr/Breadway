<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<c:import url="/top.do">
	<c:param name="title" value="공연장 좌석 선택"/>
</c:import>
<c:import url="/show_summary.do" >
	<c:param name="page" value="seats"/>
	<c:param name="schedule_id" value="${schedule }"/>
	<c:param name="role_table_name" value="${getShow.SHOW_ROLE_TABLE_NAME  }"/>
</c:import>

<!-- 공연장 좌석 -->

<div class="container bg-light">
	<div class="row">
	
	<div class="col-sm-4" style="margin-top:30px;">
    <div class="card bg-white text-dark">
	<div class="card-body"> 
    
	<div class="container">
	<ul class="list-group list-group-flush" id="seat_group"></ul>
	</div>
	
	<br>	
	
	<div class="container text-center">
	<div class="btn-group">
	<button type="button" id="dash" class="btn btn-outline-secondary">
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16">
	<path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
	</svg>
	</button>
	<input id="num_spinner" value="1" style="width: 75px;" disabled>
	<button type="button" id="plus" class="btn btn-outline-secondary">
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
	<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg>
	</button></div>
	</div>	
	
	<br>
	
	<div class="container text-center">
	<form action="show_checkout.do" method="post" id="getSeat">
	<input type="hidden" name="schedule" value="${schedule }">
	<input type="hidden" name="show_id" value="${getShow.SHOW_ID }">
	<input type="submit" value="예매하기" class="btn btn-secondary"></button>
	</form>
	</div>   
     
    </div>
    </div>
    </div>
    
	<div class="col-sm-8" style="margin-top:30px; margin-bottom:30px;">
	<c:forEach var="seat" items="${seat}">
		
	<div class="containor text-center">
	<h5>${seat.key.seat_Section }</h5>
	<c:forEach var="seat_row" begin="1" end="${seat.key.seat_Row }" step="1" >		
	<c:forEach var="seat_col" begin="1" end="${seat.key.seat_Qty/seat.key.seat_Row }" step="1" >

	<fmt:parseNumber var="seat_num" integerOnly="true"
					type="number" value="${((seat_row-1)*(seat.key.seat_Qty/seat.key.seat_Row)) + seat_col}" />
	
	<button class="border border-secondary" name="seat_empty" 
		id="${seat.key.seat_Section}${seat_num }" value=""
		title="${seat.key.seat_Section}석&nbsp;${seat_row }열&nbsp;${seat_col }번"
		data-toggle="popover" data-placement="top" data-trigger="hover" 
		data-content="${seat.key.seat_Price}원"
		style="display: inline-block; width: 30px; height: 30px; margin: 1px; background-color: #FFF;">
	</button>
		</c:forEach>
		<br>
		</c:forEach>
	
	<c:forEach var="seat_data" items="${seat.value}">
	<script>
		$(document).ready(function() {	
			$("#${seat_data.seat_Number}").css('backgroundColor', '#555');
			$("#${seat_data.seat_Number}").attr('name', 'seat_book');
			$("#${seat_data.seat_Number}").val('book');
			$("#${seat_data.seat_Number}").attr("disabled", true);
		});
	</script>
	</c:forEach>

	
	</div>
	</c:forEach>
    
	</div>
	</div>
	
	<div class="container">
	<div class="modal fade" id="seat_info">
		<div class="modal-dialog modal-dialog-centered">
		<div class="align-self-center mx-auto">		
		<div class="alert alert-secondary">
	    <strong>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		<path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
		</svg>
		안내사항
	    </strong><hr>
		<label id="seat_select_msg">좌석을 선택해주세요.</label>
		<label id="seat_session_msg">현재 다른 회원이 해당 좌석을 먼저 선택했습니다.<br>다른 좌석을 선택해주세요.</label>
	  	</div>
	  	</div>
		</div>
	</div>
	</div>
</div>

<script>
function closeFunction() {
	$("li[name=seats_list]").click(function(){
	    var spinnerNum = $("#num_spinner").val();
	    
	    for(var i=0; i<spinnerNum; i++){
	    	var seat = $("div[name=closeBtnContain]").eq(0).val();

		    $("#"+seat).val("");
			$("#"+seat).css('backgroundColor', '#FFF');
			$("#"+seat).attr('name', 'seat_empty');
			$("#seat"+seat).remove();
			$("#seatnum"+seat).remove();
			$("#name"+seat).remove();
			$("#price"+seat).remove();
			$("#discount"+seat).remove();
	    }
		
		$("button[name=seat_empty]").attr("disabled", false);
	});
}

$(document).ready(function() {	
	var num = 1;
	
	$('[data-toggle="popover"]').popover();  
	
	$("#dash").click(function(event) {
		if($("li[name=seats_list]").length == $("#num_spinner").val()){
			alert('좌석 선택을 해제해주세요.');
		}
		else if($("#num_spinner").val() == 1){
			alert('1개부터 선택이 가능합니다.');			
		}
		else{
			$("#num_spinner").val(--num);
			
			if($("li[name=seats_list]").length == $("#num_spinner").val()){
				$("button[name=seat_empty]").attr("disabled", true);
			}
		}						
    });

    $("#plus").click(function(event) {
    	if($("li[name=seats_list]").length == $("#num_spinner").val()){
			alert('좌석 선택을 해제해주세요.');
		}
    	else if($("#num_spinner").val() == 5){
			alert('5개까지 선택이 가능합니다.');
		}
    	else{
    		$("#num_spinner").val(++num);
		}
    });
    
	$('#getSeat').submit(function(event){
		if($("input[name=seatNum]").length==0){
			$('#seat_select_msg').show();
			$('#seat_session_msg').hide();
			$('#seat_info').modal('show');
			return false;
		}	        
    });
	
	if('${msg}' == 'select'){
		$('#seat_select_msg').hide();
		$('#seat_info').modal('show');
	}
	
	<c:forEach var="seat" items="${seat}">
	<c:forEach var="seat_row" begin="1" end="${seat.key.seat_Row }" step="1" >		
	<c:forEach var="seat_col" begin="1" end="${seat.key.seat_Qty/seat.key.seat_Row }" step="1" varStatus="status">

	<fmt:parseNumber var="seat_num" integerOnly="true"
					type="number" value="${((seat_row-1)*(seat.key.seat_Qty/seat.key.seat_Row)) + seat_col}" />
					
						$(document).ready(function(){							
							$('#${seat.key.seat_Section}${seat_num }').on('select', function(){				
								if ( $('#${seat.key.seat_Section}${seat_num }').val() == ''){
									$('#${seat.key.seat_Section}${seat_num }').val("${seat.key.seat_Section}${seat_num }");
									$('#${seat.key.seat_Section}${seat_num }').css('background-color', '#cfdce7');
									$('#${seat.key.seat_Section}${seat_num }').attr('name', 'seat_select');
									$("#seat_group").append("<li class='list-group-item' id='seat${seat.key.seat_Section}${seat_num }' name='seats_list'><div class='row' style=''border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;'><div class='col-sm-9'>${seat.key.seat_Section}석&nbsp;${seat_row}열&nbsp;${seat_col}번<br>${seat.key.seat_Price}원</div><div class='col-sm-3 text-right' name='closeBtnContain' id='btn${seat.key.seat_Section}${seat_num }'></div></div></li>");									
									$("#btn${seat.key.seat_Section}${seat_num }").val("${seat.key.seat_Section}${seat_num }");
									$("#getSeat").append("<input type='hidden' id='seatnum${seat.key.seat_Section}${seat_num }' name='seatNum' value='${seat.key.seat_Section}${seat_num }'/>");
									$("#getSeat").append("<input type='hidden' id='name${seat.key.seat_Section}${seat_num }' name='seatName' value='${seat.key.seat_Section}석&nbsp;${seat_row}열&nbsp;${seat_col}번'/>");
									$("#getSeat").append("<input type='hidden' id='price${seat.key.seat_Section}${seat_num }' name='seatPrice' value='${seat.key.seat_Price}'/>");
									$("#getSeat").append("<input type='hidden' id='discount${seat.key.seat_Section}${seat_num }' name='seatDiscount' value='${seat.key.seat_Discount}'/>");			
								}else {
									$('#${seat.key.seat_Section}${seat_num }').val("");
									$('#${seat.key.seat_Section}${seat_num }').css('background-color', '#FFF');
									$('#${seat.key.seat_Section}${seat_num }').attr('name', 'seat_empty');
									$("#seat${seat.key.seat_Section}${seat_num }").remove();
									$("#seatnum${seat.key.seat_Section}${seat_num }").remove();
									$("#name${seat.key.seat_Section}${seat_num }").remove();
									$("#price${seat.key.seat_Section}${seat_num }").remove();
									$("#discount${seat.key.seat_Section}${seat_num }").remove();
								}
								
					 			if($("li[name=seats_list]").length == $("#num_spinner").val()){
									$("button[name=seat_empty]").attr("disabled", true);
								}
								else if($("li[name=seats_list]").length < $("#num_spinner").val()){
									$("button[name=seat_empty]").attr("disabled", false);
								}	
							});
							
							$('#${seat.key.seat_Section}${seat_num }').on('click', function(){	
								var seatNum = ${seat_num };
								var spinnerNum = $("#num_spinner").val();
								var col = ${seat_col};
								var tmp = new Array();
								var max = ${status.end};
								var maxTmp = new Array();
								
								if($('#${seat.key.seat_Section}${seat_num }').attr('name') == 'seat_select'){
									$("button[name=seat_select]").trigger("select");
								}else{
									for(var i=0; i<spinnerNum; i++){
										var number = seatNum + i;
										var col_num = col+i;
										if($("#${seat.key.seat_Section}"+number).val()=='book'){
											 tmp.push(number);
										 }else if(col_num==max){
											 maxTmp.push(number);
										 }
									}									
																		
									if(tmp.length>0){
										for(var i=0;i<spinnerNum; i++){
											var number = (tmp[0]-1) - i;
											$("#${seat.key.seat_Section}"+number).trigger("select");
										}
									}else if(maxTmp.length>0){
										for(var i=0;i<spinnerNum; i++){
											var number = maxTmp[0] - i;
											$("#${seat.key.seat_Section}"+number).trigger("select");
										}
									}else{										
										for(var i=0; i<spinnerNum; i++){
											var number = seatNum + i;
											$("#${seat.key.seat_Section}"+number).trigger("select");
										}										
									}
									$('div[name=closeBtnContain]').first().append("<button type='button' class='close' id='close_btn'><span>&times;</span></button>");
									$('div[name=closeBtnContain]').attr('onClick', 'closeFunction();');
								}								
							});
						});					
	
	$("#plus, #dash").click(function(event) {
		if($('#${seat.key.seat_Section}${seat_num }').val()=='book'){
			var num = ${seat_num };	/* 시트 번호 가져오기 */
			var col = ${seat_col}; /* 시트 열 가져오기 */
			var qty = $("#num_spinner").val(); /* 시트 선택 개수 가져오기 */
			var min = 1;
			var max = ${status.end};
			var max_qty = 5;
			var seatNum;
			var increase_temp = new Array();
			var decrease_temp = new Array();
			var temp = new Array();

			if(col>=qty && col <= (max-qty)){
				if(col==qty){
					for(var i=1; i<qty; i++){
						seatNum = num - i;
						var seatID = '${seat.key.seat_Section}' + seatNum;
						
						if($('#'+seatID).val() == ''){
							decrease_temp.push(seatID);
						}
					}
				} 
				
				for(var i=1; i<=qty; i++){
					seatNum = num + i;
					var seatID = '${seat.key.seat_Section}' + seatNum;
					
					if($('#'+seatID).val() == ''){
						temp.push(seatID);
					}
				}			
			}
			
			if(col>(max-max_qty) && col<=(max-1)){
					var qty_tmp;
					if(col == max-1){
						qty_tmp = 1;
					}else if(col == max-2){
						qty_tmp = 2;
					}else if(col == max-3){
						qty_tmp = 3;
					}else if(col == max-4){
						qty_tmp = 4;
					}
					
					for(var i=1; i<=qty_tmp; i++){
						seatNum = num + i;
						var seatID = '${seat.key.seat_Section}' + seatNum;
						
						if($('#'+seatID).val() == ''){
							increase_temp.push(seatID);
						}
					}
			}
			
			if(col<=5 && qty==(col-1) ){
				for(var i=1; i<=qty; i++){
					seatNum = num - i;
					var seatID = '${seat.key.seat_Section}' + seatNum;
					
					if($('#'+seatID).val() == ''){
						decrease_temp.push(seatID);
					}
				}
			}
			
/*   			if(col==(max-1)){
				seatNum = num+1;
				var seatID = '${seat.key.seat_Section}' + seatNum;
				if(qty>1 && $('#'+seatID).val() == ''){
					$('#'+seatID).css('backgroundColor', '#C0C0C0');
					$('#'+seatID).attr('name', 'select');
					$('#'+seatID).attr("disabled", true);
				}else if(qty==1 && $('#'+seatID).val() == ''){
					$('#'+seatID).css('backgroundColor', '#FFF');
					$('#'+seatID).attr('name', 'seat_empty');
					$('#'+seatID).attr("disabled", false);
				}
			}   */
			
			if(decrease_temp.length<qty){				
				for(var i=0; i<decrease_temp.length; i++){
					$('#'+decrease_temp[i]).css('backgroundColor', '#C0C0C0');
					$('#'+decrease_temp[i]).attr('name', 'select');
					$('#'+decrease_temp[i]).attr("disabled", true);
				}
			}else if(decrease_temp.length==qty){
				for(var i=0; i<decrease_temp.length; i++){
					$('#'+decrease_temp[i]).css('backgroundColor', '#FFF');
					$('#'+decrease_temp[i]).attr('name', 'seat_empty');
					$('#'+decrease_temp[i]).attr("disabled", false);
				}
			}
			
			if(increase_temp.length<qty){				
				for(var i=0; i<increase_temp.length; i++){
					$('#'+increase_temp[i]).css('backgroundColor', '#C0C0C0');
					$('#'+increase_temp[i]).attr('name', 'select');
					$('#'+increase_temp[i]).attr("disabled", true);
				}
			}else if(increase_temp.length==qty){
				for(var i=0; i<increase_temp.length; i++){
					$('#'+increase_temp[i]).css('backgroundColor', '#FFF');
					$('#'+increase_temp[i]).attr('name', 'seat_empty');
					$('#'+increase_temp[i]).attr("disabled", false);
				}
			}
			
			if(temp.length<qty){
				for(var i=0; i<temp.length; i++){
					$('#'+temp[i]).css('backgroundColor', '#C0C0C0');
					$('#'+temp[i]).attr('name', 'select');
					$('#'+temp[i]).attr("disabled", true);
				}
			}else if(temp.length==qty){
				for(var i=0; i<temp.length; i++){
					$('#'+temp[i]).css('backgroundColor', '#FFF');
					$('#'+temp[i]).attr('name', 'seat_empty');
					$('#'+temp[i]).attr("disabled", false);
				}
			}
		}	
	});
					
	</c:forEach>
	</c:forEach>
	</c:forEach>
	
});

history.pushState(null, document.title, location.href);
window.addEventListener('popstate', function (event)
{
  history.pushState(null, document.title, location.href);
});
</script>