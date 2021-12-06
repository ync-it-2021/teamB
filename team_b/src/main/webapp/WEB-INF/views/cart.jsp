 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zxx">

<%@include file="includes/shopHeader.jsp"%>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Normal Breadcrumb Begin -->
   <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/cart_bg.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>장바구니</h2>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="row-sm-6">
                <div class="col-lg-14">
                <h4 style="color:white;">장바구니</h4>
                <hr>
                <table class="table table-striped table-bordered"
					style="table-layout:fixed; color:grey;">
                	<tr>
                		<td>
						※ GameWallet에서는 활성화(수신)되지 않은 제품 코드(키)에 한하여 구입 후 7일 이내에 주문 취소가 가능합니다.
                		</td>
                	</tr>
               	</table>
				<table class="table table-striped table-bordered table-dark"
					style="table-layout:fixed;">
						<thead class="thead-dark">
							<tr>
								<th>이미지</th>
								<th colspan="2">상품명</th>								
								<th>플랫폼</th>
								<th>가격</th>
								<th width="55px"></th>
							</tr>
						</thead>
						<!-- 아마 여기서부터 c:foreach 시작 -->
						<tr>
							<td>이미지</td>
							<td colspan="2">상품이름</td>
							<td>스팀</td>
							<td><del>50,000</del>42,000</td>
							<td>
									<a href="#" role="button" data-oper='remove' class="btn-sm btn-danger"> 
										<i class="fa fa-trash fa-fw"></i>
									</a>
							</td>
						</tr>
						<!-- end -->
						<tr>
							<td colspan="4">합계</td>
							<td colspan="2">42,000 원</td>
						</tr>
					</table>
					<a href="#" role="button" data-oper='submit' class="btn site-btn" style="float:right;">
						주문하기 </a>
				</div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->

<%@include file="includes/shopFooter.jsp"%>

      <!-- Search model Begin -->
      <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/player.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

</body>

</html>