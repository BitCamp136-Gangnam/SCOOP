<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link rel="shortcut icon" href="img/favicon.png">
<!-- Tweaks for older IEs--><!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
   <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

</head>
<body>
<!-- navbar-->
<header class="header">
  <nav class="navbar navbar-expand-lg">
   <div class="container">
     <!-- Navbar brand--><a href="frontpage.jsp" class="navbar-brand font-weight-bold"><img src="img/brownlogo.png" alt="..." class="img-fluid"></a>
     <!-- Navbar toggler button-->
     <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right">Menu<i class="icon ion-md-list ml-2"></i></button>
     <div id="navbarSupportedContent" class="collapse navbar-collapse">
      <ul class="navbar-nav mx-auto ml-auto">
         <!-- 여기 지우면 죽음뿐 -->
      </ul>
      <ul class="navbar-nav">
      <li class="nav-item dropdown"><a id="pages" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">세부기능</a>
      <div class="dropdown-menu">
      <div id="table">
      <div class="rowdrop">
         <span class="celldrop col1drop"><a href="" class="dropdown-item">
         	협업공간<br>
         	<span style="color: gray;font-size:13px">동료와 함께 자유롭게 <br>협업하는 공간</span>
         	<br>
         	</a></span>
      
         <span class="celldrop col2drop"><a href="" class="dropdown-item">
         	이슈<br>
         	<span style="color: gray;font-size:13px">협업을 시작하는 실시간 <br> 동시 편집 문서</span>
         
         </a></span>
      </div>
      <div class="rowdrop">
         <span class="celldrop col1drop"><a href="index.html" class="dropdown-item">실시간 대화</a></span>
         <span class="celldrop col2drop"><a href="l" class="dropdown-item">이슈 업데이트</a></span>
      </div>
      <div class="rowdrop">
         <span class="celldrop col1drop"><a href="" class="dropdown-item">컨텐츠 모음</a></span>
         <span class="celldrop col2drop"><a href="" class="dropdown-item">관리자 기능</a></span>
      </div>
      
         <hr>
         <a href="" class="dropdown-item" style="text-align: center;">스쿱의 보안</a>
         <br>
        
      </div>
           </div>
           </li>
           <!-- Link-->
           <li class="nav-item"> <a href="schedule.html" class="nav-link">가격</a></li>
           <!-- Link-->
           <li class="nav-item"> <a href="#" class="nav-link">Get started</a></li>
       
        <li class="nav-item"><a href="#" data-toggle="modal" data-target="#login" class="nav-link font-weight-bold mr-3">Login</a></li>
        <li class="nav-item"><a href="#" class="navbar-btn btn btn-primary">무료로 시작하기</a></li>
      </ul>
     </div>
   </div>
  </nav>
</header>
<!-- Login Modal-->
<div id="login" tabindex="-1" role="dialog" aria-hidden="true" class="modal fade bd-example-modal-lg">
  <div role="document" class="modal-dialog modal-dialog-centered modal-lg">
   <div class="modal-content">
     <div class="modal-header border-bottom-0">
      <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
     </div>
     <div class="modal-body p-4 p-lg-5">
      <form action="#" class="login-form text-left">
        <div class="form-group mb-4">
         <label>Email address</label>
         <input type="email" name="email" placeholder="name@company.com" class="form-control">
        </div>
        <div class="form-group mb-4">
         <label>Password</label>
         <input type="password" name="password" placeholder="Min 8 characters" class="form-control">
        </div>
        <div class="form-group">
         <input type="submit" value="Login" class="btn btn-primary">
        </div>
      </form>
     </div>
   </div>
  </div>
