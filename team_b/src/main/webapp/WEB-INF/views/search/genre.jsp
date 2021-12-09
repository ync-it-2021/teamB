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
                           <c:forEach items="${games}" var="games">
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<a class='move'
											href='detail?game_num=<c:out value="${games.game_num}"/>'>
											<c:set var="t" value="file_1" /> <c:if
												test="${not empty games[t]}">
												<div class="product__item__pic set-bg"
													data-setbg="/resources/upload/${games[t]}">
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
											</c:if>
										</a>
										<div class="product__item__text">
											<ul>
												<li><c:out value="${games.genre_name}" /></li>
												<li><c:out value="${games.size_name}" /></li>
											</ul>
											<h5>
												<a href='detail?game_num=<c:out value="${games.game_num}"/>'><c:out
														value="${games.title}" /></a>
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
									<c:forEach items="${news}" var="news">
									<c:set var="t" value="file_1" />
									<c:if test="${not empty news[t]}">
										<div class="product__sidebar__view__item set-bg mix day years"
											data-setbg="/resources/upload/${news[t]}">
											<div class="ep">${news.gubun }</div>
                                    		<br>
											<h5>
												<a href='newsdetail?news_num=<c:out value="${news.news_num}"/>'>
												${news.news_title }</a>
											</h5>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<!-- 프로모션 끝 -->

							<div class="product__sidebar__comment">
								<div class="section-title">
									<h5>신규출시</h5>
								</div>
								<c:forEach items="${recent}" var="recent"  end="3">
								<div class="product__sidebar__comment__item">
									<c:set var="t" value="file_1" /> 
									<c:if test="${not empty recent[t]}">
									<div class="product__sidebar__comment__item__pic">
										<img src="/resources/upload/${recent[t]}" alt="" width="90" height="130">
									</div>
									</c:if>
									<div class="product__sidebar__comment__item__text">
										<ul>
											<li><c:out value="${recent.genre_name}" /></li>
											<li><c:out value="${recent.size_name}" /></li>
										</ul>
										<h5>
											<a href="detail?game_num=<c:out value="${recent.game_num}"/>">${recent.title }</a>
										</h5>
										<span><div class="view">
												<del>${recent.price } 원</del>
												<h5 style="color: WHITE"><c:out value="${recent.sale_price}" /> 원</h5>
											</div></span>
									</div>
								</div>
								</c:forEach>
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