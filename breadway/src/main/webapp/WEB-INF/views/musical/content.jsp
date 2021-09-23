<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- main index.jsp -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>메인화면</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
   <script type = "text/javascript">
  function openMap(placenum){
  	window.open("mapload.do?placenum="+placenum, "_blank","width=500, height=300, resizable=no, scrollbars=no");

  }
  </script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
	      <li><a href="#">뮤지컬목록</a></li>
	      <li><a href="musical_content.do?show_id=1">뮤지컬상세보기</a></li>
	      <li><a href="musical_cast.do">부트스트랩 예시화면</a></li>
      </ul>
       <c:choose>
      	<c:when test = "${sessionScope.consumer == null}||${sessionScope.marketer == null}">
      	<ul class="nav navbar-nav navbar-right">
       	 <li><a href="login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       	 <li><a href ="signup.do">회원가입</a></li>
       	</ul>
       	</c:when>
       	<c:otherwise>
       	<ul class="nav navbar-nav navbar-right">
       	 <li><a href="logout.do"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
       	 <li><a href ="mypage.do">마이페이지</a></li>
       	</ul>
       	</c:otherwise>
       </c:choose>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="musical_reviewlist.do?show_ID=${getShow.SHOW_ID}">후기게시판</a></p>
      <p><a href="musical_qnalist.do?show_ID=${getShow.SHOW_ID}">문의게시판</a></p>
    </div>
    <div class="col-sm-8 text-left"> 
      <h1>뮤지컬상세정보</h1>
     	<table border = "1" width = "80%" >
     		<tr>
     			<td  align="center" rowspan = "3">
     			<img src="<spring:url value='/resources/files/show/${getShow.POSTERNAME}' />" class="aligncenter" width="200" height="250">
     			</td>
     			<td>제목</td>
     			<td colspan ="2">
     				${getShow.SHOW_NAME}
     			</td>
     		</tr>
     		<tr>
     			<td>장소</td>
     			<td colspan = "2" id = "placename">
     			<a href = "javascript:openMap('${getShow.THEATRE_ID}')">${getShow.THEATRE_NAME}</a></td>
     		</tr>
     		<tr>
     			<td>상세설명</td>
     			<td>${getShow.DETAIL}</td>
     			<td>
     				<a href = "#">[예매하기]</a>
     			</td>
     	</table>
		  <h2>공연정보</h2>
			<table border = "1" width = "80%" >
				<tr>
	     			<td>극장주소 </td>
	     			<td colspan="2">공연안내사항</td>
	     		</tr>
	     		<tr>
	     			<td rowspan = "3">	
	     			 ${getShow.THEATRE_ADDRESS}</td>
	     			<td>공연기간</td>
	     			<td>${startDate}~${endDate}</td>
	     		</tr>
	     		<tr>
	     			<td>관람등급</td>
	     			<td>${getShow.RATE}</td>
	     		</tr>
	     		<tr>
	     			<td>주의사항</td>
	     			<td>${getShow.NOTICE}</td>
	     		</tr>
	     		<tr>
	     			<td>스토리</td>
	     			<td colspan = "2"> ${getShow.SHOW_CONTENT}</td>
	     		</tr>
	     		<tr>
	     			<td>장르태그</td>
	     			<td colspan="2"># ${getShow.GENRE}</td>
	     		</tr>
	     		<tr>
	     		<c:forEach var ="part" items = "${getPart}">
	     		<td>
	     			<img src="<spring:url value='/resources/files/cast/${part.cast_PhotoName}' />" alt="배우사진" class="rounded-circle"><br>
	     			역할 ${part.cast_Part}<br>
	     			배우 ${part.cast_Name}
	     		</td>
	     		</c:forEach>
	     		</tr>
	     	</table>
      <hr>
      <h3>Test</h3>
      <p>Lorem ipsum...</p>
    </div>
    <div class="col-sm-2 sidenav">  
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>