var result = "${result}";

$(function() {	
	
	if(result == 'addSuccess'){
		alert("상품 문의 성공입니다.");
	}
	
	$(".purchase").on('click', function(){
		if($("#datetimepicker1Input").val() == ''){
			alert("예약날짜와 시간을 설정해주세요");
		} else {
			location.href = "${pageContext.request.contextPath}/product/order_view?"
					+"ITEM_ID=${productdata.ITEM_ID}&amount=" + $(".amount").val() 
					+"&member_id=" + $("input[name='member_id']").val()
					+"&order_date=" + $("#datetimepicker1Input").val();
		}
	})//purchase click function
		   
	$(".cart").on('click', function(){
		location.href = "${pageContext.request.contextPath}/product/cart?ITEM_ID=${productdata.ITEM_ID}&amount=" 
		+ $(".amount").val() + "&member_id=" + $("input[name='member_id']").val();
	});//cart click function
	
	
	
	new tempusDominus.TempusDominus(document.getElementById('datetimepicker1'), {
		stepping: 30,
		restrictions: {
	          minDate: undefined,
	          maxDate: undefined,
	          disabledDates: [],
	          enabledDates: [],
	          daysOfWeekDisabled: [],
	          disabledTimeIntervals: [],
	          disabledHours: [0,1,2,3,4,5,6,7,22,23,24],
	          enabledHours: []
	      },
		display: { 
	        components: {
	        	minutes: true,
	            seconds: false,
	            useTwentyfourHour: true,
	        },
	        icons: {
	            type: 'icons',
	            time: 'fa fa-solid fa-clock',
	            date: 'fa fa-solid fa-calendar',
	            up: 'fa fa-solid fa-arrow-up',
	            down: 'fa fa-solid fa-arrow-down',
	            previous: 'fa fa-solid fa-chevron-left',
	            next: 'fa fa-solid fa-chevron-right',
	            today: 'fa fa-solid fa-calendar-check',
	            clear: 'fa fa-solid fa-trash',
	            close: 'fas fa-solid fa-xmark'
	        },
	        sideBySide: true,
	    },
	});//temus dominus end
	
	
	$('#wishButton').on('click',function(){
		
		var item_id = $('#hidden_itemID').val();
		
		$.ajax({
			url: "is_inmywish",
			data : {"ITEM_ID" : item_id }, //앞에는 파라미터로 넘길 이름 뒤에는 넣을 값
			success: function(resp){
				//console.log(resp);
				if(resp != "null" ){ //사용자 아이디로 찜한 상품이 있을경우
					alert("해당 상품은 이미 찜한상품에 있습니다.");
				} else { //없으므로 다시 에이잭스에서 사용자 아이디로 상품을 찜한다.
					
					
					$.ajax({
						url:"addWish",
						data: {"ITEM_ID" : item_id},
						success: function(resp){
							//console.log(resp)
							if (resp != null) {
								alert("상품이 성공적으로 찜목록에 담겼습니다.");
							} else{
								alert("상품을 찜목록에 담는중 오류가 발생했습니다.");
							}
						}//inner success
					})//inner ajax
					
					
					
				}
			},//outter success
		})//outer ajax end
	})//wish button click function
	
	
	
	//수정성공하면 alert
   	var result = "${result}";
	if(result == "updatesuccess") {
		alert("문의 수정이 완료되었습니다");
	}
	
});