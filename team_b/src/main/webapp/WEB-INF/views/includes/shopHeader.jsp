<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Project B</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/plyr.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

<script>
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e) {
		if(!searchForm.find("input[name='keyword']").val()) {
			alert("검색어를 입력하세요!");
			return false;
		}
		e.preventDefault();
		searchForm.submit();
	})
</script>
</head>
<body>
	<!-- Header Section Begin -->
	<header class="header">
		<div class="container">
			<form id='searchForm' action="/search" method='get'>
				<div class="input-group custom-search-form"
					style="padding: 5px 0 5px 0; width: 50%; margin: 0 auto;">
					<input type="text" class="form-control" placeholder="Search..."
						id="keyword" name="keyword"
						style="height: 30px; background-color: #0b0c2a; color: white;">
					<span class="input-group-btn">
						<button class="fa fa-search"
						style="color: white;
						background-color:transparent;
						border: 0px;
						height: 30px; 
						padding: 5px 5px 5px 5px;"></button>
					</span>
				</div>
			</form>
			<div class="row">
				<div class="col-lg-2">
					<div class="header__logo">
						<a href="/"> <img src="/resources/img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="header__nav">
						<nav class="header__menu mobile-menu">
							<ul>
								<li class="active"><a href="/news">뉴스</a></li>
								<li><a href="#">장르<span
										class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<c:forEach items="${genre}" var="genre">
											<li><a href="/genre?keyword=${genre.genre_name}">${genre.genre_name}</a></li>
										</c:forEach>
									</ul></li>
								<li><a href="#">플레이 지원<span
										class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<c:forEach items="${size}" var="size">
											<li><a href="/size?keyword=${size.size_name}">${size.size_name}</a></li>
										</c:forEach>
									</ul></li>
								<li><a href="#">고객센터<span class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li><a href="/faq">자주하는 질문</a></li>
										<li><a href="#">1대1 문의</a></li>
									</ul></li>
								<li><a href="/project">프로젝트 소개</a></li>
							<li><a href="#"> 
							<i class="fa fa-user fa-fw"><span class="arrow_carrot-down"></span></i>
							</a>
								<ul class="dropdown">
									<sec:authorize access="isAuthenticated()">
										<li><a href="/user_detail/${username }"><i class="fa fa-user fa-fw"></i> ${username}</a></li>
										<li><a href="/cart/${username}"><i class="fa fa-shopping-cart fa-fw"></i> 장바구니</a></li>
												<li class="divider"></li>
										<li>
											<a href="/customLogout"><i class="fa fa-sign-out fa-fw"></i> 로그아웃</a>
										</li>
									</sec:authorize>

									<sec:authorize access="isAnonymous()">
										<li><a href="/login"><i class="fa fa-sign-in fa-fw"></i> 로그인</a></li>
									</sec:authorize>
								</ul> <!-- /.dropdown-user --></li>
							<!-- /.dropdown -->
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="header__right">
						<!-- <a href="/cart" class=""><span class="icon_cart_alt"></span></a> -->
						<!-- 로그인 -->
<%-- 						<sec:authorize access="isAuthenticated()">
							<a href="/logout"><span class="fa fa-sign-out"></span></a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a href="/login"><span class="fa fa-sign-in"></span></a>
						</sec:authorize> --%>
					</div>
				</div>
			</div>
			<div id="mobile-menu-wrap"></div>
		</div>
	</header>
	<!-- Header End -->
	<script>
	  $(".fa-sign-out").on("click", function(e){
			alert("로그아웃 하였습니다.");
		  });
	</script>
</body>
</html>