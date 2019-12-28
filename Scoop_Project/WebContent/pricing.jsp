<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
<meta name="description"
	content="Musli is a beautiful Bootstrap 4 template for multipurpose landing pages." />

<!--Inter UI font-->
<link href="https://rsms.me/inter/inter-ui.css" rel="stylesheet">

<!--vendors styles-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Bootstrap CSS / Color Scheme -->
<link rel="stylesheet" href="css/default.css" id="theme-color">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
<!-- Ionicons CSS-->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- Device mockups CSS-->
<link rel="stylesheet" href="css/device-mockups.css">
<!-- Google fonts - Source Sans Pro-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
<!-- Swiper sLider-->
<link rel="stylesheet" href="vendor/swiper/css/swiper.min.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="css/custom.css">
<!-- Favicon-->
<!-- <link rel="shortcut icon" href="img/favicon.png"> -->
<!-- Tweaks for older IEs--><!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
   <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="47797892299-i06tt9qhbs15g8mn89ncu1isa1eneql8.apps.googleusercontent.com">
</head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://code.iconify.design/1/1.0.3/iconify.min.js"></script>
<body>
	<header class="header">
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<!-- Navbar brand-->
				<a href="frontpage.jsp" class="navbar-brand font-weight-bold"><img
					src="img/brownlogo.png" alt="..." class="img-fluid"></a>
				<!-- Navbar toggler button-->
				<button type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation"
					class="navbar-toggler navbar-toggler-right">
					Menu<i class="icon ion-md-list ml-2"></i>
				</button>
				<div id="navbarSupportedContent" class="collapse navbar-collapse">
					<ul class="navbar-nav mx-auto ml-auto">
						<!-- 여기 지우면 죽음뿐 -->
					</ul>
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a id="pages" href="#"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							class="nav-link dropdown-toggle">세부기능</a>
							<div class="dropdown-menu">
								<div id="table">
									<div class="rowdrop">
										<span class="celldrop col1drop"><a href=""
											class="dropdown-item"> 협업공간<br> <span
												style="color: gray; font-size: 13px">동료와 함께 자유롭게 <br>협업하는
													공간
											</span> <br>
										</a></span> <span class="celldrop col2drop"><a href=""
											class="dropdown-item"> 이슈<br> <span
												style="color: gray; font-size: 13px">협업을 시작하는 실시간 <br>
													동시 편집 문서
											</span>

										</a></span>
									</div>
									<div class="rowdrop">
										<span class="celldrop col1drop"><a href="index.html"
											class="dropdown-item"> 실시간 대화<br> <span
												style="color: gray; font-size: 13px">모든 이슈,할 일,파일에서 <br>나누는
													실시간 커뮤니케이션
											</span>
										</a></span> <span class="celldrop col2drop"><a href=""
											class="dropdown-item"> 이슈 업데이트<br> <span
												style="color: gray; font-size: 13px">나에게 필요한 소식을 이슈별로<br>알려주는
													알림 리스트
											</span>
										</a></span>
									</div>
									<div class="rowdrop">
										<span class="celldrop col1drop"><a href="index.html"
											class="dropdown-item"> 캘린더<br> <span
												style="color: gray; font-size: 13px">나와 동료의 일정/할 일<br>파악
													및 스케쥴 관리
											</span>
										</a></span> <span class="celldrop col2drop"><a href=""
											class="dropdown-item"> 칸반<br> <span
												style="color: gray; font-size: 13px">업무의 진행사항을 파악<br>
													및 설정으로 프로젝트를 관리
											</span>
										</a></span>
									</div>
									<div class="rowdrop">
										<span class="celldrop col1drop"><a href=""
											class="dropdown-item"> 컨텐츠 모음<br> <span
												style="color: gray; font-size: 13px">파일,할 일,의사결정,링크를
													<br>쉽고 빠르게 찾을 수 있는 공간
											</span>
										</a></span> <span class="celldrop col2drop"><a href=""
											class="dropdown-item"> 관리자 기능<br> <span
												style="color: gray; font-size: 13px">동료 관리 ,<br>
													협업공간 관리
											</span>
										</a></span>
									</div>

									<hr>
									<a href="" class="dropdown-item" style="text-align: center;">
										스쿱의 보안<br> <span style="color: gray; font-size: 13px">최우선적인
											데이터 보호, 개인정보보호 유지</span>
									</a> <br>

								</div>
							</div></li>
						<!-- Link-->
						<li class="nav-item"><a href="pricing.jsp" class="nav-link">가격</a></li>
						<!-- Link-->
						<li class="nav-item"><a href="#" class="nav-link">Get
								started</a></li>

						<li class="nav-item"><a href="#" data-toggle="modal"
							data-target="#login" class="nav-link font-weight-bold mr-3">Login</a></li>
						<li class="nav-item"><a href="#"
							class="navbar-btn btn btn-primary">무료로 시작하기</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- Login Modal-->
	<div id="login" tabindex="-1" role="dialog" aria-hidden="true"
		class="modal fade bd-example-modal-lg">
		<div role="document"
			class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body p-4 p-lg-5">
					<img class="img-responsive center-block" alt="Scoop로고"
						src="images/logo/brownlogo.png"
						style="width: 100%; height: auto; padding-right: 15%; padding-left: 15%;" />
					<form action="#" class="login-form text-left">
						<div class="form-group mb-4">
							<label>Email address</label> <input type="email" name="email"
								placeholder="name@company.com" class="form-control">
						</div>
						<div class="form-group mb-4">
							<label>Password</label> <input type="password" name="password"
								placeholder="Min 8 characters" class="form-control">
						</div>
						<div class="form-group">
							<input type="submit" value="Login" class="btn btn-primary"
								style="width: 190px; height: 38px; text-align: center; padding-top: 5px;">
							<div id="my-signin2" style="float: right;"></div>
							<div id="naver_id_login"
								style="float: right; margin-right: 5px; margin-left: 0px; width: 210px; border-left-width: 20px; padding-left: 15px;"></div>
						</div>
					</form>
					<!-- 네이버아이디로로그인 버튼 노출 영역 -->
					<script type="text/javascript">
						var naver_id_login = new naver_id_login(
								"UQIzvQsqqo7IfCBE1GH1",
								"http://localhost:8090/Scoop_Project/index.jsp");
						var state = naver_id_login.getUniqState();
						naver_id_login.setButton("white", 3, 40);
						naver_id_login.setDomain("http://localhost:8090/");
						naver_id_login.setState(state);
						naver_id_login.setPopup();
						naver_id_login.init_naver_id_login();
					</script>

					<script>
						function onSuccess(googleUser) {
							console.log('Logged in as: '
									+ googleUser.getBasicProfile().getName());
						}
						function onFailure(error) {
							console.log(error);
						}
						function renderButton() {
							gapi.signin2.render('my-signin2', {
								'scope' : 'profile email',
								'width' : 190,
								'height' : 38,
								'longtitle' : true,
								'theme' : 'dark',
								'onsuccess' : onSuccess,
								'onfailure' : onFailure
							});
						}
					</script>
					<script
						src="https://apis.google.com/js/platform.js?onload=renderButton"
						async defer></script>

				</div>
			</div>
		</div>
	</div>




	<!--pricing section-->
	<section class="pt-7" id="pricing">
		<div class="container">
			<div class="row">
				<div class="col-md-7 mx-auto text-center">
					<h2>스쿱을 무료로 사용해 보세요</h2>
					<p class="text-muted lead">무료로 얼마든지 동료를 초대하고 협업공간을 생성하여 협업할 수
						있습니다.</p>
				</div>
			</div>
			<!--pricing tables-->
			<div class="row pt-5 pricing-table">
				<div class="col-sm-12">
					<div class="card-deck pricing-table">
						<div class="card text-center">
							<div class="card-body">
								<h4 class="card-title pt-3">Premium</h4>
								<h2 class="card-title text-primary pt-4">$499</h2>
								<div class="text-muted mt-4">per month</div>
								<ul class="list-unstyled pricing-list">
									<li>Unlimited devices</li>
									<li>Unlimited media sources</li>
									<li>10 private channel</li>
									<li>Premium support</li>
								</ul>
								<a href="#" class="btn btn-primary"> Get Started </a>
							</div>
						</div>
						<div class="card text-center">
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
									<li>20MB</li>
									<li>-</li>
									<li>-</li>
									<li><span class="iconify" data-icon="bx:bx-check"
										data-inline="false" style="color: #d4af37;"></span></li>
									<li>-</li>
									<li>무제한</li>
									<li>무제한</li>
									<li>-</li>
									<li>-</li>
								</ul>
								<a href="#" class="btn btn-secondary"> Get started </a>
							</div>
						</div>
						<div class="card text-center">
							<div class="card-body">
								<h4 class="card-title text-primary pt-3">Premium</h4>
								<h2 class="card-title text-primary pt-4">$4</h2>
								<div class="text-muted mt-4">per month</div>
								<ul class="list-unstyled pricing-list">
									<li>무제한</li>
									<li>50MB</li>
									<li><span class="iconify" data-icon="bx:bx-check"
										data-inline="false" style="color: #d4af37;"></span></li>
									<li><span class="iconify" data-icon="bx:bx-check"
										data-inline="false" style="color: #d4af37;"></span></li>
									<li><span class="iconify" data-icon="bx:bx-check"
										data-inline="false" style="color: #d4af37;"></span></li>
									<li><span class="iconify" data-icon="bx:bx-check"
										data-inline="false" style="color: #d4af37;"></span></li>
									<li>무제한</li>
									<li>무제한</li>
									<li><span class="iconify" data-icon="bx:bx-check"
										data-inline="false" style="color: #d4af37;"></span></li>
									<li>무제한</li>
									<li>-</li>
								</ul>
								<a href="#" class="btn btn-primary"> Get Started </a>

							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="row mt-6">
				<div class="col-md-10 mx-auto">
					<div class="row">
						<div class="col-md-6 mb-5">
							<h6>Can I try Musli for free?</h6>
							<p class="text-muted">Nam liber tempor cum soluta nobis
								eleifend option congue nihil imper per tem por legere me doming.</p>
						</div>
						<div class="col-md-6 mb-5">
							<h6>Do you have hidden fees?</h6>
							<p class="text-muted">Nam liber tempor cum soluta nobis
								eleifend option congue nihil imper per tem por legere me doming.</p>
						</div>
						<div class="col-md-6 mb-5">
							<h6>What are the payment methods you accept?</h6>
							<p class="text-muted">Nam liber tempor cum soluta nobis
								eleifend option congue nihil imper per tem por legere me doming.</p>
						</div>
						<div class="col-md-6 mb-5">
							<h6>How often do you release updates?</h6>
							<p class="text-muted">Nam liber tempor cum soluta nobis
								eleifend option congue nihil imper per tem por legere me doming.</p>
						</div>
						<div class="col-md-6 mb-5">
							<h6>What is your refund policy?</h6>
							<p class="text-muted">Nam liber tempor cum soluta nobis
								eleifend option congue nihil imper per tem por legere me doming.</p>
						</div>
						<div class="col-md-6 mb-5">
							<h6>How can I contact you?</h6>
							<p class="text-muted">Nam liber tempor cum soluta nobis
								eleifend option congue nihil imper per tem por legere me doming.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tlinks">
			Collect from <a href="http://www.cssmoban.com/" title=""></a>
		</div>
	</section>


	<!-- theme switcher (FOR DEMO ONLY - REMOVE FROM PRODUCTION)-->
	<div class="switcher-wrap">
		<div class="switcher-trigger">
			<span class="fa fa-gear"></span>
		</div>
		<div class="color-switcher">
			<h6>Color Switcher</h6>
			<ul class="mt-3 clearfix">
				<li class="bg-gold active" data-color="default" title="Default gold"></li>
				<li class="bg-blue" data-color="blue" title="Blue"></li>
				<li class="bg-red" data-color="red" title="Red"></li>
				<li class="bg-indigo" data-color="indigo" title="Indigo"></li>
				<li class="bg-orange" data-color="orange" title="Orange"></li>
				<li class="bg-black" data-color="black" title="Black"></li>
				<li class="bg-teal" data-color="teal" title="Teal"></li>
				<li class="bg-cyan" data-color="cyan" title="Cyan"></li>
				<li class="bg-purple" data-color="purple" title="Purple"></li>
				<li class="bg-pink" data-color="pink" title="Pink"></li>
			</ul>
			<p>
				These are just demo colors. You can <b>easily</b> create your own
				color scheme.
			</p>
		</div>
	</div>
	<footer class="footer">
  <div class="container text-center">
   <!-- Copyrights-->
   <div class="copyrights">
     <!-- Social menu-->
     <ul class="social list-inline-item">
      <li class="list-inline-item"><a href="#" target="_blank" class="social-link"><i class="icon ion-logo-twitter"></i></a></li>
      <li class="list-inline-item"><a href="#" target="_blank" class="social-link"><i class="icon ion-logo-facebook"></i></a></li>
      <li class="list-inline-item"><a href="#" target="_blank" class="social-link"><i class="icon ion-logo-youtube"></i></a></li>
     </ul>
     <p class="copyrights-text mb-0">Copyright &copy; 2019.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
   </div>
  </div>
</footer>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/swiper/js/swiper.min.js"></script>
<script src="js/front.js"></script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
	<script src="js/scripts.js"></script>
</html>