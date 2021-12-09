 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zxx">

<%@include file="includes/shopHeader.jsp"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style  type="text/css">
a:link { color:black; text-decoration:none; }
a:visited { color:black; text-decoration:none; }
a:hover { color:black; text-decoration:none; }
a:active { color:black; text-decoration:none; }
</style>
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
                        <h2>자주묻는 질문</h2>
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
                <h4 style="color:white;">문답</h4>
                <hr>
					<div class="panel-group">
						<!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
						 <c:forEach items="${faq}" var="faq" varStatus="">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapse${faq.faq_num }"
										aria-expanded="false"> [${faq.faq_type}] ${faq.faq_title }</a>
										</h4>
								</div>
								<div id="collapse${faq.faq_num }" class="panel-collapse collapse"
									role="tabpanel">
									<div class="panel-body">
										<p>${faq.faq_contents }</p>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>

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

<script>

	// Collapse로 화면이 펼치기 전에 호출
	$('.collapse').on('show.bs.collapse', function() {
		// icon을 + 마크로 변경한다.
		var target = $("[href='#" + $(this).prop("id") + "']");
		target.removeClass("fa-plus-square");
		target.addClass("fa-minus-square");
	});
	// Collapse로 화면이 펼친 후에 호출
	$('.collapse').on('shown.bs.collapse', function() {
		// icon을 + 마크로 변경한다.
		var target = $("[href='#" + $(this).prop("id") + "']");
		target.removeClass("fa-plus-square");
		target.addClass("fa-minus-square");
	});
	// Collapse로 화면에 접기 전에 호출
	$('.collapse').on('hide.bs.collapse', function() {
		// icon을 - 마크로 변경한다.
		var target = $("[href='#" + $(this).prop("id") + "']");
		target.removeClass("fa-minus-square");
		target.addClass("fa-plus-square");
	});
	// Collapse로 화면에 접고 난 후에 호출
	$('.collapse').on('hidden.bs.collapse', function() {
		// icon을 - 마크로 변경한다.
		var target = $("[href='#" + $(this).prop("id") + "']");
		target.removeClass("fa-minus-square");
		target.addClass("fa-plus-square");
	});
</script>


</html>