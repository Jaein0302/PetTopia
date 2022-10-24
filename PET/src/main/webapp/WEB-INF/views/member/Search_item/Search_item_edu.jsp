<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<c:if test="${!empty e}">
<div class="container mt-3 mb-5">
    <div class="container-fluid">
        <div class="row px-xl-5 pb-3">
        <c:forEach var="p" items="${e}">	        
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4" >
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                  	    <img class='img-fluid w-100' src="/pet_topia/upload${p.ITEM_IMAGE_FILE}" onclick="location.href='${pageContext.request.contextPath}/product/detail?ITEM_ID=${p.ITEM_ID}'">              	          	
                    </div>
                    <div class="card-body border-left border-right p-0 pt-2 text-center">
                    	<span class="text-body">${p.seller_name}</span>
						<h4 class="text-truncate m-0">${p.ITEM_NAME}</h4>
						<i class="fas fa-star"></i><span class="text-body">&nbsp;${p.ITEM_SCORE}&ensp;<span class="text-small">후기 (${p.cnt})</span></span>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                    	 <span class="text-dark price" style="margin:0;font-color:black"><fmt:formatNumber value="${p.ITEM_PRICE}" pattern="#,###" />원</span>


            			<input type="hidden" value="${p.ITEM_ID}" class="hidden_itemID" id="hidden_itemID">
               			
               			<script>
               			$.ajax({
               				type : "POST",
               				url: "../product/is_inmywish",
               				data : {"ITEM_ID" : "${p.ITEM_ID}" }, 
               				beforeSend : function(xhr)
               	            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
               	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
               	            },
               	            success: function(resp){

               	            	var output = "<a href='javascript:void(0)' class='btn border wishbutton'>"
               					//console.log(resp);
               					if(resp != "null" ){ //사용자 아이디로 찜한 상품이 있을경우
               						output += "<i class='fas fa-heart-broken text-primary'></i>"
               					} else {
               						output += "<i class='fas fa-heart text-primary'></i>"
               					}
               					output += "</a>"
               					$('input[value="${p.ITEM_ID}"]').after(output)
               	            }
               			})
               			</script>
                    </div>
                </div>
            </div>        
         </c:forEach>            
         </div>     
     </div>
</div>
</c:if>
<c:if test="${empty e}">
<div class="text-center mt-3">
<h2 style="color:gray">검색결과가 없습니다.</h2>
</div>
</c:if>
</body>
