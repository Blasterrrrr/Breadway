<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>아이디 중복 결과</title>
	<script type = "text/javascript">
	function Idinput(){
		 opener.document.getElementById("consumer_ID").value = document.getElementById("id").value
		window.close();
	}
	</script>
</head>
<body>
	<div align = "center">
	<h3> 아이디 중복 확인 결과</h3><br>
	입력 ID :<input type = "text" id = "id" value = "${consumer_ID}" readOnly><br>
	<c:choose>
	<c:when test="${res==0}">
		<p> 사용 가능한 아이디입니다.</p>
		<input type = "button" value = "아이디 사용하기" onclick = "Idinput()">
	</c:when>
	<c:otherwise>
		<p style = 'color:red'> 해당 아이디는 사용할 수 없습니다.</p>
	</c:otherwise>
	</c:choose>
	<hr>
	<a href = "javascript:history.back()">[다시시도]</a>
	&nbsp; &nbsp;
	<a href = "javascript:window.close()">[창닫기]</a>
	</div>
</body>
</html>