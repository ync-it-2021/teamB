<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="zxx">

<%@include file="includes/shopHeader.jsp"%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="">

</head>

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
                        <h2>로그인</h2>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->
    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>로그인</h3>
                        <h2><c:out value="${error }"/></h2>
                        <form role="form" method='post' action="/login">
                        <fieldset>
                        <div class="form-group">
                            <div class="input__item">
                                <input type="text" placeholder="userid" name="username">
                                <span class="icon_mail"></span>
                            </div>
                         </div>
                         <div class="form-group">
                            <div class="input__item">
                                <input type="password" placeholder="password" name="password" value="">
                                <span class="icon_lock"></span>
                            </div>
                            </div>
                            <div class="checkbox">
									<label style="color:white;"> <input name="remember-me" type="checkbox">
									Remember Me
									</label>
								</div>
                            <a href="/" class="site-btn">로그인</a>
                            </fieldset>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <a href="#" class="forget_pass">로그인에 문제가 있습니까?</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>계정이 없으십니까?</h3>
                        <a href="/signup" class="primary-btn">회원 가입</a>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> 페이스북으로 로그인</a></li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i> 구글로 로그인</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> 트위터로 로그인</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->

<%@include file="includes/shopFooter.jsp"%>

  <script>
  $(".site-btn").on("click", function(e){
    
    e.preventDefault();
    $("form").submit();
    
  });
  </script>
  <c:if test="${param.logout != null}">
      <script>
      $(document).ready(function(){
      	alert("로그아웃하였습니다.");
      });
      </script>
</c:if>  


</body>

</html>