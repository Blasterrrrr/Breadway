<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- message.jsp -->

<form name="f" method="post" action="${url}">
	<input type="hidden" name="root" value="${root}">
	<input type="hidden" name="show_ID" value="${show_ID}">
</form>

<script type="text/javascript">
alert("${msg}");
document.f.submit();
	/* Alert.info("${msg}",function(){
		location.href="${url}";
	}); */
</script>
