<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- faq_input.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/showmanage_top.do">
	<c:param name="title" value="관리자 페이지 FAQ입력"></c:param>
</c:import>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
<style>
	.w3-lobster {
	  font-family: "Lobster", serif;
	}
	.w3-button {width:150px;}
</style>
<script type="text/javascript">
		function check(){
			if (f.keyword.value==""){
				alert("키워드를 입력해 주세요!!")
				f.keyword.focus()
				return
				}
			if (f.question.value==""){
				alert("질문의 대한 제목을 입력해 주세요!!")
				f.question.focus()
				return
			}
			if (f.answer.value==""){
				alert("질문에 대한 답변을 입력해 주세요!!")
				f.answer.focus()
				return
			}
				document.f.submit()
			}
</script>
<div align="center">
	<br>
		<div class="w3-container w3-lobster">
		  <p class="w3-xxxlarge">Frequently Asked Questions Input Page</p>
		</div>
	<br>
	<div align = "center" style="width:50%">
	<form name = "f" action = "managerfaq_inputok.do" method = "post">
		<table border="1" class="w3-table w3-striped w3-border">
			<tr>
				<td>키워드</td>
				<td>
					<select name = "keyword">
						<option value = "예매">예매</option>
						<option value = "취소">취소</option>
						<option value = "개인정보">개인정보</option>
						<option value = "공연정보">공연정보</option>
						<option value = "결제방법">경제방법</option>
						<option value = "환불규정">환불규정</option>
						<option value = "기타">기타</option>
						<option value = "1:1문의">1:1문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>질문</td>
				<td><input class="w3-input w3-border w3-round-large" type = "text" name = "question" maxlength='100'></td>
			</tr>
			<tr>
				<td>답변</td>
				<td><textarea class="w3-input w3-border w3-round-large" rows = "4" cols = "50" name= "answer"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align = "center">
				<div align = "center">
					<input class="w3-button w3-dark-grey" type = "button" value = "전송" onclick = "javascript:check();">
					<input class="w3-button w3-dark-grey" type = "reset" value = "다시 작성">
					<!-- <a href="javascript:check();">[전송]</a>
					<a href="#">[취소]</a> -->
				</div>	
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>