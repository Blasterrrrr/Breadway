<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메뉴&로그인 Nav -->
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<link href="//cdn.jsdelivr.net/gh/snz-hayden/toolo/fonts/nanum_squareround/nanum_squareround.css" rel="stylesheet">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>${title}</title>
</head>
<style type="text/css">
	@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
	
	body, div{
		font-family: 'NanumSquare', sans-serif !important;
	}
	
	:lang(zh) {
		font-family:'LiHei Pro Medium', sans-serif
	}
	
	.table {
        border-collapse: collapse;
        width: 100%;
        white-space: nowrap;
        margin-top: 0;
        margin-bottom: 0;
        margin-left: 0;
        margin-right: 0;
      }
      
      .table-fixed {
        white-space: normal !important;
      }
	
	 ul.nav-pills {
	 	padding-top: 30px;
	 	position: fixed;
	 }
	 
	a:hover {
		color: orange;
	}
	
	 th{
	 	font-size: 20px !important;
	 	text-align: center;
	 	vertical-align: middle !important;
	 	background-color: #c9e5ff;
 	}
	 
	 div.col-8 div {
	  	padding-top: 50px;
	  	position: static;
	 }
 	
 	tr, td {
 		font-size: 17px !important;
 		vertical-align: middle !important;
 	}
 		
	.nav-link:active {
		background-color: orange;
		color: white;
	}
	 
	 .form-control{
 		width: auto;
 	}
 	
</style>
<body>
<nav class="navbar navbar-light bg-dark">
	<div class="container">
	<ul class="nav justify-content-start">
	<span class="navbar-brand mb-0 h1">
		<a type="button" href="musical_mainPage.do" style="color: #fff; font-size: 22px; font-weight: bold">BreadWay</a>
	</span>
	</ul>	

	<ul class="nav justify-content-end">
	<c:choose>
		<c:when test = "${empty sessionScope.marketer}">		
			<li class="nav-item"><a class="nav-link" style="color: #fff; font-size: 20px;" href="login.do">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
			  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
			</svg> Login</a></li>
		</c:when>
		<c:otherwise>
			<li class="nav-item"><a class="nav-link" style="color: #fff; font-size: 20px;" href="logout.do">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
			<path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
			</svg>
			 Logout</a></li>
			<c:choose>
				<c:when test="${not empty sessionScope.marketer}">
				<li class="nav-item"><a class="nav-link" style="color: #fff; font-size: 20px;" href ="myPage.mkt">마이페이지</a></li>
				</c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>
	</ul>
	</div>
</nav>

