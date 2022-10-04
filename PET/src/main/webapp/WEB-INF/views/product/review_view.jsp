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
	<col width="10%" />
	<col width="10%" />
	<col width="50%" />
	<col width="30%" />
	</colgroup>
      <tr>
      <%-- 커밋 22--%> 
      	  <%-- 아이디, 날짜, 별점 --%>
		  <td class="p-1"><div>${b.review_id}</div></td>
		  <td class="p-1"><div>${fn:replace(b.review_reg_date, '-', '.')}</div></td>
		  <td class="p-1"><div>${b.review_score}</div></td>
		  
		  <%-- 썸네일 --%>
		  <td class="p-0" rowspan='3'>
		     <c:if test="${!empty b.review_image}">
		     <img class='img-thumbnail review_img'${fn:replace(b.review_image, '>', ' ')}>
		     </c:if>
		  </td>
		  
	  </tr>
	  <tr>
	  	   <%-- 제목 --%>
		   <td class="p-1 text-left" colspan="3">
		  	<div>
		  	 <a href="review_detail?num=${b.review_num}">
		  	    <span class="text-dark">
			        <c:out value="${b.review_subject}" escapeXml="true"/>
		  	    </span>
		  	 </a>
		  	 </div>
		 	</td>
	  </tr>
	  <tr>	
	  		<%-- 내용 --%>
		  	<td  class="p-2" colspan="3">
		  		<c:out value="${b.review_text}"/>
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
	