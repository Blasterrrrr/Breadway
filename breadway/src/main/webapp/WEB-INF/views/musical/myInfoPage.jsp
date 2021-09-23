<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>

    <head>
    	<title>내 정보 확인</title>
    </head>
    <body>
    <table border="1" align="center" width="800" height="650">

    	<tr align="center"  height="100" >
    	<td width="10%">
    	<h5><a href="musical_categoryPage.do?genre=action">장르별</a></h5>
    	<h5><a href="musical_categoryPage_area.do">지역별</a></h5>
    	</td>
    	<td width="10%">
    	<h5><a href="musical_categoryPage_date.do">날짜별</a></h5>
    	</td>
    	<td>
    	<h1><a href="musical_mainPage.do">브로드웨이</a></h1>
    	</td>
    	<td width="20%">
    	<c:choose>
    		<c:when test="${sessionScope.consumer == null}">
    			<h5><a href="login.do">로그인</a></h5>
    			<h5><a href ="signup.do">회원가입</a></h5>
    		</c:when> 
    		<c:otherwise>
    			<h5><a href="logout.do">로그아웃</a></h5>
    		</c:otherwise>
    	</c:choose>
    		<h5><a href="musical_loginCheck.do?root=consumer_mypage.do">마이페이지</a>
    		<h5><a href="faq_main.do">고객센터</a></h5>
    	</td>
    	
    	</tr>
    	
    	<tr>
    	<td colspan="2" rowspan="2" valign="top">
    		<ul>
    			<li><a href="musical_myInfo.do">내정보보기</a></li>
    			<li><a href="musical_myBuyPage.do">예매내역확인</a></li>
    			<li><a href="musical_myCancelPage.do">예매취소내역확인</a></li>
    			<li><a href="inquiry_myInquiry.do">문의내역확인</a></li>
    		</ul>
    	</td>
    	
    	
    	<th colspan="3" valign="top">내정보보기
    		<ul>
    			<li align="left">이름 : <input type="text" name="name" class="box" value="${consumerDTO.consumer_Name}" readOnly></li>
    			<li align="left">아이디 : <input type="text" name="name" class="box" value="${consumerDTO.consumer_ID}" readOnly></li>
    			<li align="left">이메일 : <input type="text" name="name" class="box" value="${consumerDTO.consumer_Email}" readOnly></li>
    			<li align="left">전화번호 : <input type="text" name="name" class="box" value="${consumerDTO.consumer_Phone}" readOnly></li>
    		</ul>
    		<a href= "consumer_edit.do">[수정하러가기]</a>
    	</th>
    	</tr>	
    	
				
		
<%--     	<c:out value="${consumerDTO }"/> --%>
    	<%-- <c:set var="dto" value="${consumerDTO}">
    	
  		</c:set> --%>
    		
    		
    	
    	
    </table>
    </body>