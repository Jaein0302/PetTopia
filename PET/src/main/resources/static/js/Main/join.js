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
            if(data.zonecode!=="") {$(".chk_post").show();}
            if(fullRoadAddr!=="") {$(".chk_address").show();}
        }
    }).open();
}//function Postcode()

//취소 버튼 누르면 뒤로가기
$(".signoutb").click(function(){
	var answer = confirm("가입을 취소하시겠습니까?")
	if(answer == true)
		$(location).attr('href','join');
})



//국세청 사업자 등록정보 진위확인 api
$('.regnum').click(function(){
	var regnum = $('#regnum').val(); //1208806529
	var bname = $('.bname').val(); //정윤수
	var bdate = $('.bdate').val(); //20131219
	
	if(bname == ""){
		alert("대표자성명을 입력해주세요");
		$('.bname').focus();
	}else if(bdate==""){
		alert("개업일자 8자리를 입력해주세요");
		$('.bdate').focus();
	}else if(regnum==""){
		alert("사업자 등록번호 10자리를 입력해주세요");
		$('#regnum').focus();
	}else{	
	console.log("사업자등록번호= "+regnum+", 이름="+bname+", 개업일="+bdate);
	var data = {  
			"businesses": [   
			{   
				"b_no": regnum,      
				"start_dt": bdate,      
				"p_nm": bname,      
				"p_nm2": "",      
				"b_nm": "",      
				"corp_no": "",     
				"b_sector": "",      
				"b_type": ""    
			}  
		]
	}
		$.ajax({
		  url: "https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=LS%2F0%2FFJ0nKGVtQDjRPMbttGggE36jKrWEY%2BSMu0hbj00o0%2FvOy8Z31RmO2J91Wsd%2FepNUPtcqeJ6Ei%2BfzD3cTw%3D%3D",  // serviceKey 값을 xxxxxx에 입력
		  type: "POST",
		  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
		  dataType: "JSON",
		  contentType: "application/json",
		  accept: "application/json",
		  success: function(result) {
		      console.log("사업자인증 결과 = "+result);
		      var keys = Object.keys(result);
		      console.log("키값="+keys);
		       if (keys.indexOf('valid_cnt') > -1) {
		    	  alert("사업자등록번호 인증성공");
		    	  $(".chk_bno").show();
		    	  chkbno = true;
		    	  return;
		      }else{
		    	  alert("국세청에 등록되지 않은 사업자등록번호입니다.")
		    	  chkbno = false;
		    	  return;
		      } 
		  },
		  error: function(result) {
		      console.log(result.responseText); //responseText의 에러메세지 확인
		  }
		});//ajax
	}
})

var checkid=false;
var checkpass=false;
var checkpasschk=false;
var chkbno = false;
var checkbtype =false;
var checkaddress=false;
var checktell = false;
var checkemail=false;
var checktell=false;
//업종 selec하면 input에 자동 입력
$(function(){	
	var input = $('.inputText');
	$('.selectType').on("change",function(){
		var value = $(this).find("option:selected").val();
		input.val(value);
		if(value=="기타"){
			$(input).attr('readOnly', false);
			$(input).focus();
			$(input).val('');
			$(".chk_btype").hide();
		}else if(value=="선택"){
			$(input).attr('readOnly', true);
			$(input).val('');
			$(".chk_btype").hide();
			checkbtype = false;
		}else if(value="동물병원"){
			$(".chk_btype").show();
			checkbtype = true;
		}
	})//change
});
//아이디 유효성 검사
$("input[name=member_id]").on('keyup',
			function(){
		     $("#message").empty();
		     //[A-Za-z0-9_]의 의미가 \w
		     var pattern = /^\w{5,12}$/;
		     var id = $(this).val();
		     if (!pattern.test(id)) {
		    	 $("#message").css('color','tomato')
		    		          .html("영문자 숫자 _로 5~12자 가능합니다.");
		    	 $(".chk_id").hide();
		    	   checkid=false;
		    	   return;
		     }
		    	 
		     $.ajax({
		    	url : "idcheck",
		    	data : {"id" : id},
		    	success: function(resp) {
		    	 if (resp == -1) {//db에 해당 id가 없는 경우
			        $("#message").css('color', '#6dc99f').html("사용 가능한 아이디 입니다.");
			        $(".chk_id").show();
			        checkid=true;
		    	 } else {//db에 해당 id가 있는 경우(0)
		    	    $("#message").css('color', 'tomato').html("사용중인 아이디 입니다.");
		    	    $(".chk_id").hide();
		    	    checkid=false; 
       	    	 }
		        }
		      });//ajax end
	 })//id keyup end

	// id focusout 후 메세지 감추기
	$("input[name=member_id]").blur(function(){
		$("#message").hide();
	});
	$("input[name=member_id]").focus(function(){
		$("#message").show();
	});

