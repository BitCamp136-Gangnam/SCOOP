<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="47797892299-i06tt9qhbs15g8mn89ncu1isa1eneql8.apps.googleusercontent.com">
    <jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
    <link href="css/style.css" rel="stylesheet">
    
</head>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<body class="h-100">
    
    <jsp:include page="/WEB-INF/views/commons/preloader.jsp"></jsp:include>

    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <div>
                                	<a class="" href="index.jsp">
                                		<img class="img-responsive center-block"alt="Scoop로고" src="images/logo/scooplogo.png" style="padding-right:15%;padding-left:15%;"/>
                                	</a>
                                </div>
                                <form class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="email" class="form-control" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="Password">
                                    </div>
                                    <button class="btn login-form__btn submit w-100">Sign In</button>
                                </form>
                                
                                   <!-- 네이버아이디로로그인 버튼 노출 영역 -->
								  <div id="naver_id_login"></div>
								  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
								  <script type="text/javascript">
								  	var naver_id_login = new naver_id_login("UQIzvQsqqo7IfCBE1GH1", "http://localhost:8090/Scoop_Project/index.jsp");
								  	var state = naver_id_login.getUniqState();
								  	naver_id_login.setButton("white", 2,40);
								  	naver_id_login.setDomain("http://localhost:8090/");
								  	naver_id_login.setState(state);
								  	naver_id_login.setPopup();
								  	naver_id_login.init_naver_id_login();
								  </script>
								  <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
								  <script>
							      function onSignIn(googleUser) {
							        // Useful data for your client-side scripts:
							        var profile = googleUser.getBasicProfile();
							        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
							        console.log('Full Name: ' + profile.getName());
							        console.log('Given Name: ' + profile.getGivenName());
							        console.log('Family Name: ' + profile.getFamilyName());
							        console.log("Image URL: " + profile.getImageUrl());
							        console.log("Email: " + profile.getEmail());
							
							        // The ID token you need to pass to your backend:
							        var id_token = googleUser.getAuthResponse().id_token;
							        console.log("ID Token: " + id_token);
							        //location.href="http://localhost:8090/Scoop_Project/index.jsp";
							      }
							    </script>
                                <p class="mt-5 login-form__footer">Dont have account? <a href="page-register.jsp" class="text-primary">Sign Up</a> now</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>
</body>
</html>




