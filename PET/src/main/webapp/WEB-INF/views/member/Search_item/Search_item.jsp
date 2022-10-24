<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>펫토피아 - 통합검색페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/search_item.css" type="text/css" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>

$(function(){

	$('body').on('click','.wishbutton', function(){

		var icon = $(this).children(':nth-child(1)')
		var item_id = $(this).prev();
	
		
		if( icon.hasClass("fa-heart-broken") ){

			$.ajax({//찜 취소
				url:"../product/deleteWish_byItemID",
				data : {"ITEM_ID": item_id.val()},
				success: function(res){
					console.log(res);
					alert("찜 취소 되었습니다.");
					document.location.href = document.location.href;
				},//success
		
			})//ajax end
		
		} else {//찜하기

			$.ajax({
				type: "POST",
				url:"../product/addWish",
				data: {"ITEM_ID" : item_id.val() },
				beforeSend : function(xhr)
	            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				success: function(resp){
					//console.log(resp)
					if (resp != null) {
						alert("상품이 성공적으로 찜목록에 담겼습니다.");
						window.location.href=window.location.href
					} else{
						alert("상품을 찜목록에 담는중 오류가 발생했습니다.");
					}
				}//inner success
			})//inner ajax
		
		}
	
	
	})

})

</script>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="../header.jsp" />
</div>

<div class="container mb-5 mainbody" style="height:1500px;margin-top:230px;">
  <div class="row px-xl-5">
   <div class="col-lg-12" style="margin:0 auto;">
 		<div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">'${item}'검색 결과 총 
            <c:if test="${!empty lc}">
            ${lc}
            </c:if>
            <c:if test="${empty lc}">
            0
            </c:if>건</span></h2>
        </div>
        <hr>
        
  <div class="main">

	<input id="tab1" type="radio" name="tabs" checked>
	<label class='label-tab' for="tab1"><i class="fas fa-border-all"></i>&ensp;전체보기 (
	        <c:if test="${!empty lc}">
            ${lc}
            </c:if>
            <c:if test="${empty lc}">
            0
            </c:if>)</label>
	
	<input id="tab2" type="radio" name="tabs">
	<label class='label-tab' for="tab2">수술/치료(
	        <c:if test="${!empty tc}">
            ${tc}
            </c:if>
            <c:if test="${empty tc}">
            0
            </c:if>)</label>
	
	<input id="tab3" type="radio" name="tabs">
	<label class='label-tab' for="tab3">교육 (
		    <c:if test="${!empty ec}">
            ${ec}
            </c:if>
            <c:if test="${empty ec}">
            0
            </c:if>)</label>
	
	<input id="tab4" type="radio" name="tabs">
	<label class='label-tab' for="tab4">미용 (
			<c:if test="${!empty bc}">
            ${bc}
            </c:if>
            <c:if test="${empty bc}">
            0
            </c:if>)</label>
	
		  <div class="content mt-3">  
			  <div id="content1">
				<jsp:include page='Search_item_all.jsp' />
			  </div>
	
			  <div id="content2">
				<jsp:include page='Search_item_treat.jsp' />
			  </div>
	
			  <div id="content3">
				<jsp:include page='Search_item_edu.jsp' />
			  </div>
	
			  <div id="content4">
				<jsp:include page='Search_item_beauty.jsp' />
			  </div>
		  </div>
	
		</div>

   </div>
  </div>
 </div>

    
<jsp:include page="../footer.jsp" />
</body>
</html>