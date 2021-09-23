<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
     <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
     
<c:import url="/top.do">
	<c:param name="title" value="메인페이지"/>
</c:import>
   
			<br>
    		<div class="container" align="center">
    		<form name="f" action="musical_mainPage.do?mode=find" method="post">
            <div class="input-group w-100">
              <input type="text" class="form-control" name="show_Name" placeholder="뮤지컬 이름을 입력하세요" aria-label="Input group example" aria-describedby="basic-addon1"/>
                	<button type="submit" class="btn btn-secondary">
               		<svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
					</svg>
					</button>
            </div>
            </form>
            </div>
            <br>
            <br>
    		
    	
    	<c:choose>
    		<c:when test="${mode == 'all'}">
    			<c:choose>
    			
    				<c:when test="${empty allShowList}">
						<td colspan="6" align="center">
    					<h4>상품을 준비 중입니다.</h4>
						</td>
					</c:when>
					
					<c:otherwise>
					
						<div class="container" align="center" >
							<c:forEach var="dto" items="${allShowList}" varStatus="status">
							<c:choose>
								<c:when test="${(status.index % 4)==0 && status.index != 0}">
								<div class="card" style="width:250px; height:450px" id="clear" >
						   			<img class="card-img-top" src="<spring:url value='/resources/files/show/${dto.posterName}' />" alt="Card image" style="width:250px; height:350px">
						   		<div class="card-body" align="left">
						      	<h5 class="card-title">${dto.show_Name}</h5>
						      	<!-- <p class="card-text">ㅇㅇ</p> -->
						      	<a href="musical_content.do?show_ID=${dto.show_ID}" class="btn btn-primary">예매하기</a>
						    	</div>
						  		</div>
						  		</c:when>
						  		<c:otherwise>
						 		<div class="card" style="width:250px; height:450px" id="float" >
						   			<img class="card-img-top" src="<spring:url value='/resources/files/show/${dto.posterName}' />" alt="Card image" style="width:250px; height:350px">
						   		<div class="card-body" align="left">
						      	<h5 class="card-title">${dto.show_Name}</h5>
						      	<!-- <p class="card-text">ㅇㅇ</p> -->
						      	<a href="musical_content.do?show_ID=${dto.show_ID}" class="btn btn-primary">예매하기</a>
						    	</div>
						  		</div>
						  		</c:otherwise>
						  		</c:choose>
						  	</c:forEach>
						  	</div>
					
    					</c:otherwise>
    					
    					</c:choose>
    				</c:when>

    		<c:otherwise>
    			<c:choose>
    				<c:when test="${empty findList}">
    					<td colspan="6" align="center">
    						<h4>해당하는 뮤지컬을 찾을 수 없습니다.</h4>
						</td>
					</c:when>
					
				<c:otherwise>
				
				<div class="container" align="center" >
							<c:forEach var="dto" items="${findList}" varStatus="status">
							<c:choose>
								<c:when test="${(status.index % 4)==0 && status.index != 0}">
								<div class="card" style="width:250px; height:450px" id="clear" >
						   			<img class="card-img-top" src="<spring:url value='/resources/files/show/${dto.POSTERNAME}' />" alt="Card image" style="width:250px; height:350px">
						   		<div class="card-body" align="left">
						      	<h5 class="card-title">${dto.SHOW_NAME}</h5>
						      	<!-- <p class="card-text">ㅇㅇ</p> -->
						      	<a href="musical_content.do?show_ID=${dto.SHOW_ID}" class="btn btn-primary">예매하기</a>
						    	</div>
						  		</div>
						  		</c:when>
						  		<c:otherwise>
						 		<div class="card" style="width:250px; height:450px" id="float" >
						   			<img class="card-img-top" src="<spring:url value='/resources/files/show/${dto.POSTERNAME}' />" alt="Card image" style="width:250px; height:350px">
						   		<div class="card-body" align="left">
						      	<h5 class="card-title">${dto.SHOW_NAME}</h5>
						      	<!-- <p class="card-text">ㅇㅇ</p> -->
						      	<a href="musical_content.do?show_ID=${dto.SHOW_ID}" class="btn btn-primary">예매하기</a>
						    	</div>
						  		</div>
						  		</c:otherwise>
						  		</c:choose>
						  	</c:forEach>
						  	</div>
						  	</c:otherwise>
						  	</c:choose>
						  	</c:otherwise>
						  	</c:choose>
				
    	
    </body>