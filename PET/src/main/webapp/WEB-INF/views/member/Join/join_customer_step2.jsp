<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>펫토피아 본인인증</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
</head>
<style>
.mform{width:600px!important}
.clearfix {margin: 39px 57.5px!important}
.jinput{width:300px!important}
.text-dark{opacity:0.7}
.text-dark:hover{opacity:1}
</style>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="../header.jsp" />
</div>
 <div class="container mb-5" style="margin-top:20px;">
   <div class="container-fluid offer pt-5">
    <div class="text-center">
 	<jsp:include page="join_step.jsp" />
	</div>
   <form class="mform customer" name="joinform" 
   		 action="${pageContext.request.contextPath}/main/join_customer_step3" method="post">
	<h1>본인인증</h1>
	<hr>
	<div style="margin: 30px 0 56px 86px;">
	<b>이메일&ensp;<i class="fas fa-check chk_email" style="display:none"></i></b>
	<input type="text" class="jinput mb-4" name="member_email" placeholder="이메일 주소를 입력해주세요" maxlength="30" required>
	<input type="button" class="button-5 postb gomail" value="코드발송" style="padding:10px 20px">
	<span class="message" id="email_message"></span>
	
	<b>인증코드&ensp;<i class="fas fa-check chk_code" style="display:none"></i></b>
	<input type="hidden" class="jinput mail_code">
	<input type="text" class="jinput" name="mail_code" placeholder="인증코드를 입력해주세요" maxlength="10" required>
	<input type="button" class="button-5 postb go_chk_code" value="인증하기" style="padding:10px 20px">
	</div>
		
	<div class="clearfix mt-4">
		<button type="submit" class="button-5 cancelbtn updateb">다음단계</button>
		<button type="button" class="button-5 submitbtn signoutb">취소</button>
	</div>
	 <input type="hidden" name="agree" value="">
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	</div>
</div>
	<jsp:include page="../footer.jsp" />
	<script>
	var checkcode=false;
	var checkemail=false;
	//이메일 유효성 검사
	$("input[name=member_email]").on('keyup',
				  function() {
					 $("#email_message").empty();
					 var pattern = /^\w+@\w+[.]\w{3}$/;
					 var email = $(this).val();
					 if (!pattern.test(email)) {
						 $("#email_message").css('color', 'tomato').html("이메일형식이 맞지 않습니다.");
						 $(".chk_email").hide();
						 checkemail=false;
						 return;
					 }else{
						 $("#email_message").css('color','#6dc99f').html("이메일형식에 맞습니다. 코드발송 버튼을 눌러주세요.");
						 checkemail=true;
						 return;
					 }
	});//email keyup 이벤트 처리 끝
			$("input[name=member_email]").blur(function(){
				$("#email_message").hide();
			});
			$("input[name=member_email]").focus(function(){
				$("#email_message").show();
			});		
	
	
	$('.gomail').click(function(){
		var member_email = $("input[name=member_email]").val();
		var token = $("meta[name='_csrf']").attr("content"); 
		var header = $("meta[name='_csrf_header']").attr("content"); 
		$(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
		$.ajax({
			url : "${pageContext.request.contextPath}/main/mail_code",
			type : 'post',
			data : {
		    	member_email,
		    	token,
		    	header
			},
			dataType : "json",
			success : function(data) { // controllor에서 list를 return 받았음
				console.log(data['message']);
				if(data['message']=="success"){
					alert(member_email+"로 인증코드를 발송했습니다.");
					$('.mail_code').val(data['code']);
					$('.chk_email').show();
					$("input[name=mail_code]").focus();
				}else{
					alert(member_email+"는 이미 등록된 이메일 주소입니다.");
				}
			},
			error : function() {
				alert("이메일 주소를 확인해주세요");
				$("input[name=member_email]").focus();
			}
		}); //ajax
	}); //click
	
	// 인증하기 클릭
	$(".go_chk_code").click(function(){
		var inputcode = $("input[name=mail_code]").val();
		var code = $(".mail_code").val();
	    if(code!="" && inputcode!=code) {
	        alert('알맞은 인증코드를 입력해주세요');
	        $("input[name=mail_code]").focus();
	        checkcode=false;
	    }else if(code!="" && inputcode==code){
	    	alert('인증이 완료되었습니다.');
	    	$('.chk_code').show();
	    	checkcode=true;
	    }
	})
	
	// submit 버튼 클릭
	$(".updateb").click(function(){
    	if(!checkemail){
    		alert("이메일 주소 형식을 확인해주세요");
    		$("input[name='member_email']").focus();
    		return false;
    	}
		if(!checkcode){
			alert('인증코드를 다시 확인해주세요');
			 $("input[name=mail_code]").focus();
			return false;
		}
	})
//취소 버튼 누르면 뒤로가기
$(".signoutb").click(function(){
	var answer = confirm("가입을 취소하시겠습니까?")
	if(answer == true)
		$(location).attr('href','join');
})
	</script>
</body>
</html>