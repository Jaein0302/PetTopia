<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
<style>
   select.form-control {
      width: auto;
      display: inline-block      
   }
   
   .rows {
      text-align: right;
   }
   
    body > div > table > thead > tr:nth-child(2) > th:nth-child(1){width:10%}
    body > div > table > thead > tr:nth-child(2) > th:nth-child(2){width:40%}
    body > div > table > thead > tr:nth-child(2) > th:nth-child(3){width:50%}

   .ask { float : right }

</style>

</head>
<body>
   <div class="container">
      <span class="ask" style="display:inline">문의 목록 ( ${listcount} )</span>   
      <table class="table table-striped" id="detail">
         <thead>
            <tr>
               <th><div>글 번호</div></th>            
               <th><div>제목</div></th>         
               <th><div>작성자</div></th>         
               <th><div>날짜</div></th>         
            </tr>
              <c:forEach var="a" items="${asklist}">  
               <input type="hidden" value="${a.ITEM_ASK_CONTENT}">              
               <input type="hidden" value="${a.ITEM_ASK_ITEMID}">              
               <tr>
                  <td>${a.ITEM_ASK_NUM}</td>
                  <td>
                     ${a.ITEM_ASK_SUBJECT}                 
                  </td>
                  <td>${a.ITEM_ASK_USERNAME}</td>
                  <td>${a.ITEM_ASK_DATE}</td>
                  <td><button id="detail_button" class="btn-dark">상세보기</button></td>
               </tr>
            </c:forEach>
         </thead>
      </table>   
    
      <div class="text-right">
          <sec:authorize access="isAnonymous()">
            <button type="button" class="btn btn-info floar-right ask_denied">문의하기</button>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
            <button type="button" class="btn btn-info floar-right ask_access" data-toggle="modal" 
                  data-target="#product_ask">문의하기</button>
           </sec:authorize>
      </div>
</div>

   <%-- 문의 등록 modal 시작 --%>
   <div class="modal" id="product_ask">
     <div class="modal-dialog">
       <div class="modal-content">          
         <!-- Modal body -->
         <div class="modal-body">
            <form  action="${pageContext.request.contextPath}/ask/add" method="post">   
               <sec:authorize access="isAuthenticated()">               
               <sec:authentication property="principal" var="pinfo"/>
             
                <input type="hidden" class="form-control" name="ITEM_ASK_ITEMID"  value="${param.ITEM_ID}">
                
               	<div class=m-3>                 
	                <h6>작성자</h6>            
	             	<input type="text" class="form-control" name="ITEM_ASK_USERNAME" value="${pinfo.username}" readOnly>
                </div>
                
                <div class=m-3>                 
                  	<h6>제목</h6>
              	 	<input type="text" name="ITEM_ASK_SUBJECT" class="form-control">           
                </div>
                
                <div class=m-3>
                   	<h6>내용</h6>
               		<textarea name="ITEM_ASK_CONTENT" class="form-control" rows="5"></textarea>                
             	</div>    
             
             <button type="submit" class="btn btn-primary" id="p_add">상품 등록</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">   
             </sec:authorize>                   
            </form>
         </div>           
       </div>
     </div>
   </div> 
     
   <%-- 문의 수정 modal 시작 --%>
   <div class="modal" id="ask_detail">
     <div class="modal-dialog">
       <div class="modal-content">          
         <!-- Modal body -->
         <div class="modal-body">
            <form id="update" action="${pageContext.request.contextPath}/ask/update" method="post">              
                
                <input type="hidden" class="form-control" name="ITEM_ASK_NUM" id="ASK_NUM">
                <input type="hidden" class="form-control" name="ITEM_ASK_DATE" id="ASK_DATE">
                <input type="hidden" class="form-control" name="ITEM_ASK_ITEMID" id="ASK_ITEMID">
                
                <div class=m-3>
                	<h6>작성자</h6>                	
                    <input type="text" class="form-control" name="ITEM_ASK_USERNAME" id="USERNAME" readOnly>
                </div>
                
                <div class=m-3>
	                <h6>제목</h6>
	                <input type="text" name="ITEM_ASK_SUBJECT" class="form-control" id="SUBJECT">
                </div>
                
                <div class=m-3>
	                <h6>내용</h6>
	                <textarea name="ITEM_ASK_CONTENT" class="form-control" rows="5" id="CONTENT"></textarea>
                </div>    
             
	             	<button type="submit" class="btn btn-primary a_update">문의 수정</button>
	             	<button type="button" class="btn btn-primary a_delete">문의 삭제</button>             	
	                <button type="button" class="btn btn-danger a_cancel">취소</button>
             
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">      
                                      
            </form>
         </div>           
       </div>
     </div>
   </div>   
<script src="${pageContext.request.contextPath}/resources/js/Product/ask_view.js"></script>
   
</body>