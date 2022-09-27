<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 수술/치료</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.search {
		width : 600px;
		margin: 0 auto;
	}
</style>
</head>


<body>
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

<script>
<!--
$('.search_select').change(function(){
	
	$.ajax({
		type:"POST",
		data: sdata,
		url : "list_ajax",
		dataType : "json",
		success : function (data) {
			
		}
	})
})
-->

</script>
<div class="container mb-5 mainbody" style="height:300px;margin-top:220px;">
  	 			
 	<div class="search">
 		<div>
	 		<form action="${pageContext.request.contextPath}/product/education_list" method="post"> 
	 			<h5>결과내 재검색</h5>
		    	<input name = "search_word" value="${search_word}" class="form-control" type="text" placeholder="검색어를 입력해 주세요">
		    	<button class="search-btn" type="submit">검색</button><hr>
		    	<input type="hidden" name="item_category" value="education">		    	
		    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		    </form>
		</div>
	</div>	
</div>


</div>

</body>
</html>