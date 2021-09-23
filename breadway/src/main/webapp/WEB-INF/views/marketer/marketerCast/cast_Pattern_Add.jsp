<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<title>캐스팅패턴 추가</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function success(){
		alert("등록되었습니다.");
	}
</script>
<div align="center" class="container" style="margin-top:30px;">
	<form name="fff" action="cast_Pattern_Add_Ok.mkt" method="post">
	<input type="hidden" name="show_ID" value="${sessionScope.show_ID}">
	<input type="hidden" name="schedule_ID" value="${schedule_ID}">
		<h2>뮤지컬&lt;${sessionScope.show_Name}&gt; 캐스팅 패턴 등록하기</h2>
		<table border="1" width="50%" class="table table-bordered">
			<thead>
				<tr align="center">
					<th>Role Name</th>
					<th>Cast Name</th>
				</tr>
			</thead>
			<c:forEach var="rList" items="${newRoleList}">
				<tr>
					<td bgcolor="#ebebeb">${rList}</td>
					<td lang="zh">
						<select name="cast_Name" class="form-control">
						<c:forEach var="i" begin="0" end="${list_castInfo.size()-1}">
							<c:forEach var="castName" items="${list_castInfo.get(i).getCast_Name()}">
								<option value="${castName}">${castName} (${list_castInfo.get(i).getCast_Part()} 役)</option>
							</c:forEach>
						</c:forEach>
						</select>
					</td>
				</tr>
				</c:forEach>
		</table>
		<br>
		<button type="submit" class="btn btn-secondary" onclick="javascript:success();">등록하기</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>	
	</form>
</div>
