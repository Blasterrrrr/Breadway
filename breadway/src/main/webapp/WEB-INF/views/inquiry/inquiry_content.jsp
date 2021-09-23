<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
    <head>
    	<title>문의내역리스트</title>
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
    	
    	
    	<th colspan="4" valign="top" align="center">문의내역상세보기<br>
		<table border="1" width="600">
			<tr> 
				<th bgcolor="yellow" width="20%">글번호</th>
				<td align="center" width="30%">${getInquiry.num}</td>
				<th bgcolor="yellow" width="20%">작성자</th>
				<td align="center" width="30%">${getInquiry.name}</td>
			</tr>
			<tr>
				<th bgcolor="yellow" width="20%">이메일</th>
				<td align="center" width="30%">${getInquiry.email}</td>
				<th bgcolor="yellow" width="20%">작성일</th>
				<td align="center" width="30%">${getInquiry.inqdate}</td>
			</tr>
	<tr>
		<th bgcolor="yellow" width="20%">글제목</th>
		<td width="80%" colspan="3">${getInquiry.subject}</td>
	</tr>
	<tr>
		<th bgcolor="yellow" width="20%">문의내용</th>
		<td width="80%" colspan="3"><pre>${getInquiry.content}</pre></td>
	</tr>
	<tr>
		<th bgcolor="yellow" width="20%" align="left" colspan="4">답변내용</th>
		<c:choose>
			<c:when test="${empty getInquiryAnswer}"  >
			<tr>
			<td colspan="4" width="80%" valign="top" colspan="3"  height="100"><pre>답변중입니다. 기다려주세요.</pre></td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr>
			<td colspan="4" width="80%" valign="top"  colspan="3"  height="100"><pre>${getInquiryAnswer.content}</pre></td>
			</tr>
			</c:otherwise>
		</c:choose>
		
	</tr>
	<tr bgcolor="yellow" >
		<td align="right" colspan="4" align="center">

			<input type="button" value="글수정"
				onclick="window.location='inquiry_updateForm.do?num=${getInquiry.num}'">
				&nbsp;&nbsp;&nbsp;
			<input type="button" value="글삭제" 
				onclick="window.location='inquiry_delete.do?num=${getInquiry.num}'">
				&nbsp;&nbsp;&nbsp;
			<input type="button" value="글목록" onclick="window.location='inquiry_myInquiry.do'">
		</td>
	</tr>
</table>

 
    	</th>
    	</tr>	
    </table>
    </body>