<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="${pageContext.request.contextPath}/resources/css/Community/list.css" type="text/css" rel="stylesheet">
</head>
<style>
.mform {
    background-color: #fefefe;
    margin: 1% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    width: 80%; /* Could be more or less, depending on screen size */
    padding: 16px;
}
</style>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

 <div class="container mb-5 mainbody" style="height:500%;margin-top:220px;">
  <div class="row px-xl-5">
   <div class="col-lg-12" style="margin:0 auto;">
 		
	<table class="table text-center m-0">
 	<!-- 테이블 간격 -->
	<colgroup>
	<col width="40%" />
	<col width="29%" />
	<col width="31%" />
	</colgroup>
 	<thead>
 	<tr style="border:none">
 	<th colspan="1" class="text-left"><span class="commu">&emsp;커뮤니티&nbsp;</span><i class="fas fa-paw"></i></th>
    <th colspan="1" class="text-center">
     <span><i class="fas fa-star"></i>추천 게시글 TOP 5&emsp;</span>
	     <div class="block">
		    <ul id="ticker">
		    <c:forEach var="h" items="${hlist}" end="4"  varStatus="status">
		        <li><a href="detail?num=${h.commu_num}">
		        <span class="text-count">${status.index+1}</span>
		        <span class="text-body"><c:out value="${h.commu_subject}" escapeXml="true" /></span>
	  			<span class="text-comment text-small">[<c:out value="${h.cnt}"/>]</span>
		        </a></li>
		    </c:forEach>
		    </ul>
		</div>
	</th>
	<th colspan="1" class="text-right">
	
	<!-- 글쓰기 버튼 -->
	 <div class="text-right">
	 <sec:authorize access="isAnonymous()">
	  <input type="button" class="button-5 postb cowrite" value="글쓰기" >
	 </sec:authorize>
	 <sec:authorize access="isAuthenticated()">
	  <input type="button" class="button-5 postb" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/community/write'" >
	  </sec:authorize>
	 </div>
	
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
     	  <i style="color:#4a4c4b;"class="fa fa-clock-o"></i>&nbsp;&nbsp;${fn:replace(c.commu_date, '-', '.')}&nbsp; <span style="font-size:12px">|</span>&nbsp;  
     	  <i style="color:#4a4c4b;"class="fa fa-eye"></i>&nbsp;&nbsp;${c.commu_readcount}</td>
     	</tr>
    
     	<tr>
     	 <td colspan="2" style="text-align:left!important;height:200px;border:none;padding-top:20px">
     	 <div style="white-space:pre-wrap;font-size:16px;padding:10px 15px">${c.commu_content}</div></td>
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
<script>
$(function(){
	$(".deletechk").click(function () {
	    var answer = confirm('정말 삭제하시겠습니까?');
	    if (answer) {
	    	$(location).attr('href','${pageContext.request.contextPath}/community/delete?num=${c.commu_num}'); 	
	    }
	});
		//로그인 후 글쓰기 가능
		$(".cowrite").click(function () {
		    Swal.fire({
						position: 'center',
						icon: 'warning',
						title: '로그인 후 이용가능합니다.',
						showConfirmButton: false,
						timer: 1000
					})
		});
		//추천 게시글
		 var ticker = function()
	    {
	        setTimeout(function(){
	            $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
	            {
	                $(this).detach().appendTo('ul#ticker').removeAttr('style');
	            });
	            ticker();
	        }, 2000);
	    };
	    ticker();
		
});
</script>
</body>
<jsp:include page="../member/footer.jsp" />
</html>