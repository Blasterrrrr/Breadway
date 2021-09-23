<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <head>
		  <meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <title>날짜별 검색</title>
		  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		  <link rel="stylesheet" href="/resources/demos/style.css">
		  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<script>
			$(document).ready(function () {
			    $.datepicker.regional['ko'] = {
			        closeText: '닫기',
			        prevText: '이전달',
			        nextText: '다음달',
			        currentText: '오늘',
			        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
			        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
			        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
			        '7월','8월','9월','10월','11월','12월'],
			        dayNames: ['일','월','화','수','목','금','토'],
			        dayNamesShort: ['일','월','화','수','목','금','토'],
			        dayNamesMin: ['일','월','화','수','목','금','토'],
			        weekHeader: 'Wk',
			        minDate: 0,
			        dateFormat: 'yy-mm-dd',
			        firstDay: 0,
			        isRTL: false,
			        showMonthAfterYear: true,
			        yearSuffix: '',
			        showOn: 'both',
			        buttonText: "달력",
			        changeMonth: true,
			        changeYear: true,
			        showButtonPanel: true,
			        yearRange: 'c-99:c+99',
			    };
			    $.datepicker.setDefaults($.datepicker.regional['ko']);

			    $('#sdate').datepicker();
			    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
			    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#edate").datepicker( "option", "minDate", selectedDate );
			    });

			    $('#edate').datepicker();
			    $('#edate').datepicker("option", "minDate", $("#sdate").val());
			    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#sdate").datepicker( "option", "maxDate", selectedDate );
			    });
			});
			</script>
	</head>
    <body> 
<c:import url="/top.do">
	<c:param name="title">날짜별보기</c:param>
</c:import>
	<div align = "center">
	   		<div class="container" style="padding-top:30px; padding-bottom:30px;">
    		<form name="f" action="musical_musicalDateFind.do" method="post">
    			<p>조회기간:
				  <input type="date" id="sdate" name="datepicker1"> ~
				  <input type="date" id="edate" name="datepicker2">
				  <input type="submit" value="조회" class="btn btn-secondary">
				</p>
				</form>
			
				
				<table border="0" height="400" width="600" align="ceneter" class="table">
				<thead>
    				<tr align="Center" height="40">
    					<th>No.</th>
    					<th>포스터</th>
    					<th>뮤지컬 제목</th>
    				</tr>
    			</thead>
    				<c:if test="${empty dateShowList}" >
    				<tr align="center" heigth="360">
    				
    					<td colspan="3">
    					해당하는 날짜에 뮤지컬이 없습니다.
    					</td>
    				</tr>
    				</c:if>
    				
    				<c:forEach var="dto" items="${dateShowList}" varStatus="status">
    				<tr align="center" >
    					<td><font size=20>${status.count}</font></td>
    					<td><a href="musical_content.do?show_ID=${dto.show_ID}">
    							<img src="<spring:url value='/resources/files/show/${dto.posterName}' />" class="aligncenter" width="200" height="250"><br>
    							</a>
    					</td>
    					<td>${dto.show_Name}</td>
    				</tr>
    				</c:forEach>
    					
    		</table>
			</div>
 </div>

    </body>
