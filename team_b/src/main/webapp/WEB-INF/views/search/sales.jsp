<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="../includes/shopHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
  <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i>홈</a>
                        <a href="./categories.html">카테고리</a>
                        <span>검색결과</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4>검색결과</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p>Order by:</p>
                                        <select>
                                            <option value="">A-Z</option>
                                            <option value="">1-10</option>
                                            <option value="">10-50</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                           <c:forEach items="${sales}" var="sales">
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<a class='move'
											href='detail?game_num=<c:out value="${sales.game_num}"/>'>
											<c:set var="t" value="file_1" /> <c:if
												test="${not empty sales[t]}">
												<div class="product__item__pic set-bg"
													data-setbg="/resources/upload/${sales[t]}">
													<div class="view">
														<del>
															<c:out value="${sales.price}" />
															KRW
														</del>
														<h5 style="color: WHITE">
															<c:out value="${sales.sale_price}" />
															KRW
														</h5>
													</div>
												</div>
											</c:if>
										</a>
										<div class="product__item__text">
											<ul>
												<li><c:out value="${sales.genre_name}" /></li>
												<li><c:out value="${sales.size_name}" /></li>
											</ul>
											<h5>
												<a href='detail?game_num=<c:out value="${sales.game_num}"/>'><c:out
														value="${sales.title}" /></a>
											</h5>
										</div>
									</div>
								</div>
							</c:forEach>
                    </div>
                    <div class="product__pagination">
                        <a href="#" class="current-page">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#"><i class="fa fa-angle-double-right"></i></a>
                    </div>
                </div>
                </div>
              	<!-- 현재 할인중 탭 끝 프로모션 시작-->
				<div class="col-lg-4 col-md-6 col-sm-8">
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
								<div class="product__sidebar__view__item set-bg mix years month"
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
							<!-- 프로모션 끝 -->

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
	</section>
	<!-- Product Section End -->

<%@include file="../includes/shopFooter.jsp"%>
</body>
</html>