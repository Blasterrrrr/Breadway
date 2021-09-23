<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<title>캐스트 등록</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function success(){
		if(fff.cast_Name.value != "" && fff.cast_Photo.value != ""){
			alert("등록되었습니다.");
		}
	}
</script>
<div align="center" class="container" style="margin-top:30px;">
	<h2>캐스트 등록하기</h2>
	<form name="fff" action="cast_Add_Ok.mkt" method="post" enctype="multipart/form-data">
	<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
		<input type="hidden" name="cast_PhotoName">
		<table border="1" class="table table-bordered">
			<tr>
				<th align="center" width="15%" class="text-center">Musical Name</th>
				<td>${sessionScope.show_Name}</td>
			</tr>
			<tr>
				<th align="center" width="15%" class="text-center">Play Part</th>
				<td lang="zh">
					<select name="cast_Part" class="form-control" >
						<c:forEach var="rList" items="${newRoleList}">
							<option value="${rList}">${rList} 役</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th align="center" width="15%" class="text-center">Cast Name</th>
				<td><input type="text" name="cast_Name" size="20"  class="form-control" required /></td>
			</tr>
			<tr>
				<th align="center" width="15%" class="text-center">Cast Photo</th>
				<td>
					<input type="file" accept="image/*" name="cast_Photo" class="form-control-file" required="required">
				</td>
			</tr>	
		</table>
		<p><p>
		<button type="submit" class="btn btn-secondary" onclick="javascript:success();">등록하기</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="window.location='cast_All.mkt?show_ID=${sessionScope.show_ID}'">취소</button>
	</form>
</div>
