<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/Order/orderlist.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>
 <div class="container mb-5 mainbody" style="height:1500px;margin-top:220px;">
  <div class="row px-xl-5">
  
   <!-- 사이드바 -->	  
   <div class="col-md-3 pb-3 m-0">
	  <jsp:include page="../mypage/aside.jsp" />
   </div>
   
   <div class="col-md-9 pb-3">
    
    <!-- 예약중 -->
    <table class="table text-left m-0" style="width:100%">
	 	<thead>
		 	<tr style="border:none">
			 	<th>
			 	   <span class="onair"></span>
			 	   <span class="commu pr-4">&ensp;예약중</span>
			 	   <span class="text-small1">( 총 <span class="text-comment">1</span>건의 예약이 있습니다 )</span>
			    </th>
			</tr>
		</thead>
	</table>
   
   <!-- 예약내역 -->
   <table class="table text-left mt-3 order">
	<colgroup>
	<col width="20%" />
	<col width="55%" />
	<col width="25%" />
	</colgroup>
   		<tr>
	   		<th class='pb-0' colspan='2'>
	   			<i class="fas fa-angle-right"></i>&ensp;
	   				예약번호&ensp;:&ensp;ABC12345678
	   		</th>
	   		<th class='text-right pb-0'>
	   			<span class='order-modify pr-2'>예약 수정</span><span class='text-small1'>|</span>
	   			<span class='order-cancel pl-2'>예약 취소</span>
	   		</th>
   		</tr>
   	<tbody class='border-bottom'>
   	   	<tr>
	   		<td class='border-left' rowspan='4'>
	   			<img src="${pageContext.request.contextPath}/resources/img/Main/product-4.jpg" 
	   				 style="width:150px;hegith:150px;">
	   		</td>
   		</tr>
   		<tr>
   			<td class='text-dark'>반려견 놀이훈련</td>
   			<td class='border-left border-right text-center order-price' rowspan='4'>30,000원</td>
   		</tr>
   		<tr>
   			<td>애견훈련교실
   				<i class="fas fa-map-marker-alt pl-1"></i>
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<span class="p-subTitle1">22.10.25 화&ensp;|&ensp;오후 3:00</span>
   			</td>
   		</tr>
   	</tbody>
   </table>
   
   <!-- 지난 예약 -->
    <table class="table text-left mt-5" style="width:100%">
	 	<thead>
		 	<tr style="border:none">
			 	<th>
			 	   <span class="bounce arrow-bounce pr-2"><i class="fa fa-2x fa-chevron-down"></i></span>
			 	   <span class="commu"> 지난 예약</span>
			    </th>
			</tr>
		</thead>
	</table>
   
   
    <!-- 지난 예약내역 -->
   <table class="table text-left mt-3 order">
	<colgroup>
	<col width="20%" />
	<col width="55%" />
	<col width="25%" />
	</colgroup>
   		<tr>
	   		<th class='pb-0' colspan='2'>
	   			<i class="fas fa-angle-right"></i>&ensp;
	   				예약번호&ensp;:&ensp;DEF12345678
	   		</th>
	   		<th class='text-right pb-0'>
	   			<span class='text-comment'><i class="fas fa-pencil-alt"></i>
	   				리뷰 쓰기
	   			</span>
	   		</th>
   		</tr>
   	<tbody class='border-bottom'>
   	   	<tr>
	   		<td class='border-left' rowspan='4'>
	   			<img src="${pageContext.request.contextPath}/resources/img/Main/dog6.jpg" 
	   				 style="width:150px;hegith:150px;">
	   		</td>
   		</tr>
   		<tr>
   			<td class='text-dark'>반려동물 인생샷찍기</td>
   			<td class='border-left border-right text-center order-price' rowspan='4'>30,000원</td>
   		</tr>
   		<tr>
   			<td>애견스튜디오
   				<i class="fas fa-map-marker-alt pl-1"></i>
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<span class="order-price">22.10.01 화&ensp;|&ensp;오후 5:00</span>
   			</td>
   		</tr>
   	</tbody>
   </table>
   
   </div>
  </div>
  </div>
</body>
<jsp:include page="../member/footer.jsp" />
</html>