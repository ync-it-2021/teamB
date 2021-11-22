<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%
pageContext.setAttribute("CR", "\r");
pageContext.setAttribute("LF", "\n");
pageContext.setAttribute("CRLF", "\r\n");
pageContext.setAttribute("SP", "&nbsp;");
pageContext.setAttribute("BR", "<br/>");
%>

<!-- jstl로 변환처리 -->
<c:set var="cmt" value="${fn:replace(coment.coment,CRLF, BR)}" />
<c:set var="cmt" value="${fn:replace(cmt,CR, BR)}" />
<c:set var="cmt" value="${fn:replace(cmt,CR, BR)}" />
<c:set var="cmt" value="${fn:replace(cmt,' ',SP)}" />
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Project B</title>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

   <%@include file="includes/shopHeader.jsp"%>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i>홈</a>
                        <a href="./categories.html">카테고리</a>
                        <span>${games.title}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
	<section class="anime-details spad">
		<div class="container">
			<div class="anime__details__content">
				<div class="row">
					<div class="col-lg-3"> 
							<c:set var="t" value="file_1" />
							<c:if test="${not empty games[t]}">
								<div class="anime__details__pic set-bg" data-setbg="/resources/upload/${games[t]}">
								</div>
								<script>
									//document.getElementById('thumb_${i}').src="/resources/upload/" + getThumbFileName('${board[t]}');
								</script>
							</c:if>
					</div>
				<div class="col-lg-9">
					<div class="anime__details__text">
						<div class="anime__details__title">
							<h3><c:out value="${games.title }"/></h3>
							<span><c:out value="${games.dev }"/></span>
						</div>
						<div class="anime__details__rating">
							<div class="rating">
								<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
									class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
								<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
									class="fa fa-star-half-o"></i></a>
							</div>
							<span><c:out value="${games.korean }"/></span>
						</div>
						<div class="anime__details__widget">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<ul>
										<li><span>장르:</span> <c:out value="${games.genre_name }"/></li>
										<li><span>퍼블리셔:</span> <c:out value="${games.publisher }"/></li>
										<li><span>개발사:</span> <c:out value="${games.dev }"/></li>
										<li><span>플랫폼:</span> <c:out value="${games.platform }"/></li>
										<li><span>언어:</span> <c:out value="${games.korean }"/></li>
										<li><span>플레이어 지원:</span> <c:out value="${games.size_name }"/></li>
									</ul>
								</div>
							</div>
							<div class="anime__details__btn">
								<a href="#" class="follow-btn"><i class="fa fa-heart-o"></i>
									위시리스트 추가</a> <a href="#" class="watch-btn"><span><del>${games.sale_price}
											KRW</del> ${games.price} KRW</span> <i class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>게임 정보</h5>
						</div>
						<p style="color: white;">${games.info}</p>
					</div>
					<div class="anime__details__widget">
						<div class="section-title">
							<h5>권장 사양</h5>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<ul>
									<li><span>운영체제:</span> 윈도우 7/8.1/10 (64-bit versions)</li>
									<li><span>프로세서:</span> i5-6600k 3.5 GHz</li>
									<li><span>메모리:</span> 8 GB RAM</li>
									<li><span>그래픽:</span> GTX 780 3GB / Radeon R9 285 2GB</li>
									<li><span>네트워크:</span> 초고속 인터넷 연결</li>
									<li><span>저장공간:</span>80 GB 사용 가능 공간</li>
								</ul>
							</div>
							<div class="col-lg-6 col-md-6">
								<ul>
									<li><span>운영체제:</span> 윈도우 7/8.1/10 (64-bit versions)</li>
									<li><span>프로세서:</span> i5-6600k 3.5 GHz</li>
									<li><span>메모리:</span> 8 GB RAM</li>
									<li><span>그래픽:</span> GTX 780 3GB / Radeon R9 285 2GB</li>
									<li><span>네트워크:</span> 초고속 인터넷 연결</li>
									<li><span>저장공간:</span>80 GB 사용 가능 공간</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4" style="float: right;">
					<div class="anime__details__sidebar">
						<div class="section-title">
							<h5>프로모션</h5>
						</div>
						<!-- <ul class="filter__controls">
                            <li class="active" data-filter="*">Day</li>
                            <li data-filter=".week">Week</li>
                            <li data-filter=".month">Month</li>
                            <li data-filter=".years">Years</li>
                        </ul> -->
						<div class="filter__gallery">
							<div class="product__sidebar__view__item set-bg mix day years"
								data-setbg="../img/sidebar/tv-1.jpg">
								<div class="ep">2021 / 06 / 04 ~ 2021 / 06 / 18</div>
								<h5>
									<a href="#">2021 여름세일 돌입</a>
								</h5>
							</div>
							<div class="product__sidebar__view__item set-bg mix month week"
								data-setbg="../img/sidebar/tv-2.jpg">
								<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
								<h5>
									<a href="#">2021 할로윈세일 예정</a>
								</h5>
							</div>
							<div class="product__sidebar__view__item set-bg mix week years"
								data-setbg="../img/sidebar/tv-3.jpg">
								<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
								<h5>
									<a href="#">아무 행사</a>
								</h5>
							</div>
							<div class="product__sidebar__view__item set-bg mix years month"
								data-setbg="../img/sidebar/tv-4.jpg">
								<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
								<h5>
									<a href="#">이외에 예정된 행사 없음</a>
								</h5>
							</div>
							<div class="product__sidebar__view__item set-bg mix day"
								data-setbg="../sidebar/tv-5.jpg">
								<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
								<div class="view">
									<i class="fa fa-eye"></i> 9141
								</div>
								<h5>
									<a href="#">--</a>
								</h5>
							</div>
						</div>
						<!-- <div class="product__sidebar__comment">
            <div class="section-title">
                <h5>신규출시</h5>
            </div>
            <div class="product__sidebar__comment__item">
                <div class="product__sidebar__comment__item__pic">
                    <img src="img/sidebar/comment-1.jpg" alt="">
                </div>
                <div class="product__sidebar__comment__item__text">
                    <ul>
                        <li>Active</li>
                        <li>Movie</li>
                    </ul>
                    <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                    <span><div class="view"><del>85,000 KRW</del><h5 style="color:WHITE">55,000 KRW</h5></div></span>
                </div>
            </div>
            <div class="product__sidebar__comment__item">
                <div class="product__sidebar__comment__item__pic">
                    <img src="img/sidebar/comment-2.jpg" alt="">
                </div>
                <div class="product__sidebar__comment__item__text">
                    <ul>
                        <li>Active</li>
                        <li>Movie</li>
                    </ul>
                    <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                    <span><div class="view"><del>85,000 KRW</del><h5 style="color:WHITE">55,000 KRW</h5></div></span>
                </div>
            </div>
            <div class="product__sidebar__comment__item">
                <div class="product__sidebar__comment__item__pic">
                    <img src="img/sidebar/comment-3.jpg" alt="">
                </div>
                <div class="product__sidebar__comment__item__text">
                    <ul>
                        <li>Active</li>
                        <li>Movie</li>
                    </ul>
                    <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                    <span><<div class="view"><del>85,000 KRW</del><h5 style="color:WHITE">55,000 KRW</h5></div></span>
                </div>
            
            <div class="product__sidebar__comment__item">
                <div class="product__sidebar__comment__item__pic">
                    <img src="img/sidebar/comment-4.jpg" alt="">
                </div>
                <div class="product__sidebar__comment__item__text">
                    <ul>
                        <li>Active</li>
                        <li>Movie</li>
                    </ul>
                    <h5><a href="#">Monogatari Series: Second Season</a></h5>
                    <span><div class="view"><del>85,000 KRW</del><h5 style="color:WHITE">55,000 KRW</h5></div></span>
                </div>
            </div>
        </div> -->
					</div>
				</div>
			</div>
			</div>
	</section>
	<!-- Anime Section End -->
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