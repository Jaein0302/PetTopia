<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>개인 회원가입</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="header.jsp" />
</div>
 <div class="container mb-5 mainbody">
   <form class="mform" name="joinform" action="${pageContext.request.contextPath}/main/joinProcess" method="post">
	<h1>개인 회원가입</h1>
	<hr>
	<b>아이디</b>
	<input type="text" class="jinput" name="member_id" placeholder="Enter id" required maxlength="12">
	<span id="message"></span>
	
	<b>비밀번호</b>
	<input type="password" name="member_password" placeholder="Enter password" required>
	
	<b>비밀번호 확인</b>
	<input type="password" name="passwordchk" placeholder="Enter password" required>
	
	
	<b>이름</b>
	<input type="text"  class="jinput" name="member_name" placeholder="Enter name" required>
	
	<b>우편번호</b>
	<input type="text" class="jinput" id="post1" name="member_post" placeholder="Enter Post" maxlength="5" style="width:150px" required>
	<input class="button-5 postb" type="button" value="우편검색"  id="postcode" style="padding:10px 20px">
	
	<b>주소</b>
	<input type="text" class="jinput" id="address" name="member_address" maxlength="2" placeholder="Enter address" required>
	
	<b>연락처</b>
	<input type="text" class="jinput" name="member_tell" placeholder="Enter tell" required>
	
	<b>이메일</b>
	<input type="text" class="jinput" name="member_email" placeholder="Enter email" maxlength="30" required>
	<span id="email_message"></span>
	
	
	<div class="clearfix">
		<button type="submit" class="submitbtn" style="padding: 14px 20px;">가입</button>
		<button type="reset" class="cancelbtn">취소</button>
	</div>
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	</div>
	<jsp:include page="footer.jsp" />
<script>
$('#postcode').click(function(){
	//window.open("post.html", "post", "width=400, height=500, scrollbars=yes");
	Postcode();
	$("#post_message").html("");
	checkpost=true;
	$("#address_message").html("");
	checkaddress=true;
});	

function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	console.log(data.zonecode)
            var fullRoadAddr = data.roadAddress;
            var extraRoadAddr = '';

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            $('#post1').val(data.zonecode);
            $('#address').val(fullRoadAddr);
        }
    }).open();
}//function Postcode()
</script>
</body>
</html>