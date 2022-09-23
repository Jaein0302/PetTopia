<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>펫토피아 - 통합검색페이지</title>
<style>
.joinbtn{border:1px solid silver;margin:0 40px;border-radius:20px;cursor:pointer}
.joinbtn:hover, .joinbtn:active{background-color:#f7e1ab;border:1px solid #f7e1ab}
</style>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="header.jsp" />
</div>

<div class="container mb-5 mainbody" style="height:400px;margin-top: 300px;">
  <div class="row px-xl-5">
   <div class="col-lg-12" style="margin:0 auto;">
 		통합검색 페이지
 		<br>
 		검색 키워드 : ${item}
   </div>
  </div>
 </div>

    
<jsp:include page="footer.jsp" />
</body>
</html>