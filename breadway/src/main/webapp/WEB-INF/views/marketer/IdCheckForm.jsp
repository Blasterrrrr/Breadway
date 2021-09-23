<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>아이디 중복 확인창</title>
	<script>
	function blankCheck(){
		var marketer_ID = check.marketer_ID.value();
		marketer_ID = marketer_ID.trim();
		if(marketer_ID.length<5){
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
		return true;
	}
	</script>
</head>
<body>
	<div align = "center">
	<h3> 아이디 중복 확인</h3>
	<form name = "check" method = "post" action = "marketer_idCheck_ok.do" onsubmit = "return blankCheck()" class="form">
	아이디 : <input type = "text" name = "marketer_ID" maxlength = "10" autofocus>
	<input type = "submit" value = "중복확인" class="btn btn-secondary">
	</form>
	</div>
</body>
</html>