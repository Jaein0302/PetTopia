<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>펫토피아 - 회원가입</title>
<style>
.joinbtn{border:1px solid silver;margin:0 40px;border-radius:20px;cursor:pointer}
.joinbtn:hover, .joinbtn:active{background-color:#f7e1ab;border:1px solid #f7e1ab}
</style>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="header.jsp" />
</div>
  <div class="container mb-5 mainbody" style="height:400px;margin-top: 300px;">
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative text-center text-white mb-2 py-5 px-5 joinbtn"
                 onclick="location.href='${pageContext.request.contextPath}/main/customer_join'">
                    <div class="position-relative" style="z-index: 1;">
                        <h1 class="font-weight-semi-bold">개인회원가입</h1>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="position-relative text-center text-white mb-2 py-5 px-5 joinbtn"
                 onclick="location.href='${pageContext.request.contextPath}/main/business_join'">
                    <div class="position-relative" style="z-index: 1;">
                        <h1 class="font-weight-semi-bold">기업회원가입</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    
<jsp:include page="footer.jsp" />
</body>
</html>