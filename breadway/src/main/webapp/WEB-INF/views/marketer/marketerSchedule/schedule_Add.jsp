<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<title>스케줄 등록</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function nullCheck(){
		if (fff.schedule_Date.value==""){
			alert("날짜를 선택해 주세요!");
			return;
		}
		var sDate = fff.startDate.value;
		var newSDate = sDate.substring(0, 10); //yyyy-MM-dd
		var eDate = fff.endDate.value;
		var newEDate = eDate.substring(0, 10);
		var newsDate = new Date(sDate);
		var neweDate = new Date(eDate);
		if (newSDate > fff.schedule_Date.value){
			alert("공연 시작 이후 날짜를 선택해주세요!");
			return;
		}
		if (newEDate < fff.schedule_Date.value){
			alert("공연 종료 이전 날짜를 선택해주세요!");
			return;
		}
		
		if (fff.schedule_Time.value==""){
			alert("시간을 입력해 주세요!");
			return;
		}
		
		var RadioNum = document.getElementsByName("pNum");
		var chk_cnt = 0; 
	    for(var i=0; i<RadioNum.length; i++){ 
	      if(RadioNum[i].checked == true) {
	    	  chk_cnt++; 
	      }
	    }
	    if(chk_cnt<1) { 
	        alert("패턴을 선택해 주세요!"); 
	        return; 
	      } 

		document.fff.submit();
		alert("스케줄이 등록되었습니다.");
	}
</script>
<div align="center" style="margin-top:30px;">
	<form name="fff" action="schedule_Add_Ok.mkt" method="post">
		<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
		<input type="hidden" name="schedule_ID" value="${schedule_ID}">
		<input type="hidden" name="startDate" value="${fn:substring(sessionScope.startDate, 0, 10)}">
		<input type="hidden" name="endDate" value="${fn:substring(sessionScope.endDate, 0, 10)}">
		<h2>뮤지컬&lt;${sessionScope.show_Name}&gt; 스케줄 등록하기</h2>
		<table border="1" width="100%" class="table table-bordered table-sm">
			<tr>
				<th class="text-center">Scheduling Date</th>
				<td><input type="date" name="schedule_Date" placeholder="yyyy-MM-dd" size="15" required="required"></td>
			</tr>
			<tr>
				<th class="text-center">Scheduling Time</th>
				<td><input type="time" name="schedule_Time" placeholder="HH:mm" size="15" required="required"></td>
			</tr>
			<tr>
				<th class="text-center">Cast Pattern</th>
				<td>
					<c:choose>
						<c:when test="${CastNames.size() <= count_role}">
							등록된 캐스트 패턴이 없습니다.
						</c:when>
						<c:otherwise>
							<table border="1" class="table">
								<tr>
									<td align="center" bgcolor="#ebebeb">Role</td>
									<td align="center" rowspan="${count_roleSet + 1}">
										<table border="1" class="table">
											<tr>
												<c:forEach var="cList" items="${CastNames}" varStatus="status">
													<c:choose>
														<c:when test="${status.count <= count_role}">
															<td align="center" bgcolor="#ebebeb" lang="zh">${cList} 役</td>
														</c:when>
														<c:otherwise>
															<td align="center">${cList}</td>
														</c:otherwise>
													</c:choose>
													<c:if test="${status.count % count_role == 0}">
														<tr>
													</c:if>
												</c:forEach>
											</tr>
										</table>
									</td>
										<c:forEach begin="1" end="${count_roleSet - 1}" varStatus="status">
											<tr><td align="center" bgcolor="#ebebeb">
											<input type="radio" name="pNum" value="${status.index-1}" required="required" />
												Pattern ${status.index}
											</td></tr>
										</c:forEach>
									</table>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<p><p>
		<button type="button" class="btn btn-secondary" onclick="javascript:nullCheck();">등록하기</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="window.location='schedule_All.mkt'">취소</button>
	</form>
</div>
