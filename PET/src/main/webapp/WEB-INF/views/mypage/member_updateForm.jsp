<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<title>회원관리 시스템 회원수정 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
h3{
	text-align: center; color: #1a92b9;
}
input[type=file]{
	display:none;
}
</style>
</head>
<body>
<jsp:include page="../member/header.jsp"/>
<div class="container mb-5">
   <form class="mform" name="updateform" action="updateProcess" method="post">
	<h1>회원 정보 수정</h1>
	<hr>
	<b>아이디</b>
	<input type="text" class="jinput" name="id" value="${memberinfo.member_id}" readonly>
	
	<b>비밀번호</b>
	<input type="password" name="password" value="${memberinfo.member_password}" readonly>
	
	<b>이름</b>
	<input type="text" class="jinput" name="name" value="${memberinfo.member_name}" placeholder="Enter name" 
		   required>
	
	<b>이메일 주소</b>
	<input type="text" class="jinput" name="email"  value="${memberinfo.member_email}" placeholder="Enter email"
		required><span id="email_message"></span>
	
	<div class="clearfix">
		<button type="submit" class="submitbtn" style="padding: 14px 20px;">수정</button>
		<button type="button" class="cancelbtn">취소</button>
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</div>
<script>

</script>
</body>
</html>