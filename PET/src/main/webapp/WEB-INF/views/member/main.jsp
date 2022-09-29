<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>펫토피아</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
</head>
<body>

<!-- header -->
<div class="header">
<jsp:include page="header.jsp" />
</div>


    <div class="container mb-5 mainbody">
        <div class="row border-top px-xl-5">
			<div class="col-lg-12" style="margin:0 auto;">
                <!-- 슬라이드 시작 -->
                <div id="header-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="height: 410px;">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/carousel-3.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">반려견에게 눈높이를 맞춘</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">애견 유치원</h3>
                                    <a href="" class="btn btn-light py-2 px-3">보러가기</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/carousel-1.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">반려견, 반려묘를 위한</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">필수 예방접종</h3>
                                    <a href="" class="btn btn-light py-2 px-3">보러가기</a>
                                </div>
                            </div>
                        </div>
                         <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/carousel-2.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">지금도 귀엽지만 더 귀엽게!</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">애견 미용</h3>
                                    <a href="" class="btn btn-light py-2 px-3">보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-prev-icon mb-n2"></span>
                        </div>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-next-icon mb-n2"></span>
                        </div>
                    </a>
                </div>
                <!-- 슬라이드 끝 -->
            </div>
        </div>
    
    <!-- Navbar End -->


    <!-- Featured Start -->
     <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3" style="font-size:37px"></h1>
                    <h5 class="font-weight-semi-bold m-0">서비스 예약</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-calendar-alt text-primary m-0 mr-2" style="font-size:37px"></h1>
                    <h5 class="font-weight-semi-bold m-0">&emsp;예약 관리</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-gift text-primary m-0 mr-3" style="font-size:37px"></h1>
                    <h5 class="font-weight-semi-bold m-0">&ensp;이벤트</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3" style="font-size:37px"></h1>
                    <h5 class="font-weight-semi-bold m-0">1:1 고객 상담</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->


    <!-- Categories Start -->
    <div class="container-fluid pt-3">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <!-- <p class="text-right">15 Products</p> -->
                    <a href="${pageContext.request.contextPath}/product/product_list?item_category=treat" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/dog1.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0" style="text-align:center">수술/치료</h5>
                </div>
            </div>
                  <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <a href="${pageContext.request.contextPath}/product/product_list?item_category=education" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/dog4.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0" style="text-align:center">교육</h5>
                </div>
            </div>
                  <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <a href="${pageContext.request.contextPath}/product/product_list?item_category=beauty" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/dog5.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0" style="text-align:center">미용</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Categories End -->


    <!--
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                    <img src="${pageContext.request.contextPath}/resources/img/Main/offer-1.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3">보러가기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                    <img src="${pageContext.request.contextPath}/resources/img/Main/offer-2.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3">보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    -->


    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">BEST</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
        <c:forEach var="p" items="${list}" end="7">	        
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4" onclick="location.href='product/detail'">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="${pageContext.request.contextPath}/resources/img/Main/product-2.jpg" alt="">
                    </div>
                    <div class="card-body border-left border-right p-0 pt-2 text-center">
                    	<span>${p.ITEM_NAME}</span>
                        <h4 class="text-truncate">${p.ITEM_CONTENT}</h4>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                    	 <span class="text-dark price" style="margin:0;font-color:black"><fmt:formatNumber value="${p.ITEM_PRICE}" pattern="#,###" />원</span>
                    	<a href="" class="btn btn-sm text-dark p-0  zzim"><i class="fas fa-heart"></i></a>
                        <a href="" class="btn btn-sm text-dark p-0 shopping_cart"><i class="fas fa-shopping-cart text-primary mr-1"></i></a>
                    </div>
                </div>
            </div>
         </c:forEach>
        </div>
    </div>
    <!-- Products End -->


    <!-- Subscribe Start -->
    <!--
    <div class="container-fluid bg-secondary my-5">
        <div class="row justify-content-md-center py-5 px-xl-5">
            <div class="col-md-6 col-12 py-5">
                <div class="text-center mb-2 pb-2">
                    <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">Stay Updated</span></h2>
                    <p>Amet lorem at rebum amet dolores. Elitr lorem dolor sed amet diam labore at justo ipsum eirmod duo labore labore.</p>
                </div>
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control border-white p-4" placeholder="Email Goes Here">
                        <div class="input-group-append">
                            <button class="btn btn-primary px-4">Subscribe</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    -->
    <!-- Subscribe End -->

</div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
var message = "${message}";
if(message == 'JoinSuccess'){
   Swal.fire(
  '회원가입을 축하드립니다!',
  '서비스는 로그인 후 이용가능합니다.',
  'success'
)
  };
</script>
</body>
</html>