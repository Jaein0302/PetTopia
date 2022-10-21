<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
   .m_product {
      width : 600px;
      margin : 0 auto;
      padding : 40px
   }
   
   .add { float : right }
   
   .m_product table tbody td {font-size : 10pt}

   .page-link { color : darkgrey !important; } 
   
</style>

<script>


</script>

<body>
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>
 <div class="container mb-5 mainbody" style="height:1500px;margin-top:220px;">
  <div class="row px-xl-5">
  
   <!-- 사이드바 -->	  
   <div class="col-md-3 pb-3 m-0">
	  <jsp:include page="../mypage/aside.jsp" />
   </div>
   
 <!-- 내가 등록한 상품 -->
   <div class="col-md-9 pb-3">
     
   <div class='w-100 m-2'>
   		 <span class="commu pr-4" style='font-weight: bold;'>내가 등록한 상품</span>
   		 <span class='text-small1'>(&nbsp;총 
   		 <span class='text-comment'>${listcount}</span>개의 상품을 등록하셨습니다.&nbsp;)</span>
   </div>
      
   <div class="container m_product" style="width:900px">
      <table class="table" id="productlist">
         <thead>            
            <tr>
               <th>번호</th>            
               <th>상품번호</th>            
               <th>상품이름</th>         
               <th>카테고리</th>   
               <th>등록날짜</th>                     
               <th>문의답변</th>      
               <th>수정</th>      
               <th>삭제</th>      
            </tr>
         </thead>
         <tbody>
         <c:set var="num" value="${listcount-(page-1)*limit}" />      
         <c:forEach var="p" items="${productlist}">
         	<input type="hidden" value="${p.ITEM_IMAGE_FILE}">
         	<input type="hidden" value="${p.ITEM_CONTENT}">
         	<input type="hidden" value="${p.ITEM_SEX}">
         	<input type="hidden" value="${p.ITEM_WEIGHT}">
         	<input type="hidden" value="${p.ITEM_SPECIES}">
         	<input type="hidden" value="${p.ITEM_PRICE}">
         	<input type="hidden" value="${p.ITEM_IMAGE_ORIGINAL}">
            <tr>
               <td>         
                  <c:out value="${num}"/>
                  <c:set var="num" value="${num-1}" />
               </td>               
               <td><div>${p.ITEM_ID}</div></td>
               <td>${p.ITEM_NAME}</td>
               <td>${p.ITEM_CATEGORY}</td>
               <td>${p.ITEM_REG_DATE}</td>
               <td>
                  <a href="${pageContext.request.contextPath}/ask/answer_view?ITEM_ID=${p.ITEM_ID}">
                     <button class="btn btn-Secondary reply" >문의답변</button>
                  </a>
               </td>
               <td>               
                    <button class="btn btn-info modify" data-toggle="modal" data-target="#product_modify" id="modifybutton">수정</button>
               </td>   
               <td>
                  <a href="${pageContext.request.contextPath}/product/delete?ITEM_ID=${p.ITEM_ID}" 
                  	 onclick="return confirm('삭제하시겠습니까?')">
                     <button class="btn btn-Danger delete" id="delete" >삭제</button>
                  </a>                  
               </td>
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
          <a  href="${pageContext.request.contextPath}/product/my_product?page=${page-1}&member_id=<sec:authentication property="principal.Username"/>" 
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
            <a href="${pageContext.request.contextPath}/product/my_product?page=${a}&member_id=<sec:authentication property="principal.Username"/>" 
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
          <a  href="${pageContext.request.contextPath}/product/my_product?page=${page+1}&member_id=<sec:authentication property="principal.Username"/>" 
              class="page-link">&nbsp;다음</a>
         </li>
        </c:if>
      </ul>    
   </div>
   <button type="button" class="btn btn-primary add" data-toggle="modal" data-target="#product_add" id="add">상품 등록하기</button>
