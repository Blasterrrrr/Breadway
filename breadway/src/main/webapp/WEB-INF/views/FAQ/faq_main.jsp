<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
         <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
         <%@ page import="java.net.URLEncoder" %>

<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<c:import url="/top.do">
	<c:param name="title" value="고객센터"/>
</c:import>


			<div class="container" align="center">
			<p>
    		<h1>무엇을 도와드릴까요?</h1>
    		<p>
    		<p>
    		</div>
    	
    		<div class="container" >
    		<h3>서 비 스 별 질 문</h3>
    		</div>
    		
    		<br><br>
    		<form name="f" action="faq_keywordList.do" method="post">
    		<div class="container"  align="center">

			
    		<button type="submit" name="keyword" value="예매"
    			class="btn btn-outline-dark"  style='width:130px; border:solid 4px black; padding:7px 7px 7px 7px; heigth:130px; border-radius: 5%;'><i style='font-size:75px' class='fas'>&#xf07a;</i><br><h4>예         매</h4></button>
			 &nbsp;
    		 &nbsp;
    		<button type="submit" name="keyword" value="취소"
    		class="btn btn-outline-dark"  style='width:130px; border:solid 4px black; padding:7px 7px 7px 7px; heigth:130px; border-radius: 5%;'><i style='font-size:75px' class='fas'>&#xf273;</i><br><h4>취         소</h4></button>
			 &nbsp;
    		 &nbsp;
    		<button type="submit" name="keyword" value="개인정보"
    		class="btn btn-outline-dark"  style='width:130px; border:solid 4px black; padding:7px 7px 7px 7px; heigth:130px; border-radius: 5%;'><i style='font-size:75px' class='fas'>&#xf47f;</i><br><h4>개인정보</h4></button>
			 &nbsp;
			 &nbsp;
    		<button type="submit" name="keyword" value="공연정보"
    		class="btn btn-outline-dark"  style='width:130px; border:solid 4px black; padding:7px 7px 7px 7px; heigth:130px; border-radius: 5%;'><i style='font-size:75px' class='fas'>&#xf530;</i><br><h4>공연정보</h4></button>
    		</div>
    		<br>
    		<div class="container"  align="center" >

    		<button type="submit" name="keyword" value="결제방법"
    		class="btn btn-outline-dark"  style='width:130px; border:solid 4px black; padding:7px 7px 7px 7px; heigth:130px; border-radius: 5%;'><i style='font-size:75px' class='fas'>&#xf1f9;</i><br><h4>결제방법</h4></button>
			 &nbsp;
    		 &nbsp;
    		<button type="submit" name="keyword" value="환불규정"
    		class="btn btn-outline-dark"  style='width:130px; border:solid 4px black; padding:7px 7px 7px 7px; heigth:130px; border-radius: 5%;'><i style='font-size:75px' class='fas'>&#xf4b9;</i><br><h4>환불규정</h4></button>
			 &nbsp;
    		 &nbsp;
    		<button type="submit" name="keyword" value="기타"
    		class="btn btn-outline-dark"  style='width:130px; border:solid 4px black; padding:7px 7px 7px 7px; heigth:130px; border-radius: 5%;'><i style='font-size:75px' class='fas'>&#xf550;</i><br><h4>기         타</h4></button>
			 
			 &nbsp;
			 &nbsp;
    		<button type="button"  onclick="location.href='musical_loginCheck.do?root=inquiry_writeForm.do'" class="btn btn-outline-dark"  style='width:130px; border:solid 4px black; padding:7px 7px 7px 7px; heigth:130px; border-radius: 5%;'><i style='font-size:75px' class='fas'>&#xf27a;</i><br><h4>1:1문의</h4></button>
    		</div>
    		</form>
    		<c:if test="${keyword == null}">
    		<div class="container" >
    		<br>
    		<br>
    		
    		<h3>자 주 묻 는 질 문</h3>
    		<form name="f" action="faq_find.do?mode=find" method="post">
            <div class="input-group w-50" id="floatRight">
              <input type="text" class="form-control" name="question" placeholder="search..." aria-label="Input group example" aria-describedby="basic-addon1"/>
                	<button type="submit" class="btn btn-secondary">
               		<svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
					</svg>
					</button>
            </div>
            </form>
            </div>
            <c:choose>
            	<c:when test="${mode == 'find'}">
            		<c:if test="${empty faqFind}">
            			<div class="container">
            			<h4>찾으시는 FAQ가 없습니다.</h4>
            			</div>
            		</c:if>
            		<c:if test="${not empty faqFind}">
            			<div class="container" style="width:1200px">
						<table class="table table-striped"  > 
						<thead>
						<tr height="25">
							<th width="40">NO.</th>
							<th width="380">제목</th>
							<th width="180">키워드</th>
							</tr>
							</thead>
							
						<c:forEach var="dto" items="${faqFind}" varStatus="status">
						
						<tr height="25">
						
							<td>${dto.num}</td>
							<td>
							<div class="container" >
								<!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
								<div class="panel panel-default">
								<div class="panel-heading" role="tab">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collpase${status.index}" aria-expanded="false">
								${dto.question }
								</a>
								</div>
								<div id="collpase${status.index}" class="panel-collapse collapse" role="tabpanel">
								<div class="panel-body">
								${dto.answer }
								</div>
								</div>
								</div>
								</div>
								</div>
							</td>
							<td>${dto.keyword}</td>
							
						</tr>
				
						</c:forEach>
						</table>
						</div>
            		</c:if>
            		</c:when>
            		
            	<c:otherwise>	
    			<div class="container" style="width:1200px">
				<table class="table table-striped"  > 
						<c:choose>
						<c:when test="${empty faq_list}">
						<tr>
						<td colspan="2">
							등록된 FAQ가 없습니다.
						</td>
						</tr>
						</c:when>
						<c:otherwise>
						<thead>
						<tr height="25">
							<th width="40">NO.</th>
							<th width="380">제목</th>
							<th width="180">키워드</th>
							</tr>
							</thead>
						<c:forEach var="dto" items="${faq_list}" varStatus="status">
						
						<tr height="25">
							<td>${dto.num}</td>
							<td><div class="container" >
