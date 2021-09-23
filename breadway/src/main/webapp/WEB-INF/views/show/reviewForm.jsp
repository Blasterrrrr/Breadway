<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<div class="container" align="center" >
				 <form name = "review" action = "musical_review_ok.do" method = "post">
					<input type = "hidden" name = "show_ID" value = "${view[0].SHOW_ID}">
					<input type ="hidden" name="consumer_UID" value = "${sessionScope.consumer.getConsumer_UID()}">
					<table style="border :0px solid black; border-collapse: collapse;" class="table" >
						<tr>
							<th>공연명</th>
							<td>
								${view[0].SHOW_NAME}</td>
						</tr>
						<tr>
							<th>관람일시</th>
							<td>
							<select name = "view_date">
							<c:forEach var = "view" items = "${view}">
								<option value = "${view.SCHEDULE_DATE}">${view.SCHEDULE_DATE} / ${view.SCHEDULE_TIME}</option>
							</c:forEach>
							</select>	
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type = "text" name = "rev_subject" >
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								<input type ="text" name = "writer" value = "${sessionScope.consumer.getConsumer_Name()}" readOnly>
							</td>
						</tr>
						<tr>
							<th>별점</th>
							<td>
								<select name ="score">
									<option value = "★★★★★">★★★★★</option>
									<option value = "★★★★☆">★★★★☆</option>
									<option value = "★★★☆☆">★★★☆☆</option>
									<option value = "★★☆☆☆">★★☆☆☆</option>
									<option value = "★☆☆☆☆">★☆☆☆☆</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td style="vertical-align:middle">
							<textarea name="rev_content" rows="10" cols="100%"  class="form-control" required="required"></textarea></td>
							
						</tr>
						<tr>
							<td colspan ="2">
								<input type = "button" value = "목록" class="btn btn-secondary" onclick="history.back();">
								<input type = "submit" value = "확인" class="btn btn-secondary">
								<input type = "button" value = "취소" class="btn btn-secondary"onclick="history.back();">
							</td>
						</tr>
					</table>
				</form>
				</div>