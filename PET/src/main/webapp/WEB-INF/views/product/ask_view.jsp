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

  input {
      border-style: solid;
      border-width: 1px;
    }
</style>

</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th colspan="3">상품 문의</th>
					<th colspan="2">
						<font size=3>글 개수 : ${listcount}</font>
					</th>
				</tr>
				<tr>
					<th><div>글 번호</div></th>				
					<th><div>제목</div></th>			
					<th><div>날짜</div></th>			
				</tr>
			</thead>
		</table>
		<a href = "#">		
			<button type="button" class="btn btn-info floar-right" data-toggle="modal" data-target="#product_ask">문의하기</button>
		</a>
	</div>
	
	<%-- modal 시작 --%>

	<div class="modal" id="product_ask">
	  <div class="modal-dialog">
	    <div class="modal-content"> 	      
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="pinfo"/>
		  	 <form action="${pageContext.request.contextPath}/ask/add" method="post">		  	 
		  	 	 <input type="text" class="form-control" name="ITEM_ASK_USERNAME" value="${pinfo.username}" readOnly>
		  	 	 <input type="hidden" class="form-control" name="ITEM_ASK_ITEMID" value="${productdata.ITEM_ID}" readOnly>
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
		  	 </form>
		  </sec:authorize>		  	 
	      </div>  	      
	    </div>
	  </div>
	</div>	
	
	
</body>