$(function(){
  //로그인 안하고 문의하기 누르면 alert창
  $(".ask_denied").click(function(){
     alert("로그인 후 이용가능합니다.")            
  });  
  
  //상세보기
  $("#detail").on('click',"#detail_button",function(){
	$("#ask_detail").show();
	var ITEM_ASK_NUM = $(this).parent().prev().prev().prev().prev().text();
	var ITEM_ASK_SUBJECT = $(this).parent().prev().prev().prev().text();
	var ITEM_ASK_USERNAME = $(this).parent().prev().prev().text();
	var ITEM_ASK_DATE = $(this).parent().prev().text();
	var ITEM_ASK_CONTENT = $(this).parent().parent().prev().prev().val();
	var ITEM_ASK_ITEMID = $(this).parent().parent().prev().val();

	$("#ASK_NUM").val(ITEM_ASK_NUM);
	$("#SUBJECT").text(ITEM_ASK_SUBJECT);
	$("#USERNAME").val(ITEM_ASK_USERNAME);
	$("#ASK_DATE").val(ITEM_ASK_DATE);
	$("#CONTENT").text(ITEM_ASK_CONTENT);
	$("#ASK_ITEMID").val(ITEM_ASK_ITEMID);
	
	console.log("ITEM_ASK_NUM=" + ITEM_ASK_NUM);
	console.log("ITEM_ASK_SUBJECT=" + ITEM_ASK_SUBJECT);
	console.log("ITEM_ASK_USERNAME=" + ITEM_ASK_USERNAME);
	console.log("ITEM_ASK_DATE=" + ITEM_ASK_DATE);
	console.log("ITEM_ASK_CONTENT=" + ITEM_ASK_CONTENT);
	console.log("ITEM_ASK_ITEMID=" + ITEM_ASK_ITEMID);
	})

	$("#ask_detail").on('click', ".a_cancel", function(){
		$("#ask_detail").hide();
	})
	
 	$(".a_update").click(function(){
	var ITEM_ASK_NUM = $("#ASK_NUM").val();
	var ITEM_ASK_USERNAME = $("#USERNAME").val();
	var ITEM_ASK_ITEMID = $("#ASK_ITEMID").val();
	var ITEM_ASK_SUBJECT = $("#SUBJECT").text();
	var ITEM_ASK_CONTENT = $("#CONTENT").text();
	

  })
	

	
	$(".a_delete").on('click', function(){
		location.href("${pageContext.request.contextPath}/ask/delete")
		$("#ask_detail").hide();
	})
      
      
            
})