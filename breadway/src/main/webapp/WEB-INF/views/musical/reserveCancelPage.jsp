<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>

<script type="text/javascript">
    	
		alert("****************필독***************** \n예매 취소 시 기간에 따라 위약금이 발생할 수 있습니다.\n자세한 내용은 해당 페이지를 참조해주세요.")
		
		function check() {
			var obj = document.f.difference.value;
			console.log(obj);
			if(obj == 0) {
				alert("공연 당일에는 예매취소가 불가능합니다.")
				return false;
			}	else if(obj < 0 ) {
				alert("해당 공연은 이미 끝났습니다.")
				return false;
			}
			else {
				document.f.submit();
				true;
			}
		}
	</script>
<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>
 <c:import url="/top.do">
	<c:param name="title" value="예매취소규정"></c:param>
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
	    <div class="container" style="padding-top:30px; padding-bottom:30px;">
    		<form name="f" action="musical_reserveCancelOk.do?order_Num=${reserveData[0].ORDER_NUM}" method="post" onSubmit="check();return false">
    		<input type="hidden" name="order_num" value="${reserveData[0].ORDER_NUM}">
 			<input type="hidden" name="difference" value="${difference}">
			
    		<table border="0" class="table" style="vertical-align:middle;">
    			<tr height="10%"  align="left" >
    			<td width="80%" colspan="4">뮤지컬<${reserveData[0].SHOW_NAME}></td>
    			</tr>
    			<tr height="100" >
    				<td width="25%" align="center" style="vertical-align:middle;" >
    				공연 날짜
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;" >
    				${reserveData[0].SCHEDULE_DATE}
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;" >
    				오늘 날짜
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;" >
    				${today}<br>
    				(공연일까지 ${difference}일 전)
    				</td>
    			</tr>
    			</tr>
    			<tr height="30">
    				<c:set var = "total" value = "0" />
					<c:forEach var="result" items="${reserveData}" varStatus="status">     
						<c:set var= "total" value="${total + result.SEAT_PRICE}"/>
					</c:forEach>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				결제 금액
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				${total * (100-(reserveData[0].SEAT_DISCOUNT))/100}
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				결제 날짜
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				${reserveData[0].RESERVE_DATE}
    				</td>
    			</tr>
    			<tr height="30">
    				<td width="25%" align="center" style="vertical-align:middle;">
    				좌석
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				<c:forEach var="i" items="${reserveData}" varStatus="status" >
    				${i.SEAT_NAME}<br></c:forEach>
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				환불 예상 금액
    				</td>
    				<td width="25%" align="center" style="vertical-align:middle;">
    				${total * (100-(reserveData[0].SEAT_DISCOUNT))/100*percent/100}<br>
    				(${percent}% 환불 예정)
    				<input type="hidden" name="cancelPrice" value="${total * (100-(reserveData[0].SEAT_DISCOUNT))/100*percent/100}">
    				</td>
    			</tr>
    			<tr>
    				<td colspan="4" valign="top" align="left">
    				*위약금 관련 사항*<br>
    				1. 관람일까지 10일 이후부터 : 결제금액의 100% 환불.<br>
    				2. 관람일까지 9일~7일 전 : 결제금액의 90% 환불.<br>
    				3. 관람일까지 6일~3일 전 : 결제금액의 80% 환불.<br>
    				4. 관람일까지 2일~마감일전 : 결제금액의 70% 환불.<br>
    				5. 공연 당일은 취소가 불가능합니다.
    				</td>
    			</tr>
    			<tr>
    				<td colspan="4" >
    				<div class="container" style="text-align:right; padding:-51px;" >
    				<input type="submit" value="확인" class="btn btn-outline-secondary" >
					<input type="button" value="취소" class="btn btn-outline-secondary" onclick = "history.back(-1);">
					</div>
    				</td>
    			</tr>
    		</table>
    		
    		</table>
    		</form>
    	
    	
				
		
<%--     	<c:out value="${consumerDTO }"/> --%>
    	<%-- <c:set var="dto" value="${consumerDTO}">
    	
  		</c:set> --%>
    		
    		
    	
    	
</div>
</div>
</div>
</div>
    </body>
    
    
    </html>


<%-- 

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
   		<c:set var="diff" value='${difference}'/>