//비밀번호 유효성 검사
$("input[name=member_password]").on('keyup',
			function(){
			$("#pass_message").empty();
			var pattern=/^[a-zA-Z0-9]{8,20}$/;
			 var pw = $(this).val();
			 if(!pattern.test(pw)){
				$("#pass_message").css('color','tomato').html("숫자와 영문자 조합으로 8~20자 가능합니다.");
				 $(".chk_pass").hide(); 
				checkpass=false;
		    	 return;
			 }else{
			    $("#pass_message").css('color','#6dc99f').html("사용 가능한 비밀번호 입니다.");
				  $(".chk_pass").show();
				  $(".chk_passchk").hide(); 
				  $("#passchk_message").empty();
				  $("input[name=passwordchk]").val('');
			     checkpass=true;
			     return;
			     }
	 });
	// pass focusout 후 메세지 감추기
	$("input[name=member_password]").blur(function(){
		$("#pass_message").hide();
	});
	$("input[name=member_password]").focus(function(){
		$("#pass_message").show();
	});

//비밀번호 확인 유효성 검사
$("input[name=passwordchk]").on('keyup',
				function(){
				$("#passchk_message").empty();
				 var pw = $("input[name=member_password]").val();
				 var pwchk = $(this).val();
				 if(!checkpass) {
						$("#passchk_message").css('color','tomato').html("8자리 ~ 20자리 이내로 입력해주세요.");
						 $(".chk_passchk").hide(); 
						checkpasschk=false;
				 }else {
				 
				 if(pw != pwchk){
					$("#passchk_message").css('color','tomato').html("비밀번호가 일치하지 않습니다.");
					 $(".chk_passchk").hide(); 
					checkpasschk=false;
					return;
				 }else if(pwchk == "") {
					$("#passchk_message").css('color','tomato').html("비밀번호가 일치하지 않습니다.");
					$(".chk_passchk").hide(); 
					checkpasschk=false;
					return;
				 }else{
				    $("#passchk_message").css('color','#6dc99f').html("비밀번호가 일치합니다.");
					  $(".chk_passchk").show();
				     checkpasschk=true;
				     return;
				     }
				 }
		 });
		// pass focusout 후 메세지 감추기
		$("input[name=passwordchk]").blur(function(){
			$("#passchk_message").hide();
		});
		$("input[name=passwordchk]").focus(function(){
			$("#passchk_message").show();
		});	
		
