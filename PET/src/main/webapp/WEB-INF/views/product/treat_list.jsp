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
	 		<form action="${pageContext.request.contextPath}/product/treat_list" method="post"> 
	 			<h5>결과내 재검색</h5>
		    	<input name = "search_word" value="${search_word}" class="form-control" type="text" placeholder="검색어를 입력해 주세요">
		    	<button class="search-btn" type="submit">검색</button><hr>
		    	<input type="hidden" name="item_category" value="treat">
		    	<input type="hidden" name="search_field" value="1">
		    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		    </form>
		</div>
		<div>
			<form class="search_select">
				<h5>성별</h5>
				<div>
					<input type="radio" name="gender" value="남" checked><span>남</span>
					<input type="radio" name="gender" value="여"><span>여</span>
				</div>
				<hr>
	
				<h5>크기</h5>
				<div>
					<input type="radio" name="size" value="소형" checked><span>소형</span>
					<input type="radio" name="size" value="중형"><span>중형</span>
					<input type="radio" name="size" value="대형"><span>대형</span>
				</div>
				<hr>
	
				<b>종류</b>
				<div>
					<input type="radio" name="species" value="반려견" checked><span>반려견</span>
					<input type="radio" name="species" value="반려묘"><span>반려묘</span>
				</div>
				<hr>
			</form>
		</div>
	</div>	
</div>


<!-- 상품 나열 -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">검색결과</span></h2>
        </div>
        
        <c:forEach var="p" items="${productlist}">	
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4" onclick="location.href='product/detail'">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="${pageContext.request.contextPath}/resources/img/Main/product-2.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right p-0 pt-2 text-center">
                    	<span> ${p.ITEM_NAME}</span>
                        <h4 class="text-truncate">${p.ITEM_CONTENT}</h4>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                    	 <span class="text-dark price" style="margin:0;font-color:black">${p.ITEM_CONTENT}</span>
                    	<a href="" class="btn btn-sm text-dark p-0  zzim"><i class="fas fa-heart"></i></a>
                        <a href="" class="btn btn-sm text-dark p-0 shopping_cart"><i class="fas fa-shopping-cart text-primary mr-1"></i></a>
                    </div>
                </div>
            </div>
         </div>
         </c:forEach>        
     </div>
</body>
</html>