</div>
<div class="page-holder">
  <!-- Hero Section-->
  <section class="hero shape-1">
   <div class="container">
     <div class="row align-items-center">
      <div class="col-lg-6">
        <h1 class="hero-heading">하나의 문서로 함께 만드는 협업</h1>
        <p class="lead mt-5 font-weight-light">동료와 한 페이지 안에서 할 일,파일,의사결정,일정 및 커뮤니케이션을 모두 담아 이슈를 해결해 보세요.🍿</p>
        <!-- Subscription form-->
        <form action="#" class="subscription-form mt-5">
         <div class="form-group">
           <label>Email</label>
           <input type="email" name="email" placeholder="your@email.com" class="form-control">
           <button type="submit" class="btn btn-primary">Start tracking</button>     
         </div>
            <span>이미 가입하셨나요?</span>
            <a href="" style="color:#cf455c;">로그인 하기</a>    
        </form>
        <!-- Platforms-->
        <div class="platforms d-none d-lg-block"><span class="platforms-title">Compatible with</span>
         <ul class="platforms-list list-inline">
           <li class="list-inline-item"><img src="img/netflix.svg" alt="" class="platform-image img-fluid"></li>
           <li class="list-inline-item"><img src="img/apple.svg" alt="" class="platform-image img-fluid"></li>
           <li class="list-inline-item"><img src="img/android.svg" alt="" class="platform-image img-fluid"></li>
           <li class="list-inline-item"><img src="img/windows.svg" alt="" class="platform-image img-fluid"></li>
           <li class="list-inline-item"><img src="img/synology.svg" alt="" class="platform-image img-fluid"></li>
         </ul>
        </div>
      </div>
      <div class="col-lg-6 d-none d-lg-block">
          <img src="img/AppleiMac.png" alt="..." class="img-fluid">
      </div>
     </div>
   </div>
  </section>
  <br>
  <!-- Features Section-->
  <section class="features shape-2">         
   <div class="container">
     <div class="section-header text-center"><span class="section-header-title"></span>
      <h2 class="h1">Built and customized</h2>
      <div class="row">
        <div class="col-lg-8 mx-auto">
         <p class="lead">ShowTrackr’s built-in machine learning and context-aware features guarantee that all the notifications and recommendations are always delivered to you in the perfect moment.</p>
        </div>
      </div>
     </div>
     <div class="row mt-5 text-center">
      <div class="col-lg-4">
        <div class="features-item mb-5 mb-lg-0">
         <div class="gradient-icon gradient-1"><i class="icon ion-ios-play"></i></div>
         <h3 class="h5">Automated tracking</h3>
         <p>Track your favorite shows automatically without switching between apps.</p><a href="#" class="features-link">Learn more<i class="icon ion-ios-arrow-forward ml-2"></i></a>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="features-item mb-5 mb-lg-0">
         <div class="gradient-icon gradient-2"><i class="icon ion-ios-cog"></i></div>
         <h3 class="h5">Machine learning</h3>
         <p>Get recommendations like never before, which are truly customized for your taste.</p><a href="#" class="features-link">Learn more<i class="icon ion-ios-arrow-forward ml-2"></i></a>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="features-item mb-5 mb-lg-0">
         <div class="gradient-icon gradient-3"><i class="icon ion-ios-notifications"></i></div>
         <h3 class="h5">Smart notifications</h3>
         <p>Receive smart notifications exactly at the right moments when you need them.</p><a href="#" class="features-link">Learn more<i class="icon ion-ios-arrow-forward ml-2"></i></a>
        </div>
      </div>
     </div>
   </div>
  </section>
  <!-- App Showcase Section-->
  <section class="app-showcase pb-big">
   <div class="container">
     <div class="row align-items-center">
      <div class="col-lg-6">
        <h2 class="mb-4">Easy-to-use interfaces on every platform</h2>
        <p class="lead">Since most of our features work in a completely automated way, you will mainly use our apps to discover new TV shows recommended for you and discuss the most interesting episodes with like-minded people.</p>
        <div class="row mt-5">
         <div class="col-lg-8">
           <div id="v-pills-tab" role="tablist" aria-orientation="vertical" class="nav flex-column nav-pills showcase-nav"><a id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true" class="nav-link active showcase-link"> <i class="icon ion-md-pie mr-4"></i>Customized Dashboard</a><a id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false" class="nav-link showcase-link"> <i class="icon ion-ios-moon mr-4"></i>Automatic Day &amp; Night Modes</a><a id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false" class="nav-link showcase-link"> <i class="icon ion-md-chatbubbles mr-4"></i>Integrated Chat Platform</a></div>
         </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div id="v-pills-tabContent" class="tab-content showcase-content">
         <div id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" class="tab-pane fade show active">
           <div class="showcase-image-holder">
            <div class="device-wrapper">
              <div data-device="iPhone7" data-orientation="portrait" data-color="black" class="device">
               <div class="screen"><img src="img/showcase-screen-1.jpg" alt="..." class="img-fluid"></div>
              </div>
            </div><img src="img/showcase-img-1.jpg" alt="..." class="showcase-image d-none d-lg-block">
           </div>
         </div>
         <div id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" class="tab-pane fade">
           <div class="showcase-image-holder">
            <div class="device-wrapper">
              <div data-device="iPhone7" data-orientation="portrait" data-color="black" class="device">
               <div class="screen"><img src="img/showcase-screen-2.jpg" alt="..." class="img-fluid"></div>
              </div>
            </div><img src="img/showcase-img-2.jpg" alt="..." class="showcase-image d-none d-lg-block">
           </div>
         </div>
         <div id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" class="tab-pane fade">
           <div class="showcase-image-holder">
            <div class="device-wrapper">
              <div data-device="iPhone7" data-orientation="portrait" data-color="black" class="device">
               <div class="screen"><img src="img/showcase-screen-3.jpg" alt="..." class="img-fluid"></div>
              </div>
            </div><img src="img/showcase-img-3.jpg" alt="..." class="showcase-image d-none d-lg-block">
           </div>
         </div>
        </div>
      </div>
     </div>
   </div>
  </section>
  <div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
  <!-- Testimonials Section-->
  <section class="testimonials bg-black">
   <div class="container">
     <div class="row">
      <div class="col-lg-6 section-padding">
        <div class="section-header pr-3"><span class="section-header-title text-white">Community</span>
         <h2 class="h1 text-white">We believe in the power of community</h2>
         <p class="lead text-white mt-4 mb-4">Our goal is to create a product and service that you’re satisfied with and use it every day. This is why we’re constantly working on our services to make it better every day and really listen to what our users has to say.</p><a href="#" class="btn btn-primary">Read more testimonials</a>
        </div>
      </div>
      <div class="col-lg-6 d-none d-lg-block">
        <div class="row feeds">
         <div class="col-lg-6">
           <div class="swiper-container testimonials-slider-1">
            <div class="swiper-wrapper">
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-1.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Patrick Martin</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">ShowTrackr is a real gem! I started using it a couple months ago and it completely changed the way how I watch TV shows. I can only recommend it!</p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-3.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Joseph Matthews</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">I use ShowTrackr every day, and it’s awesome! I track all of my TV shows in it. :) </p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-5.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Bruce Murphy</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">ShowTrackr is a real gem! I started using it a couple months ago and it completely changed the way how I watch TV shows. I can only recommend it!</p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-3.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Crystal Perkins</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">I use ShowTrackr every day, and it’s awesome! I track all of my TV shows in it. :) </p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-1.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Patrick Martin</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">ShowTrackr is a real gem! I started using it a couple months ago and it completely changed the way how I watch TV shows. I can only recommend it!</p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-4.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Bruce Murphy</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">I use ShowTrackr every day, and it’s awesome! I track all of my TV shows in it. :) </p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
            </div>
           </div>
         </div>
         <div class="col-lg-6">
           <div class="swiper-container testimonials-slider-1">
            <div class="swiper-wrapper">
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-5.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Thomas Cruz</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">I use ShowTrackr every day, and it’s awesome! I track all of my TV shows in it. :) </p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-1.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Patrick Martin</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">ShowTrackr is a real gem! I started using it a couple months ago and it completely changed the way how I watch TV shows. I can only recommend it!</p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-6.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Bruce Murphy</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">I use ShowTrackr every day, and it’s awesome! I track all of my TV shows in it. :) </p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-7.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Crystal Perkins</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">ShowTrackr is a real gem! I started using it a couple months ago and it completely changed the way how I watch TV shows. I can only recommend it!</p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-1.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Patrick Martin</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">I use ShowTrackr every day, and it’s awesome! I track all of my TV shows in it. :) </p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
               </div>
              </div>
              <!-- Feed slide-->
              <div class="swiper-slide"> 
               <!-- Feed block-->
               <div class="feed-block">
                 <div class="feed-header">
                  <div class="feed-user">
                    <div class="feed-user-avatar"><img src="img/testimonial-avatar-8.svg" alt="user" class="feed-user-image img-fluid"></div>
                    <div class="feed-user-name"><strong>Megan Walters</strong></div>
                  </div>
                  <div class="feed-icon"> <i class="icon ion-logo-twitter"></i></div>
                 </div>
                 <div class="feed-body">
                  <p class="feed-text">ShowTrackr is a real gem! I started using it a couple months ago and it completely changed the way how I watch TV shows. I can only recommend it!</p>
                 </div>
                 <div class="feed-date">Jan 18, 2018</div>
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
  <!-- Subscription Section-->
  <section class="subscription padding-big">
   <div class="container text-center">
     <div class="section-header">
      <div class="row">
        <div class="col-lg-8 mx-auto"><span class="section-header-title">Get Started</span>
         <h2 class="h1">Start tracking your TV shows for free </h2>
         <p class="lead">In order to start tracking your TV shows, all you have to do is enter your email address. Everything else will be taken care of by us. All you have to do is sit back, relax and enjoy your TV shows..</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-7 mx-auto">
         <!-- Subscription form-->
         <form action="#" class="subscription-form mt-5">
           <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" placeholder="your@email.com" class="form-control">
            <button type="submit" class="btn btn-primary">Start tracking</button>
           </div>
         </form>
        </div>
      </div>
     </div>
   </div>
  </section>
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

</body>
</html>
