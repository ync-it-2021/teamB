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
table {font-size:12px;}
th {width:60px;}
td {width:200px;}
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
                        <h2>마이페이지</h2>
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
                <h4 style="color:white;">정보</h4>
                <hr>
					<div class="panel-group">
						<!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
						<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
				<table class="table table-striped table-bordered table-dark"
					style="table-layout:fixed;">
							<thead class="thead-dark">
								<tr>
									<th>이름</th>
									<td><c:out value=" ${member_info.userName }" /></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><c:out value=" ${member_info.userid }" /></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><c:out value=" ${member_info.userMail }" /></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><c:out value=" ${member_info.userPhone }" /></td>
								</tr>
								<tr>
									<th>가입날짜</th>
									<td><c:out value=" ${member_info.regDate }" /></td>
								</tr>
								<tr>
									<th>상태</th>
									<td>
										<c:choose>
											<c:when test="${enabled eq 1 }">
												유효
											</c:when>
											<c:when test="${enabled eq 1 }">
												정지
											</c:when>
										</c:choose>
									</td>
								</tr>
							</thead>
						</table>

						<!--  	<div id="collapse${faq.faq_num }" class="panel-collapse collapse"
									role="tabpanel">-->	
									<div class="panel-body">
									<!--	<p>${faq.faq_contents }</p> -->	
									</div>
								</div>
							</div>
						</div>
					
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