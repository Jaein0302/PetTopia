<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/Main/aside.css" type="text/css" rel="stylesheet">
</head>
<body>
 <sec:authorize access="isAuthenticated()">
 <sec:authentication property="principal" var="pinfo"/>
      <aside>
         <h4><i class="fas fa-user-circle pr-2"></i>마이페이지</h4>
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
<script src="${pageContext.request.contextPath}/resources/js/Main/aside.js"></script>
</body>
</html>