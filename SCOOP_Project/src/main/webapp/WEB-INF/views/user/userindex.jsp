<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
    <!-- Favicon icon -->
    <!-- Pignose Calender -->
    <link href="<c:url value="/resources/plugins/pg-calendar/css/pignose.calendar.min.css" />" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="<c:url value="/resources/plugins/chartist/css/chartist.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css" />">
    <!-- Custom Stylesheet -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("UQIzvQsqqo7IfCBE1GH1", "http://localhost:8090/Scoop_Project/index.jsp");
  // 접근 토큰 값 출력
  console.log("토큰값 : "+ naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    console.log(naver_id_login.getProfileData('email'));
    console.log(naver_id_login.getProfileData('name'));
    $.ajax({
	    url:'naverLogin.do', //request 보낼 서버의 경로
	    type:'post', // 메소드(get, post, put 등)
	    data:{'email':naver_id_login.getProfileData('email'),
	    	'name':naver_id_login.getProfileData('name')
	    	}, //보낼 데이터
	    success: function(data) {
	    	Swal.fire({
	    		  title: "네이버 로그인 성공",
	    		  text: "WELCOME",
	    		  icon: "success",
	    		  button: "확인"
	    		})
	    	location.href="userindex.do";
	    },
	    error: function(err) {
	    	Swal.fire({
	    		  title: "네이버 로그인 실패",
	    		  text: "로그인 중 에러가 발생했습니다",
	    		  icon: "error",
	    		  button: "확인"
	    		})
	    }
	});
  }
</script>
<style>
.newissue{
   border-bottom: 1px solid #c8c8c8;
   padding-top: 0.7%;
   padding-bottom: 0.7%;
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
        <div class="content-body" style="min-height: 500px;">
       
            <div class="container-fluid">
        <div class="card" style="min-height: 590px">
      <div class="row" style="margin: 2%">
            <h3>새로운 소식</h3>
      </div>
      <div class="row" style="margin-left: 2%;">
         <ul class="nav nav-pills">
             <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">정렬</a>
               <div class="dropdown-menu">
                 <a class="dropdown-item" data-toggle="tab" href="#">안읽음</a>
                 <a class="dropdown-item" data-toggle="tab" href="#">읽음</a>
               </div>
             </li>
             <li class="nav-item">
               <a class="nav-link active" data-toggle="tab" href="#">이슈 업데이트</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" data-toggle="tab" href="#">@멘션</a>
             </li>
          </ul>
      </div>
      <hr style="margin-top: 0;margin-left: 2%; margin-right: 2%">
      <div class="row" style="margin-left: 2%; margin-right: 2%">
         <div class="col-sm-2 newissue" >
         이슈 제목 들어갈곳
         </div>
         <div class="col-sm-8 newissue">
         아이콘도 넣고 여기에 내용들어가는데 나중엔 append하면 될듯?? 정렬이랑 @멘션은 비동기로?
         </div>
         <div class="col-sm-2 newissue">
         여기에 시간넣으면됨
         </div>
      </div>
            <!-- #/ container -->
            </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
  
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="<c:url value="/resources/plugins/common/common.min.js" />"></script>
    <script src="<c:url value="/resources/js/custom.min.js" />"></script>
    <script src="<c:url value="/resources/js/settings.js" />"></script>
    <script src="<c:url value="/resources/js/gleek.js" />"></script>
    <script src="<c:url value="/resources/js/styleSwitcher.js" />"></script>

    <!-- Chartjs -->
    <script src="<c:url value="/resources/plugins/chart.js/Chart.bundle.min.js" />"></script>
    <!-- Circle progress -->
    <script src="<c:url value="/resources/plugins/circle-progress/circle-progress.min.js" />"></script>
    <!-- Datamap -->
    <script src="<c:url value="/resources/plugins/d3v3/index.js"/>"></script>
    <script src="<c:url value="/resources/plugins/topojson/topojson.min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/datamaps/datamaps.world.min.js"/>"></script>
    <!-- Morrisjs -->
    <script src="<c:url value="/resources/plugins/raphael/raphael.min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/morris/morris.min.js"/>"></script>
    <!-- Pignose Calender -->
    <script src="<c:url value="/resources/plugins/moment/moment.min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/pg-calendar/js/pignose.calendar.min.js"/>"></script>
    <!-- ChartistJS -->
    <script src="<c:url value="/resources/plugins/chartist/js/chartist.min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"/>"></script>

    <script src="<c:url value="/resources/js/dashboard/dashboard-1.js"/>"></script>

</body>
</html>