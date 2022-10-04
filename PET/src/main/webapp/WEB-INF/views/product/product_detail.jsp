<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 수술/치료</title>
<link href="${pageContext.request.contextPath}/resources/css/Product/detail.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	p > span, p> select { 
							float : right;
							position : relative;
							right : 60px;
							}
	#tab1, #tab2, #tab3, #tab4 {position : relative;
								left : 20px;
								}
	span img { width : 30px}
</style>
<script>

var result = "${result}";

$(function() {	
	$(".amount").on('change', function(){
		var p_price = $(".product_price").text().slice(0, -1);
		console.log("p_price=" + p_price)
		var t_price = $(".amount").val() * p_price;		
		$(".total_price").html(t_price);
	})
	
	if(result == 'addSuccess'){
		alert("상품 문의 성공입니다.");
	}
	
	$(".purchase").on('click', function(){
		location.href = "${pageContext.request.contextPath}/product/purchase?ITEM_ID=${productdata.ITEM_ID}&amount=" + $(".amount").val();
	})
});

$(function() {	
	
	$(".amount").on('change', function(){
		var p_price = $(".product_price").text().slice(0, -1);
		console.log("p_price=" + p_price)
		var t_price = $(".amount").val() * p_price;		
		$(".total_price").html(t_price);
	})
	
	
	//달력모양 아이콘 클릭시에 캘린더 팝업창으로 보여주기
	$("#openCalendar").click(function (){
		window.open("openCalendar","get","width=900, height=900");
	})
	
});


</script>

</head>

<body>
	<jsp:include page="../member/header.jsp" />
	
	<div class="row align-items-center justify-content-center detail">
		<div class="col-sm-9 ">
			<br>
			<div>
				<b>상품 상세보기</b>
			</div>
			<hr	style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
			<br>
			
			
			<div class="container">
				<form>
				<div class="row text-center detailbox">
					<div class="uploadResult"></div>
                 		<img class='img-fluid w-10' src="/pet_topia/upload${productdata.ITEM_IMAGE_FILE}" style="width:450px; height:450px">
					<div class="col-sm-6">
						<p>상품명 <span>${productdata.ITEM_NAME}</span> </p>
						<hr>
						<p>판매가 <span class="product_price">${productdata.ITEM_PRICE}원</span> </p>
						<hr>
						<p>상품개수 
							<select class="amount" name="amount" id="size-select">
								<option value="0">--[상품개수를 선택하세요]--</option>
								<option value="1">1개</option>
								<option value="2">2개</option>
								<option value="3">3개</option>
								<option value="4">4개</option>
								<option value="5">5개</option>
							</select>
							<c:set var="amount1" value="amount"/>
						</p>
						<hr>
						<p>예약 날짜/시간 정하기 
							<span>					
								<img id="openCalendar" class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Product/calendar.png">
							</span>
						</p>
						<hr>


						<p>총 상품 금액 <span class="total_price"> </span></p> 
						<hr style="opacity: 1; background-color: black; margin: 0 auto">
						<br>
						<button type="button" class="btn btn-primary">관심상품 담기</button>
						<button type="button" class="btn btn-primary">장바구니 담기</button>
						<button type="button" class="btn btn-primary purchase">바로 구매하기</button>
						</a>
					</div>
				</div>
				</form>
				<br>
			</div>
			<hr
				style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
			<br>

			<div class="tab">
				<input id="tab1" type="radio" name="tabs" checked>
				<label for="tab1">상품상세정보</label> 	
							
				<input id="tab2" type="radio" name="tabs"> 				
				<label for="tab2">상품 구매후기</label> 
				
				<input id="tab3" type="radio" name="tabs"> 
				<label for="tab3">상품 문의</label> 
				
				<input id="tab4" type="radio" name="tabs"> 
				<label for="tab4">취소/ 환불</label>
				

				<section id="content1">
					<p>상세정보</p>
				</section>

				<section id="content2">
					<jsp:include page='review_view.jsp' />
				</section>
				
				<section id="content3">
					<jsp:include page='ask_view.jsp' />
				</section>

				<section id="content4">
					<p>취소/ 환불</p>
				</section>

			</div>

		</div>
	</div>
<jsp:include page="../member/footer.jsp" />
</body>
</html>