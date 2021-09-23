<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<title>프로필 업데이트</title>
</head>
<c:import url="/marketer_top" />
<script type="text/javascript">
	function blankCheck(){
		var pwd = fff.marketer_Password.value;
		for(i=0; i<pwd.length; i++){
			var str = pwd.substr(i, 1);
			if(str == " "){
				alert("비밀번호에는 공백을 입력하실 수 없습니다!");
				return;
			}
		}
		alert("프로필을 수정했습니다.");
	}
</script>
<div align="center" class="container" style="margin-top:30px;">
	<h2>내 프로필 수정</h2>
	<form name="fff" action="profile_update_ok.mkt" method="post">
		<input type="hidden" name="marketer_UID" value="${sessionScope.arketer_UID}">
		<table border="1" width="100%" class="table table-bordered">
			<c:forEach var="pList" items="${profile_list}">
			<tr>
				<th class="text-center" width="20%">Marketer ID</th>
				<td><input type="text" class="form-control" name="marketer_ID" value="${pList.marketer_ID}" class="form-control" readOnly></td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Password</th>
				<td><input type="text" name="marketer_Password" class="form-control" value="${pList.marketer_Password}" required="required" placeholder="Password"></td>
			</tr>
			<tr>
				<th class="text-center" width="20%">Name</th>
				<td><input type="text" name="marketer_Name" class="form-control" value="${pList.marketer_Name}" class="form-control"></td>
			</tr>			
			<tr>
				<th class="text-center" width="20%">Email</th>
				<td><input type="text" name="marketer_Email"  class="form-control" value="${pList.marketer_Email}" class="form-control" readOnly></td>
			</tr>		
			<tr>
				<th class="text-center" width="20%">Phone</th>
				<td><input type="text" name="marketer_Phone"  class="form-control" value="${pList.marketer_Phone}" required="required"></td>
			</tr>	
			</c:forEach>
		</table>
		<br>
		<button type="submit" class="btn btn-secondary" onclick="javascript:blankCheck();">수정하기</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="window.location='myPage.mkt'">취소</button>
	</form>
</div>