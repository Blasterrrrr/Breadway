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
<title>회원정보수정창</title>
	<script type = "text/javascript">
 	function checkValue()
	        {	
	        	var form = document.edit;
	        	
	            if(form.consumer_Password.value != form.PasswordCheck.value){
	                alert("비밀번호를 동일하게 입력하세요.");
	                return false;
	            }
	 
	            if(isNaN(form.consumer_Phone.value)){
	          		alert("전화번호는 - 제외한 숫자만 입력해주세요.");
	          		return false;
	          	}
	  			return true;
	        	form.submit();
	        }
 	function myPage()
 		{
 			location.href = "consumer_mypage.do";
 		}
 	</script>
</head>
<body>
<nav class="navbar navbar-light bg-dark">
<p><p>
</nav>
<div class="container" align="center" >
 <div class="row content">
  <div class="col-sm-2"></div>
   <div class="col-sm-8 text-left">
	<form name = "edit" action = "consumer_edit_ok.do" method = "post" onsubmit="return checkValue()">
	<input type = "hidden" name = "consumer_UID" value = "${getConsumer.consumer_UID}">
		<table width="600" align="center" class="table">
  				<tr>
					<td colspan="2" align="center">회원정보수정</td>
 				</tr>
				<tr>
					<td width="150" class="m3">아이디</td>
					<td class="m3">
						<input type="text" name="consumer_ID" value = "${getConsumer.consumer_ID}" readOnly>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">비밀번호</td>
					<td class="m3">
						<input type="password" name="consumer_Password" placeholder="비밀번호" value = "${getConsumer.consumer_Password}" required>
						
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">비밀번호 확인</td>
					<td class="m3">
						<input type="password" name="PasswordCheck" placeholder="비밀번호확인" value = "${getConsumer.consumer_Password}" required>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">이름</td>
					<td class="m3">
						<input type="text" name="consumer_Name" value = "${getConsumer.consumer_Name}" readOnly>
				</tr>
  				 <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" name="consumer_Email" maxlength="50" value = "${getConsumer.consumer_Email}" readOnly>
                    </td>
                </tr>
                <tr>
                	<td>전화번호</td>
                	<td>
                		<input type = "text" name = "consumer_Phone" maxlength ="11" value = "${getConsumer.consumer_Phone}" required>
                	</td>
                </tr>
  				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정" class="btn btn-secondary">  
						<input type="reset" value="취소" class="btn btn-secondary" onclick="history.back();">
					</td>
  				</tr>
  			</table>
	</form>
	</div>
	</div>
	</div>
</body>
</html>