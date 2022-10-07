<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 수술/치료</title>
<link href="${pageContext.request.contextPath}/resources/css/Product/detail.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
table img {height: 100px}
</style>

<script>
$(function(){
	
	/** 취소하기버튼을 누르면 ajax에서 해당 찜한상품을 삭제하고 alert으로 알림**/
	$('#deleteWish').on('click',function(){
		
		var wish_id = $('#hidden_wishID').val();
		
		$.ajax({
			url:"deleteWish",
			data : {"WISH_ID": wish_id},
			success: function(res){
				console.log(res);
				alert("찜 취소 되었습니다.");
				document.location.href = document.location.href;
			},//success
		})//ajax end
		
		
	})//deletewish button click function
	
	
})//ready function


</script>
</head>

<body>
	<jsp:include page="../member/header.jsp" />
	<div class="container">
		<table class="table table-striped">
			<div><h3>찜한 상품</h3></div>
			<thead>				
				<tr>
					<th>번호</th>
					<th>상품이미지</th>				
					<th>상품이름</th>			
					<th>상품금액</th>	
					<th>취소</th>	
				</tr>
			</thead>
			<c:set var="num" value="${listcount-(page-1)*limit}" />
    		<c:forEach var="w" items="${wishList}">
     			<tr>
      				<td><%-- 번호 --%>
       					<c:out value="${num}"/>
       					<c:set var="num" value="${num-1}" /> <%--num=num-1;의미 --%>
	  				</td>
	  				
	  				<td><%-- 상품 이미지 --%>
	  					<img src="/pet_topia/upload${w.WISH_ITEM_IMAGE }">
	  					<input type="hidden" value="${w.WISH_ID }" id="hidden_wishID">
	  				</td>
	  				
	 				<td class="text-left"><%--상품이름 --%>
	  					<div>
	  	 					<a href="${pageContext.request.contextPath}/product/detail?ITEM_ID=${w.WISH_ITEM_ID}">
	  	    					<span class="text-dark">
		        					<c:out value="${w.WISH_ITEM_NAME}" escapeXml="true"/>
	  	    					</span>
	  						</a>
	  					</div>
	  				</td>
	  				
	  				<td><%-- 상품 금액 --%>
	  					<div>${w.WISH_ITEM_PRICE}</div>
	  				</td>
	  				
	  				<td>
	  					<button id="deleteWish" class="btn btn-danger">취소하기</button>
	  				</td>
	  			</tr>
	  		</c:forEach>
		</table>
	</div>
	
	<!-- 페이징 처리 -->
	<div style="position:absolute;left:45%;margin-top:80px">
	<ul class="pagination modal-2 text-center">
	  
	 <c:if test="${page <= 1 }">
	  <li><a href="#" class="prev"><i class="fas fa-angle-double-left"></i></a></li>
	 </c:if> 
	 <c:if test="${page > 1 }">
	  <li>
		<a class="next" href="${pageContext.request.contextPath}/comment/myPost?page=${page-1}&member_id=<sec:authentication property="principal.Username"/>"><i class="fas fa-angle-double-left"></i></a>
	  </li>
	 </c:if> 
	 
	 <c:forEach var="a" begin="${startpage}" end="${endpage}">
	 	<c:if test="${a == page}">
		 <li>
			<a class="pnum active">${a}</a>
		 </li>
	   </c:if>
	   <c:if test="${a != page }"> 
	 	 <li>
			<a class="pnum" href="${pageContext.request.contextPath}/comment/myPost?page=${a}&member_id=<sec:authentication property="principal.Username"/>">${a}</a>
		 </li>
	   </c:if>
	 </c:forEach>
	  
	<c:if test="${page >= maxpage }">
		<li class="page-item">
		  <li><a href="#" class="next"><i class="fas fa-angle-double-right"></i></a></li>
	</c:if>
	<c:if test="${page < maxpage }"> 
	     <li>
			<a class="next" href="${pageContext.request.contextPath}/comment/myPost?page=${page+1}&member_id=<sec:authentication property="principal.Username"/>"><i class="fas fa-angle-double-right"></i></a>
		 </li>
	</c:if>
	</ul>
	</div>
</body>	