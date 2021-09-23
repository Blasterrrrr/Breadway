<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- showmanage_theatreupdate.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
		function check(){
			if (f.show_name.value==""){
				alert("공연 이름를 입력해 주세요!!")
				f.show_name.focus()
				return
				}
			if (f.show_organizer.value==""){
				alert("공연 주최자를 입력해 주세요!!")
				f.show_organizer.focus()
				return
			}
			if (f.startDate.value==""){
				alert("시작 날짜를 입력해 주세요!!")
				f.startDate.focus()
				return
			}
				document.f.submit()
				self.close();
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
<div align="center">
	<c:choose>
	<c:when test = "${empty theatrelist}">
  	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxlarge">Theatre Update Complete</p>
		  <p class="w3-xxlarge">Plead close the window</p>
		</div>
	<br>
  	</c:when>
  	<c:otherwise>
		<form name = "f" action = "showmanage_theatreupdateok.do" method = "POST">
		<input type="hidden" name="theatre_id" value="${theatrelist.theatre_id}"/>
		<br>
		<br>
		<div align = "center" style="width:70%">
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<th align="center" width="30%">공연 장소</th>
				<td align="center" width="40%"><input type= "text" name = "theatre_name" value = "${theatrelist.theatre_name}" maxlength='50'style="width:400px;font-size:13px;"></td>
			</tr>
			<tr>
				<th align="center" width="30%">공연 장소 주소</th>
				<td align="center" width="40%"><input type= "text" name = "theatre_address" value = "${theatrelist.theatre_address}" maxlength='50' style="width:400px;font-size:13px;"></td>
			</tr>
			<tr>
				<th align="center" width="30%">공연 장소 지역번호</th>
				<td align="center" width="40%">
					<select name = "theatre_areacode">
						<option value = "02">02(서울)</option>
						<option value = "032">032(인천)</option>
						<option value = "042">042(대전)</option>
						<option value = "051">051(부산)</option>
						<option value = "052">052(울산)</option>
						<option value = "053">053(대구)</option>
						<option value = "062">062(광주)</option>
						<option value = "064">064(제주도)</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align = "center" colspan = "2">
				<div class = "w3-center">
					<input class="w3-button w3-dark-grey" type="submit" value="수정">
				</div>
				</td>
			</tr>
		</table>
		</div>
		</form>
	</c:otherwise>
	</c:choose>
</div>