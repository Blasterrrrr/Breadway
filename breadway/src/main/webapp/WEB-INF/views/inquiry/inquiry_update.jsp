


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
         <%@ page import="java.net.URLEncoder" %>

<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<c:import url="/top.do">
	<c:param name="title" value="1대1문의 수정"/>
</c:import>


			<div class="container" align="center">
			<p>
    		<h1>1:1문의 수정하기</h1>
    		<p>
    		<p>
    		</div>
    	


    </head>



    
    <div class="container mt-3" style="padding-right: 300px; padding-left: 300px; margin-right: auto; margin-left: auto;" >
  <form name="inquiry" action="inquiry_updateok.do" method="post" onsubmit="return check()">
  <input type="hidden" name="num" value="${getInquiry.num}"/>
		<input type="hidden" name="consumer_UID" value="${sessionScope.consumer.consumer_UID}">
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">이름</span>
      </div>
      <input type="text" class="form-control"  id="usr" name="name" value="${sessionScope.consumer.consumer_Name}" readonly>
    </div>
    
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control"  id="usr" name="subject" value="${getInquiry.subject}">
    </div>
    
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">이메일</span>
      </div>
      <input type="text" class="form-control"  id="usr" name="email" value="${sessionScope.consumer.consumer_Email}"  readonly >
    </div>
    
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      </div>
      <textarea  class="form-control"  id="usr" name="content" cols="20" rows="20" >${getInquiry.content}</textarea>
  	<br>
    <button type="submit" class="btn btn-primary" >Submit</button>
    
    <button type="reset" class="btn btn-primary" >reset</button>
    
  </form>
</div>
     <script type="text/javascript">
	function check(){
		if (inquiry.subject.value==""){
			alert("제목을 입력해 주세요!!")
			inquiry.subject.focus()
			return false
		}
		if (inquiry.content.value==""){
			alert("내용을 입력해 주세요!!")
			inquiry.content.focus()
			return false
		}
		if (inquiry.email.value==""){
			alert("이메일을 입력해 주세요!!")
			inquiry.content.focus()
			return false
		}

		return true
	}
</script>
    
    	
    </body>
