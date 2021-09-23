<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<title>캐스트 수정</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function success(){
		if(fff.cast_Name.value != ""){
			alert("수정되었습니다.");
		}
	}
</script>
<div align="center" class="container" style="margin-top:30px;">
	<h2>캐스트 수정하기</h2>
	<form name="fff" action="cast_Update_Ok.mkt" method="post" enctype="multipart/form-data">
	<input type="hidden" name="show_ID" value="${sessionScope.cast_ID}">
	<c:forEach var="cList" items="${get_castInfo}">
		<input type="hidden" name="cast_ID" value="${cList.cast_ID}">
		<input type="hidden" name="cast_PhotoName" value="${cList.cast_PhotoName}">
		<table border="1" width="100%" class="table table-bordered">
			<tr>
				<th align="center" width="15%" class="text-center">Musical Name</th>
				<td>${sessionScope.show_Name}</td>
			</tr>
			<tr>
				<th align="center" width="15%" class="text-center">Play Part</th>
				<td>
					<select name="cast_Part" class="form-control">
						<c:forEach var="rList" items="${sessionScope.newRoleList}">
							<c:choose>
								<c:when test="${castPart == rList}">
									<option value="${castPart}" selected>${castPart}</option>
								</c:when>
								<c:otherwise>
									<option value="${rList}">${rList}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th align="center" width="15%" class="text-center">Cast Name</th>
				<td><input type="text" name="cast_Name" value="${cList.cast_Name}" size="20"  class="form-control" required="required"></td>
			</tr>
			<tr>
				<th align="center" width="15%" class="text-center">Cast Photo</th>
				<td>
					<input type="file" accept="image/*" name="cast_Photo" class="form-control-file">
					<p>selected: ${cList.cast_PhotoName}
					<input type="hidden" name="cast_Photo2" value="${cList.cast_PhotoName}">
				</td>
			</tr>	
		</table>
		<br>
		<button type="submit" class="btn btn-secondary" onclick="javascript:success();">수정하기</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="window.location='cast_All.mkt?show_ID=${sessionScope.show_ID}'">취소</button>
		</c:forEach>
	</form>
</div>
