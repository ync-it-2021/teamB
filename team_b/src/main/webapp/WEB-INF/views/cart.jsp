 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zxx">

<%@include file="includes/shopHeader.jsp"%>
<body>
	${cartInfo }
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
						<c:forEach items="${cartInfo }" var = "ci">
						<td class = "td_width_1 cart_info_td">
						<input type ="hidden" class="individual_Price_input" value="${ci.price }">
						<input type ="hidden" class="individual_salePrice_input" value="${ci.salePrice }">
						<input type ="hidden" class="individual_QUANTITY_input" value="${ci.QUANTITY }">
						<input type ="hidden" class="individual_totalPrice_input" value="${ci.totalPrice }">
						</td>
						
						<tr>
							<td>이미지</td>
							<td colspan="2">${ci.title }</td>
							<td>스팀</td>
							<td><del>${ci.price }</del>${ci.sale_price }</td>
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
						</c:forEach>
					</table>
					<a href="#" role="button" data-cart_num ="${ci.cart_num }"data-oper='submit' class="btn site-btn" style="float:right;">
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
    
    <script type="text/javascript">
    //장바구니 삭제 버튼
    $(".btn-sm").on("click",function(e){
   	e.preventDefault();
   	const cart_num = $(this).data("cart_num");
   	$(".delete_cart_num").val(cart_num);
   	$(".quantity_delete_form").submit();
    });
    
 // 서버 데이터
  ${".btn_cart"}.on("click",function(e){
     		form.quanitity $(".quanitity_input").val();
     		$ajax({
    		userid : '${member.userid}',
    		game_num : '${gameinfo_game_num}'
    		quanitity : ''
    		form.quanitity = $(".quanitity_input").val();
    		$.ajax({
    			url: '/cart/add',
    			type : "POST",
    			data : form,
    			success: funtion(result){
    				cartAlert(result;)
    				}
    			})
    		});
	function cartAlert(result) {
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다");
		}else if(result =='2'){
			alert("장바구니에 이미 추가되어져 있습니다");
		}
		
	}
    		
 
    
    </script>

</body>

</html>