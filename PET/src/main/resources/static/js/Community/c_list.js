$(function(){
	//로그인 후 글쓰기 가능
	$(".cowrite").click(function () {
	    	alert("로그인 후 이용 가능합니다.")
	});

	$('.summernote').summernote({
	 placeholder: '내용을 입력해주세요',
	  height: 450,
	  lang: "ko-KR",
	  focus: true,
	  callbacks: {
          onImageUpload : function(files, editor, welEditable){

                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i],
                this);
                    }
                }
            } 
     });
});


	$('.summernote').summernote('fontSize', '24');

    function uploadSummernoteImageFile(file, el) {
        var data = new FormData();	
        data.append("file",file);
            $.ajax({
              url: '/summer_image',
              type: "POST",
              enctype: 'multipart/form-data',
              data: data,
              cache: false,
              contentType : false,
              processData : false,
              success : function(data) {
                        var json = JSON.parse(data);
                        $(el).summernote('editor.insertImage',json["url"]);
                            jsonArray.push(json["url"]);
                            jsonFn(jsonArray);
                    },
                    error : function(e) {
                        console.log(e);
                    }
                });
            }


function jsonFn(jsonArray){
	console.log(jsonArray);
}