//이름 공백 검사
$("input[name=member_name]").on('keyup',
				function(){
			var nameval = $(this).val();
			if(nameval != "") {
				$(".chk_name").show();
			}else {
				$(".chk_name").hide();
			}
})
//대표자 성명 유효성 검사
$(".bname").on('keyup',
				function(){
			var pattern = /^[가-힣]|[a-zA-Z]$/;
			var bnameval = $(this).val();
			if(!pattern.test(bnameval)) {
				$(".chk_bname").hide();
			}else{
				$(".chk_bname").show();
			}
})
//개업일자 유효성 검사
$(".bdate").on('keyup',
				function(){
			var pattern =  /(^(19|20)\d{2})(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
			var bdate = $(this).val();
			if(!pattern.test(bdate)) {
				$(".chk_bdate").hide();
			}else{
				$(".chk_bdate").show();
			}
})

//업종 공백 검사
$("input[name=member_btype]").on('keyup',
		function(){
	var btype = $(this).val();
	if(btype != "") {
		$(".chk_btype").show();
		checkbtype=true;
		return;
	}else if(btype == "") {
		$(".chk_btype").hide();
		checkbtype=false;
		return;
	}
	
})

//주소 공백 검사
$("input[name=member_address]").on('keyup',
		function(){
	var addressval = $(this).val();
	if(addressval.trim() != "") {
		$("#address_message").hide();
		$(".chk_address").show();
		checkaddress=true;
		return;
	}else {
		$("#address_message").css('color','tomato').html("주소를 입력해주세요");
		$(".chk_address").hide();
		checkaddress=false;
		return;
	}
	
})
	// 주소 focusout 후 메세지 감추기
	$("input[name=member_address]").blur(function(){
		$("#address_message").hide();
	});
	$("input[name=member_address]").focus(function(){
		$("#address_message").show();
	});	
//연락처 유효성 검사
$("input[name=member_tell]").on('keyup',
			function(){
			$("#tell_message").empty();
			 var pattern = /^(010|011|016|017|018|019)-[0-9]{3,4}-[0-9]{4}$/;
			 var tell = $(this).val();
			 if(!pattern.test(tell)){
				$("#tell_message").css('color','tomato').html("000-0000-0000 형식에 맞게 입력해주세요");
				$(".chk_tell").hide(); 
				checktell=false;
		    	 return;
			 }else{
			    $("#tell_message").css('color','#6dc99f').html("사용 가능한 연락처입니다.");
				  $(".chk_tell").show();
			     checktell=true;
			     return;
			     }
	 });
	$("input[name=member_tell]").blur(function(){
		$("#tell_message").hide();
	});
	$("input[name=member_tell]").focus(function(){
		$("#tell_message").show();
	});

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
					 $("#email_message").css('color','#6dc99f').html("이메일형식에 맞습니다.");
					 $(".chk_email").show();
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

function noSpaceForm(obj) { // 공백사용못하게
var str_space = /\s/;  // 공백체크
if(str_space.exec(obj.value)) { //공백 체크
	 obj.value = obj.value.replace(' ',''); // 공백제거
	}
}

//개인회원가입 서브밋	    
$('.customer').submit(function(){
		    	if(!checkid){
		    		alert("사용가능한 아이디로 입력하세요");
		    		$("input[name='member_id']").val('').focus();
		    		return false;
		    	}
		    	if(!checkpass){
		    		alert("사용가능한 비밀번호를 입력하세요");
		    		$("input[name='member_password']").val('').focus();
		    		return false;
		    	}
		    	if(!checkpasschk){
		    		alert("비밀번호 확인을 확인해주세요");
		    		$("input[name='passwordchk']").val('').focus();
		    		return false;
		    	}
		    	if($("input[name='member_name']").val().trim()=="") {
		    		alert("이름을 확인해주세요");
		    		$("input[name='member_name']").val('').focus();
		    		return false;
		    	}
		    	if($("input[name='member_post']").val()=="") {
		    		alert("우편번호를 확인해주세요");
		    		$("input[name='member_post']").focus();
		    		return false;
		    	}
		    	if(!checkaddress) {
		    		alert("주소를 확인해주세요");
		    		$("input[name=member_address]").val('').focus();
		    		return false;
		    	}
		    	if(!checktell) {
		    		alert("연락처 형식을 확인해주세요");
		    		$("input[name=member_tell]").focus();
		    		return false;
		    	}
		    	if(!checkemail){
		    		alert("이메일 주소 형식을 확인해주세요");
		    		$("input[name='member_email']").focus();
		    		return false;
		    	}
});//개인회원가입 서브밋 end

//기업회원가입 서브밋	    
$('.business').submit(function(){
		    	if(!checkid){
		    		alert("사용가능한 아이디로 입력하세요");
		    		$("input[name='member_id']").val('').focus();
		    		return false;
		    	}
		    	if(!checkpass){
		    		alert("사용가능한 비밀번호를 입력하세요");
		    		$("input[name='member_password']").val('').focus();
		    		return false;
		    	}
		    	if(!checkpasschk){
		    		alert("비밀번호 확인을 확인해주세요");
		    		$("input[name='passwordchk']").val('').focus();
		    		return false;
		    	}
		    	if($("input[name='member_name']").val().trim()=="") {
		    		alert("이름을 확인해주세요");
		    		$("input[name='member_name']").val('').focus();
		    		return false;
		    	}
		    	if(!chkbno){
		    		alert("사업자 등록번호 인증을 확인해주세요");
		    		$("input[name='member_regnum']").focus();
		    		return false;
		    	}
		    	if(!checkbtype){
		    		alert("업종을 선택해주세요");
		    		$(".selectType").focus();
		    		return false;
		    	}
		    	if($("input[name='member_post']").val()=="") {
		    		alert("우편번호를 확인해주세요");
		    		$("input[name='member_post']").focus();
		    		return false;
		    	}
		    	if(!checkaddress) {
		    		alert("주소를 확인해주세요");
		    		$("input[name=member_address]").val('').focus();
		    		return false;
		    	}
		    	if(!checktell) {
		    		alert("연락처 형식을 확인해주세요");
		    		$("input[name=member_tell]").focus();
		    		return false;
		    	}
		    	if(!checkemail){
		    		alert("이메일 주소 형식을 확인해주세요");
		    		$("input[name='member_email']").focus();
		    		return false;
		    	}
		    	
});//기업회원가입 서브밋 end