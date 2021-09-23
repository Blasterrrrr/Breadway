<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- showmanage_scheduleupdate.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<p class="w3-xxlarge">Schedule Update Page</p>
		</div>
	<br>
	<c:choose>
		<c:when test = "${empty schedulelist}">
		<br>
			<div class="w3-container w3-lobster">
				<p class="w3-xxlarge">Schedule Update Complete</p>
				<p class="w3-xxlarge">Please close the Window</p>
			</div>
		<br>
		</c:when>
		<c:otherwise>
		<div align = "center" style="width:50%">
			<form name = "f" action = "showmanage_scheduleupdateok.do" method = "post" class="w3-table w3-striped w3-border">
			<input type = "hidden" name = "schedule_id" value = "${schedulelist.schedule_id}">
			<table border = "1" class="w3-table w3-striped w3-border">
				<tr>
					<th align = "center">공연 시작 날짜</th>	
					<td align = "center"><input type = "date" name = "schedule_date" value = "${fn:substring(schedulelist.schedule_date,0,10)}"></td>
				</tr>
				<tr>
					<th align = "center">공연 시간</th>	
					<td align = "center"><input type = "text" name = "schedule_time" value = "${schedulelist.schedule_time}"></td>
				</tr>
				<tr>
					<td align = "center" colspan = "2">
					<div align = "center">
						<input class="w3-button w3-dark-grey" type = "submit" value = "스케쥴 수정">
					</div>
					</td>
				</tr>
			</table>
			</form>
		</div>	
		</c:otherwise>
	</c:choose>
</div>