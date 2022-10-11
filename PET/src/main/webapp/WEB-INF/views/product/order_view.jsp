<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- fullcalender -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.js'></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

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




<body>


	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="hidden_token">   
	
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
		   			<td>판매자<span id="seller_id">${productdata.MEMBER_ID}</span></td>
		   		</tr>
		   		
		   		<tr>
		   			<td>주소<span>${productdata.ITEM_ADDRESS }</span></td>
		   		</tr>
		   				
		   	</tbody>
	   	</table>
		   
		<div class="mt-4 mb-4 total">	   		
			<h5>금액</h5><h4><c:out value = "${productdata.ITEM_PRICE}"/>원</h4>
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
				
				<tr>
					<td>예약 일자 정하기</td>
					<td>
						<button type="button" class="btn btn-danger"  data-toggle="modal" data-target="#open_sch" id="confirm" >예약 일자를 설정해주세요</button>
						<input type="hidden" value="2022-10-10 19:00" id="hidden_time">
					</td>
				</tr>	
			</tbody>	
		</table>	
		
		<form action="${pageContext.request.contextPath}/product/purchase2" method="POST">
   			<input type="hidden" name="order_id" value="1">
  			<input type="hidden" name="order_item_id" value="${productdata.ITEM_ID}">
   			<input type="hidden" name="order_item_sellerName" value="${memberlist.member_name}">
   			<input type="hidden" name="order_item_name" value="${productdata.ITEM_NAME}">
   			<input type="hidden" name="order_item_price" value="${productdata.ITEM_PRICE}">
   			<input type="hidden" name="order_time" value="2022-10-10 19:00">
   			<input type="hidden" name="order_location" value="${memberlist.member_address}">
   			<input type="hidden" name="order_image" value="${productdata.ITEM_IMAGE_FILE}">
   			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
   			<button type="submit">결제하기</button>
		</form>
	</div>
	
<!-- open_sch modal -->
<div class="modal" id="open_sch">
 <div class="modal-xl">
  <div class="modal-content">
		<!-- Modal body -->
		<div class="modal-body">
			<div id='wrap'>
				<div id='calendar'></div>
					<br>
				<div class="fc">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</div>
			</div>
		</div>
  </div>
 </div>
</div>

