<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
</head>
<body>

<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>
 <div class="container mb-5 mainbody" style="height:1500px;margin-top:220px;">
  <div class="row px-xl-5">
  
   <!-- 사이드바 -->	  
   <div class="col-md-3 pb-3 m-0">
	  <jsp:include page="../mypage/aside.jsp" />
   </div>
   
   <!-- 내가 남긴 리뷰 -->
   <div class="col-md-9 pb-3">
   <table class="table text-center">
	<!-- 테이블 간격 -->
	<colgroup>
	<col width="13%" />
	<col width="45%" />
	<col width="17%" />
	<col width="15%" />
	<col width="10%" />
	</colgroup>
 	<thead>
     <tr>
    	<th>번호</th>
    	<th class="text-left">제목</th>
    	<th>작성자</th>
    	<th>작성일</th>
    	<th>조회수</th>
     </tr>
    </thead>
    <tbody>
     <c:set var="num" value="${listcount-(page-1)*limit}" />
     <c:forEach var="b" items="${boardlist}">
     <tr>
      <td><%-- 번호 --%>
       <c:out value="${num}"/><%--출력 --%>
       <c:set var="num" value="${num-1}" /> <%--num=num-1;의미 --%>
	  </td>
	 <td class="text-left"><%--제목 --%>
	  <div>
	  	 <a href="detail?num=${b.commu_num}">
	  	    <span class="text-dark">
	  	    	 <c:if test="${b.commu_subject.length()>=20}">
		  	     		<c:out value="${b.commu_subject.substring(0,20)}..." />
			  	 </c:if>
			  	 <c:if test="${b.commu_subject.length()<20}">
		        		<c:out value="${b.commu_subject}" escapeXml="true"/>
		         </c:if>
	  	    </span>
	  		<span class="text-comment text-small">[<c:out value="${b.cnt}"/>]</span>
	  	 </a>
	  </div>
	  </td>
	  <td><div>${b.commu_name}</div></td>
	  <td><div>${fn:replace(b.commu_date, '-', '.')}</div></td>
	  <td><div>${b.commu_readcount}</div></td>
	  </tr>
	  </c:forEach>
	  </tbody>
	 </table>

	 
<!-- 검색 창 -->
	 <div class="text-center mt-4" style="position:absolute;left:35%;">
	 <form method="get" action="">
	 <select name="search_field">
	 <option value="0" selected>제목+내용</option>
	 <option value="1">작성자</option>
	 <option value="2">제목</option>
	 <option value="3">내용</option>
	 </select>
	 <input type="text" class="search_word" name="search_word" value="">
	 <input type="button" class="button-5 postb" value="검색" style="min-height:40px;width:15%">
	 </form>
	 </div>
	 
<!-- 페이징 처리 -->
	<div style="position:absolute;left:45%;margin-top:80px">
	<ul class="pagination modal-2 text-center">
	  
	 <c:if test="${page <= 1 }">
	  <li><a href="#" class="prev"><i class="fas fa-angle-double-left"></i></a></li>
	 </c:if> 
	 <c:if test="${page > 1 }">
	  <li>
		<a class="next" href="${pageContext.request.contextPath}/community/list?page=${page-1}"><i class="fas fa-angle-double-left"></i></a>
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
			<a class="pnum" href="${pageContext.request.contextPath}/community/list?page=${a}">${a}</a>
		 </li>
	   </c:if>
	 </c:forEach>
	  
	<c:if test="${page >= maxpage }">
		<li class="page-item">
		  <li><a href="#" class="next"><i class="fas fa-angle-double-right"></i></a></li>
	</c:if>
	<c:if test="${page < maxpage }"> 
	     <li>
			<a class="next" href="${pageContext.request.contextPath}/community/list?page=${page+1}"><i class="fas fa-angle-double-right"></i></a>
		 </li>
	</c:if>
	</ul>
	</div>
   
   
   
   
   </div>
  </div>
 </div>
</body>
<jsp:include page="../member/footer.jsp" />
</html>