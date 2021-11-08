<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<%@include file="includes/shopHeader.jsp"%>

<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="/resources/img/normal-breadcrumb.jpg">
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
						<form action="#{path}/user/register" method="post">

							<div class="input__item">
								<input type="text" placeholder="이름" name="userName"> <span
									class="icon_profile"></span>
							</div>

							<div class="input__item">

								<span class="icon_id_alt"></span> <input type="text"
									placeholder="아이디" name="userid">
								<!--  <button type="submit" class="site-btn ">중복확인</button>-->
							</div>

							<div class="input__item">
								<input type="password" placeholder="비밀번호" name="userpw"> <span
									class="icon_lock"></span>
							</div>
							<div class="input__item">
								<input type="password" placeholder="비밀번호 확인"> <span
									class="icon_lock-open"></span>
							</div>
							<div class="input__item">
								<input type="text" placeholder="이메일" name="userMail"> <span
									class="icon_mail"></span>
							</div>
							<div class="input__item">
								<input type="text" placeholder="전화번호" name="userPhone"> <span
									class="icon_phone"></span>
							</div>
							<div>
								<button type="submit" class="site-btn" onclick="">회원가입</button>
							</div>

						</form>

					</div>
				</div>
				<div class="col-lg-6">
					<div class="login__social__links"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- Signup Section End -->

	<%@include file="includes/shopFooter.jsp"%>

	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">
				<i class="icon_close"></i>
			</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

</body>

</html>