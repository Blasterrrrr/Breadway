<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- PosterUpdate -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>파일 업로드</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
	<style>
		.w3-lobster {
		  font-family: "Lobster", serif;
		}
		.w3-button {width:150px;}
	</style>
  </head>
  <body>
  	<div align = "center">
  		<c:choose>
  		<c:when test = "${empty getShow.show_name}">
  			<br/><br/>
  			<div class="w3-container w3-lobster">
			  <p class="w3-xxxlarge">File Upload Complete</p>
			  <p class="w3-xxlarge">Plz closse the window</p>
			</div>
  		</c:when>
  		<c:otherwise>
			<br/><br/>
			<h3>${getShow.show_name}의 이미지 수정</h3>
			<form action="PosterUpdateOk.do" method="post" enctype="multipart/form-data">
			 	<input type="hidden" name="show_id" value="${getShow.show_ID}"/>
			<table>
				<tr>
				    <td align = "center">포스터 이미지 선택 </td>
				</tr>
				<tr>
					<td align = "center"><input type="file" name="poster"/></td>
				</tr>
				<tr>
					<td align = "center">
				   		<button type="submit">Upload</button>
			 		</td>
				</tr>
				</table>
			</form>
		</c:otherwise>
		</c:choose>
	</div>
  </body>
</html>