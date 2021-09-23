<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>문의수정</title>
</head>
<body>
<div class="container" style="padding-top:70px"> 
		<form name = "qnA" action = "quest_update_ok.do" method="post">
		<input type = "hidden" name = "show_ID" value = "${show_ID}">
		<input type="hidden" name="num" value="${getQuest.num}" />
	<table border = "0" width = "80%" class="table">
		<tr>	
			<th colspan = "2"><h2>문 의 수 정</h2></th>
		</tr>
		<tr>
			<th width="100">작성자</th>
			<td>
				<input type = "text" name = "writer" value = "${sessionScope.consumer.consumer_Name}">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type = "text" name ="qna_subject" value="${getQuest.qna_subject}" maxlength="30">
			</td>
		</tr>
		<tr>
			<th>문의내용</th>
			<td>
				<textarea name = "qna_content"  rows="10" cols="50" >${getQuest.qna_content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<input type = "submit" value = "등록" class="btn btn-secondary">
				<input type = "button" value = "취소" onclick="javascript:history.back();" class="btn btn-secondary">
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>