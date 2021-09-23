<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
     <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>
 <c:import url="/top.do">
	<c:param name="title" value="뮤지컬 예매 상세 내역"></c:param>
</c:import> 
	<br><br><br>
	
	<div class="container" style="margin-top:30px">
  		<div class="row">
	        <div class="col-sm-3">
	        <ul class="nav nav-pills flex-column">
       			<li class="nav-item">
         			<a class="nav-link" href="consumer_mypage.do">내정보보기</a>
      		  	</li>
      		  	<li class="nav-item">
      		  		<a class="nav-link active" href="musical_myBuyPage.do">예매내역확인</a>
      		  	</li>
		        <li class="nav-item">
		          <a class="nav-link " href="musical_myCancelPage.do">예매취소내역확인</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="inquiry_myInquiry.do">문의내역확인</a>
		        </li>   
    	  </ul>
	    </div>
	    <div class="col-sm-8 text-center">
	    <div class="container" style="padding-top:30px; padding-bottom:1px; ">
    		<table border="0" style="width:99%; height:300; text-align:center; text-valign:middle; margin:auto" class="table">
    		
    		<thead>
    			<tr>
    				<td colspan="2" align="center" height="10">예매상세내역확인</td>
    			</tr>
    		</thead>
    		<tbody>
    			<tr height="100%" valign="middle">
    				<td style="text-align:center; text-valign:middle; vertical-align: middle; ">
    				<div   style="display:inline-block">
    				<img  src="<spring:url value='/resources/files/show/${show[0].POSTERNAME}' /> " width="300" height="450" >
    				</div>
    				</td>
    				
    				<td style="text-align:center; text-valign:middle; vertical-align: middle; ">
    				<div style="display:inline-block">
    				<table border="0"  class="table">
    				<tr>
    				<td colspan="2">
    				<h3>${show[0].SHOW_NAME}</h3> </td>
    				</tr>
    				<tr>
    					<td>예매자명 </td>
    					<td>${sessionScope.consumer.consumer_Name}</td>
    				</tr>
    				<tr>
    					<td>예매번호 </td>
    					<td>${show[0].ORDER_NUM}</td>
    				</tr>
    				<tr>
    					<td>예매날짜 </td>
    					<td>${show[0].RESERVE_DATE}</td>
    				</tr>
    				<tr>
    					<td>관람일시 </td>
    					<td>${show[0].SCHEDULE_DATE} / ${show[0].SCHEDULE_TIME}</td>
    				</tr>
    				<tr>
    					<td>좌석 </td>
    					<td><c:forEach var="i" items="${show}" varStatus="status" >
    								${i.SEAT_NAME}<br></c:forEach></td>
    				</tr>
    				<tr>
    					<td>공연장</td>
    					<td>${show[0].THEATRE_NAME}</td>
    				</tr>
    				<tr>
    					<td>결제금액</td>
    					<td><c:set var = "total" value = "0" />
							<c:forEach var="result" items="${show}" varStatus="status">     
							<c:set var= "total" value="${total + result.SEAT_PRICE}"/>
							</c:forEach>
							<c:out value="${total}"/>원 / 할인 : ${show[0].SEAT_DISCOUNT}%<br>
							${total * (100-show[0].SEAT_DISCOUNT)/100}원
							</td>
    				</tr>
    				</table>
    				</div>
    				</td>
    				</tr>
    				<tr height="1"><td colspan="2"></td>
    				</tr>
    			</tbody>
    		</table>
</div>
<div class="container" style="text-align:right; padding:-51px;" >
<button type="button" class="btn btn-outline-secondary" onclick = "location.href = 'musical_reserveCancel.do?order_Num=${show[0].ORDER_NUM}' ">예매 취소하기</button>
</div>
</div>
</div>
</div>
	
<%-- 	<div class="container" style="margin-top:30px">
  		<div class="row">
	        <div class="col-sm-3">
	        <ul class="nav nav-pills flex-column">
       			<li class="nav-item">
         			<a class="nav-link" href="consumer_mypage.do">내정보보기</a>
      		  	</li>
      		  	<li class="nav-item">
      		  		<a class="nav-link active" href="musical_myBuyPage.do">예매내역확인</a>
      		  	</li>
		        <li class="nav-item">
		          <a class="nav-link" href="musical_myCancelPage.do">예매취소내역확인</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="inquiry_myInquiry.do">문의내역확인</a>
		        </li>   
    	  </ul>
	    </div>
	    <div class="col-sm-8 text-center">
	    <div class="container" style="padding-top:30px; padding-bottom:30px;">
    		<table border="0" width="35%" height="500" align="center" class="table">
    		<thead>
    			<tr>
    				<td colspan="2" align="center" height="10">${show[0].SHOW_NAME} 예매내역확인</td>
    			</tr>
    		</thead>
    		<tbody>
    			<tr height="90%">
    				<td width="50%" align="center" valign="middle">
    				<img src="<spring:url value='/resources/files/show/${show[0].POSTERNAME}' /> " width="250" height="350" >
    				</td>
    				<td valign="middle">
 					예매자명 : ${sessionScope.consumer.consumer_Name}<br>

    				
    				예매번호 : ${show[0].RESERVE_ID}<br>
    				예매날짜 : ${show[0].RESERVE_DATE}<br>
    				관람일시 : ${show[0].SCHEDULE_DATE} / ${show[0].SCHEDULE_TIME}<br>
    				좌석 :<br>
    				<c:forEach var="i" items="${show}" varStatus="status" >
    				${i.SEAT_NAME}<br></c:forEach>
    				공연장 : ${show[0].THEATRE_NAME}<br>
    				<div class="row">
    <div class="col-sm-3" style="background-color:lavender;">.col-sm-3</div>
    <div class="col-sm-3" style="background-color:lavenderblush;">.col-sm-3</div>
    <div class="col-sm-3" style="background-color:lavender;">.col-sm-3</div>
    <div class="col-sm-3" style="background-color:lavenderblush;">.col-sm-3</div>
  </div>
