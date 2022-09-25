<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
<link href="${pageContext.request.contextPath}/resources/css/Community/list.css" type="text/css" rel="stylesheet">
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
	
	<form method="post" action="">
	<table class="commut" >
	<!-- 테이블 간격 -->
	<colgroup>
	<col width="15%" />
	<col width="85%" />
	</colgroup>
	<!-- 작성 페이지 -->
	<sec:authorize access="isAuthenticated()">
	 	<sec:authentication property="principal" var="pinfo"/>
	    <tr>
	    	<td>글쓴이</td>
	    	<td colspan="4"><input class="inputname" type="text" name="user_name" value="${pinfo.username}" readOnly></td>
	    </tr>
	    <tr>
	    	<td>제목</td>
	    	<td colspan="4"><input class="inputsub" type="text" name="subject" placeholder="제목을 입력해 주세요." required></td>
	    </tr>
	    <tr>
	    	<td>내용</td>
	    	<td colspan="4"><textarea class="inputcon" name="content" placeholder="내용을 입력해 주세요."></textarea></td>
	    </tr>
	 	<tr>
	 	<td colspan="5">
	 		<button type="submit" class="addcommu button-5">등록</button>
	 		<button type="button" class="cancommu button-5">취소</button></td>
	 	</tr>
	 </sec:authorize>
	    </table>
</form>
	
   </div>
  </div>
 </div>

<script src="${pageContext.request.contextPath}/resources/js/Community/c_list.js"></script>

</body>
<jsp:include page="../member/footer.jsp" />
</html>