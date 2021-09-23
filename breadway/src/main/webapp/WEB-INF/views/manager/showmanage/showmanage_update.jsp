<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 공연 관리 수정"></c:param>
</c:import>
<script type="text/javascript">
		function check(){
			if (f.show_name.value==""){
				alert("공연 이름를 입력해 주세요!!")
				f.show_name.focus()
				return
				}
			else if (f.show_organizer.value==""){
				alert("공연 주최자를 입력해 주세요!!")
				f.show_organizer.focus()
				return
			}
			else if (f.startDate.value==""){
				alert("시작 날짜를 입력해 주세요!!")
				f.startDate.focus()
				return
			}
			else if (f.endDate.value==""){
				alert("종료 날짜를 입력해 주세요!!")
				f.endDate.focus()
				return
			}
			else if (f.startDate.value>f.endDate.value){
				alert("시작 날짜가 종료 날짜보다 크면 안됩니다. 다시 입력해 주세요!!")
				f.startDate.focus()
				return
			}
			else if (f.genre.value==""){
				alert("공연 장르를 입력해 주세요!!")
				f.genre.focus()
				return
			}
			else if (f.rate.value==""){
				alert("관람 연령가를 입력해 주세요!!")
				f.rate.focus()
				return
			}
			else if (f.duration.value==""){
				alert("공연 시간을 입력해 주세요!!")
				f.duration.focus()
				return
			}
			else if (f.detail.value==""){
				alert("상세 사항을 입력해 주세요!!")
				f.detail.focus()
				return
			}
			else if (f.notice.value==""){
				alert("공지 사항을 입력해 주세요!!")
				f.notice.focus()
				return
			}
			document.f.submit()
		}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
	<style>
		.w3-lobster {
		  font-family: "Lobster", serif;
		}
		.w3-button {width:150px;}
</style>
<!-- 공연의 이름, 주최자 ,기간,장르,관람연령가,공연시간,세부사항,공지사항만 수정하고 포스터는 따로 처리하기로 한다. -->
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">Show Update Page</p>
		</div>
	<form name = "f" action = "showmanage_updateok.do" method = "POST">
		<input type="hidden" name="show_ID" value="${getShow.show_ID}"/>
	<br>
	<br>
	<div align = "center" style="width:70%">
	<table border="1" class="w3-table w3-striped w3-border">
		<tr>
			<th align="center" width="20%">공연 이름</th>
			<td align="center" width="60%"><input type= "text" name = "show_name" value = "${getShow.show_name}" maxlength='20'></td>
		</tr>
		<tr>
			<th align="center" width="20%">공연 주최자</th>
			<td align="center" width="60%"><input type= "text" name = "show_organizer" value = "${getShow.show_organizer}" maxlength='20'></td>
		</tr>
		<tr>
			<th align="center" width="20%">기간</th>
			<td align="center" width="60%"><input type= "date" name = "startDate" value = "${getShow.startDate}">~
							<input type= "date" name = "endDate" value = "${getShow.endDate}"></td>
		</tr>
		<tr>
			<th align="center" width="20%">장르</th>
			<td align="center" width="60%">
				<select name = "genre">
					<option value = "드라마">드라마</option>
					<option value = "판타지">판타지</option>
					<option value = "호러">호러</option>
					<option value = "희극">희극</option>
					<option value = "비극">비극</option>
				</select>
			</td>
		</tr>
		<tr>
			<th align="center" width="20%">나이 제한</th>
			<td align="center" width="60%">
				<select name = "rate">
					<option value = "전체 이용가">전체 이용가</option>
					<option value = "12세 이용가">12세 이용가</option>
					<option value = "15세 이용가">15세 이용가</option>
					<option value = "19세 이용가">청소년 관람 불가</option>
				</select>
			</td>
		</tr>
		<tr>
			<th align="center" width="20%">공연 시간</th>
			<td align="center" width="60%"><input type= "text" name = "duration" value = "${getShow.duration}" maxlength='10'>분</td>
		</tr>
		<tr>
			<th align="center" width="20%">세부 사항</th>
			<td align="center" width="60%"><textarea rows = "7" cols = "50" name = "detail">${getShow.detail}</textarea></td>
		</tr>
		<tr>
			<th align="center" width="20%">공지 사항</th>
			<td align="center" width="60%"><textarea rows = "7" cols = "50" name = "notice">${getShow.notice}</textarea></td>
		</tr>
		<tr>
			<th align="center" width="20%">공연 영상 주소</th>
			<td align="center" width="60%"><input type= "text" name = "videoLink" value = "${getShow.videoLink}" maxlength='150' style="width:600px;font-size:13px;"></td>
		</tr>
		<tr>
			<td align = "center" colspan = "2">
				<div align = "center">
				<input type = "button" value = "전송" onclick = "location = 'javascript:check()'">
				&nbsp;&nbsp;
				<input type = "button" value = "메인" onclick = "location = 'showmanage_main.do'">
				</div>
			</td>
		</tr>
	</table>
	</div>
	</form>
</div>