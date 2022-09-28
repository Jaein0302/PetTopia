<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
출처: https://cofs.tistory.com/262 [CofS:티스토리]<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<head>
	<title>펫토피아 - 수술/치료</title>
</head>

<style>
	.search {
		width : 600px;
		margin: 0 auto;
	}
	#search_word {width:70%; display : inline}
	
	#search_button {display : inline}
	
	
	
</style>

<script>
	if($('input[type=checkbox]').is(":checked")){
		console.log("바뀜");
	};
</script>

<body>
<div class="header">
	<jsp:include page="../member/header.jsp" />
</div>


<div class="container mb-5 mainbody" style="height:150px;margin-top:220px;">  	 			
 	<div class="search">
 		<div>
	 		<form action="${pageContext.request.contextPath}/product/product_list" method="post" > 
	 			<h5>결과내 재검색</h5>
		    	<input name = "search_word" value="${search_word}" class="form-control" type="text" placeholder="검색어를 입력해 주세요" id="search_word">
		    	<button class="search-btn" type="submit" id="search_button">검색</button><hr>
		    	<input type="hidden" name="item_category" value="treat">
		    	<input type="hidden" name="search_field" value="1">
		    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		    	
		    </form>
		</div>
	</div>	
</div>


<!-- 상품 나열 -->
<div class="container mb-5 mainbody" id="p_list">
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">검색결과</span></h2>
        </div>        
        <div class="row px-xl-5 pb-3">
        
        <c:forEach var="p" items="${productlist}">	        
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4" onclick="location.href='${pageContext.request.contextPath}/product/detail?ITEM_ID=${p.ITEM_ID}'">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <!--  
						<c:set var="reg_date" value="${p.ITEM_REG_DATE}"/>			
						<c:set var="image_file" value="${p.ITEM_IMAGE_FILE}"/>			
    					<c:set var = "length" value = "${fn:length(image_file)}"/>                       
                        <img class="img-fluid w-100" src="${pageContext.request.contextPath}/C:\upload/" + ${fn:substring(reg_date, 0,10)} + ${fn:substring(image_file, length-22,length)}>
                  	-->
                  	    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/resources/img/Main/product-2.jpg" alt="">                  	
                    </div>
                    <div class="card-body border-left border-right p-0 pt-2 text-center">
                    	<span> ${p.ITEM_NAME}</span>
                        <h4 class="text-truncate">${p.ITEM_CONTENT}</h4>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                    	 <span class="text-dark price" style="margin:0;font-color:black">${p.ITEM_PRICE}</span>
                    	<a href="" class="btn btn-sm text-dark p-0  zzim"><i class="fas fa-heart"></i></a>
                        <a href="" class="btn btn-sm text-dark p-0 shopping_cart"><i class="fas fa-shopping-cart text-primary mr-1"></i></a>
                    </div>
                </div>
            </div>        
         </c:forEach>            
         </div>     
     </div>
</div>
</body>
</html>