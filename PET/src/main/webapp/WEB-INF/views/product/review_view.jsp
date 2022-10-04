<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="${pageContext.request.contextPath}/resources/css/Order/review_list.css" type="text/css" rel="stylesheet">
<body>
 <div class="container-fluid pt-5">
  <div class="row px-xl-5 pb-3">
   
   <c:if test="${!empty rlist}">
     <c:forEach var="b" items="${rlist}">
   <table class="mb-3 table text-left">
    <!-- 테이블 간격 -->
	<colgroup>
	<col width="70%" />
	<col width="30%" />
	</colgroup>
      <tr>
		<td class="p-1" style='vertical-align:top !important;'>
		  <%-- 아이디, 날짜, 별점 --%>
		  <span class='pr-2'>${b.review_id}</span>
		  <span class='pr-2'>${fn:replace(b.review_reg_date, '-', '.')}</span>
		  <span>${b.review_score}</span>
		  <c:if test="${b.review_score==1}">
		  </c:if>
		  
		  <div>
		  <%-- 제목 --%>
		  <h5 class="text-dark">
			<c:out value="${b.review_subject}" escapeXml="true"/> 
		  </h5>
		  	
		  <%-- 내용 --%>
		  <c:out value="${b.review_text}"/>	
		  </div>
		</td>
		  
		  <%-- 썸네일 --%>
		  <td class="p-0">
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
	