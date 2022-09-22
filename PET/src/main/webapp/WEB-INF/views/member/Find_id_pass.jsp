<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원가입</title>
<style>
.joinbtn{border:1px solid silver;margin:0 40px;border-radius:20px;}
</style>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="header.jsp" />
</div>
  <div class="container mb-5 mainbody" style="height:450px;margin-top: 250px;">
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative text-center text-white mb-2 py-5 px-5 joinbtn">
                    <div class="position-relative" style="z-index: 1;">
                        <h1 class="font-weight-semi-bold">회원 아이디 찾기</h1>
                    </div>
                    <b class="text-dark">이름</b>
                    <input type="text" name="member_name" required><br>
                    <b class="text-dark">이메일</b>
                    <input type="text" name="member_email" required><br>
                    <input type="submit" value="아이디 찾기">
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="position-relative text-center text-white mb-2 py-5 px-5 joinbtn">
                    <div class="position-relative" style="z-index: 1;">
                        <h1 class="font-weight-semi-bold">회원 비밀번호 찾기</h1>
                    </div>
                    <b class="text-dark">아이디</b>
                    <input type="text" name="member_id" required><br>
                    <b class="text-dark">이름</b>
                    <input type="text" name="member_name" required><br>
                    <b class="text-dark">이메일</b>
                    <input type="text" name="member_email" required><br>
                    <input type="submit" value="비밀번호 찾기">
                </div>
            </div>
        </div>
    </div>
    </div>
    
<jsp:include page="footer.jsp" />
</body>
</html>