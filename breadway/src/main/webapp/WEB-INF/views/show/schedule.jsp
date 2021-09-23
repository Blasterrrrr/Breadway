<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
    
<c:import url="/top.do">
	<c:param name="title" value="공연 일정표"/>
</c:import>
<c:import url="/show_summary.do" >
	<c:param name="page" value="schedule"/>
</c:import>
    
<!-- 공연 일정표 -->

<div class="container" style="padding-top:30px">
<div class="row">
	<div class="col-4">
	<h3>${year }년&nbsp;${month }월</h3>
	</div>
	
  	<div class="col-6"></div>
  	<div class="col">  		
  		<form action="show_calendar.do?show_id=${getShow.SHOW_ID }" method="post" name="last_month_form">
  		<input type="hidden" name="last_date" value="${getShow.ENDDATE }">
  		<input type="hidden" name="month" value="last">
  		<input type="hidden" name="theatre_id" value="${getShow.THEATRE_ID }">
  		<button type="submit" class="btn btn-outline-secondary">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-left-fill" viewBox="0 0 16 16">
		<path d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
		</svg>
		</button>		
		</form>	
  	</div>
  	<div class="col">
  		<form action="show_calendar.do?show_id=${getShow.SHOW_ID }" method="post" name="next_month_form">
  		<input type="hidden" name="last_date" value="${getShow.ENDDATE }">
  		<input type="hidden" name="month" value="next">
  		<input type="hidden" name="theatre_id" value="${getShow.THEATRE_ID }">
  		<button type="submit" class="btn btn-outline-secondary">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
		<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
		</svg>
		</button>
		</form>
	</div>
	
</div>  	
</div>  
  
  <div class="p-3 mb-2 bg-light text-dark">
  <div class="container">        
  <table class="table table-bordered p-3 mb-2 bg-white text-dark">
    <thead class="thead-light">
      <tr>
        <th>일</th>
        <th>월</th>
        <th>화</th>
        <th>수</th>
        <th>목</th>
        <th>금</th>
        <th>토</th>
      </tr>
    </thead>
    <tbody>
    
    <tr>    
    <c:forEach var="day" items="${days }" varStatus="status">
    	<td style="width:150px; height:150px;">  
    	<c:if test="${day.value!=null }">   
    		<p>${day.key }</p> 		  
     	 	<c:forEach var="values" items="${day.value}">
     	 	<form action="show_seats.do" method="post">     	 	
     	 	<input type="hidden" name="schedule" value="${values.schedule_id}">
   			<p><button type="submit" class="btn btn-secondary" id="show${values.schedule_id}" style="display:hidden;">
   			${values.schedule_time }</button></p>
   			</form>
   			
<script>
var reserve_qty = ${values.reserve_seat_qty};
var venue_qty = ${venue_seat_qty};
var total = venue_qty - reserve_qty;

if(total==0){
	$('#show${values.schedule_id}').text('매진');
	$('#show${values.schedule_id}').attr("disabled", true);
}
</script>
   			
   			</c:forEach> 
    	</c:if>
    	</td>    	
    	<c:if test="${(status.index+1)%7==0 }"></tr></c:if>    	
    	</c:forEach>     
    </tbody>
  </table>
</div>
</div>

<div class="container">
<div class="modal fade" id="schedule_info">
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
	공연 일정이 존재하지 않습니다.<br>
	당일부터 마지막 공연 기간 내 일정만 조회가 가능합니다.
  	</div>
  	</div>
	</div>
</div>
</div>

</body>
</html>

<script>
	var month = ${month};
	var current = ${currentMonth};
	var last = ${lastMonth};

	$(document).ready(function() {
		$('form[name=last_month_form]').submit(function(event){
			if(month==current){
				$('#schedule_info').modal('show');
				return false;
			}	        
	    });
		
		$('form[name=next_month_form]').submit(function(event){
			if(month==last){
				$('#schedule_info').modal('show');
				return false;
			}	        
	    });
	});
</script>