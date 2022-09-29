$(function(){
	//로그인 후 글쓰기 가능
	$(".cowrite").click(function () {
	    Swal.fire({
					position: 'center',
					icon: 'warning',
					title: '로그인 후 이용가능합니다.',
					showConfirmButton: false,
					timer: 1000
				})
	});
	//취소 버튼 누르면 뒤로가기
	 $(".signoutb").click(function(){
		 Swal.fire({
			  title: '작성을 취소하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $(location).attr('href','list');
			  }
			})
		});
		
	//추천 게시글
	 var ticker = function()
    {
        setTimeout(function(){
            $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
            {
                $(this).detach().appendTo('ul#ticker').removeAttr('style');
            });
            ticker();
        }, 2000);
    };
    ticker();

	 

	
});

