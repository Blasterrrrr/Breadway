<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
		.login-container{
		    margin-top: 5%;
		    margin-bottom: 5%;
		}
		.login-logo{
		    position: relative;
		    margin-left: -41.5%;
		}
		.login-logo img{
		    position: absolute;
		    width: 20%;
		    margin-top: 19%;
		    background: #282726;
		    border-radius: 4.5rem;
		    padding: 5%;
		}
		.login-form-1{
		    padding: 9%;
		    background:#282726;
		    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
		}
		.login-form-1 h3{
		    text-align: center;
		    margin-bottom:12%;
		    color:#fff;
		}
		.login-form-2{
		    padding: 9%;
		    background: #f05837;
		    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
		}
		.login-form-2 h3{
		    text-align: center;
		    margin-bottom:12%;
		    color: #fff;
		}
		.btnSubmit{
		    font-weight: 600;
		    width: 50%;
		    color: #282726;
		    background-color: #fff;
		    border: none;
		    border-radius: 1.5rem;
		    padding:2%;
		}
		.btnForgetPwd{
		    color: #fff;
		    font-weight: 600;
		    text-decoration: none;
		}
		.btnForgetPwd:hover{
		    text-decoration:none;
		    color:#fff;
		}
	</style>
</head>

<div class="container login-container">
            <div class="row">
                <div class="col-md-6 login-form-1">
                <form action = "consumer_login_ok.do" method = "post">
					<input type = "hidden" name="root" value="${root}">
                    <h3>일 반 회 원</h3>
                        <div class="form-group">
                            <input type="text" class="form-control" name = "consumer_ID" placeholder="아이디" maxlength="41" value = "${cookie.csaveId.value}" />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="consumer_Password" placeholder="비밀번호" maxlength="16" />
                        </div>
                        <div class = "form-group">
                        <c:choose>
							<c:when test="${not empty cookie.csaveId.value}">
								<input type = "checkbox" name = "csaveId" checked/>
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="csaveId" id ="csaveId"/>
							</c:otherwise>
						</c:choose> <font color = "white">아이디 저장하기</font>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" value="Login" />
                        </div>
                        <div class="form-group">
                            <a type="button" class="btnForgetPwd" data-toggle="modal" data-target="#consumerPwModal">
                            <font color="white">Forget Password?</font></a>&nbsp;&nbsp;&nbsp;
                            <a type="button" class="btnForgetPwd" data-toggle="modal" data-target="#consumerIDModal">
                            <font color="white">Forget ID?</font></a>&nbsp;&nbsp;&nbsp;
                            <a type="button" class="btnForgetPwd" data-toggle="modal" data-target="#consumerModal">
                            	<font color="white">Sign up</font></a>
                        </div>
                	</form>
                </div>
                <div class="col-md-6 login-form-2">
                    <div class="login-logo">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                    </div>
                    <h3>기 업 회 원</h3>
                    <form action = "marketer_login_ok.do" method = "post">
						<input type = "hidden" name="root" value="${root}">
                        <div class="form-group">
                            <input type="text" class="form-control" name = "marketer_ID" placeholder="아이디" maxlength="41" value = "${cookie.msaveId.value}" />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name = "marketer_Password" placeholder="비밀번호" maxlength="16" />
                        </div>
                        <div class ="form-group">
                        	<c:choose>
								<c:when test="${not empty cookie.msaveId.value}">
									<input type = "checkbox" name = "msaveId" checked/>
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="msaveId" id ="msaveId"/>
								</c:otherwise>
							</c:choose>
								 <font color = "white">아이디 저장하기</font>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" value="Login" />
                        </div>
                        <div class="form-group">
                            <a type="button" class="btnForgetPwd" data-toggle="modal" data-target="#marketerPwModal">
                            <font color="white">Forget Password?</font></a>&nbsp;&nbsp;&nbsp;
                            <a type="button" class="btnForgetPwd" data-toggle="modal" data-target="#marketerIDModal">
                            <font color="white">Forget ID?</font></a>&nbsp;&nbsp;&nbsp;
                            <a type="button" class="btnForgetPwd" data-toggle="modal" data-target="#marketerModal">
                            	<font color="white">Sign up</font></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
   
		<!-- The Modal -->
		  <div class="modal fade" id="consumerModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">일반 회원 가입 확인</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		         	<form name="f" action="consumer_check.do" method="post">
					<table width="500" class="outline">
						<tr>
							<th width="20%">이름</th>
							<td>
								<input type="text" name="consumer_Name" class="box" placeholder="이름을 입력해주세요." required="required">
							</td>
						</tr>
						<tr>
							<th width="20%">이메일</th>
							<td>
								<input type="text" name="consumer_Email" class="box" maxlength="30" placeholder="example@naver.com" required="required">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="조회" class="btn btn-secondary">
								<input type="reset" value="취소" class="btn btn-secondary" data-dismiss="modal">
							</td>
						</tr>
					</table>
				</form>
		        </div> 
		      </div>
		    </div>
		  </div>
		  
		  <!-- The findIDModal -->
		  <div class="modal fade" id="consumerIDModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">아이디찾기</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		        <form name = "f" action = "consumer_findID.do" method = "post">
				<table width = "500" class = "outline">
				<tr>
					<th width = "20%">이름</th>
					<td><input type = "text" name = "consumer_Name" class = "box" placeholder="이름을 입력해주세요." required="required"></td>
				</tr>
				<tr>
					<th width = "20%">이메일</th>
					<td><input type="text" name="consumer_Email" class="box" maxlength="30" placeholder="example@naver.com" required="required"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<input type = "submit" value = "조회" class="btn btn-secondary">
						<input type = "reset" value = "취소" class="btn btn-secondary" data-dismiss="modal">
					</td>
				</tr>
				</table>
				</form>
		        </div> 
		      </div>
		    </div>
		  </div>
		   <!-- The findPwModal -->
		  <div class="modal fade" id="consumerPwModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">아이디찾기</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		        <form name = "f" action = "consumer_findPW.do" method = "post">
				<table width = "500" class = "outline">
				<tr>
					<th width = "20%">이름</th>
					<td><input type = "text" name = "consumer_Name" class = "box" placeholder="이름을 입력해주세요."></td>
				</tr>
				<tr>
					<th width = "20%">아이디</th>
					<td><input type = "text" name="consumer_ID" placeholder="아이디를 입력해주세요."></td>
				</tr>
				<tr>
					<th width = "20%">이메일</th>
					<td><input type="email" name="consumer_Email" class="box" maxlength="30" placeholder="example@naver.com"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<input type = "submit" value = "조회" class="btn btn-secondary">
						<input type = "reset" value = "취소" class="btn btn-secondary" data-dismiss="modal">
					</td>
				</tr>
				</table>
				</form>
		        </div> 
		      </div>
		    </div>
		  </div>		  		  
		  
		 
		  		<!-- The Modal -->
		  <div class="modal fade" id="marketerModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">기업 회원 가입 확인</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		         	<form name="f" action="marketer_check.do" method="post">
					<table width="500" class="outline">
						<tr>
							<th width="20%">회원명</th>
							<td><input type="text" name="marketer_Name" class="box" placeholder="이름을 입력해주세요." required="required"></td>
						</tr>
						<tr>
							<th width="20%">이메일</th>
							<td><input type="text" name="marketer_Email" class="box" maxlength="30" placeholder="example@naver.com" required="required">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="조회" class="btn btn-secondary">
								<input type="reset" value="취소" class="btn btn-secondary" data-dismiss="modal">
							</td>
						</tr>
					</table>
				</form>
		        </div> 
		      </div>
		    </div>
		  </div>
		  
		  <!-- The findIDModal -->
		  <div class="modal fade" id="marketerIDModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">아이디 찾기</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		        <form name = "f" action = "marketer_findID.do" method = "post">
				<table width = "500" class = "outline">
				<tr>
					<th width = "20%">이름</th>
					<td><input type = "text" name = "marketer_Name" class = "box" placeholder="이름을 입력해주세요." required="required"></td>
				</tr>
				<tr>
					<th width = "20%">이메일</th>
					<td><input type="text" name="marketer_Email" class="box" maxlength="30" placeholder="example@naver.com" required="required"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<input type = "submit" value = "조회" class="btn btn-secondary">
						<input type = "reset" value = "취소" class="btn btn-secondary" data-dismiss="modal">
					</td>
				</tr>
				</table>
				</form>
		        </div> 
		      </div>
		    </div>
		  </div>
		   <!-- The findPwModal -->
		  <div class="modal fade" id="marketerPwModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">비밀번호 찾기</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		        <form name = "f" action = "marketer_findPW.do" method = "post">
				<table width = "500" class = "outline">
				<tr>
					<th width = "20%">이름</th>
					<td><input type = "text" name = "marketer_Name" class = "box" placeholder="이름을 입력해주세요."></td>
				</tr>
				<tr>
					<th width = "20%">아이디</th>
					<td><input type = "text" name="marketer_ID" placeholder="아이디를 입력해주세요."></td>
				</tr>
				<tr>
					<th width = "20%">이메일</th>
					<td><input type="email" name="marketer_Email" class="box" maxlength="30" placeholder="example@naver.com"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<input type = "submit" value = "조회" class="btn btn-secondary">
						<input type = "reset" value = "취소" class="btn btn-secondary" data-dismiss="modal">
					</td>
				</tr>
				</table>
				</form>
		        </div> 
		      </div>
		    </div>
		  </div>		  		  
		 
</body>
</html>