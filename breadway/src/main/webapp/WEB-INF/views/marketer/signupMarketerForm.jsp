<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- signupForm.jsp -->
<html>
<head>
 <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>회원가입</title>
	<script type="text/javascript">
	
		
	      function checkValue()
	        {	
	
	        	var form = document.f;
	        	
	        	if(!form.marketer_ID.value){
	        		alert("아이디를 입력하세요");
	        		return false;
	        	}
	            if(!form.marketer_Password.value){
	                alert("비밀번호를 입력하세요.");
	                return false;
	            }
	            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	            if(form.marketer_Password.value != form.PasswordCheck.value){
	                alert("비밀번호를 동일하게 입력하세요.");
	                return false;
	            } 
	            if(!form.marketer_Phone.value){
	            	alert("전화번호를 입력해주세요");
	            	return false;
	            }
	          	if(isNaN(form.marketer_Phone.value)){
	          		alert("전화번호는 - 제외한 숫자만 입력해주세요.");
	          		return false;
	          	}
	        	form.submit();
	        }
	        // 취소 버튼 클릭시 로그인 화면으로 이동
	        function goLoginForm() {
	            location.href="login.do";
	        }
	        function openIDCheck(){
	        	window.name = "parentForm"
	        	window.open("marketer_IdCheckForm.do","아이디 중복 확인", "width=500, height=200, resizable=no, scrollbars=no");
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
	<form name = "f" action = "marketer_Input.do" method = "post" onsubmit="return checkValue()">
		<table class="table">
  				<tr>
					<td colspan="2" align=center>회원가입</td>
 				</tr>
				<tr>
					<td width="150">아이디</td>
					<td class="m3">
						<input type="text" name="marketer_ID" id="marketer_ID" placeholder="아이디" readOnly>
						<input type="button" onclick="openIDCheck()" value="ID 중복확인" class="btn btn-secondary">
					</td>
  				</tr>
  				<tr>
					<td width="150">비밀번호</td>
					<td class="m3">
						<input type="password" name="marketer_Password" placeholder="비밀번호" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">비밀번호 확인</td>
					<td class="m3">
						<input type="password" name="PasswordCheck" placeholder="비밀번호확인" class="box">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">이름</td>
					<td class="m3">
						<input type="text" name="marketer_Name" value = "${param.marketer_Name}" class="box" maxlength = "30" readOnly>
				</tr>
  				 <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" name="marketer_Email" maxlength="50" value = "${param.marketer_Email}" readOnly>
                    </td>
                </tr>
                <tr>
                	<td>전화번호</td>
                	<td>
                		<input type = "text" name = "marketer_Phone" maxlength ="11" >
                	</td>
                </tr>
  				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="가입" class="btn btn-secondary">  
						<input type="button" value="취소" onclick="history.back();" class="btn btn-secondary">
					</td>
  				</tr>
  			</table>
	</form>
	</div>
	</div>
	</div>
</body>
</html>