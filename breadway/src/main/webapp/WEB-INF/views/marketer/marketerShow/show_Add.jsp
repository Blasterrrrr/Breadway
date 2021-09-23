<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<title>뮤지컬 등록</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function add_textbox(){
		let role_space = document.getElementById("role_space");
		let createBox = document.createElement("createBox");
		createBox.innerHTML = "<input type='text' name='role_box' class='form-control'><p>";
		role_space.appendChild(createBox);
	}
	
	
 	function SelectLocation(selectItem){
 		let target = document.getElementById("select2");
 		
		let seoul = ["대성디큐브아트센터","서울예술의전당"];
		let incheon = ["부평아트센터","인천문화예술회관"];
		let daejeon = ["대전예술의전당"];
		let busan = ["부산드림씨어터","부산문화회관"];
		let ulsan = ["울산문화예술회관"];
		let daegu = ["대구오페라하우스"];
		let gwangju = ["광주문화예술회관"];
		let jaeju = ["제주한라아트홀"];

		let changeItem;
		
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
			 let opt = document.createElement("option");
			 opt.value = changeItem[x];
			 opt.innerHTML = changeItem[x];
			 target.appendChild(opt);
		 }
	}
 	
 	
 	function nullCheck(){
		if (fff.show_Name.value==""){
			alert("뮤지컬명을 입력해 주세요!");
			fff.show_Name.focus();
			return;
		}
		if (fff.show_Organizer.value==""){
			alert("주최사를 입력해 주세요!");
			return;
		}
		if (fff.poster.value==""){
			alert("포스터를 선택해 주세요!");
			return;
		}
		if (fff.select1.value=="none"){
			alert("지역을 선택해 주세요!");
			return;
		}
		if (fff.startDate.value==""){
			alert("시작일을 선택해 주세요!");
			return;
		}
		var sDate = new Date(fff.startDate.value);
		var today = new Date();
		if (sDate < today){
			alert("시작일은 현재 날짜 이후로 선택해주세요!");
			return;
		}
		if (fff.endDate.value==""){
			alert("종료일을 입력해 주세요!");
			return;
		}
		var eDate = new Date(fff.endDate.value);
		if (eDate < sDate){
			alert("종료일은 시작일 이후로 선택해주세요!");
			return;
		}
		if (fff.genre.value=="none"){
			alert("장르를 선택해 주세요!");
			return;
		}
		if (fff.duration.value==""){
			alert("공연시간을 입력해 주세요!");
			return;
		}
		var roleBoxSize = document.getElementsByName('role_box').length;
		var countRoleBox = 0;
		for(var i=0; i<roleBoxSize; i++){
			if (fff.role_box[i].value != ""){
				countRoleBox++;
			}
		}
		if(countRoleBox == 0){
			alert("배역을 입력해 주세요!");
			return;
		}
		if (fff.detail.value==""){
			alert("공연 정보를 입력해 주세요!");
			return;
		}
		if(fff.videoLink.value.indexOf("embed") == -1) {
			alert("유튜브 주소를 다시 확인해주세요!");
			return;
		}
		
		document.fff.submit();
		alert("관리자에게 승인을 요청했습니다.");
	}
 	
 	
	function howToGetLink(){
		var win = window.open("howToGetLink", "YouTube 링크 복사 방법", "width=800, height=700");
	}	
 	

</script>
<div align="center" class="container" style="margin-top:30px;">
	<h2>뮤지컬 등록하기</h2>
	<form name="fff" action="show_Add_Ok.mkt" method="post" enctype="multipart/form-data">
		<input type="hidden" name="show_Status" value="0">
		<input type="hidden" name="marketer_UID" value="${sessionScope.marketer_UID}">
		<input type="hidden" name="posterName">
		<table border="1" class="table table-bordered">
			<tr>
				<th class="text-center" width="20%">Musical Name</th>
				<td>
					<input type="text" name="show_Name" class="form-control" required>
					* 영문 대소문자, 숫자, 한글만 입력해주세요
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Organizer</th>
				<td><input type="text" name="show_Organizer" class="form-control" required></td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Poster</th>
				<td>
					<input type="file" accept="image/*" name="poster" class="form-control-file" required>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Held Location</th>
				<td>
					<select id="select1" name="select1" onchange="SelectLocation(this)" class="form-control form-control-sm">
						<option value="none">지역 선택</option>
						<c:forEach var="aList" items="${list_Area}">
							<option value="${aList.area_Name}">${aList.area_Name}</option>
						</c:forEach>
					</select>
					<p><p>
					<select name="theatre_Name" id="select2" class="form-control form-control-sm">
					 <option>장소 선택</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Start Date</th>
				<td><input type="date" name="startDate" placeholder="yyyy-MM-dd" class="form-control" required></td>
			</tr>			
			<tr>
				<th class="text-center" width="20%">Musical End Date</th>
				<td><input type="date" name="endDate" placeholder="yyyy-MM-dd" class="form-control" required></td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Genre</th>
				<td>
					<div>
						<select name="genre" class="form-control">
									<option value="none">장르 선택</option>
									<option value="drama">드라마</option>
									<option value="fantasy">판타지</option>
									<option value="horror">호러</option>
									<option value="comedy">희극</option>
									<option value="tragedy">비극</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Rate</th>
				<td>
					<select name="rate" class="form-control">
								<option value="전체">전체관람가</option>
								<option value="15세 이상">15세 이상 관람가</option>
								<option value="19세 이상">19세 이상 관람가</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Duration</th>
				<td><input type="text" name="duration" size="10" class="form-control" required>* 단위 : 분(min)</td>
			</tr>	
			<tr>
				<th class="text-center" width="20%">Musical Role List</th>
				<td>
					<button type="button" class="btn btn-secondary" onclick="javascript:add_textbox();">입력란 추가</button>
						* 영문 대소문자, 숫자, 한글만 입력해주세요
						<p>
						<div id="role_space">
						<p>
						<input type='text' name='role_box' class='form-control' required='required'>
						<p>
						<input type='text' name='role_box' class='form-control'>
						<p>
					</div>
					<p>
				</td>
			</tr>				
			<tr>
				<th class="text-center" width="20%">Musical Detail</th>
				<td><textarea name="detail" rows="10" cols="100%"  class="form-control" required></textarea></td>
			</tr>	
			<tr>
				<th class="text-center" width="20%">Musical Notice</th>
				<td><textarea name="notice" rows="5" cols="100%" class="form-control"></textarea></td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Musical Teaser Link</th>
				<td>
					<input type="text" name="videoLink" class="form-control">
					<p><p>* YouTube만 지원 가능합니다. 링크 가져오는 법을 확인해주세요!</p>
					<button type="button" class="btn btn-secondary" onclick="javascript:howToGetLink()">링크 가져오는 방법</button>
				</td>
				
			</tr>	
		</table>
		<p><p>
		<button type="button" class="btn btn-secondary" onclick="javascript:nullCheck()">등록하기</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">취소</button>
	</form>
</div>