</div>
    				</td>
    			</tr>
    			<tr  height="30%" >
    				<td colspan="2" valign="top">
    				결제내역<br>
    				가격 : <c:set var = "total" value = "0" />
							<c:forEach var="result" items="${show}" varStatus="status">     
							<c:set var= "total" value="${total + result.SEAT_PRICE}"/>
							</c:forEach>
							<c:out value="${total}"/>원 할인 : ${show[0].SEAT_DISCOUNT}% <br>
    				결제금액 :${total * (100-show[0].SEAT_DISCOUNT)/100}
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2" align="right">
    				<a href="musical_reserveCancel.do?order_Num=${show[0].ORDER_NUM}">[예매 취소하기]</a>
    				</td>
    			</tr>
    			</tbody>
    		</table>
</div>
</div>
</div>
</div> --%>
		
		
<%--     	<c:out value="${consumerDTO }"/> --%>
    	<%-- <c:set var="dto" value="${consumerDTO}">
    	
  		</c:set> --%>	
 
    </body>
    </html>


<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>
    <head>
    	<title>뮤지컬 예매 상세 내역</title>
    	<style>

.hidden {

    display:none;

}

</style>
    </head>
    <body>
    <table border="1" align="center" width="800" height="650">

    	<tr align="center"  height="100" >
    	<td width="10%">
    	<h5><a href="musical_categoryPage.do?genre=action">장르별</a></h5>
    	<h5><a href="musical_categoryPage_area.do">지역별</a></h5>
    	</td>
    	<td width="10%">
    	<h5><a href="musical_categoryPage_date.do">날짜별</a></h5>
    	</td>
    	<td>
    	<h1><a href="musical_mainPage.do">브로드웨이</a></h1>
    	</td>
    	<td width="20%">
    	<c:choose>
    		<c:when test="${sessionScope.consumer == null}">
    			<h5><a href="login.do">로그인</a></h5>
    			<h5><a href ="signup.do">회원가입</a></h5>
    		</c:when> 
    		<c:otherwise>
    			<h5><a href="logout.do">로그아웃</a></h5>
    		</c:otherwise>
    	</c:choose>
    		<h5><a href="musical_loginCheck.do?root=consumer_mypage.do">마이페이지</a>
    		<h5><a href="faq_main.do">고객센터</a></h5>
    	</td>
    	
    	</tr>
    	
    	<tr>
    	<td colspan="2" rowspan="2" valign="top">
    		<ul>
    			<li><a href="musical_myInfo.do">내정보보기</a></li>
    			<li><a href="musical_myBuyPage.do">예매내역확인</a></li>
    			<li><a href="musical_myCancelPage.do">예매취소내역확인</a></li>
    			<li><a href="inquiry_myInquiry.do">문의내역확인</a></li>
    		</ul>
    	</td>
    	
    	
    	<th colspan="3" valign="top" align="center">예매내역확인<br>
    		<table border="1" width="80%" height="500" align="center">
    			<tr height="10%"  align="left" >
    			<td width="80%" colspan="2">뮤지컬<${show[0].SHOW_NAME}></td>
    			</tr>
    			<tr height="90%">
    				<td width="50%" align="center" valing="center">
    				<img src="<spring:url value='/resources/files/show/${show[0].POSTERNAME}' /> " width="250" height="350" >
    				</td>
    				<td>
    				예매자명 : ${sessionScope.consumer.consumer_Name}<br>
    				예매번호 : ${show[0].RESERVE_ID}<br>
    				예매날짜 : ${show[0].RESERVE_DATE}<br>
    				관람일시 : ${show[0].SCHEDULE_DATE} / ${show[0].SCHEDULE_TIME}<br>
    				좌석 :<br>
    				<c:forEach var="i" items="${show}" varStatus="status" >
    				${i.SEAT_NAME}<br></c:forEach>
    				공연장 : ${show[0].THEATRE_NAME}<br>
    				</td>
    			</tr>
    			<tr  height="30%" >
    				<td colspan="2" valign="top">
    				결제내역<br>
    				가격 : <c:set var = "total" value = "0" />
							<c:forEach var="result" items="${show}" varStatus="status">     
							<c:set var= "total" value="${total + result.SEAT_PRICE}"/>
							</c:forEach>
							<c:out value="${total}"/>원 할인 : ${show[0].SEAT_DISCOUNT}% <br>
    				결제금액 :${total * (100-show[0].SEAT_DISCOUNT)/100}
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2" align="right">
    				<a href="musical_reserveCancel.do?order_Num=${show[0].ORDER_NUM}">[예매 취소하기]</a>
    				</td>
    		</table>
    		

 
    	</th>
    	</tr>		
    </table>
    </body> --%>