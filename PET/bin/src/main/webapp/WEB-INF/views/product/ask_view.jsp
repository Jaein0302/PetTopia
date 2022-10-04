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
<script>
	$(function(){
		$(".ask_denied").click(function(){
			alert("로그인 후 이용가능합니다.")				
		});
		
<%--		
		$(".ask_access").click(function(){
			var data = $(this).data('id');
			console.log(data);
			$("#product_add").val(data);
		})		
		
	$("#product_ask").on('show.bs.modal', function(e){
		var id = $(e.relatedTarget).data('id');
	})
--%>	
		
		
		
	})
</script>

</head>
<body>
	<div class="container">
		<span class="ask" style="display:inline">내 상품 ( ${listcount} )</span>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th><div>글 번호</div></th>				
					<th><div>제목</div></th>			
					<th><div>작성자</div></th>			
					<th><div>날짜</div></th>			
				</tr>
        		<c:forEach var="a" items="${asklist}">	
					<tr>
						<td>${a.ITEM_ASK_NUM}</td>
						<td>
							<a href="detail?num=${b.BOARD_NUM}">
								${a.ITEM_ASK_SUBJECT}
							</a>
						</td>
						<td>${a.ITEM_ASK_USERNAME}</td>
						<td>${a.ITEM_ASK_DATE}</td>
					</tr>
				</c:forEach>
			</thead>
		</table>		 
	
		<!-- 페이징
		<div class="center-block">
			<ul class="pagination justify-content-center">
			  <c:if test="${page <= 1 }">
				<li class="page-item">
				 <a class="page-link gray">이전&nbsp;</a>
				</li>
			  </c:if>
		 	  <c:if test="${page > 1 }">
				<li class="page-item">
				 <a  href="${pageContext.request.contextPath}/product/detail?page=${page-1}" 
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
					<a href="${pageContext.request.contextPath}/product/detail?page=${a}" 
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
				 <a  href="${pageContext.request.contextPath}/product/detail?page=${page+1}" 
				     class="page-link">&nbsp;다음</a>
				</li>
			  </c:if>
			</ul>	 
		</div>
	 -->
	 
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

	<%-- modal 시작 --%>

	<div class="modal" id="product_ask">
	  <div class="modal-dialog">
	    <div class="modal-content"> 	      
	      <!-- Modal body -->
	      <div class="modal-body">
		  	 <form  action="${pageContext.request.contextPath}/ask/add" method="post">	
		  	 	<sec:authorize access="isAuthenticated()">		  	 	
		  	 	<sec:authentication property="principal" var="pinfo"/>
		  	 	
		  	 	 <input type="text" class="form-control" name="ITEM_ASK_ITEMID"  value="${param.ITEM_ID}">
		  	 
		  	 	<!--  <p>작성자</p>   -->	 
				 <input type="text" class="form-control" name="ITEM_ASK_USERNAME" value="${pinfo.username}" readOnly>
	 	  	 	
	 	  	 	 <div>	 	  	 	 
	  	 	 		<p>제목</p>
					<textarea name="ITEM_ASK_SUBJECT" class="form-control" rows="1"></textarea>		  	 	 
	  	 	 	 </div>
	  	 	 	
		  	 	 <div>
		  	 	 	<p>내용</p>
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
	
	
</body>