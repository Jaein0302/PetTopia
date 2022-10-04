<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>펫토피아 사업자인증</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
</head>
<style>
.mform{width:600px!important}
.clearfix {margin: 39px 57.5px!important}
.jinput{width:400px!important}
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
   		 action="${pageContext.request.contextPath}/main/join_business_step3" method="post">
	<h1>사업자등록번호 인증</h1>
	<hr>
	
	<div style="margin: 30px 0 56px 86px;">
	<b>기업명&ensp;<i class="fas fa-check chk_name" style="display:none"></i></b>
	<input type="text" class="jinput" name="member_name" placeholder="기업명을 입력해주세요"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"  required>
	
	<b>대표자성명&ensp;<i class="fas fa-check chk_bname" style="display:none"></i></b>
	<input type="text" class="jinput bname" placeholder="대표자성명을 입력해주세요"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" required value="정윤수">
	
	<b>개업일자&ensp;<i class="fas fa-check chk_bdate" style="display:none"></i></b>
	<input type="text" class="jinput bdate" placeholder="Ex) YYYYMMDD" maxlength="8" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"  required value="20131219">
	
	<b>업종&ensp;<i class="fas fa-check chk_btype" style="display:none"></i></b>
	<select class="selectType" style="padding:8px 20px;margin-right:3px">
		<option value="선택">업종선택</option>
		<option value="동물병원">동물병원</option>
		<option value="애견미용">애견미용</option>
		<option value="훈련기관">훈련기관</option>
		<option value="기타">직접입력</option>
	</select>
	<input type="text" class="jinput inputText" name="member_btype" 
	        placeholder="업종을 선택해주세요" style="width:267px!important" required readOnly  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" >
	
	
	<b>사업자 등록번호&ensp;<i class="fas fa-check chk_bno" style="display:none"></i></b>
	<input type="text" class="jinput" id="regnum" name="member_regnum" 
		   placeholder="Ex) 1234567890" maxlength="10" style="width:305px!important" required value="1208806529">
	<input class="button-5 postb regnum" type="button" value="인증"  id="b_regnum" style="padding:10px 20px">
	
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
	var chkbno = false;
	var checkbtype =false;

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
			    	  alert("국세청에 등록되지 않은 사업자등록번호입니다.");
			    	  $("input[name='member_regnum']").focus();
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
		});//change
		
		//로그인 막기
		$('.me4').click(function(){
			$(".popup_panel").remove();
			alert("회원가입 완료 후 로그인 해주세요.")
		});
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
	
	// submit 버튼 클릭
	$(".updateb").click(function(){
		if($("input[name='member_name']").val().trim()=="") {
    		alert("이름을 확인해주세요");
    		$("input[name='member_name']").val('').focus();
    		return false;
    	}
    	if(!checkbtype){
    		alert("업종을 선택해주세요");
    		$(".selectType").focus();
    		return false;
    	}
    	if(!chkbno){
    		alert("사업자 등록번호 인증을 확인해주세요");
    		$("input[name='member_regnum']").focus();
    		return false;
    	}
	})
	
	//취소 버튼 누르면 뒤로가기
	$(".signoutb").click(function(){
		var answer = confirm("가입을 취소하시겠습니까?")
		if(answer == true)
			$(location).attr('href','join');
	})
	
	function noSpaceForm(obj) { // 공백사용못하게
	var str_space = /\s/;  // 공백체크
	if(str_space.exec(obj.value)) { //공백 체크
		 obj.value = obj.value.replace(' ',''); // 공백제거
		}
	}
	</script>
</body>
</html>