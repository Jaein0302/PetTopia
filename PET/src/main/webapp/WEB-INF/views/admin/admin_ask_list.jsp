<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>문의하기</title>
</head>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>
 <div class="container mb-5 mainbody" style="height:1500px;margin-top:220px;">
  <div class="row px-xl-5">
  

 <!-- 사이드바 -->
	<div class="col-md-3 pb-3 m-0">
	  <jsp:include page="admin_aside.jsp" />
   </div>

	<div class="col-md-9 pb-3">
	 <table class="table text-center">
    <thead>
   <tr style="border:none">
     <th colspan="3" class="text-left"><span class="commu">고객센터&nbsp;</span><i class="fas fa-question-circle" style="font-size: 28px!important;color:#6F6F6F!important;"></i></th>
     <th colspan="2" class="text-right">
     </th>
     </tr> 
   </thead>
   </table>
	
	
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
   <form action="admin_ask_list_post" method="post">
         <div class="input-group">
         
            <select id="viewcount" name="search_field_one">
            <option value="0" selected>전체보기</option>
            <option value="1">답변대기</option>
            <option value="2">답변완료</option>
            </select>
            
            <select id="viewcount2" name="search_field_two">
            <option value="0" selected>제목</option>
            <option value="1">작성자</option>
            </select>
            
            
            <input name="search_word" type="text" class="form-control"
                  placeholder="검색어를 입력해주세요." value="" id="search_button">
            <button class="btn btn-primary" type="submit">검색</button>
         </div>
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      </form>
     </sec:authorize>
     
    
   <c:if test="${listcount > 0}">      
   
  <table class="table table-striped">
   <thead>
   <tr>
      <th colspan="3">펫토피아 문의 게시판</th>
      <th colspan="2">
      </th>
   </tr>
   <tr>
      <th><div>No</div></th>
      <th><div>문의제목</div></th>
      <th><div>문의날짜</div></th>
      <th><div>답변여부</div></th>
   </tr>   
   </thead>
   
   
   <tbody>
   <c:set var="num" value="${listcount-(page-1)*limit}"/>
   <c:forEach var="b" items="${list}">   
   <tr>
         
      <th><div><c:out value="${num}"/><c:set var="num" value="${num-1}"/><%-- num 출력 --%></div></th>      
         
      <th><div><a href="AskToAdminView?num=${b.AAM_NUMBER}">
          <c:out value="${b.AAM_SUBJECT}" escapeXml="true"/>
         </a> 
         </div>
         </th>
      <th><div>${b.AAM_ANSDATE}</div></th>
      
               <th><div>
   <c:choose>  
    <c:when test="${b.AAM_ANSCHECK == '답변완료'}">
      답변완료
   </c:when> <%--sdsdsdsd --%>
   <c:otherwise> 
      답변대기
   </c:otherwise> 
   </c:choose>   
   </div>
   </th>
      </tr>
     </c:forEach>
    </tbody>   
   </table>
   
   
   <!-- 페이징 -->
   <ul class="pagination justify-content-center">
         
         
            <c:if test="${page <= 1}">
               <li class="page-item">
                  <a class="page-link gray">이전&nbsp;</a>
               </li>
            </c:if>
            
            
            <c:if test="${page > 1}">
               <li class="page-item">
                  <a href="list?page=${page - 1}&search_field=${search_field}&search_word=${search_word}"
                     class="page-link">이전&nbsp;</a>
               </li>
            </c:if>
            
            
            
            
            
            <c:forEach var="a" begin="${startpage}" end="${endpage}">
               <c:if test="${a == page}">
                  <li class="page-item active">
                     <a class="page-link">${a}</a>
                  </li>
               </c:if>
               
               <c:if test="${a != page}">
                  <c:url var="go" value="list">
                     <c:param name="search_field" value="${search_field}"/>
                     <c:param name="search_word" value="${search_word}"/>
                     <c:param name="page" value="${a}"/>
                  </c:url>   
                  <li class="page-item">
                     <a href="${go}" class="page-link">${a}</a>
                  </li>
               </c:if>
                   </c:forEach>
            

            <c:if test="${page >= maxpage}">
               <li class="page-item">
                  <a class="page-link gray">&nbsp;다음</a>
               </li>
            </c:if>
            
            <c:if test="${page < maxpage}">
               <c:url var="next" value="list">
                     <c:param name="search_field" value="${search_field}"/>
                     <c:param name="search_word" value="${search_word}"/>
                     <c:param name="page" value="${page + 1}"/>
                  </c:url>
               <li class="page-item">
                  <a href="${next}" class="page-link">&nbsp;다음</a>
               </li>
            </c:if>
     
         </ul>
         
         
         </c:if>
            <button class="btn btn-primary" id="ask_to_admin" type="submit">문의하기</button>
      </div>
   
   
   </div></div>
   
   
   

</body>
   
<script>

$("#ask_to_admin").click(function(){
   location.href="admin_ask_to_admin";
})

var selectedValue = '${search_field_one}'
var selectedValue2 = '${search_field_two}'

if(selectedVaule = '-1'){
       $("#viewcount").val(0);
    }
    
if(selectedValue2 ='-1'){
   $("#viewcount2").val(0);
   
}
       
 
    
    
    //검색 버튼을 클릭한 경우
    //$("#search_button").click(function(){
       //검색어 공백 유효성 검사를 합니다.
       //if($("#search_button").val()==''){
       //   alert("검색어를 입력하세요.!!!");
       //   $("#search_button").focus();
       //   return false;
       //}//if val() 끝
       
       
   // })//버튼끝
    
    //검색어 입력창에 플래스홀더가 나타나도록 합니다.
    
    $("#viewcount_test").change(function(){
    
    
    
    
    
    }) //chane end
    
    
    //회원 목록의 삭제를 클릭한  경우
    $("tr > td:nth-child(3) > a").click(function(){
       var answer = confirm("정말 삭제하시겠습니까?");
       console.log(answer);// 취소를 클릭한 경우 - false
       if(!answer){ //취소를 클릭한 경우
          event.preventDefault(); //이동하지 않습니다.   
       }
    
    })//삭제 클릭 end
    
    
 





</script>
   
</html>