<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>

<!-- 메뉴&로그인 Nav -->
<html>
<head>
	   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>${title }</title>
<style>
        #float {
                    float: left;
                    margin-left: 20px;
                    margin-bottom: 20px;
                    }
        #clear {
              float: left;
              clear: both;
                    margin-left: 20px;
                    margin-bottom: 20px;
        }
        
        #centerWindow { 
        position:absolute;
         width:100px;
          height:100px; 
          top:50%; 
          left:50%; 
          margin-top:-50px; 
          margin-left:-50px; 
          }
            
    </style>
</head>
<body>
<nav class="navbar navbar-light bg-dark">
	<div class="container">
	<ul class="nav justify-content-start">
		<span class="navbar-brand mb-0 h1">
			<a type="button" href="musical_mainPage.do" style="color: #fff;">BreadWay</a>
		</span>
	
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#" style="color: #fff;" id="navbardrop" data-toggle="dropdown">
		뮤지컬
		</a>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="musical_categoryPage.do?genre=action">장르별</a>
			<a class="dropdown-item" href="musical_categoryPage_area.do">지역별</a>
			<a class="dropdown-item" href="musical_categoryPage_date.do">날짜별</a>
		</div>
	</li>
	</ul>	
  
	<ul class="nav justify-content-end">
	<c:choose>
		<c:when test = "${empty sessionScope.consumer && empty sessionScope.marketer}">		
			<li class="nav-item"><a class="nav-link" style="color: #fff;" href="login.do">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
			  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
			</svg> Login</a></li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" style="color: #fff;" id="signup_navbardrop" data-toggle="dropdown">
				 회원가입
				</a>
			<div class="dropdown-menu">
				<a type="button" class="dropdown-item" data-toggle="modal" data-target="#consumerModal">일반회원</a>
				<a type="button" class="dropdown-item" data-toggle="modal" data-target="#marketerModal">기업회원</a>
			</div>
			</li>			
		  
			<li class="nav-item"><a class="nav-link" style="color: #fff;" href ="faq_main.do">고객센터</a></li>
		</c:when>
		<c:otherwise>
			<li class="nav-item"><a class="nav-link" style="color: #fff;" href="logout.do">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
			<path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
			</svg>
			 Logout</a></li>
			<c:choose>
				<c:when test="${not empty sessionScope.consumer}">
				<li class="nav-item"><a class="nav-link" style="color: #fff;" href ="consumer_mypage.do">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" style="color: #fff;" href ="faq_main.do">고객센터</a></li>
				</c:when>
				<c:when test="${not empty sessionScope.marketer}">
				<li class="nav-item"><a class="nav-link" style="color: #fff;" href ="myPage.mkt">마이페이지</a></li>
				</c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>
	</ul>
	</div>
</nav>

<div class="container">
		<!-- The Modal -->
		  <div class="modal fade" id="consumerModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">일반 회원 가입 확인</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		         	<form name="f" action="consumer_check.do" method="post">
					<table width="500" class="outline">
						<tr>
							<th width="20%">이름</th>
							<td>
								<input type="text" name="consumer_Name" class="box" placeholder="이름을 입력해주세요." required="required">
							</td>
						</tr>
						<tr>
							<th width="20%">이메일</th>
							<td>
								<input type="text" name="consumer_Email" class="box" maxlength="30" placeholder="example@naver.com" required="required">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="조회" class="btn btn-secondary">
								<input type="reset" value="취소"  class="btn btn-secondary" data-dismiss="modal">
							</td>
						</tr>
					</table>
				</form>
		        </div> 
		      </div>
		    </div>
		  </div>
		  </div>
		  
		  <div class="container">
		  		<!-- The Modal -->
		  <div class="modal fade" id="marketerModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">기업 회원 가입 확인</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		         	<form name="f" action="marketer_check.do" method="post">
					<table width="500" class="outline">
						<tr>
							<th width="20%">이름</th>
							<td><input type="text" name="marketer_Name" class="box" placeholder="이름을 입력해주세요." required="required"></td>
						</tr>
						<tr>
							<th width="20%">이메일</th>
							<td><input type="text" name="marketer_Email" class="box" maxlength="30" placeholder="example@naver.com" required="required">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="조회" class="btn btn-secondary">
								<input type="reset" value="취소" class="btn btn-secondary" data-dismiss="modal">
							</td>
						</tr>
					</table>
				</form>
		        </div> 
		      </div>
		    </div>
		  </div>
		 </div> 