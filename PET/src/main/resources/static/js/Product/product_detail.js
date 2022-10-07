var result = "${result}";

$(function() {	
	$(".amount").on('change', function(){
		var p_price = $(".product_price").text().slice(0, -1);
		console.log("p_price=" + p_price)
		var t_price = $(".amount").val() * p_price;		
		$(".total_price").html(t_price);
	})//amount change function	
	
	if(result == 'addSuccess'){
		alert("상품 문의 성공입니다.");
	}
	
	$(".purchase").on('click', function(){
		if($("#datetimepicker1Input").val() == ''){
			alert("예약날짜와 시간을 설정해주세요");
		} else {
			location.href = "${pageContext.request.contextPath}/product/order_view?ITEM_ID=${productdata.ITEM_ID}&amount=" 
		      	+ $(".amount").val() + "&member_id=" + $("input[name='member_id']").val();
		}
	})//purchase click function
		   
	$(".cart").on('click', function(){
		location.href = "${pageContext.request.contextPath}/product/cart?ITEM_ID=${productdata.ITEM_ID}&amount=" 
		+ $(".amount").val() + "&member_id=" + $("input[name='member_id']").val();
	});//cart click function
	
	$("button").on('click', function(){
		if($(".amount").val() == '') {
			return false;
		}
	})//button click function
	
	$(".amount").on('change', function(){
		var p_price = $(".product_price").text().slice(0, -1);
		console.log("p_price=" + p_price)
		var t_price = $(".amount").val() * p_price;		
		$(".total_price").html(t_price);
	})//amount change function
	
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
	
	//수정성공하면 alert
   	var result = "${result}";
	if(result == "updatesuccess") {
		alert("문의 수정이 완료되었습니다");
	}
	
});