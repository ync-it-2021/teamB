<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>      
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
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>
<body>
<!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="/board/index">
                            <img src="/resources/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="./blog.jsp">뉴스</a></li>
                                <li><a href="./categories.jsp">카테고리 <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./categories.jsp">카테고리</a></li>
                                        <li><a href="./anime-details.jsp">Anime Details</a></li>
                                        <li><a href="./anime-watching.jsp">Anime Watching</a></li>
                                        <li><a href="./blog-details.jsp">Blog Details</a></li>
                                        <li><a href="./signup.jsp">Sign Up</a></li>
                                        <li><a href="./login.jsp">Login</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="./blog.jsp">고객센터<span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./categories.jsp">자주하는 질문</a></li>
                                        <li><a href="./anime-details.jsp">공지사항</a></li>
                                        <li><a href="./anime-details.jsp">1대1 문의</a></li>
                                    </ul>
                                </li>
                                    <li><a href="#">프로젝트 소개</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class=""><span class="icon_cart_alt"></span></a>
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                        <a href="/board/login"><span class="icon_profile"></span></a>

						<sec:authorize access="isAuthenticated()">

							<li><a href="/customLogout"><i
									class="fa fa-sign-out fa-fw"></i></a></li>
						</sec:authorize>

						<sec:authorize access="isAnonymous()">

							<li><a href="/customLogin"><i
									class="fa fa-sign-out fa-fw"></i></a></li>
						</sec:authorize>
					</div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->
</body>
</html>