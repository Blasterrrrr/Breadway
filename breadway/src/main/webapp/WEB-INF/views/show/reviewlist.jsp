<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- reviewlist.jsp -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>후기게시판</title>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type = "text/javascript">
  function logincheck(){
		alert("로그인하고 이용해주세요!")
		location.href="login.do"
	}
	 var bDisplay = true;
	  function doDisplay(num){
		  var con = document.getElementById(num);
		  if(con.style.display =='none'){
			  con.style.display ='block';
			
		  }else{
			  con.style.display ='none';
		  }
	  }
  </script>
</head>
<body>
<c:import url="/top.do">
	<c:param name="title" value="공연후기"/>
</c:import>
<c:import url="/show_summary.do" >
	<c:param name="page" value="review"/>
	<c:param name="show_ID" value="${show_ID}"/>	
</c:import>

<div class="container" style="padding-top:30px"> 
  <div class="row content">
  <div class="col-sm-1"></div>
    <div class="col-sm-10 text-left"> 
      <h2>후기게시판</h2>
		<table border = "0" width = "90%" class="table table-hover">
		<thead>
			<tr>
				<td colspan = "3" align = "center">
				<form name="f" action="musical_findReivew.do" method="post">
				<input type = "hidden" name ="show_ID" value = "${show_ID}">
					<select name="search">
						<option value="writer">작성자</option>
						<option value="rev_subject">제목</option>
					</select>
					<input type="text" name="searchString">
					<input type="submit" class="btn btn-secondary" value="찾기">
				</form>
				</td>
				<td align = "center">
				<c:choose>
					<c:when test = "${sessionScope.consumer!=null}">
					  <a href="musical_reserveCheck.do?show_ID=${show_ID}&consumer_UID=${sessionScope.consumer.getConsumer_UID()}">
                            	[글작성]</a>
					</c:when>
					<c:otherwise>
						<a href = "javascript:logincheck()">[글작성]</a>
					</c:otherwise>
				</c:choose>
				</td> <!-- reviewForm으로 이동 -->
			</tr>
			<tr>
				<th>작성자</th>
				<th>작성일</th>
				<th>공연별점</th>
				<th>관람일시</th>
			</tr>
			</thead>
			<tr>
		<c:if test = "${endRow > rowCount}">
			<c:set var ="endRow" value = "${rowCount}"/>
		</c:if>
		<c:choose>
			<c:when test="${empty listReview}">
				<td colspan = "4">
					등록된 후기가 없습니다.
				</td>
			</c:when>
			<c:otherwise>
			<c:forEach var="dto" items="${listReview}">
			<thead>
			<tr>
				<td>${dto.writer}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.score}</td>
				<td>${dto.view_date}</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="4" style="word-bread:break-all">${dto.rev_content}
				</td>
			</tr>
			<tr>
				<td colspan="4" align ="right">
				<c:if test="${dto.writer==consumer.getConsumer_Name()}">
							<a href = "review_delete.do?show_ID=${dto.show_ID}&num=${dto.num}">[삭제]</a>
							<a href="review_update.do?show_ID=${dto.show_ID}&num=${dto.num}">[수정]</a>
				</c:if>
				</td>
			</tr>
			</tbody>
			</c:forEach>
			</c:otherwise>
			</c:choose>
	</table>
	<div align="center">
			<c:if test="${rowCount>0}">
			<c:if test = "${endPage>pageCount}">
			<c:set var = "endPage" value = "${pageCount}"/>
			</c:if>
			<c:if test="${startPage>pageBlock}">
			<a href = "musical_reviewlist.do?show_ID=1&pageNum=${startPage - pageBlock}">[이전]</a>		
			</c:if>
			<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
			<a href = "musical_reviewlist.do?show_ID=1&pageNum=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage<pageCount}">
			<a href = "musical_reviewlist.do?show_ID=1&pageNum=${startPage + pageBlock}">[다음]</a>
			</c:if>
		</c:if>
     </div>
    </div>
  </div>
</div>


</body>
</html>