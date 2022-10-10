	// url 대조 후 메뉴에 navActive 주기
	var pageUrl = window.location.href; //창의 url을 가져온다.
	$(window).on('load', function(){ //load가 되었을때 실행
	    $('#myPageName').siblings('.nav-link').removeClass('navActive'); //다른 navActive가 있으면 지워준다.
	   
	    if (pageUrl.indexOf('update') > -1) {
	        $('#myPageName > li > a').eq(0).addClass('navActive');
	    } else if (pageUrl.indexOf('order/list') > -1) { 
	        $('#myPageName > li > a').eq(1).addClass('navActive');
	    }else if (pageUrl.indexOf('#') > -1) { 
	        $('#myPageName > li > a').eq(2).addClass('navActive');
	    }else if (pageUrl.indexOf('myreview') > -1) { 
	        $('#myPageName > li > a').eq(3).addClass('navActive');
	    }else if (pageUrl.indexOf('myPost') > -1) { 
	        $('#myPageName > li > a').eq(4).addClass('navActive');
	    }else if (pageUrl.indexOf('myComment') > -1) { 
	        $('#myPageName > li > a').eq(5).addClass('navActive');
	    }else if (pageUrl.indexOf('withdraw') > -1) { 
	        $('#myPageName > li > a').eq(6).addClass('navActive');
	    }
	    
	});
