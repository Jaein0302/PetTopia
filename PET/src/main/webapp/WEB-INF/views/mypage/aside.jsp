<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 일반회원 aside 메뉴 -->
<!-- 
회원정보 수정
예약내역
내가 남긴 문의
내가 남긴 리뷰
내 글
내 댓글
회원 탈퇴
 -->
 <sec:authorize access="hasRole('ROLE_MEMBER')">
 <sec:authentication property="principal" var="pinfo"/>
		<aside>
			<h4>마이페이지</h4>
				<ul class="nav nav-pills flex-column" id="myPageName" style="width: 200px">
					 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/update">회원정보 수정</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/order/list?member_id=${pinfo.username}">예약내역</a></li>
	                 <li class="nav-item"><a class="nav-link" href="#">내가 남긴 문의</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/order/myreview?member_id=${pinfo.username}">내가 남긴 리뷰</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}">내 글</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}">내 댓글</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/withdraw">회원 탈퇴</a></li>
               	</ul>
		</aside>
</sec:authorize>


<!-- 판매자 계정 aside 메뉴 -->
<!-- 
회원정보수정
내글
내댓글
나의 일정확인
내 상품관리
 -->
 <sec:authorize access="hasRole('ROLE_SELLER')">
 	<aside>
			<h4>판매자 메뉴</h4>
				<ul class="nav nav-pills flex-column" id="myPageName" style="width: 200px">
					 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/update">회원정보 수정</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}">내 글</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}">내 댓글</a></li>
					 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/SCH?member_id=${pinfo.username}">나의 일정 확인</a></li>
					 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/product/my_product?member_id=${pinfo.username}">내 상품 관리</a></li>
					 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/withdraw">회원 탈퇴</a></li>
               	</ul>
		</aside>
 </sec:authorize>
 
 <!-- admin 계정 aside 메뉴 -->
 <sec:authorize access="hasRole('ROLE_ADMIN')">
 	<aside>
 		<h4>관리자 메뉴</h4>
 			<ul class="nav nav-pills flex-column" id="myPageName" style="widht: 200px">
 				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/update">회원정보 수정</a></li>
 				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}">내 글</a></li>
	            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}">내 댓글</a></li>
	            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/admin_list">회원 목록</a></li>
 			</ul>
 	</aside>
 </sec:authorize>
</body>
</html>