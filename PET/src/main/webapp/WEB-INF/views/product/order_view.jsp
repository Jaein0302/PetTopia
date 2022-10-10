<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<style>
.order { margin : 0 auto;
			width : 700px}
			
.item tbody tr td span  { 
							float : right;
							position : relative;
							right : 40px;
							}
.total h5 {display:inline; position:relative; left : 30px}
.total h4 {display:inline; float : right; position:relative; right : 40px}		
.total {background : lightgray;}		
.purchase { text-align : center; display:inline-block; width:100%}			
.purchase button { width : 200px; height : 40px;}

</style>

<script>

$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	/*
	예약하기 버튼을 클릭했을때
	1. 결제방식이 현장결제라면 바로 예약해준다
	2. 결제방식이 카카오페이라면 카카오페이 창을 띄운다
	*/
    $(".purchase").click(function() {    	
    	var IMP = window.IMP;
        IMP.init('imp76641672');
        
        
    	if( $('#select_pay').val() == 'KAKAO_PAY'){ //결제방식이 카카오페이 일때
    		
    		 // IMP.request_pay(param, callback) 결제창 호출
    		IMP.request_pay({ // param
   				pg: "kakaopay",
   			 	pay_method: "card",
   		        merchant_uid: "ORD20180131-0000012",
   		        name: "노르웨이 회전 의자",
   		        amount: 64900,
   		        buyer_email: "gildong@gmail.com",
   		        buyer_name: "홍길동",
   		        buyer_tel: "010-4242-4242",
   		        buyer_addr: "서울특별시 강남구 신사동",
   		        buyer_postcode: "01181" 		
    		 }, function (rsp) { // callback			
    			 if (rsp.success) {    		
    				 alert("결제 성공");
    			 } else {
    				 alert("결제 실패");
    			 }
    		 }
    		 );
    	} else { //결제방식이 현장결제일때
    		$.ajax({
				 url:'purchase', 
				 method:'POST',
				 dataType : 'json',
				 data: {
	    			 "order_id" : Date.now() + Math.random(),
	    			 "order_member_id" : "${memberlist.member_id}",
	    			 "order_item_id" : "${productdata.ITEM_ID}",
	    			 "order_item_sellerName" : "${memberlist.member_name}",
	    			 "order_item_name" :"${productdata.ITEM_NAME}",
	    			 "order_item_price" :"${productdata.ITEM_PRICE}",
	    			 "order_time" : "${order_date}",
	    			 "order_location" : "${memberlist.member_address}",
	    			 "order_image" : "${productdata.ITEM_IMAGE_FILE}"
				 },
				 beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
				 success : function(result) {
					 console.log(result);
					 if(result == 1) {
						 alert("결제 성공");
					 } else {
						 alert("결제 실패");
					 }
				 }, //success end
				 error:function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					} // error end
			 }) //ajax end    		
    	}
    })//purchase click function    
})
	
  </script>



<body>
	<jsp:include page="../member/header.jsp" />
	
	<!-- 주문페이지 -->
	<div class="order">
	<table class="table text-left m-2" style="width:100%">
	 	<thead>
		 	<tr style="border:none">
			 	<th>
			 	   <span class="commu pr-4">&ensp;주문결제</span>
			    </th>
			</tr>
		</thead>
	</table>	
	
		<table class="table text-left mt-3 item">
		   	<tbody class='border-bottom '>
		   	   	<tr>
			   		<td class='border-left' rowspan='5' style="width:200px">
	                 	<img class='img-fluid w-15' src="/pet_topia/upload${productdata.ITEM_IMAGE_FILE}" style="width:150px;hegith:150px; ">
			   		</td>
		   		</tr>
		   		<tr>
					<td>상품명<span>${productdata.ITEM_NAME}</span></td>
		   		</tr>
		   		<tr>
					<td>예약날짜<span id="date">${order_date }</span></td>
		   		</tr>
		   		
		   		<tr>
					<td>가격<span>${productdata.ITEM_PRICE}원</span></td>
		   		</tr> 		
		   	</tbody>
	   	</table>
		   
		<div class="mt-4 mb-4 total">	   		
			<h5>총 합계금액</h5><h4><c:out value = "${productdata.ITEM_PRICE}"/>원</h4>
		</div>
		
		<table class="table text-left mt-5 item">
		 	<thead>
			 	<tr>
				 	<th colspan="2">구매자 정보</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
				 	<td>이름</td>
				 	<td>${memberlist.member_name}</td>
				</tr>		
				
				<tr>
				 	<td>휴대폰 전화</td>
				 	<td>${memberlist.member_tell}</td>
				</tr>		
				
				<tr>
				 	<td>이메일 주소</td>
				 	<td>${memberlist.member_email}</td>
				</tr>	
				
				<tr>
					<td>결제방식</td>
					<td>
						<select name="select_pay" id="select_pay">
							<option value="CASH">현장결제</option>
							<option value="KAKAO_PAY">카카오페이</option>
						</select>
					</td>
				</tr>	
			</tbody>	
		</table>	
		<div class="purchase">			
			<button class="btn btn-primary">결제하기</button> 
		</div>
	</div>
</body>	