<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:import url="/top.do">
	<c:param name="title">지역별</c:param>
</c:import>
    	<div class="container" style="margin-top:50px">
  		<div class="row">
	        <div class="col-sm-2" align = "center">
    		<form name="f" action="musicalFind.do" method="post">
    		<input type="hidden" name="show_name">
    			<h3>지역별</h3>
    			<ul class="nav nav-pills flex-column">	
    				<li><input type="submit" name="area" value="서울" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="경기" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="인천" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="대전" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="부산" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="울산" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="대구" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="광주" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
					<li><input type="submit" name="area" value="제주도" style="background-color:transparent;  cursor:pointer; border:0px transparent solid;"></li>
				</ul>
				</form>
				</div>
		
			<div class="col-sm-10 text-center">
	   		<div class="container" style="padding-top:30px; padding-bottom:30px;">
	   		<div align = "center">
    		<form name="f" action="musicalFind.do" method="post">
				<table border="0">
					<tr>
						<td>
						<select name="area">
    						<option value="서울">서울</option>
    						<option value="경기">경기</option>
    						<option value="인천">인천</option>
    						<option value="대전">대전</option>
    						<option value="부산">부산</option>
    						<option value="울산">울산</option>
    						<option value="대구">대구</option>
    						<option value="광주">광주</option>
    						<option value="제주도">제주도</option>
    						
    					</select>
							<input type="text" name="show_Name" placeholder="뮤지컬 이름을 검색하세요" style="width:300px;font-size:15px;">
							<input type="submit" value="검색" class="btn btn-secondary">
						</td>
					</tr>			
		 		</table>
			</form>
			<c:choose>
    		<c:when test="${isEmpty == 'null'}">

    				<h4>해당하는 뮤지컬이 없습니다.</h4>

    		</c:when> 
    		<c:otherwise>
    		<div class="container" align="center" >
							<c:forEach var="dto" items="${findList}" varStatus="status">
							<c:choose>
								<c:when test="${(status.index % 3)==0 && status.index != 0}">
								<div class="card" style="width:250px; height:450px" id="clear" >
						   			<img class="card-img-top" src="<spring:url value='/resources/files/show/${dto.POSTERNAME}' />" alt="Card image" style="width:250px; height:350px">
						   		<div class="card-body" align="left">
						      	<h5 class="card-title">${dto.SHOW_NAME}</h5>
						      	<!-- <p class="card-text">ㅇㅇ</p> -->
						      	<a href="musical_content.do?show_ID=${dto.show_ID}" class="btn btn-primary">예매하기</a>
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
		</div>
	</div>
	</div>
	</div>
		</div>
    </body>