<!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
<!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
<div class="panel panel-default">
<div class="panel-heading" role="tab">
<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collpase${status.index}" aria-expanded="false">
${dto.question }
</a>
</div>
<div id="collpase${status.index}" class="panel-collapse collapse" role="tabpanel">
<div class="panel-body">
${dto.answer }
</div>
</div>
</div>
</div>
</div></td>
							<td>${dto.keyword}</td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						</table>
						</div>
						</c:otherwise>
						</c:choose>
						
						</c:if>
						
						<c:if test="${not empty keyword}">
						<div class="container" >
    					<br>
    					<br>
    					<h3>${keyword} 관련 질문</h3>
						<form name="f" action="faq_find.do?mode=find" method="post">
         			   <div class="input-group w-50" id="floatRight">
           				 <input type="text" class="form-control" name="question" placeholder="search..." aria-label="Input group example" aria-describedby="basic-addon1"/>
                		<button type="submit" class="btn btn-secondary">
               			<svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
						</svg>
						</button>
         	   </div>
         	   </form>
         	   </div>
    			<div class="container" style="width:1200px">
				<table class="table table-striped"  > 
						<c:choose>
						<c:when test="${empty keywordList}">
						<tr>
						<td colspan="2">
							${keyword} 관련 등록된 FAQ가 없습니다.
						</td>
						</tr>
						</c:when>
						<c:otherwise>
						<thead>
						<tr height="25">
							<th width="40">NO.</th>
							<th width="380">제목</th>
							<th width="180">키워드</th>
							</tr>
							</thead>
						<c:forEach var="dto" items="${keywordList}" varStatus="status">
						
						<tr height="25">
							<td>${dto.num}</td>
							<td>
							<div class="container" >
								<!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
								<div class="panel panel-default">
								<div class="panel-heading" role="tab">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collpase${status.index}" aria-expanded="false">
								${dto.question }
								</a>
								</div>
								<div id="collpase${status.index}" class="panel-collapse collapse" role="tabpanel">
								<div class="panel-body">
								${dto.answer }
								</div>
								</div>
								</div>
								</div>
								</div>
							</td>
							<td>${dto.keyword}</td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						</table>
						</div>

				</c:if>		
					
						<div class="container" style="display: flex; justify-content: center;">
						<ul class="pagination" >
						<c:if test="${rowCount > 0}">
						<c:if test="${startPage > pageBlock}">
  						<li class="page-item"><a class="page-link" href="faq_content.do?pageNum=${startPage-pageBlock}">이전</a></li>
  						</c:if>
  						<c:forEach var="i" begin="${startPage}" end="${endPage}">
  						<li class="page-item"><a class="page-link" href="faq_main.do?pageNum=${i}">${i}</a></li>
  						</c:forEach>
  						<c:if test="${endPage < pageCount}">
  						<li class="page-item"><a class="page-link" href="faq_content.do?pageNum=${startPage+pageBlock}">다음</a></li>
						</c:if>
						</c:if>
						</ul>
						</div>
						
						
		 		
    </body>
