<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<title>스케줄 수정</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function nullCheck(){
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

		document.f.submit();
		alert("스케줄이 수정되었습니다.");
	}
</script>
<div align="center" style="margin-top:30px;">
	<form name="f" action="schedule_Update_Ok.mkt" method="post">
		<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
		<h2>뮤지컬&lt;${sessionScope.show_Name}&gt; 스케줄 수정하기</h2>
		<div class="table-responsive">
			<table border="1" width="100%" class="table table-bordered table-sm">
				<c:forEach var="sList" items="${get_schedule}">
					<input type="hidden" name="schedule_ID" value="${sList.schedule_ID}">
					<tr>
						<td align="center" width="20%" bgcolor="#c9e5ff">Scheduling Date</td>
						<td>
							<fmt:parseDate value="${sList.schedule_Date}" pattern="yyyy-MM-dd HH:mm:ss" var="schedule_Date"/>
							<fmt:formatDate value="${schedule_Date}" pattern="yyyy-MM-dd" var="schedule_Date"/>
							<input type="date" name="schedule_Date" placeholder="yyyy-MM-dd" value="${schedule_Date}" size="15" readOnly></td>
					</tr>
					<tr>
						<td align="center" width="20%" bgcolor="#c9e5ff">Scheduling Time</td>
						<td><input type="time" name="schedule_Time" placeholder="HH:mm" value="${sList.schedule_Time}" size="15" required="required"></td>
					</tr>
					<tr>
						<td align="center" width="20%" bgcolor="#c9e5ff">Cast Pattern</td>
						<td>
							<c:choose>
								<c:when test="${CastNames.size() <= count_role}">
									등록된 캐스트 패턴이 없습니다.
								</c:when>
								<c:otherwise>
									<table border="1" width="100%">
										<tr>
											<td align="center" bgcolor="#ebebeb">Role</td>
											<td align="center" rowspan="${count_roleSet + 1}">
												<table border="1" width="100%">
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
													<tr><td align="center"  bgcolor="#ebebeb">
													<input type="radio" name="pNum" value="${status.index-1}" required="required" />
														Pattern ${status.index}
													</td></tr>
												</c:forEach>
											</table>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<p><p>
		<button type="submit" class="btn btn-secondary" onclick="nullCheck();">수정하기</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
	</form>
</div>