<script>
$(document).ready(function(){
	
	console.log("${productdata.ITEM_IMAGE_FILE}")
	
	/*
	예약하기 버튼을 클릭했을때
	
	1. 우선 예약 일자가 설정 되었는지 확인한다 (빨강버튼을 클릭하면 예약모달을 띄우고 거기서 완료되면 초록버튼으로 바꿀것임)
	2. 결제방식이 현장결제라면 바로 예약해준다
	3. 결제방식이 카카오페이라면 카카오페이 창을 띄운다
	*/
	
	$(".purchase").click(function (){
		
		var IMP = window.IMP;
        IMP.init('imp24704360');
        
        if($("#confirm").html() =='테스트중'){//예약설정 안했을때 
    		alert("예약 일자를 설정해주세요");
    	} else { //예약설정했을때
    		
    		if( $('#select_pay').val() == 'KAKAO_PAY'){//결제방식이 카카오페이 일때
    			
    			 // IMP.request_pay(param, callback) 결제창 호출
    			 IMP.request_pay({//param
    				 pg: "kakaopay",
    				 pay_method: "card",
    				 order_id: "Y" + new Date().getTime(),
    				 name: "${productdata.ITEM_NAME}",
    				 item_id: "${productdata.ITEM_ID}",
    				 amount: "${productdata.ITEM_PRICE}",
    				 count: 1,
    				 buyer_id: "${memberlist.member_id}",
    				 buyer_addr: "${memberlist.member_address}"
    			 }, function (rsp){//callback 함수
    				 
    				 if(rsp.success){
    					 $.ajax({
    						 url: 'purchase',
    						 method: 'POST',
    						 contentType: "application/json; charset=UTF-8",
    						 data : {
    							 "order_id" : Date.now() + Math.random(),
    		   	    			 "order_member_id" : "${memberlist.member_id}",
    		   	    			 "order_item_id" : "${productdata.ITEM_ID}",
    		   	    			 "order_item_sellerName" : "${memberlist.member_name}",
    		   	    			 "order_item_name" :"${productdata.ITEM_NAME}",
    		   	    			 "order_item_price" :"${productdata.ITEM_PRICE}",
    		   	    			 "order_time" : $('#hidden_time').val(),
    		   	    			 "order_location" : "${memberlist.member_address}",
    		   	    			 "order_image" : "${productdata.ITEM_IMAGE_FILE}" //json으로 값을 넘길때 \가 깨지고 있음
    						 }, //data
    		   				 beforeSend : function(xhr){
    		   						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    		   				 },
    						 success: function(result){
    							 console.log(result);
    							 
    							 if(result ==1){
    								 alert("결제 성공");
    							 } else {
    								 alert("결제 실패");
    							 }
    						 }, //success
    						 error: function(request, status, error){
    							 alert("code : "+ request.status + "\n message : "+ request.responseText + "\n error : " + error);
    						 }//error
    					 })//ajax
    				 } else {
    					 alert("결제 실패");
    				 }
    			 })
    		} else { //결제 방식이 현장 결제일때 바로 예약 테이블로 넣어버리기
    			
    			 $.ajax({
					 url: 'purchase',
					 method: 'POST',
					 contentType: "application/json; charset=UTF-8",
					 data : {
						 "order_id" : Date.now() + Math.random(),
	   	    			 "order_member_id" : "${memberlist.member_id}",
	   	    			 "order_item_id" : "${productdata.ITEM_ID}",
	   	    			 "order_item_sellerName" : "${memberlist.member_name}",
	   	    			 "order_item_name" :"${productdata.ITEM_NAME}",
	   	    			 "order_item_price" :"${productdata.ITEM_PRICE}",
	   	    			 "order_time" : $('#hidden_time').val(),
	   	    			 "order_location" : "${memberlist.member_address}",
	   	    			 "order_image" : "${productdata.ITEM_IMAGE_FILE}" //json으로 값을 넘길때 \가 깨지고 있음
					 }, //data
	   				 beforeSend : function(xhr){
	   						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	   				 },
					 success: function(result){
						 console.log(result);
						 
						 if(result ==1){
							 alert("결제 성공");
						 } else {
							 alert("결제 실패");
						 }
					 }, //success
					 error: function(request, status, error){
						 alert("code : "+ request.status + "\n message : "+ request.responseText + "\n error : " + error);
					 }//error
				 })//ajax
    		}
    	}//예약설정 했을때 end
	})//purchase button click function
	
	
	
	
	$("#confirm").click(function(){
		
		var member_id = $('#seller_id').html()
		
	    var request = $.ajax({
	        url: "../mypage/getSchListByID",
	        data : {"seller_id" : member_id},
	        beforeSend : function(xhr)
	        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        method: "GET",
	        dataType: "json"
	    });
		
        request.done(function (data) {
            console.log(data); // log 로 데이터 찍어주기.

            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
            	locale: 'ko',
            	timeZone : 'Asia/Seoul',
                initialView: 'timeGridWeek',
                slotMinTime: '08:00',
                slotMaxTime: '23:00',
                eventDurationEditable : false,
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'timeGridWeek,timeGridDay'
                },
                editable: false,
                droppable: true, // this allows things to be dropped onto the calendar
                drop: function (arg) {
                    // is the "remove after drop" checkbox checked?
                    if (document.getElementById('drop-remove').checked) {
                        // if so, remove the element from the "Draggable Events" list
                        arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                    }
                },
                /**
                 * data 로 값이 넘어온다. log 값 전달.
                 */
                events: data
            });

            calendar.render();
        });
        
        
        request.fail(function( jqXHR, textStatus ) {
            alert( "Request failed: " + textStatus);
        });
		
		
		
	})//confrim button click function
	
	
})
</script>
</body>	