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
</style>

<script>
	var result = "${result}";
	if(result == 'addSuccess'){
		alert("등록 성공 입니다.");
	}
</script>


<body>
	<jsp:include page="../member/header.jsp" />
	<div class="container m_product">
		<h3 style="display:inline">내 상품</h3>
		<button type="button" class="btn btn-primary add" data-toggle="modal" data-target="#product_add">상품 등록하기</button>
		<table class="table table-striped">
			<thead>				
				<tr>
					<th>상품정보</th>				
					<th>상품이름</th>			
					<th>문의글 답변 작성</th>		
					<th>수정</th>		
					<th>삭제</th>		
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>다리수술</td>
					<td>쓸개골 탈구</td>
					<td><button type="button" class="btn btn-info reply">문의 답변하기</button></td>			
					<td><button type="button" class="btn btn-info modify">수정하기</button></td>			
					<td><button type="button" class="btn btn-danger delete">삭제하기</button></td>	
				</tr>				
			</tbody>		
		</table>
	</div>		
	
		<%-- modal 시작 --%>
	<div class="modal" id="product_add">
	  <div class="modal-dialog">
	    <div class="modal-content"> 	      
	      <!-- Modal body -->
	      <div class="modal-body">
		  	 <form action="${pageContext.request.contextPath}/product/product_add" method="post" enctype="multipart/form-data">
	  	 		
	  	 	 	<h5>상품 이름</h5>
	  	 	 	<input name="ITEM_NAME" type="text" class="form-control">	  	 	 	 
	  	 	 	<hr>	  	 		
	  	 
	  	 	 	<h5>상품 카테고리</h5>		
		  		<label><input name="ITEM_CATEGORY" type='checkbox' name='ITEM_CATEGORY' value='treat' >수술/치료</label>
		 		<label><input name="ITEM_CATEGORY" type='checkbox' name='ITEM_CATEGORY' value='education' >교육</label>
		 		<label><input name="ITEM_CATEGORY" type='checkbox' name='ITEM_CATEGORY' value='beauty' >미용</label>	
		 		<hr>	 		
		 				  	 	 	
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
	  	 	 	
	  	 	 	<h5>상품 가격</h5>		  	
	  	 	 	<input name="ITEM_PRICE" type="text" class="form-control">
	  	 	 	<hr>	
	  	 	 	
	  	 	 	<h5>상품 내용</h5>
	  	 	 	<input name="ITEM_CONTENT" type="text" class="form-control">
	  	 	 	<hr>
	  	 	 		
	  	 	 	<h5>상품 이미지</h5>
			  	<div class="form-group">
				 	<label for="ITEM_IMAGE_FILE">파일 첨부</label>
					<label for="upfile">
						<img src="${image}" alt="파일첨부">
					</label>
					<input type="file" id="upfile" name="uploadfile">
					<span id="filevalue"></span>
		  		</div> 	  	 	 	
		  	 	 		  	 	 
		  	 	 <button type="submit" class="btn btn-primary">상품 등록</button>
		  	 	 <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		  	 	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		  	 	 
		  	 </form>
	      </div>  	      
	    </div>
	  </div>
	</div>	
	
</body>	