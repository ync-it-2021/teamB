<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<%@include file="../includes/shopHeader.jsp"%>

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

	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="hero__slider owl-carousel">
				<div class="hero__items set-bg"
					data-setbg="/resources/img/hero/hero-3.jpg">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label">액션</div>
								<h2>
									Fate: <br>UBW
								</h2>
								<a href="#"><span><del>45,000 KRW</del> 25,000 KRw</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero__items set-bg"
					data-setbg="/resources/img/hero/hero-2.jpg">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label">시뮬레이션</div>
								<h2>이브 온라인</h2>
								<div class="view" style="color: WHITE">나이트 헤이븐 업데이트 !</div>
								<a href="#"><span>무료로 플레이!</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero__items set-bg"
					data-setbg="/resources/img/hero/hero-1.jpg">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label">액션</div>
								<h2>발로란트</h2>
								<div class="view" style="color: WHITE">시즌 2 에피소드 2 업데이트 기념
									할인 !</div>
								<a href="#"><span><del>39,000 KRW</del> 17,000 KRw</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="trending__product">
						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-8">
								<div class="section-title">
									<h4>현재 할인중</h4>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="btn__all">
									<a href="#" class="primary-btn">전체보기 <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>

						<div class="row">
							<c:forEach items="${games}" var="games">
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<a class='move' href='detail?game_num=<c:out value="${games.game_num}"/>'>
											<div class="product__item__pic set-bg"
												data-setbg="/resources/img/trending/trend-1.jpg">
												<div class="view">
													<del>
														<c:out value="${games.price}" />
														KRW
													</del>
													<h5 style="color: WHITE">
														<c:out value="${games.sale_price}" />
														KRW
													</h5>
												</div>
											</div>
										</a>
										<div class="product__item__text">
											<ul>
												<li><c:out value="${games.genre_name}" /></li>
												<li><c:out value="${games.size_name}" /></li>
											</ul>
											<h5>
												<a href="../anime-details.jsp"><c:out
														value="${games.title}" /></a>
											</h5>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="popular__product">
							<div class="row">
								<div class="col-lg-8 col-md-8 col-sm-8">
									<div class="section-title">
										<h4>최다인기작</h4>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4">
									<div class="btn__all">
										<a href="#" class="primary-btn">전체보기 <span
											class="arrow_right"></span></a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/popular/popular-1.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Sen to Chihiro no Kamikakushi</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/popular/popular-2.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Kizumonogatari III: Reiket su-hen</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/popular/popular-3.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Shirogane Tamashii hen Kouhan sen</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/popular/popular-4.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Rurouni Kenshin: Meiji Kenkaku Romantan</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/popular/popular-5.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Mushishi Zoku Shou 2nd Season</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/popular/popular-6.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Monogatari Series: Second Season</a>
											</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="recent__product">
							<div class="row">
								<div class="col-lg-8 col-md-8 col-sm-8">
									<div class="section-title">
										<h4>최근 업데이트</h4>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4">
									<div class="btn__all">
										<a href="#" class="primary-btn">전체보기 <span
											class="arrow_right"></span></a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/recent/recent-1.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Great Teacher Onizuka</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/recent/recent-2.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Fate/stay night Movie: Heaven's Feel - II.
													Lost</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/recent/recent-3.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Mushishi Zoku Shou: Suzu no Shizuku</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/recent/recent-4.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Fate/Zero 2nd Season</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/recent/recent-5.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Kizumonogatari II: Nekket su-hen</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="/resources/img/recent/recent-6.jpg">
											<div class="ep">18 / 18</div>
											<div class="comment">
												<i class="fa fa-comments"></i> 11
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
										</div>
										<div class="product__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
											</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 현재 할인중 탭 끝 -->
					<div class="col-lg-4 col-md-6 col-sm-8" style="float: right;">
						<div class="product__sidebar">
							<div class="product__sidebar__view">
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
										data-setbg="/resources/img/sidebar/tv-1.jpg">
										<div class="ep">2021 / 06 / 04 ~ 2021 / 06 / 18</div>
										<h5>
											<a href="#">2021 여름세일 돌입</a>
										</h5>
									</div>
									<div class="product__sidebar__view__item set-bg mix month week"
										data-setbg="/resources/img/sidebar/tv-2.jpg">
										<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
										<h5>
											<a href="#">2021 할로윈세일 예정</a>
										</h5>
									</div>
									<div class="product__sidebar__view__item set-bg mix week years"
										data-setbg="/resources/img/sidebar/tv-3.jpg">
										<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
										<h5>
											<a href="#">아무 행사</a>
										</h5>
									</div>
									<div
										class="product__sidebar__view__item set-bg mix years month"
										data-setbg="/resources/img/sidebar/tv-4.jpg">
										<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
										<h5>
											<a href="#">이외에 예정된 행사 없음</a>
										</h5>
									</div>
									<div class="product__sidebar__view__item set-bg mix day"
										data-setbg="/resources/img/sidebar/tv-5.jpg">
										<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
										<div class="view">
											<i class="fa fa-eye"></i> 9141
										</div>
										<h5>
											<a href="#">---</a>
										</h5>
									</div>
								</div>

								<div class="product__sidebar__view">
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
											data-setbg="/resources/img/sidebar/tv-1.jpg">
											<div class="ep">2021 / 06 / 04 ~ 2021 / 06 / 18</div>
											<h5>
												<a href="#">2021 여름세일 돌입</a>
											</h5>
										</div>
										<div
											class="product__sidebar__view__item set-bg mix month week"
											data-setbg="/resources/img/sidebar/tv-2.jpg">
											<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
											<h5>
												<a href="#">2021 할로윈세일 예정</a>
											</h5>
										</div>
										<div
											class="product__sidebar__view__item set-bg mix week years"
											data-setbg="/resources/img/sidebar/tv-3.jpg">
											<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
											<h5>
												<a href="#">그럴듯하지 않나요 이 행사</a>
											</h5>
										</div>
										<div
											class="product__sidebar__view__item set-bg mix years month"
											data-setbg="/resources/img/sidebar/tv-4.jpg">
											<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
											<h5>
												<a href="#">이외에 예정된 행사 없음</a>
											</h5>
										</div>
										<div class="product__sidebar__view__item set-bg mix day"
											data-setbg="/resources/img/sidebar/tv-5.jpg">
											<div class="ep">2021 / 10 / 28 ~ 2021 / 11 / 04</div>
											<div class="view">
												<i class="fa fa-eye"></i> 9141
											</div>
											<h5>
												<a href="#">진짜로</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="product__sidebar__comment">
									<div class="section-title">
										<h5>신규출시</h5>
									</div>
									<div class="product__sidebar__comment__item">
										<div class="product__sidebar__comment__item__pic">
											<img src="/resources/img/sidebar/comment-1.jpg" alt="">
										</div>
										<div class="product__sidebar__comment__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
											</h5>
											<span><div class="view">
													<del>85,000 KRW</del>
													<h5 style="color: WHITE">55,000 KRW</h5>
												</div></span>
										</div>
									</div>
									<div class="product__sidebar__comment__item">
										<div class="product__sidebar__comment__item__pic">
											<img src="/resources/img/sidebar/comment-2.jpg" alt="">
										</div>
										<div class="product__sidebar__comment__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Shirogane Tamashii hen Kouhan sen</a>
											</h5>
											<span><div class="view">
													<del>85,000 KRW</del>
													<h5 style="color: WHITE">55,000 KRW</h5>
												</div></span>
										</div>
									</div>
									<div class="product__sidebar__comment__item">
										<div class="product__sidebar__comment__item__pic">
											<img src="/resources/img/sidebar/comment-3.jpg" alt="">
										</div>
										<div class="product__sidebar__comment__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Kizumonogatari III: Reiket su-hen</a>
											</h5>
											<span><
												<div class="view">
													<del>85,000 KRW</del>
													<h5 style="color: WHITE">55,000 KRW</h5>
												</div>
											</span>
										</div>
									</div>
									<div class="product__sidebar__comment__item">
										<div class="product__sidebar__comment__item__pic">
											<img src="/resources/img/sidebar/comment-4.jpg" alt="">
										</div>
										<div class="product__sidebar__comment__item__text">
											<ul>
												<li>Active</li>
												<li>Movie</li>
											</ul>
											<h5>
												<a href="#">Monogatari Series: Second Season</a>
											</h5>
											<span><div class="view">
													<del>85,000 KRW</del>
													<h5 style="color: WHITE">55,000 KRW</h5>
												</div></span>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
									</div>
					</div>
	</section>
	<!-- Product Section End -->

	<%@include file="../includes/shopFooter.jsp"%>

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