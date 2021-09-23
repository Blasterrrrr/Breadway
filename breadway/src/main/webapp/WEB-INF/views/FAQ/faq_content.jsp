<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
    <head>
    	<title>FAQ메인 페이지</title>
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
    	<tr>
    		<td  valign="top" align="center" colspan="2">
    			<a href="faq_main.do">자주묻는질문</a><br>
    			<a href="musical_loginCheck.do?root=inquery">1:1문의하기</a>
    		</td>
    		<td valign="top" colspan="2" align="center">
    		<h2>자주 묻는 질문 리스트</h2>
				<table border="1"  width="600">
						
						<tr height="25">
							<td width="380">질문 제목 :${getFAQ.question}</td>
							<td width="180">키워드 :${getFAQ.keyword}</td>
						<tr height="25" >
							<td colspan="2">답변<br>${getFAQ.answer}</td>
						</tr>
		 		</table>
		 		
    </table>
    </body>