<%
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
response.setDateHeader("Expires", 0L); // Do not cache in proxy server
%>

    <head>
    	<title>예매내역</title>
    	<script type="text/javascript">
    	
		alert("****************필독***************** \n예매 취소 시 기간에 따라 위약금이 발생할 수 있습니다.\n자세한 내용은 해당 페이지를 참조해주세요.")
		
		function check() {
			var obj = document.f.difference.value;
			console.log(obj);
			if(obj == 0) {
				alert("공연 당일에는 예매취소가 불가능합니다.")
				return false;
			}	else if(obj < 0 ) {
				alert("해당 공연은 이미 끝났습니다.")
				return false;
			}
			else {
				document.f.submit();
				true;
			}
		}
	</script>
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
    	<tr>
    	<th colspan="3" valign="top" align="center">취소내역확인<br>
    	<form name="f" action="musical_reserveCancelOk.do?order_Num=${reserveData[0].ORDER_NUM}" method="post" onSubmit="check();return false">
    		<input type="hidden" name="order_num" value="${reserveData[0].ORDER_NUM}">
 			<input type="hidden" name="difference" value="${difference}">
			<input type="hidden" name="cancelPrice" value="${total * (100-(reserveData[0].SEAT_DISCOUNT))/100*percent/100}">
    		<table border="1" width="90%" height="500" align="center">
    			<tr height="10%"  align="left" >
    			<td width="80%" colspan="4">뮤지컬<${reserveData[0].SHOW_NAME}></td>
    			</tr>
    			<tr height="30">
    				<td width="25%" align="center" valing="center">
    				공연 날짜
    				</td>
    				<td width="25%" align="center" valing="center">
    				${reserveData[0].SCHEDULE_DATE}
    				</td>
    				<td width="25%" align="center" valing="center">
    				오늘 날짜
    				</td>
    				<td width="25%" align="center" valing="center">
    				${today}<br>
    				(공연일까지 ${difference}일 전)
    				</td>
    			</tr>
    			</tr>
    			<tr height="30">
    				<c:set var = "total" value = "0" />
					<c:forEach var="result" items="${reserveData}" varStatus="status">     
						<c:set var= "total" value="${total + result.SEAT_PRICE}"/>
					</c:forEach>
    				<td width="25%" align="center" valing="center">
    				결제 금액
    				</td>
    				<td width="25%" align="center" valing="center">
    				${total * (100-(reserveData[0].SEAT_DISCOUNT))/100}
    				</td>
    				<td width="25%" align="center" valing="center">
    				결제 날짜
    				</td>
    				<td width="25%" align="center" valing="center">
    				${reserveData[0].RESERVE_DATE}
    				</td>
    			</tr>
    			<tr height="30">
    				<td width="25%" align="center" valing="center">
    				좌석
    				</td>
    				<td width="25%" align="center" valing="center">
    				<br>
    				<c:forEach var="i" items="${reserveData}" varStatus="status" >
    				${i.SEAT_NAME}<br></c:forEach>
    				</td>
    				<td width="25%" align="center" valing="center">
    				환불 예상 금액
    				</td>
    				<td width="25%" align="center" valing="center">
    				${total * (100-(reserveData[0].SEAT_DISCOUNT))/100*percent/100}<br>
    				(${percent}% 환불 예정)
    				</td>
    			</tr>
    			<tr>
    				<td colspan="4" valign="top" align="left">
    				*위약금 관련 사항*<br>
    				1. 공연일로부터 30일 이후부터는 위약금이 없습니다.<br>
    				2. 공연일로부터 7일~30일 전까지는 결제금액의 90프로를 환불해드립니다.<br>
    				3. 공연일로부터 6일~4일 전까지는 결제금액의 80프로를 환불해드립니다.<br>
    				4. 3일 전부터 하루전까지는 결제금액의 60프로를 환불해드립니다.<br>
    				5. 공연 당일은 취소가 불가능합니다.
    				</td>
    			</tr>
    			<tr>
    				<td colspan="4" >
    					<input type="submit" value="확인" >
						<input type="button" value="취소" onclick="history.back(-1);">
    				</td>
    			</tr>
    		</table>
    		</form>
    	</th>
    	</tr>	
    </table>
    </body> --%>