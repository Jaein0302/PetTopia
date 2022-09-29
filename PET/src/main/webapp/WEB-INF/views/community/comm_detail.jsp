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
<link href="${pageContext.request.contextPath}/resources/css/Community/summernote-lite.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

 <div class="container mb-5 mainbody" style="height:1000px;margin-top:220px;">
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
     <table class="table viewp1">
      	<tr>
     	  <td colspan="2" style="text-align:center!important;background: #f9c5276b;color: #56565a;font-size: 19px;
    font-weight: bold;">
     	  <c:out value="${c.commu_subject}" /></td>
     	</tr>
     	<tr style="border-bottom:0.6px solid #EDF1FF">
     	  <td style="text-align:left!important;font-size: 15px;color: #4a4c4b;">
     	 <div title="게시글 보기" style="cursor:pointer"><input type="hidden" id="name" name="name" value="${c.commu_name}">
     	 <input type="hidden" id="user_name" name="user_name" value="${c.commu_name}">
     	 <i style="color:#4a4c4b;"class="fa fa-user"></i>&nbsp; <span class="userdoc" >${c.commu_name}</span></div>
     	 </td>
        <td style="text-align:right!important;font-size: 14px;color: #4a4c4b;">
     	  <i style="color:#4a4c4b;"class="fa fa-clock-o"></i>&nbsp;&nbsp;${c.commu_date}&nbsp; <span style="font-size:12px">|</span>&nbsp;  
     	  <i style="color:#4a4c4b;"class="fa fa-eye"></i>&nbsp;&nbsp;${c.commu_readcount}</td>
     	</tr>
    
     	<tr>
     	 <td colspan="2" style="text-align:left!important;height:200px;border:none;padding-top:20px">
     	 <div style="white-space:pre-wrap;font-size:16px;padding:10px 15px"><c:out value="${c.commu_content}" /></div></td>
     	</tr>
     	
		<tr>
		<td  colspan="2" >
		<div style="text-align:right;">
		
		<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="pinfo"/>
		<c:if test="${c.commu_name == pinfo.username || pinfo.username == 'admin' }">
			<a style="color:#0ab9a0;font-size:16px" 
			   href="${pageContext.request.contextPath}/community/modifyView?num=${c.commu_num}"><i class="fas fa-edit"></i>&nbsp;수정</a>
			&ensp;
			<a style="color:tomato;font-size:16px;cursor:pointer" class="deletechk"><i class="fas fa-trash-alt"></i>&nbsp;삭제</a>
			&ensp;
			</c:if>
		</sec:authorize>
			<a href="${pageContext.request.contextPath}/community/list" style="padding-right:10px;">
			 <i class="fa fa-list-ul" style="color:#444444;font-weight:lighter;font-size:16.5px"></i>
			 <span style="color:#444444;font-size:16px;font-weight:bold;">목록</span></a>
		</div>	
		</td>
		</tr>
 	</table>		
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
	
   </div>
  </div>
 </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Community/c_list.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Community/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Community/summernote-ko-KR.js"></script>
<script>
$(function(){
	$(".deletechk").click(function () {
	    var answer = confirm('정말 삭제하시겠습니까?');
	    if (answer) {
	    	$(location).attr('href','${pageContext.request.contextPath}/community/delete?num=${c.commu_num}'); 	
	    }
	});
});
</script>
</body>
<jsp:include page="../member/footer.jsp" />
</html>