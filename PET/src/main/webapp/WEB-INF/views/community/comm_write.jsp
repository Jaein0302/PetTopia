<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

 <div class="container mb-5 mainbody" style="height:900px;margin-top:220px;">
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
	
	<form class="mform" method="post" action="">
	<sec:authorize access="isAuthenticated()">
	  <b>제목</b>
	  <input class="jinput" type="text" name="subject" placeholder="제목을 입력해 주세요." required>
	   
	  <b>내용</b>
	  <textarea class="jinput" name="content" placeholder="내용을 입력해 주세요." style="height:400px"></textarea>
	    
	<div class="clearfix p-0" style="margin: 13px 0px 0px 33px!important;">
		<button type="submit" class="button-5 cancelbtn updateb">등록</button>
		<button type="reset" class="button-5 submitbtn signoutb">취소</button>
	</div>
	 </sec:authorize>
</form>
	
   </div>
  </div>
 </div>

<script src="${pageContext.request.contextPath}/resources/js/Community/c_list.js"></script>

</body>
<jsp:include page="../member/footer.jsp" />
</html>