</div>   
</div>
</div>
</div>   
   
   <%-- add modal 시작 --%>
   <div class="modal" id="product_add">
     <div class="modal-dialog">
       <div class="modal-content">                  
         <!-- Modal body -->
         <div class="modal-body">
         <sec:authorize access="isAuthenticated()">
         <sec:authentication property="principal" var="pinfo"/>
            <form action="${pageContext.request.contextPath}/product/add?member_id=${pinfo.username}" method="post" enctype="multipart/form-data">  
               
               <h5>판매자명</h5>
            	<input type="text" name="ITEM_SELLER" value="${pinfo.username}" class="form-control" readOnly>                
                <hr>               
                
                <h5>상품 이름</h5>
                <input name="ITEM_NAME" type="text" class="form-control">                 
                <hr>    
                           
                <h5>상품 내용</h5>
            <textarea name="ITEM_CONTENT" class="form-control" rows="5" style="resize: none;"></textarea>                
            <hr>               
         
                <h5>상품 카테고리</h5>      
             <label><input type='checkbox' name='ITEM_CATEGORY' value='treat'>수술/치료</label>
             <label><input type='checkbox' name='ITEM_CATEGORY' value='education' >교육</label>
             <label><input type='checkbox' name='ITEM_CATEGORY' value='beauty' >미용</label>   
             <hr>          
             
             <div class="option">                
                   <h5>상품 옵션(수술/치료)</h5>
               <h6>성별</h6>
                 <label><input type='checkbox' name='ITEM_SEX' value='male' >남성</label>
                <label><input type='checkbox' name='ITEM_SEX' value='female' >여성</label>   
               
               <h6>크기</h6>
                 <label><input type='checkbox' name='ITEM_WEIGHT' value='L' >대형</label>
                <label><input type='checkbox' name='ITEM_WEIGHT' value='M' >중형</label>
                <label><input type='checkbox' name='ITEM_WEIGHT' value='S' >소형</label>
                   
               <h6>종류</h6>
                 <label><input type='checkbox' name='ITEM_SPECIES' value='dog' >반려견</label>
                <label><input type='checkbox' name='ITEM_SPECIES' value='cat' >반려묘</label>
                <hr>
             </div>
                
                <h5>상품 가격(원)</h5>       
                <input name="ITEM_PRICE" type="text" class="form-control">
                <hr>   
                   
                <h5>상품 이미지</h5>
              <div class="form-group">
              	<label for="upfile">파일 첨부</label>
              	<label for="upfile">
              		<img src="${pageContext.request.contextPath}/resources/img/Main/attach.png" alt="파일첨부" style="width:20px"> 
              	</label>             	
               	<input type="file" id="upfile" name="uploadfile">
               	<span id="filevalue"></span>
               	
              </div>                 
                                
                <button type="submit" class="btn btn-primary" id="p_add">상품 등록</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">   
            </form>
            </sec:authorize>             
         </div>      
       </div>
     </div>
   </div>   
   
  <!--  수정 모달 -->
  <div class="modal" id="product_modify">
   <div class="modal-dialog">
       <div class="modal-content">                  
         <!-- Modal body -->
         <div class="modal-body">
         <sec:authorize access="isAuthenticated()">
         <sec:authentication property="principal" var="pinfo"/>
            <form id="modify" action="${pageContext.request.contextPath}/product/update" method="post" enctype="multipart/form-data">  
               
               <h5>판매자명</h5>
            <input type="text" name="ITEM_SELLER" value="${pinfo.username}" class="form-control" readOnly>                
                <hr>               
                
                <h5>상품 이름</h5>
                <input id="ITEM_NAME" name="ITEM_NAME" type="text" class="form-control">                 
                <hr>    
                           
                <h5>상품 내용</h5>
            <textarea id="ITEM_CONTENT" name="ITEM_CONTENT" class="form-control" rows="5" style="resize: none;"></textarea>                
            <hr>               
         
                <h5>상품 카테고리</h5>      
              <label><input type='checkbox' name='ITEM_CATEGORY' value='treat'>수술/치료</label>
             <label><input type='checkbox' name='ITEM_CATEGORY' value='education' >교육</label>
             <label><input type='checkbox' name='ITEM_CATEGORY' value='beauty' >미용</label>   
             <hr>          
             
             <div class="option">                
                   <h5>상품 옵션(수술/치료)</h5>
               <h6>성별</h6>
                 <label><input type='checkbox' name='ITEM_SEX' value='male' >남성</label>
                <label><input type='checkbox' name='ITEM_SEX' value='female' >여성</label>   
               
               <h6>크기</h6>
                 <label><input type='checkbox' name='ITEM_WEIGHT' value='L' >대형</label>
                <label><input type='checkbox' name='ITEM_WEIGHT' value='M' >중형</label>
                <label><input type='checkbox' name='ITEM_WEIGHT' value='S' >소형</label>
                   
               <h6>종류</h6>
                 <label><input type='checkbox' name='ITEM_SPECIES' value='dog' >반려견</label>
                <label><input type='checkbox' name='ITEM_SPECIES' value='cat' >반려묘</label>
                <hr>
             </div>
                
                <h5>상품 가격(원)</h5>           
                <input id="ITEM_PRICE" name="ITEM_PRICE" type="text" class="form-control">
                <hr>   
                   
                <h5>상품 이미지</h5>
              <div class="form-group">
              	<label for="upfile2">파일 첨부</label>
              	<label for="upfile2">
              		<img src="${pageContext.request.contextPath}/resources/img/Main/attach.png" alt="파일첨부" style="width:20px"> 
              	</label>             	
               	<input type="file" id="upfile2" name="uploadfile">
               	<span id="filevalue2"></span>
              </div>                 
                                
                <button type="submit" class="btn btn-primary" id="p_modify">상품 수정</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                <input type="hidden" id="ITEM_IMAGE_FILE" name="ITEM_IMAGE_FILE" class="form-control">                
                <input type="hidden" id="ITEM_ID" name="ITEM_ID" class="form-control">                
                
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">   
            </form>
            </sec:authorize>             
         </div>      
       </div>
     </div>
   </div>
	<script src="${pageContext.request.contextPath}/resources/js/Product/my_product.js"></script>

</body>   
