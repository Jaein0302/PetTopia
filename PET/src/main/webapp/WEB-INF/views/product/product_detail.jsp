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

</head>

<body>
	<jsp:include page="../member/header.jsp" />

	<div class="row align-items-center justify-content-center detail">
		<div class="col-sm-9 ">
			<br>
			<div>
				<b>상품 상세보기</b>
			</div>
			<hr
				style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
			<br>

			<div class="container">
				<div class="row text-center">
					<div class="fakeimg"></div>

					<div class="col-sm-6">
						<p>상품명</p>
						<hr>
						<p>판매가</p>
						<hr>
						<p>
							상품개수<span>&nbsp;&nbsp;</span> <select name="ITEM_AMOUNT"
								id="size-select">
								<option value="">--[상품개수를 선택하세요]--</option>
								<option value="1">1개</option>
								<option value="2">2개</option>
								<option value="3">3개</option>
								<option value="4">4개</option>
								<option value="5">5개</option>
							</select>
						</p>
						<hr>
						<p>예약 날짜/시간 정하기
						<hr>


						<p>총 상품 금액</p>
						<hr style="opacity: 1; background-color: black; margin: 0 auto">
						<br>
						<button type="button" class="btn">관심상품 담기</button>
						<button type="button" class="btn">장바구니 담기</button>
					</div>
				</div>
				<br>
			</div>
			<hr
				style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
			<br>

			<div class="tab">
				<input id="tab1" type="radio" name="tabs" checked>
				<!--디폴트 메뉴-->
				<label for="tab1">상품상세정보</label> <input id="tab2" type="radio"
					name="tabs"> <label for="tab2">상품 구매후기</label> <input
					id="tab3" type="radio" name="tabs"> <label for="tab3">상품
					문의</label> <input id="tab4" type="radio" name="tabs"> <label
					for="tab4">취소/ 환불</label>

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

</body>
</html>