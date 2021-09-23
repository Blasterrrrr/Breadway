<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%response.setHeader("Pragma", "no-cache"); response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setDateHeader("Expires", 0L); %>

<c:import url="/top.do">
	<c:param name="title" value="마이페이지"></c:param>
</c:import> 
	<br><br><br>
	<div class="container" style="margin-top:30px">
  		<div class="row">
	        <div class="col-sm-4">
	        <ul class="nav nav-pills flex-column">
       			<li class="nav-item">
         			<a class="nav-link active" href="consumer_mypage.do">내정보보기</a>
      		  	</li>
      		  	<li class="nav-item">
      		  		<a class="nav-link" href="musical_myBuyPage.do">예매내역확인</a>
      		  	</li>
		        <li class="nav-item">
		          <a class="nav-link" href="musical_myCancelPage.do">예매취소내역확인</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="inquiry_myInquiry.do">문의내역확인</a>
		        </li>   
		        <li class="nav-item">
		          <a class="nav-link" data-toggle="modal" data-target="#sescessionModal">회원탈퇴</a>
		        </li>
    	  </ul>
	    </div>
	    <div class="col-sm-6 text-center">
	    <div class="container" style="padding-top:30px; padding-bottom:30px;">
	    	<table border = "0" align = "center" width = "80%" height="50%" class="table">
	    	<tr>
	    		<td colspan="2" align = "center"><h3>내정보보기</h3></td>
    		</tr>
    		<tr>
    			<th>이름 </th>
    			<td align = "center">${sessionScope.consumer.consumer_Name}</td>
    		</tr>
    		<tr>
    			<th>아이디 </th>
    			<td align = "center">${sessionScope.consumer.consumer_ID}</td>
    		</tr>
    		<tr>
    			<th>이메일</th>
    			<td align = "center">${sessionScope.consumer.consumer_Email}</td>
    		</tr>
    		<tr>
    			<th>전화번호 </th>
    			<td align = "center">${sessionScope.consumer.consumer_Phone}</td>
    		</tr>
    		<tr>
    			<td colspan="2" align = "center">
    				<a href= "consumer_edit.do">[수정하러가기]</a>
    			</td>
    		</tr>
    		</table>
    	</div>
    	</div>
    </div>
   </div>
   
   <!-- The Modal -->
		  <div class="modal fade" id="sescessionModal">
		    <div class="modal-dialog modal-m">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title">회원탈퇴</h4>
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        </div>
		        <div class="modal-body">
		         	<form name="f" action="consumer_sescession_ok.do" method="post">
					<table width="500" class="table">
						<tr>
							<th width="20%">비밀번호</th>
							<td>
								<input type="password" name="consumer_Password" maxlength="30" placeholder="비밀번호를 입력해주세요" required="required">
							</td>
						</tr>
						<tr>
							<th width="20%">회원탈퇴문구입력</th>
							<td>
								<input type="text" name="sescessiontext" maxlength="50" placeholder="그동안 감사했습니다." required="required">
							</td>
						</tr>
						<tr align = "center">
							<th colspan = "2"><font color = "red">예매내역이 있을 경우 회원 탈퇴가 안됩니다.<br>예매 취소를 하고 진행해주세요</font><br>
							<a href = "musical_myBuyPage.do">[예매내역확인]</a></th>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="탈퇴하기" class="btn btn-secondary">
								<input type="reset" value="취소" class="btn btn-secondary" data-dismiss="modal">
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