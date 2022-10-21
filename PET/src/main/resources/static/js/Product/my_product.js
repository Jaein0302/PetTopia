$(function() { 
	var check=0;
	
	$("#modify").submit(function() {
		if(check == 0){
			value = $('#filevalue2').text();
			html = "<input type='hidden' value='" + value + "' name='check'>";
			$(this).append(html);
		}
	})
	  

	   
	   //등록 성공 alert창
	   var result = "${result}";
	   if(result == 'addSuccess'){
	      alert("등록 성공 입니다.");
	   }
	   if(result == 'updateSuccess'){
	      alert("수정 성공 입니다.");
	   }
	   if(result == 'deleteSuccess'){
	      alert("삭제 성공 입니다.");
	   }

	   //checkbox 하나만 선택할 수 있도록 함
	    $('input[name="ITEM_CATEGORY"]').click(function(){    
	     if($(this).prop('checked')){    
	        $('input[name="ITEM_CATEGORY"]').prop('checked',false);    
	        $(this).prop('checked',true);   
	     }
	   })
	    $('input[name="ITEM_SEX"]').click(function(){    
	     if($(this).prop('checked')){    
	        $('input[name="ITEM_SEX"]').prop('checked',false);    
	        $(this).prop('checked',true);   
	     }
	   })
	    $('input[name="ITEM_WEIGHT"]').click(function(){    
	     if($(this).prop('checked')){    
	        $('input[name="ITEM_WEIGHT"]').prop('checked',false);    
	        $(this).prop('checked',true);   
	     }
	   })
	    $('input[name="ITEM_SPECIES"]').click(function(){    
	     if($(this).prop('checked')){    
	        $('input[name="ITEM_SPECIES"]').prop('checked',false);    
	        $(this).prop('checked',true);   
	     }
	   })
	   
	    //상품옵션 평소에는 안보이게
	    $(".option").slideUp();
	   
	    //수술/치료일때만 상품 옵션 보이기
	    $('input[name="ITEM_CATEGORY"][value="treat"]').click(function(){    
	        $(".option").slideDown();
	   })   
	   
	    $('input[name="ITEM_CATEGORY"][value="education"]').click(function(){    
	        $(".option").slideUp();
	   })   
	   
	    $('input[name="ITEM_CATEGORY"][value="beauty"]').click(function(){    
	        $(".option").slideUp();
	   })   
	   
	   //등록하기 눌렀을때 checkbox 지우기
	   $('#add').on('click',function(){
			$("input[name=ITEM_CATEGORY]").prop("checked",false);
			$("input[name=ITEM_SEX]").prop("checked",false);
			$("input[name=ITEM_WEIGHT]").prop("checked",false);
			$("input[name=ITEM_SPECIES]").prop("checked",false);			
	})
	   
	   //모든 항목 클릭해야만 상품등록 가능
	   $('#p_add').on('click', function() {	          
	         var name = $.trim($('input[name="ITEM_NAME"]').val());
	         if (name == '') {
	            alert("상품이름을 입력하세요");
	            return false;
	         }

	         var price = $.trim($('input[name="ITEM_PRICE"]').val());
	         if (price == '') {
	            alert("상품가격을 입력하세요");
	            return false;
	         }	      
	         
	         var uploadfile = $.trim($('input[name="uploadfile"]').val());
	         if (uploadfile == '') {
	            alert("상품파일을 업로드해주세요");
	            return false;
	         }      	         
	      })
	      
      $("#upfile").change(function() {
    		console.log($(this).val()) //c:\fakepath\upload.png
    		var inputfile = $(this).val().split('\\');
    		$('#filevalue').text(inputfile[inputfile.length - 1]);
    	  });
    	  
      $("#upfile2").change(function() {
			check++;
    		console.log($(this).val()) //c:\fakepath\upload.png
    		var inputfile = $(this).val().split('\\');
    		$('#filevalue2').text(inputfile[inputfile.length - 1]);
    	  });
	    
	  //수정 모달에 입력
	  $("#productlist").on('click',"#modifybutton",function(){
			$(".option").slideUp();

		  	var ITEM_ID = $(this).parent().prev().prev().prev().prev().prev().text();
		  	var ITEM_NAME = $(this).parent().prev().prev().prev().prev().text();
		  	var ITEM_CATEGORY = $(this).parent().prev().prev().prev().text();
		  	var ITEM_IMAGE_ORIGINAL = $(this).parent().parent().prev().val();
		  	var ITEM_PRICE = $(this).parent().parent().prev().prev().val();
		  	var ITEM_SPECIES = $(this).parent().parent().prev().prev().prev().val();
		  	var ITEM_WEIGHT = $(this).parent().parent().prev().prev().prev().prev().val();
		  	var ITEM_SEX = $(this).parent().parent().prev().prev().prev().prev().prev().val();
		  	var ITEM_CONTENT = $(this).parent().parent().prev().prev().prev().prev().prev().prev().val();
		  	var ITEM_IMAGE_FILE = $(this).parent().parent().prev().prev().prev().prev().prev().prev().prev().val();
		  	
			console.log("ITEM_ID=" + ITEM_ID)
			console.log("ITEM_NAME=" + ITEM_NAME)
			console.log("ITEM_CATEGORY=" + ITEM_CATEGORY)
			console.log("ITEM_IMAGE_ORIGINAL=" + ITEM_IMAGE_ORIGINAL)
			console.log("ITEM_PRICE=" + ITEM_PRICE)
			console.log("ITEM_SPECIES=" + ITEM_SPECIES)
			console.log("ITEM_WEIGHT=" + ITEM_WEIGHT)
			console.log("ITEM_SEX=" + ITEM_SEX)
			console.log("ITEM_CONTENT=" + ITEM_CONTENT)
			console.log("ITEM_IMAGE_FILE=" + ITEM_IMAGE_FILE)
			
			$("#ITEM_ID").val(ITEM_ID);
			$("#ITEM_NAME").val(ITEM_NAME);
			$("#ITEM_CONTENT").text(ITEM_CONTENT);
						
			$("#ITEM_PRICE").val(ITEM_PRICE);
			$("#filevalue2").text(ITEM_IMAGE_ORIGINAL);
			
			if(ITEM_CATEGORY != "") {
				$("input[name=ITEM_CATEGORY]").prop("checked",false);
				$("input[name=ITEM_SEX]").prop("checked",false);
				$("input[name=ITEM_WEIGHT]").prop("checked",false);
				$("input[name=ITEM_SPECIES]").prop("checked",false);			
					
				$("input[name=ITEM_CATEGORY][value="+ ITEM_CATEGORY +"]").prop("checked",true);
			}
			
			if($("input[name=ITEM_CATEGORY][value=treat]").is(":checked")){
				$(".option").slideDown();
			}
			
			if(ITEM_SEX != "" || ITEM_WEIGHT != "" || ITEM_SPECIES != "") {
				$("input[name=ITEM_SEX][value="+ ITEM_SEX +"]").prop("checked",true);
				$("input[name=ITEM_WEIGHT][value="+ ITEM_WEIGHT +"]").prop("checked",true);
				$("input[name=ITEM_SPECIES][value="+ ITEM_SPECIES +"]").prop("checked",true);
			}
			
			$("#ITEM_IMAGE_FILE").val(ITEM_IMAGE_FILE);
			
	  })
	  

			
		
})
