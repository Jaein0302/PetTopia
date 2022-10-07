<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>문의하기</title>
 <jsp:include page="../member/header.jsp" />  
 <!-- 검색어를 입력한 후 다시 memberList.net으로 온 경우 검색 필드와 검색어가 나타나도록 합니다. -->
 <style>
 
 <style>
/* Style the sidebar - fixed full height */
.sidebar {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 250px;
  background-color: #e7cc87;
  overflow-x: hidden;
  padding-top: 250px;
}

/* Style sidebar links */
.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
}

/* Style links on mouse-over */
.sidebar a:hover {
  color: #f1f1f1;
}

/* Style the main content */
.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 10px;
}

/* Add media queries for small screens (when the height of the screen is less than 450px, add a smaller padding and font-size) */
@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
</style>


</head>
<body>
<div class="sidebar">
  <a href="${pageContext.request.contextPath}/admin/admin_notice"><i class="fa fa-fw fa-home"></i> 공지사항</a>
  <a href="#services"><i class="fa fa-fw fa-wrench"></i> 이벤트</a>
  <a href="${pageContext.request.contextPath}/admin/admin_ask_list"><i class="fa fa-fw fa-envelope"></i>1:1문의</a>
</div>


문의하기 했던 게시글이 나옴.
admin_ask_list 모델앤뷰 값이 전달이 됩니다.

넘어갔는지 = ${ask}
<br>
<a href="${pageContext.request.contextPath}/admin/admin_eventlist" class="nav-item nav-link me3">이벤트</a>

<button class="btn btn-primary" type="submit">문의하기</button>

</body>
<script>
$(function(){
	$("button").click(function(){
		location.href="admin_ask_write";
	})
})
</script>	
	
</html>