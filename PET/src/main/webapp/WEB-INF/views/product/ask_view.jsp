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
	<%-- 게시글이 있는 경우 --%>
		<div class="rows">
			<span>줄보기</span>
			<select class="form-control" id="viewcount">
				<option value="1">1</option>
				<option value="3">3</option>
				<option value="5">5</option>
				<option value="7">7</option>
				<option value="10" selected>10</option>			
			</select>
		</div>
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
			<button type="button" class="btn btn-info floar-right" data-toggle="modal" data-target="#myModal">문의하기</button>
		</a>
	</div>
	
	<%-- modal 시작 --%>
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content"> 	      
	      <!-- Modal body -->
	      <div class="modal-body">
		  	 <form name="ask_form" action="/add" method="post">
		  	 	 <div>
		  	 	 	<p>제목</p>
		  	 	 	<input type="text" class="form-control">		  	 	 
		  	 	 </div>
		  	 	 <div>
		  	 	 	<p>내용</p>
					<textarea class="form-control" rows="5"></textarea>		  	 	 
				 </div>
		  	 	 <button type="submit" class="btn btn-primary">문의 등록</button>
		  	 	 <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		  	 </form>
	      </div>  	      
	    </div>
	  </div>
	</div>	
	
</body>