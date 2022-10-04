<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
<<<<<<< HEAD
<link href="${pageContext.request.contextPath}/resources/css/Community/list.css" type="text/css" rel="stylesheet">
=======
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/Community/write.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/Summernote/summernote-lite.css" type="text/css" rel="stylesheet">
>>>>>>> branch 'main' of https://github.com/ahslxj1993/Pet_Topia.git
</head>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

<<<<<<< HEAD
 <div class="container mb-5 mainbody" style="height:900px;margin-top:220px;">
=======
 <div class="container mb-5 mainbody" style="height:1100px;margin-top:220px;">
>>>>>>> branch 'main' of https://github.com/ahslxj1993/Pet_Topia.git
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
	
<<<<<<< HEAD
	<form method="post" action="">
	<table class="commut" >
	<!-- 테이블 간격 -->
	<colgroup>
	<col width="15%" />
	<col width="85%" />
	</colgroup>
	<!-- 작성 페이지 -->
=======
<form class="mform" method="post" action="${pageContext.request.contextPath}/community/add" enctype="multipart/form-data">
>>>>>>> branch 'main' of https://github.com/ahslxj1993/Pet_Topia.git
	<sec:authorize access="isAuthenticated()">
<<<<<<< HEAD
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
=======
	<sec:authentication property="principal" var="pinfo"/>
	  <input type="hidden" name="commu_name" value="${pinfo.username}">
	  <b>제목</b>
	  <input class="jinput" type="text" name="commu_subject" placeholder="제목을 입력해 주세요." maxlength="50" required>
	  
	  <label for="upfile">대표 이미지 업로드</label>
	  <input class="jinput" id="upfile" type="file" name="uploadfile" accept="image/*" style="font-size:0.9rem;width:50%">
	  <span id="filevalue"></span>
	  <input type="hidden" name="commu_thumbnail" id="check" value="">
	  <img src="${pageContext.request.contextPath}/resources/img/Main/remove.png" alt="파일삭제"
		 width="12px" class="remove">
	  
	  <b class="mt-3">내용</b>
	  <textarea id="summernote" name="commu_content"></textarea>
	
	  <div class="clearfix">
		 <button type="submit" class="button-5 cancelbtn updateb">등록</button>
		 <button type="reset" class="button-5 submitbtn signoutb">취소</button>
	  </div>
	
>>>>>>> branch 'main' of https://github.com/ahslxj1993/Pet_Topia.git
	 </sec:authorize>
	    </table>
</form>
	
   </div>
  </div>
 </div>

<script src="${pageContext.request.contextPath}/resources/js/Community/c_list.js"></script>
<<<<<<< HEAD

=======
<script src="${pageContext.request.contextPath}/resources/js/Community/write.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Summernote/lang/summernote-ko-KR.js"></script>
>>>>>>> branch 'main' of https://github.com/ahslxj1993/Pet_Topia.git
</body>
<jsp:include page="../member/footer.jsp" />
</html>