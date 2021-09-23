<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<title>뮤지컬 수정</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
 	function itemChange(selectItem){
 		var target = document.getElementById("select2");
 		
		var seoul = ["대성디큐브아트센터","서울예술의전당"];
		var incheon = ["부평아트센터","인천문화예술회관"];
		var daejeon = ["대전예술의전당"];
		var busan = ["부산드림씨어터","부산문화회관"];
		var ulsan = ["울산문화예술회관"];
		var daegu = ["대구오페라하우스"];
		var gwangju = ["광주문화예술회관"];
		var jaeju = ["제주한라아트홀"];

		var changeItem;
		
		if(selectItem.value == "서울"){
			changeItem = seoul;
		}else if(selectItem.value == "인천") {
			changeItem = incheon;
		} else if(selectItem.value == "대전") {
			changeItem =  daejeon;
		}else if(selectItem.value == "부산") {
			changeItem =  busan;
		}else if(selectItem.value == "울산") {
			changeItem =  ulsan;
		}else if(selectItem.value == "대구") {
			changeItem =  daegu;
		}else if(selectItem.value == "광주") {
			changeItem =  gwangju;
		}else if(selectItem.value == "제주도") {
			changeItem =  jaeju;
		}
		
		 target.options.length = 0;
		 
		 for (x in changeItem) {
			 var opt = document.createElement("option");
			 opt.value = changeItem[x];
			 opt.innerHTML = changeItem[x];
			 target.appendChild(opt);
		 }
		
	}
 	
 	
 	function nullCheck(){
		if (f.select1.value=="none"){
			alert("지역을 선택해 주세요!");
			return;
		}
		if (f.startDate.value==""){
			alert("시작일을 선택해 주세요!");
			return;
		}
		if (f.endDate.value==""){
			alert("종료일을 입력해 주세요!");
			return;
		}
		var sDate = new Date(f.startDate.value);
		var eDate = new Date(f.endDate.value);
		if (eDate < sDate){
			alert("종료일은 시작일 이후로 선택해주세요!");
			return;
		}
		if (f.genre.value=="none"){
			alert("장르를 선택해 주세요!");
			return;
		}
		if (f.duration.value==""){
			alert("공연시간을 입력해 주세요!");
			return;
		}
		if (f.detail.value==""){
			alert("공연 정보를 입력해 주세요!");
			return;
		}
		
		alert("수정되었습니다.");
	}
 	
 	
	function howToGetLink(){
		var win = window.open("howToGetLink", "YouTube 링크 복사 방법", "width=800, height=700");
	}	
</script>
<div align="center" class="container" style="margin-top:30px;">

	<form name="f" action="show_Detail_Update_Ok.mkt" method="post" enctype="multipart/form-data">
		<input type="hidden" name="marketer_UID" value="${sessionScope.marketer_UID}">
		<input type="hidden" name="show_ID" value="${show_ID}">
		<c:forEach var="sList" items="${list_showDetail}">
			<h2>뮤지컬&lt;${sList.show_Name}&gt; 정보</h2>
			<input type="hidden" name="show_Status" value="${sList.show_Status}" class="form-control" required>
			<table border="1" width="100%" class="table table-fixed table-bordered">
				<tr>
					<th class="text-center" width="20%">Musical Name</th>
					<td><input type="text" name="show_Name" value="${sList.show_Name}" size="30" class="form-control-plaintext" readOnly></td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Organizer</th>
					<td><input type="text" name="show_Organizer" value="${sList.show_Organizer}" size="20" class="form-control-plaintext" readOnly></td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Poster</th>
					<td>
						<input type="file" accept="image/*" name="poster" class="form-control-file">
						<p><p>selected: ${sList.posterName}
						<input type="hidden" name="poster2" value="${sList.posterName}">
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Held Location</th>
					<td>
						<select id="select1" onchange="itemChange(this)" class="form-control form-control-sm">
								<c:forEach var="aList" items="${list_Area}">
									<c:choose>
										<c:when test="${area_Name == aList.area_Name}">
											<option value="${area_Name}" selected>${area_Name}</option>
										</c:when>
										<c:otherwise>
											<option value="${aList.area_Name}">${aList.area_Name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select>
						<select name="theatre_Name" id="select2" class="form-control form-control-sm">
							<c:forEach var="tList" items="${list_Theatre}">
									<c:choose>
										<c:when test="${theatre_Name == tList.theatre_Name}">
											<option value="${theatre_Name}" selected>${theatre_Name}</option>
										</c:when>
										<c:otherwise>
											<option value="${tList.theatre_Name}">${tList.theatre_Name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Start Date</th>
					<td>
						<fmt:parseDate value = "${sList.startDate}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate"/>
						<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="startDate"/>
						<input type="date" name="startDate" value="${startDate}" placeholder="yyyy-MM-dd" class="form-control" required>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical End Date</th>
					<td>
						<fmt:parseDate value = "${sList.endDate}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
						<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="endDate"/>
						<input type="date" name="endDate" value="${endDate}" placeholder="yyyy-MM-dd" class="form-control" required>
						</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Genre</th>
					<td>
						<select name="genre" class="form-control">
								<c:forEach var="i" items="${genreList}">
									<c:choose>
										<c:when test="${sList.genre == i}">
											<option value="${sList.genre}" selected>${sList.genre}</option>
										</c:when>
									<c:otherwise>
										<option value="${i}">${i}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>	
						</select>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Rate</th>
					<td>
						<select name="rate" class="form-control">
								<c:forEach var="i" items="${rateList}">
									<c:choose>
										<c:when test="${sList.rate ==i}">
											<option value="${sList.rate}" selected>${sList.rate} 관람가</option>
										</c:when>
									<c:otherwise>
										<option value="${i}">${i} 관람가</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>	
						</select>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="20%">Musical Duration</th>
					<td><input type="text" name="duration" value="${sList.duration}"  class="form-control" required>* 단위 : 분(min)</td>
				<tr>
					<th class="text-center" width="20%">Musical Role List</th>
					<td lang="zh">
						<c:forEach var="roleList" items="${newRoleList}" varStatus="loop">
							${roleList} 役
							<c:if test="${!loop.last}">, </c:if>
						</c:forEach>
							<p>
						<p>
					</td>
				</tr>	
				<tr>
					<th class="text-center" width="20%">Musical Detail</th>
					<td><textarea name="detail" rows="10" cols="100%" class="form-control" required>${sList.detail}</textarea></td>
				</tr>	
				<tr>
					<th class="text-center" width="20%">Musical Notice</th>
					<td><textarea name="notice" rows="5" cols="100%" class="form-control" required>${sList.notice}</textarea></td>
				</tr>
				<tr>
				<th class="text-center" width="20%">Musical Teaser Link</th>
				<td>
					<input type="text" name="videoLink" value="${sList.videoLink}" class="form-control">
					<p><p>* YouTube만 지원 가능합니다. 링크 가져오는 법을 확인해주세요!</p>
					<button type="button" class="btn btn-secondary" onclick="javascript:howToGetLink()" >링크 가져오는 방법</button>
				</td>
			</tr>	
			</table>
			<br>
			<button type="submit" class="btn btn-secondary" onclick="javascript:nullCheck()">수정하기</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
		</c:forEach>
	</form>
</div>