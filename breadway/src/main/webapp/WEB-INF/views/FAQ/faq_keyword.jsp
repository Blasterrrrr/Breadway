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
    	<tr align="left">
    		<td  valign="top"  colspan="2">
    			<a href="faq_main.do">자주묻는질문</a>
    			<form name="f" action="faq_keyword.do" method="post">
    			<ul>	
    				<li><input type="submit" name="keyword" value="예매" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="keyword" value="조회" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
				</ul>
				</form>
    			<a href="musical_loginCheck.do?root=inquiry_writeForm.do">1:1문의하기</a>
    		
    		</td>
    		<td valign="top" colspan="2" align="center">
    		<h2>${keyword}관련 질문리스트</h2>
				<table border="1"  width="600">
						<c:choose>
						<c:when test="${empty keyword_list}">
						<tr>
						<td colspan="2">
							등록된 FAQ가 없습니다.
						</td>
						</tr>
						</c:when>
						<c:otherwise>
						<tr height="25">
							<td width="40">NO.</td>
							<td width="380">제목</td>
							<td width="180">키워드</td>
						<c:forEach var="dto" items="${keyword_list}" varStatus="status">
						
						<tr height="25">
							<td>${status.count}</td>
							<td><a href="faq_content.do?num=${dto.num}">${dto.question}</a></td>
							<td>${dto.keyword}</td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
		 		</table>
		 		<c:if test="${rowCount > 0}">
			<c:if test="${startPage > pageBlock}">
				<a href="faq_content.do?pageNum=${startPage-pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="faq_main.do?pageNum=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="faq_content.do?pageNum=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</c:if>
    	</tr>
    		</td>
    	</tr>
    </table>
    </body>
