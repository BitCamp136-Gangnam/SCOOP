<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
<!-- Custom Stylesheet -->
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">

</head>
<style>
.myinfo {
	border: 0;
	border-bottom: 1px solid #c8c8c8;
	background-color: white;
}

.form-control[readonly] {
	background-color: white;
}
</style>
<body>

	<jsp:include page="/WEB-INF/views/commons/preloader.jsp"></jsp:include>


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<jsp:include page="/WEB-INF/views/commons/headerAndLeft.jsp"></jsp:include>

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<br>
			<div class="container-fluid">
				<div class="card" style="min-height: 1080px">
					<div class="row" style="margin: 2%">
						<div class="col-sm-12" style="padding-left: 0">
							<h3>결재 및 가격정보</h3>
						</div>
					</div>
					<div class="row" style="margin-left: 2%;">
						<ul class="nav nav-pills">
							<li class="nav-item"><a class="nav-link"
								href="./app-profile.jsp">내 정보</a></li>
							<li class="nav-item"><a class="nav-link"
								href="./app-alram.jsp">알림</a></li>
							<li class="nav-item"><a class="nav-link"
								href="./app-external.jsp">외부 서비스 연결</a></li>
							<li class="nav-item"><a class="nav-link"
								href="paymentPage.do">가격 및 결제</a></li>
						</ul>
					</div>
					<hr style="margin-top: 0">
					<div class="row"
						style="margin-left: 4%; margin-right: 2%; margin-top: 1%">
						<div class="media align-items-center mb-4">
							<img class="mr-3"
								src="<c:url value="/resources/images/avatar/avatar.png" />"
								width="120" height="120" alt="">
							<div class="media-body">
								<h3 class="mb-0">${member.name}</h3>
								<p class="text-muted mb-0" style="margin-left: 2%">${member.email}</p>
							</div>
						</div>
					</div>
					<div class="row" style="margin-left: 4%; margin-top: 2%"></div>
					<!-- #/ container -->
					<section class="pt-4" id="pricing">
						<div id="pricing_area"></div>
						<div class="container">
							<div class="row">
								<div class="col-md-7 mx-auto text-center">
									<h2>
										<spring:message code="payment.title" />
									</h2>
									<br>
									<p class="text-muted lead">
										<spring:message code="payment.content" />
									</p>
								</div>
							</div>
							<!--pricing tables-->
							<div class="row pt-5 pricing-table">
								<div class="col-sm-12">
									<div class="card-deck pricing-table">
										<div class="card text-center" style="border-color: #fff">
											<div class="card-body">
												<h4 class="card-title pt-3" style="color: #0E2866">CHOICE</h4>
												<h2 class="card-title pt-4" style="color: #0E2866">PRICE</h2>
												<div class="text-muted mt-4">
													<spring:message code="payment.date" />
												</div>
												<ul class="list-unstyled pricing-list">
													<li><spring:message code="payment.team" /></li>
													<li><spring:message code="payment.alam" /></li>
													<li><spring:message code="payment.upload" /></li>
													<li><spring:message code="payment.retiree" /></li>
													<li><spring:message code="payment.comMgm" /></li>
													<li><spring:message code="payment.teamMgm" /></li>
													<li><spring:message code="payment.publicMgm" /></li>
													<li><spring:message code="payment.member" /></li>
													<li><spring:message code="payment.collabo" /></li>
													<li><spring:message code="payment.cs" /></li>
													<li><spring:message code="payment.api" /></li>
													<li><spring:message code="payment.email" /></li>
												</ul>
												<h5>
													<spring:message code="payment.start" />
												</h5>
											</div>
										</div>

										<div class="card text-center" style="border-color: #fff">
											<div class="card-body">
												<h4 class="card-title pt-3">Free</h4>
												<h2 class="card-title pt-4">$0</h2>
												<div class="text-muted mt-4">
													<span class="iconify" data-icon="ion:infinite-sharp"
														data-inline="false"></span>
												</div>
												<ul class="list-unstyled pricing-list">
													<li>3개</li>
													<li>무제한</li>
													<li>무제한</li>
													<li>20MB</li>
													<li>-</li>
													<li>-</li>
													<li><span class="iconify" data-icon="bx:bx-check"
														data-inline="false" style="color: #E71D36;"></span></li>
													<li>-</li>
													<li>무제한</li>
													<li>무제한</li>
													<li>-</li>
													<li>-</li>
												</ul>
												<a href="#" data-toggle="modal" data-target="#login"
													class="btn btn-secondary"> Get started </a>
											</div>
										</div>
										<div class="card text-center" style="border-color: #fff">
											<div class="card-body">
												<h4 class="card-title text-primary pt-3">Premium</h4>
												<h2 class="card-title text-primary pt-4">$4</h2>
												<div class="text-muted mt-4">per month</div>
												<ul class="list-unstyled pricing-list">
													<li>무제한</li>
													<li>무제한</li>
													<li>50MB</li>
													<li><span class="iconify" data-icon="bx:bx-check"
														data-inline="false" style="color: #E71D36;"></span></li>
													<li><span class="iconify" data-icon="bx:bx-check"
														data-inline="false" style="color: #E71D36;"></span></li>
													<li><span class="iconify" data-icon="bx:bx-check"
														data-inline="false" style="color: #E71D36;"></span></li>
													<li><span class="iconify" data-icon="bx:bx-check"
														data-inline="false" style="color: #E71D36;"></span></li>
													<li>무제한</li>
													<li>무제한</li>
													<li><span class="iconify" data-icon="bx:bx-check"
														data-inline="false" style="color: #E71D36;"></span></li>
													<li>무제한</li>
													<li>-</li>
												</ul>
												<a href="requestPay" data-toggle="modal"
													data-target="#login" class="btn btn-primary"> Get
													Started </a>

											</div>
										</div>

									</div>
								</div>
							</div>

							<div class="row mt-5">
								<div class="col-md-10 mx-auto">
									<div class="row">
										<div class="col-sm-12"
											style="text-align: center; padding-bottom: 5%;">
											<h2>
												<spring:message code="qna" />
											</h2>
										</div>
										<button class="accordion">Section 1</button>
										<div class="panel">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua. Ut enim ad minim veniam, quis nostrud
												exercitation ullamco laboris nisi ut aliquip ex ea commodo
												consequat.</p>
										</div>

										<button class="accordion">Section 2</button>
										<div class="panel">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua. Ut enim ad minim veniam, quis nostrud
												exercitation ullamco laboris nisi ut aliquip ex ea commodo
												consequat.</p>
										</div>

										<button class="accordion">Section 3</button>
										<div class="panel">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua. Ut enim ad minim veniam, quis nostrud
												exercitation ullamco laboris nisi ut aliquip ex ea commodo
												consequat.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tlinks">
							Collect from <a href="http://www.cssmoban.com/" title=""></a>
						</div>
					</section>
				</div>
			</div>
		</div>


		---



		<div class="content-body">
			<br>
			<div class="container-fluid">
				<section class="pt-4" id="pricing">
					<div id="pricing_area"></div>
					<div class="container">
						<div class="row">
							<div class="col-md-7 mx-auto text-center">
								<h2>
									<spring:message code="payment.title" />
								</h2>
								<br>
								<p class="text-muted lead">
									<spring:message code="payment.content" />
								</p>
							</div>
						</div>
						<!--pricing tables-->
						<div class="row pt-5 pricing-table">
							<div class="col-sm-12">
								<div class="card-deck pricing-table">
									<div class="card text-center" style="border-color: #fff">
										<div class="card-body">
											<h4 class="card-title pt-3" style="color: #0E2866">CHOICE</h4>
											<h2 class="card-title pt-4" style="color: #0E2866">PRICE</h2>
											<div class="text-muted mt-4">
												<spring:message code="payment.date" />
											</div>
											<ul class="list-unstyled pricing-list">
												<li><spring:message code="payment.team" /></li>
												<li><spring:message code="payment.alam" /></li>
												<li><spring:message code="payment.upload" /></li>
												<li><spring:message code="payment.retiree" /></li>
												<li><spring:message code="payment.comMgm" /></li>
												<li><spring:message code="payment.teamMgm" /></li>
												<li><spring:message code="payment.publicMgm" /></li>
												<li><spring:message code="payment.member" /></li>
												<li><spring:message code="payment.collabo" /></li>
												<li><spring:message code="payment.cs" /></li>
												<li><spring:message code="payment.api" /></li>
												<li><spring:message code="payment.email" /></li>
											</ul>
											<h5>
												<spring:message code="payment.start" />
											</h5>
										</div>
									</div>

									<div class="card text-center" style="border-color: #fff">
										<div class="card-body">
											<h4 class="card-title pt-3">Free</h4>
											<h2 class="card-title pt-4">$0</h2>
											<div class="text-muted mt-4">
												<span class="iconify" data-icon="ion:infinite-sharp"
													data-inline="false"></span>
											</div>
											<ul class="list-unstyled pricing-list">
												<li>3개</li>
												<li>무제한</li>
												<li>무제한</li>
												<li>20MB</li>
												<li>-</li>
												<li>-</li>
												<li><span class="iconify" data-icon="bx:bx-check"
													data-inline="false" style="color: #E71D36;"></span></li>
												<li>-</li>
												<li>무제한</li>
												<li>무제한</li>
												<li>-</li>
												<li>-</li>
											</ul>
											<a href="#" data-toggle="modal" data-target="#login"
												class="btn btn-secondary"> Get started </a>
										</div>
									</div>
									<div class="card text-center" style="border-color: #fff">
										<div class="card-body">
											<h4 class="card-title text-primary pt-3">Premium</h4>
											<h2 class="card-title text-primary pt-4">$4</h2>
											<div class="text-muted mt-4">per month</div>
											<ul class="list-unstyled pricing-list">
												<li>무제한</li>
												<li>무제한</li>
												<li>50MB</li>
												<li><span class="iconify" data-icon="bx:bx-check"
													data-inline="false" style="color: #E71D36;"></span></li>
												<li><span class="iconify" data-icon="bx:bx-check"
													data-inline="false" style="color: #E71D36;"></span></li>
												<li><span class="iconify" data-icon="bx:bx-check"
													data-inline="false" style="color: #E71D36;"></span></li>
												<li><span class="iconify" data-icon="bx:bx-check"
													data-inline="false" style="color: #E71D36;"></span></li>
												<li>무제한</li>
												<li>무제한</li>
												<li><span class="iconify" data-icon="bx:bx-check"
													data-inline="false" style="color: #E71D36;"></span></li>
												<li>무제한</li>
												<li>-</li>
											</ul>
											<a href="requestPay" data-toggle="modal" data-target="#login"
												class="btn btn-primary"> Get Started </a>

										</div>
									</div>

								</div>
							</div>
						</div>

						<div class="row mt-5">
							<div class="col-md-10 mx-auto">
								<div class="row">
									<div class="col-sm-12"
										style="text-align: center; padding-bottom: 5%;">
										<h2>
											<spring:message code="qna" />
										</h2>
									</div>
									<button class="accordion">Section 1</button>
									<div class="panel">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo
											consequat.</p>
									</div>

									<button class="accordion">Section 2</button>
									<div class="panel">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo
											consequat.</p>
									</div>

									<button class="accordion">Section 3</button>
									<div class="panel">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo
											consequat.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tlinks">
						Collect from <a href="http://www.cssmoban.com/" title=""></a>
					</div>
				</section>
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
		<!--**********************************
            Footer end
        ***********************************-->
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<script src="<c:url value="/resources/plugins/common/common.min.js"/>"></script>
	<script src="<c:url value="/resources/js/custom.min.js"/>"></script>
	<script src="<c:url value="/resources/js/settings.js"/>"></script>
	<script src="<c:url value="/resources/js/gleek.js"/>"></script>
	<script src="<c:url value="/resources/js/styleSwitcher.js"/>"></script>

</body>

</html>