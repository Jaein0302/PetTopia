<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/Community/write.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

 <div class="container mb-5 mainbody" style="height:1100px;margin-top:220px;">
  <div class="row px-xl-5">
   <div class="col-lg-12" style="margin:0 auto;">
 		
	<table class="table text-center">
 	<thead>
   <tr style="border:none">
     <th colspan="3" class="text-left"><span class="commu">&emsp;커뮤니티&nbsp;</span><i class="fas fa-paw"></i></th>
     <th colspan="2" class="text-right">
     </th>
     </tr> 
	</thead>
	</table>
	
<form class="mform" method="post" action="${pageContext.request.contextPath}/community/add" enctype="multipart/form-data">
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo"/>
	  <input type="hidden" name="commu_name" value="${pinfo.username}">
	  <b>제목</b>
	  <input class="jinput" type="text" name="commu_subject" placeholder="제목을 입력해 주세요." maxlength="50" required>
	  <b>대표 이미지</b>
	  <input class="jinput" type="file" name="commu_thumbnail" accept="image/*" style="font-size:0.9rem;">
	  <b>내용</b>
	  <textarea class="jtextarea" name="commu_content"></textarea>    
	  <b>사진 첨부</b>
	  <input class="jinput" type="file" name="commu_thumbnail" accept="image/*" style="font-size:0.9rem;">
	
	  <div class="clearfix">
		 <button type="submit" class="button-5 cancelbtn updateb">등록</button>
		 <button type="reset" class="button-5 submitbtn signoutb">취소</button>
	  </div>
	
	 </sec:authorize>
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
	
   </div>
  </div>
 </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Community/c_list.js"></script>
</body>
<jsp:include page="../member/footer.jsp" />
</html>