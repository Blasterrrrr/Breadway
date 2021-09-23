<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- showmanage_theatrecontent.jsp -->
<script type = "text/javascript">
	function openMap(placenum){
		window.open("showmanage_theatremapload.do?placenum="+placenum, "_blank","width=900, height=500, left = 300, top = 300, resizable=no, scrollbars=no");
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
	<form name = "f" action = "showmanage_theatreupdateForm.do" method = "post">
	<input type = "hidden" name = "theatre_id" value = "${theatrelist.theatre_id}">
	<br>
	<br>
	<div align = "center" style="width:60%">
	<table border="1" class="w3-table w3-striped w3-border">
		<tr>
			<th align="center" width="20%">공연 장소</th>
			<td align="center" width="40%">${theatrelist.theatre_name}</td>
		</tr>
		<tr>
			<th align="center" width="20%">공연 장소 주소</th>
			<td align="center" width="40%">${theatrelist.theatre_address}</td>
		</tr>
		<tr>
			<th align="center" width="20%">공연 장소 지역번호</th>
			<td align="center" width="40%">0${theatrelist.theatre_areacode}</td>
		</tr>
		<tr>
			<th align="center" width="20%">장소</th>
			<td colspan = "2" id = "placename" align="center" width="40%">
				<input class="w3-button w3-dark-grey" type = "button" value = "공연장 지도" onclick = "location = 'javascript:openMap(${theatrelist.theatre_id})'">
			</td>
		</tr>
		<tr>
			<td align = "center" colspan = "2">
			<div class = "w3-center">
				<input class="w3-button w3-dark-grey" type = "submit" value = "수정">
			</div>
			</td>
		</tr>
	</table>
	</div>
	</form>
</div>