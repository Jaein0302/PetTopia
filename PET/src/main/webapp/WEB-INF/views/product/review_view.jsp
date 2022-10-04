<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="${pageContext.request.contextPath}/resources/css/Order/review_list.css" type="text/css" rel="stylesheet">
<body>
 <div class="container-fluid">
  <div class="row px-xl-5 pb-3">
	
	<c:if test='${!empty photo}'>
		<div class='w-100 text-center'>
	   		<h2 class='text-left rlist' style='mb-4'>포토 리뷰 <i class="fas fa-camera"></i></h2>
		  	<c:forEach var="ph" items="${photo}" end='4'>
		  		 <img class='img-thumbnail review_img mb-3 mr-3'${fn:replace(ph.review_image, '>', ' ')}>
		    </c:forEach>
	    </div>
	 </c:if>   
	 
    <div class='w-100'>
   		<h2 class='rlist' style='mb-4'>리뷰 목록 <span class='text-comment'>(${rlistcount})</span></h2>
  	</div>
   
   <c:if test="${!empty rlist}">
     <c:forEach var="b" items="${rlist}">
   <table class="m-0 table text-left">
    <!-- 테이블 간격 -->
	<colgroup>
	<col width="70%" />
	<col width="30%" />
	</colgroup>
      <tr class='rborder'>
		<td class="p-2" style='vertical-align:top!important;'>
		  <%-- 아이디, 날짜, 별점 --%>
		  <span class='text-small pr-3'>
		  	<i style="color:#4a4c4b;"class="fa fa-user"></i> ${b.review_id}</span>
		  <span class='text-small pr-3'>
		  	<i style="color:#4a4c4b;"class="fa fa-clock-o"></i> ${fn:replace(b.review_reg_date, '-', '.')}</span>
		  <c:if test="${b.review_score==1}">
		  <i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
		  </c:if>
		  <c:if test="${b.review_score==2}">
		  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
		  </c:if>
		  <c:if test="${b.review_score==3}">
		  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
		  </c:if>
		  <c:if test="${b.review_score==4}">
		  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
		  </c:if>
		  <c:if test="${b.review_score==5}">
		  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
		  </c:if>
		  <span class='text-small'>${b.review_score}.0</span>
		  
		  <%-- 제목 --%>
		  <div>
			  <span class="rsubject pt-1 text-dark">
				<c:out value="${b.review_subject}" escapeXml="true"/> 
			  </span>
		  </div>
		  <%-- 내용 --%>
		  <div class='pl-2 pr-4 pb-4 text-small'>
			  <span>
			  	<c:out value="${b.review_text}"/>
			  </span>	
		  </div>
		</td>
		  
		 <%-- 썸네일 --%>
		<td class="pr-3 text-right">
		  <c:if test="${!empty b.review_image}">
		     <img class='img-thumbnail review_img'${fn:replace(b.review_image, '>', ' ')}>
		  </c:if>
		</td>
		</tr>
	 </table>
	 </c:forEach>
	 </c:if>
	 
	 <%--리뷰가 없는 경우--%>
	<c:if test="${empty rlist}">
	<div class="text-center" style="margin:100px auto 400px auto">
	<h2 class="text-body">아직 후기가 없습니다</h2>
	</div>
	</c:if>
	
	</div>	
</div>	
</body>	
	