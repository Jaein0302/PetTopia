<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>기업 회원가입</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="header.jsp" />
</div>
 <div class="container mb-5 mainbody" style="margin-top:240px;">
   <form class="mform" name="joinform" action="${pageContext.request.contextPath}/main/joinProcess" method="post">
	<h1>기업 회원가입</h1>
	<hr>
	<b>아이디</b>
	<input type="text" class="jinput" name="member_id" placeholder="Enter id" required maxlength="12">
	<span id="message"></span>
	
	<b>비밀번호</b>
	<input type="password" name="member_password" placeholder="Enter password" required>
	
	<b>비밀번호 확인</b>
	<input type="password" name="passwordchk" placeholder="Enter password" required>
	
	<b>기업명</b>
	<input type="text"  class="jinput" name="member_name" placeholder="Enter name" required>
	
	<b>사업자 등록번호</b>
	<input type="text" class="jinput" id="regnum" name="member_regnum" placeholder="Ex) 1234567890" maxlength="10" style="width:305px" required>
	<input class="button-5 postb regnum" type="button" value="인증"  id="b_regnum" style="padding:10px 20px">
	
	<b>업종</b>
	<select class="selectType" style="padding:10px 20px">
		<option value="동물병원" selected>동물병원</option>
		<option value="미용">미용</option>
		<option value="훈련기관">훈련기관</option>
		<option value="기타">직접입력</option>
	</select>
	<input type="text" class="jinput inputText" name="member_btype" placeholder="Enter 업종" style="width:270px" required readOnly>
	
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
		<button type="submit" class="button-5 cancelbtn updateb">가입</button>
		<button type="reset" class="button-5 submitbtn signoutb">취소</button>
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

//사업자 등록번호 인증
$('.regnum').click(function(){
	var regnum = $('#regnum').val(); //1168115020
	console.log("입력한 사업자등록번호"+regnum);
	var data = {
		    "b_no": [regnum] // 사업자번호 "xxxxxxx" 로 조회 시,
		   }; 
		$.ajax({
		  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=LS%2F0%2FFJ0nKGVtQDjRPMbttGggE36jKrWEY%2BSMu0hbj00o0%2FvOy8Z31RmO2J91Wsd%2FepNUPtcqeJ6Ei%2BfzD3cTw%3D%3D",  // serviceKey 값을 xxxxxx에 입력
		  type: "POST",
		  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
		  dataType: "JSON",
		  contentType: "application/json",
		  accept: "application/json",
		  success: function(result) {
		      console.log("사업자인증 결과 = "+result);
		      var keys = Object.keys(result);
		      console.log("키값="+keys);
		      if (keys.indexOf('match_cnt') > -1) {
		    	  alert("사업자등록번호 인증성공");
		      }else{
		    	  alert("국세청에 등록되지 않은 사업자등록번호입니다.")
		      }
		  },
		  error: function(result) {
		      console.log(result.responseText); //responseText의 에러메세지 확인
		  }
		});
})

//취소 버튼 누르면 뒤로가기
$(".signoutb").click(function(){
	var answer = confirm("가입을 취소하시겠습니까?")
	if(answer == true)
		$(location).attr('href','${pageContext.request.contextPath}/main/join');
})

//select
$(function(){	
	var input = $('.inputText');
	$('.selectType').on("change",function(){
		var value = $(this).find("option:selected").val();
		input.val(value);
		if(input.val()=="기타"){
			$(input).attr('readOnly', false);
			$(input).focus();
			$(input).val('');
		}
	});
})
</script>
</body>
</html>