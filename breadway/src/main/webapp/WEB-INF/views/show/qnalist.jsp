<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- reviewlist.jsp -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>�ı�Խ���</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type = "text/javascript">
	function logincheck(){
		alert("�α����ϰ� �̿����ּ���!")
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
	<c:param name="title" value="���� ���ǻ���"/>
</c:import>
<c:import url="/show_summary.do" >
	<c:param name="page" value="qnalist"/>
	<c:param name="show_ID" value="${show_ID}"/>	
</c:import>
    
<div class="container" style="padding-top:30px">   
  <div class="row content">
  <div class="col-sm-1"></div>
    <div class="col-sm-10 text-left"> 
		<h2>���ǰԽ���</h2>
		<table border = "0" width = "90%" class="table table-hover">
		<thead>
			<tr>
				<td colspan="2" align = "center">
				<form name="f" action="musical_findqna.do" method="post">
					<input type = "hidden" name ="show_ID" value = "${show_ID}">
					<b>���� ����</b>
				<input type="text" name="searchString">
				<input type="submit" class="btn btn-secondary" value="ã��">
				</form>
				</td>
				<td align = "center" >
				<c:choose>
					<c:when test = "${sessionScope.consumer!=null}">
						<a href = "musical_QNAForm.do?show_ID=${show_ID}">[���ۼ�]</a>
					</c:when>
					<c:otherwise>
						<a href = "javascript:logincheck()">[���ۼ�]</a>
					</c:otherwise>
				</c:choose>
				</td> <!-- reviewForm���� �̵� -->
			</tr>
			<tr>
				<th>��������</th>
				<th>�ۼ��ڸ�</th>
				<th>�ۼ���</th>
			</tr>
			</thead>
			<tr>
		<c:if test = "${endRow > rowCount}">
			<c:set var ="endRow" value = "${rowCount}"/>
		</c:if>
		<c:choose>
			<c:when test="${empty listQuest}">
				<td colspan = "6">
					��ϵ� ���ǰ� �����ϴ�.
				</td>
			</c:when>
			<c:otherwise>
			<c:forEach var="dto" items="${listQuest}">
			<tr>
				<th><a href = "javascript:doDisplay('${dto.num}')">${dto.qna_subject}</a></th>
				<th> ${dto.writer}</th>
				<th> ${dto.reg_date}</th>
			</tr>
			<tr>
				<td colspan = "3" style="word-bread:break-all">
					<div id = "${dto.num}" style = "display:none">
					 	<p>${dto.qna_content}</p>
					 <hr>
					<c:choose>
						<c:when test = "${empty dto.qna_reContent.trim()}">
						<p>��ϵ� �亯�� �����ϴ�.</p>
						</c:when>
						<c:otherwise>
						<p>${dto.qna_reContent}</p>
						</c:otherwise>
					</c:choose>
					 </div>
				</td>
			</tr>
			<tr>
				<td colspan ="3" align ="right">
					<c:choose>
						<c:when test= "${sessionScope.consumer.getConsumer_Name()==dto.writer}">
						 <a href = "quest_updateForm.do?show_ID=${dto.show_ID}&qnanum=${dto.num}">[���Ǽ���]</a>
					 	<a href = "quest_delete.do?show_ID=${dto.show_ID}&qnanum=${dto.num}">[���ǻ���]</a>
					 </c:when>
					 <c:otherwise>
					 <c:if test="${sessionScope.marketer.getMarketer_UID() == showMarketer}">
					 <a href = "quest_reContent.do?show_ID=${dto.show_ID}&qnanum=${dto.num}">[����ۼ�]</a>
					 <a href = "marketer_quest_updateForm.do?show_ID=${dto.show_ID}&qnanum=${dto.num}">[��ۼ���]</a>
					 <a href = "marketer_quest_delete.do?show_ID=${dto.show_ID}&qnanum=${dto.num}">[��ۻ���]</a>
					 </c:if>
					 </c:otherwise>
					 </c:choose>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
	</table>
	<div align = "center">
		<c:if test="${rowCount>0}">
			<c:if test = "${endPage>pageCount}">
			<c:set var = "endPage" value = "${pageCount}"/>
			</c:if>
			<c:if test="${startPage>pageBlock}">
			<a href ="musical_qnalist.do?show_ID=1&pageNum=${startPage - pageBlock}">[����]</a>		
			</c:if>
			<c:forEach var = "i" begin = "${startPage}" end = "${endPage}">
			<a href = "musical_qnalist.do?show_ID=1&pageNum=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage<pageCount}">
			<a href = "musical_qnalist.do?show_ID=1&pageNum=${startPage + pageBlock}">[����]</a>
			</c:if>
		</c:if>
		</div>
   	 </div> 
	</div>
</div>
</body>
</html>