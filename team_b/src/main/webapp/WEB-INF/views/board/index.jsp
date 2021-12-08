<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("CR", "\r");
pageContext.setAttribute("LF", "\n");
pageContext.setAttribute("CRLF", "\r\n");
pageContext.setAttribute("SP", "&nbsp;");
pageContext.setAttribute("BR", "<br/>");
%>
<!-- jstl로 줄바꿈 변환처리 -->
<c:set var="cmt" value="${fn:replace(coment.coment,CRLF, BR)}" />
<c:set var="cmt" value="${fn:replace(cmt,CR, BR)}" />
<c:set var="cmt" value="${fn:replace(cmt,CR, BR)}" />
<c:set var="cmt" value="${fn:replace(cmt,' ',SP)}" />
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
								<a href="#"><span><del>45,000 원</del> 25,000 원</span> <i
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
								<a href="#"><span><del>39,000 원</del> 17,000 원</span> <i
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
									<a href="/sales?keyword=" class="primary-btn">전체보기 <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="row">
							<c:forEach items="${sales}" var="sales" end="5">
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<a class='move'
											href='detail?game_num=<c:out value="${sales.game_num}"/>'>
											<c:set var="t" value="file_1" /> 
											<c:if test="${not empty sales[t]}">
												<div class="product__item__pic set-bg"
													data-setbg="/resources/upload/${sales[t]}">
													<div class="view">
														<del>
															<c:out value="${sales.price}" />
															원
														</del>
														<h5 style="color: WHITE">
															<c:out value="${sales.sale_price}" />
															원
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
						<div class="popular__product">
							<div class="row">
								<div class="col-lg-8 col-md-8 col-sm-8">
									<div class="section-title">
										<h4>최근 출시작</h4>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4">
									<div class="btn__all">
										<a href="/recent?keyword=" class="primary-btn">전체보기 <span
											class="arrow_right"></span></a>
									</div>
								</div>
							</div>
							<div class="row">
								<c:forEach items="${recent}" var="recent"  end="5">
									<div class="col-lg-4 col-md-6 col-sm-6">
										<div class="product__item">
											<a class='move'
												href='detail?game_num=<c:out value="${recent.game_num}"/>'>
												<c:set var="t" value="file_1" /> <c:if
													test="${not empty recent[t]}">
													<div class="product__item__pic set-bg"
														data-setbg="/resources/upload/${recent[t]}">
														<div class="view">
															<del>
																<c:out value="${recent.price}" />
																원
															</del>
															<h5 style="color: WHITE">
																<c:out value="${recent.sale_price}" />
																원
															</h5>
														</div>
													</div>
												</c:if>
											</a>
											<div class="product__item__text">
												<ul>
													<li><c:out value="${recent.genre_name}" /></li>
													<li><c:out value="${recent.size_name}" /></li>
												</ul>
												<h5>
													<a href='detail?game_num=<c:out value="${recent.game_num}"/>'><c:out
															value="${recent.title}" /></a>
												</h5>
											</div>
										</div>
									</div>
								</c:forEach>

							</div>
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
										<img src='detail?game_num=<c:out value="${recent.game_num}"/>' alt="">
									</div>
									</c:if>
									<div class="product__sidebar__comment__item__text">
										<ul>
											<li><c:out value="${recent.genre_name}" /></li>
											<li><c:out value="${recent.size_name}" /></li>
										</ul>
										<h5>
											<a href="#">${recent.title }</a>
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