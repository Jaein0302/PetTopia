<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
   .m_product {
      width : 400px;
      margin : 0 auto;
      padding : 40px
   }
   
   .add { float : right }
   
   .m_product table tbody td {font-size : 10pt}
</style>

<script>
	
</script>

<body>
   <jsp:include page="../member/header.jsp" />
   
   <div class="container m_product">
      <h3 style="display:inline">내 문의 ( ${listcount} )</h3>
      <table class="table table-striped">
         <thead>            
            <tr>
               <th>문의 번호</th>            
               <th>상품 이름</th>            
               <th>문의 제목</th>         
               <th>등록 날짜</th>               
               <th>상품 이동</th>               
            </tr>
         </thead>
         <tbody>
         <c:set var="num" value="${listcount-(page-1)*limit}" />      
         <c:forEach var="a" items="${asklist}">
            <tr>
               <td>         
                  <c:out value="${num}"/>
                  <c:set var="num" value="${num-1}" />
               </td>               
               <td><div>${a.ITEM_NAME}</div></td>
               <td>${a.ITEM_ASK_SUBJECT}</td>
               <td>${a.ITEM_ASK_DATE}</td>
               <td><button type="button" class="btn btn-primary" 
               		onclick="location.href='${pageContext.request.contextPath}/product/detail?ITEM_ID=' + ${a.ITEM_ASK_ITEMID}">상품으로 이동</button></td>
            </tr>
         </c:forEach>            
         </tbody>      
      </table>
   
   <!-- 페이징 -->
   <div class="center-block">
      <ul class="pagination justify-content-center">
        <c:if test="${page <= 1 }">
         <li class="page-item">
          <a class="page-link gray">이전&nbsp;</a>
         </li>
        </c:if>
         <c:if test="${page > 1 }">
         <li class="page-item">
          <a  href="${pageContext.request.contextPath}/ask/myask?page=${page-1}&member_id=<sec:authentication property="principal.Username"/>" 
              class="page-link">이전&nbsp;</a>
         </li>
        </c:if>
        
      <c:forEach var="a" begin="${startpage}" end="${endpage}">
         <c:if test="${a == page}">
          <li class="page-item active">
            <a class="page-Link">${a}</a>
          </li>
         </c:if>
         <c:if test="${a != page }"> 
           <li class="page-item">
            <a href="${pageContext.request.contextPath}/ask/myask?page=${a}&member_id=<sec:authentication property="principal.Username"/>" 
               class="page-Link">${a}</a>
          </li>
         </c:if>
       </c:forEach>
       
       <c:if test="${page >= maxpage }">
         <li class="page-item">
          <a class="page-link gray">&nbsp;다음</a>
         </li>
        </c:if>
         <c:if test="${page < maxpage }">
         <li class="page-item">
          <a  href="${pageContext.request.contextPath}/ask/myask?page=${page+1}&member_id=<sec:authentication property="principal.Username"/>" 
              class="page-link">&nbsp;다음</a>
         </li>
        </c:if>
      </ul>    
   </div>
</div>     

</body>   
