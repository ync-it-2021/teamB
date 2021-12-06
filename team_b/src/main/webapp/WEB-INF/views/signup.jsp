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
   <section class="normal-breadcrumb set-bg" data-setbg="/resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>환영합니다!</h2>

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
                <div class="col-lg-8">
                    <div class="login__form">
                        <h3>회원 가입</h3>
                        <form action="#">

                            <div class="input__item">
                                <input type="text" placeholder="이름">
                                <span class="icon_profile"></span>
                            </div>

                            <div class="input__item">
                 
                                            <span class="icon_id_alt"></span>
                                            <input type="text" placeholder="아이디">
                                            <button type="submit" class="site-btn ">중복확인</button>
                                </div>

                                        <div class="input__item">
                                            <input type="text" placeholder="비밀번호">
                                            <span class="icon_lock"></span>
                                        </div>
                                        <div class="input__item">
                                            <input type="text" placeholder="비밀번호 확인">
                                            <span class="icon_lock-open"></span>
                                        </div>
                                        <div class="input__item">
                                            <input type="text" placeholder="이메일">
                                            <span class="icon_mail"></span>
                                        </div>
                                        <div class="input__item">
                                            <input type="text" placeholder="전화번호">
                                            <span class="icon_phone"></span>
                                        </div>
                                        <div>
                                            <button type="submit" class="site-btn" onclick="">회원가입</button>
                                        </div>

</form>
 
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__social__links">
                    
    
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

</html>