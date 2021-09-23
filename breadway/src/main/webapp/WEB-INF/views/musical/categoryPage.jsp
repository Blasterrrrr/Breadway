<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
 <c:import url="/top.do">
 	<c:param name="title" value = "장르별"></c:param>
 </c:import>
    <style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #fff;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper-container {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .swiper-container {
        width: 100%;
        height: 500px;
        margin: 20px auto;
      }
      .append-buttons {
        text-align: center;
        margin-top: 10px;
      }

      .append-buttons button {
        display: inline-block;
        cursor: pointer;
        border: 1px solid #007aff;
        color: #007aff;
        text-decoration: none;
        padding: 4px 10px;
        border-radius: 4px;
        margin: 0 10px;
        font-size: 13px;
      }
    </style>
    
 	<div class="container" style="margin-top:50px">
  		<div class="row">
	        <div class="col-sm-2">
	        <ul class="nav nav-pills flex-column">
       			<li class="nav-item">
         			<a class="nav-link" href="musical_categoryPage.do?genre=drama">드라마</a>
      		  	</li>
      		  	<li class="nav-item">
      		  		<a class="nav-link" href="musical_categoryPage.do?genre=fantasy">판타지</a>
      		  	</li>
		        <li class="nav-item">
		          <a class="nav-link" href="musical_categoryPage.do?genre=horror">호러</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="musical_categoryPage.do?genre=comedy">희극</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="musical_categoryPage.do?genre=tragedy">비극</a>
		        </li>   
    	  </ul>
	    </div>
    	<p><p>
    	<div class="col-sm-10 text-center">
	   	 <div class="container" style="padding-top:30px; padding-bottom:30px;">
		    <h3>${genre}</h3>
		    <p><p><p><p><p>	
    		<c:choose>
    			<c:when test="${empty showList}">
		    				<h4>해당하는 뮤지컬이 없습니다.</h4>
    			</c:when> 
    			<c:otherwise>
    			
    			
		    		<div class="swiper-container mySwiper">
				      <div class="swiper-wrapper">
				      <c:forEach var="dto" items="${showList}" varStatus="status">
				        <div class="swiper-slide">
				        <c:choose>
				        <c:when test="${(status.index % 3)==0 && status.index != 0}">
				        <div class="card" style="width:250px; height:450px" id="clear" >
						   			<img class="card-img-top" src="<spring:url value='/resources/files/show/${dto.posterName}' />" alt="Card image" style="width:250px; height:350px">
						   		<div class="card-body" align="left">
						      	<h5 class="card-title">${dto.show_Name}</h5>
						     
						      	<a href="musical_content.do?show_ID=${dto.show_ID}" class="btn btn-primary">예매하기</a>
						    	</div>
						  		</div>
						  		</c:when>
						  		<c:otherwise>
						  		 <div class="card" style="width:250px; height:450px" id="clear" >
						   			<img class="card-img-top" src="<spring:url value='/resources/files/show/${dto.posterName}' />" alt="Card image" style="width:250px; height:350px">
						   		<div class="card-body" align="left">
						      	<h5 class="card-title">${dto.show_Name}</h5>
						     
						      	<a href="musical_content.do?show_ID=${dto.show_ID}" class="btn btn-primary">예매하기</a>
						    	</div>
						  		</div>
						  		</c:otherwise>
						  		</c:choose>
				    	</div>
				    	
				    	
				     </c:forEach>
				      </div>
				      <div class="swiper-button-next"></div>
				      <div class="swiper-button-prev"></div>
				      <div class="swiper-pagination"></div>
				    </div>
    			</c:otherwise>
    	</c:choose>
    </div>
    </div>
    </div>
    </div>
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 3,
        spaceBetween: 10,
        slidesPerGroup: 3,
        loop: true,
        loopFillGroupWithBlank: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
    </body>
