<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Scoop</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Pignose Calender -->
    <link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

</head>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
.newissue{
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
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
        <div class="content-body">
		<div class="row" style="margin: 2%">
			<div class="col-sm-6">
				<h3>새로운 소식</h3>
			</div>
			<div class="col-sm-6" align="right">
				<input type="button" value="이슈작성" class="btn btn-outline-secondary" style="background-color: #fff5a5; border-color: #7393a7">
			</div>
			<br>
		</div>
		<div class="row" style="margin: 2%">
			<ul class="nav nav-pills">
			    <li class="nav-item">
			      <a class="nav-link" href="#">이슈 업데이트</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#">@멘션</a>
			    </li>
			    <li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">정렬</a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="#">안읽음</a>
			        <a class="dropdown-item" href="#">읽음</a>
			      </div>
			    </li>
		    </ul>
		</div>
		<div class="row" style="margin-left: 2%">
			<div class="col-sm-2 newissue" >
			이슈 제목 들어갈곳
			</div>
			<div class="col-sm-8 newissue">
			여기에 내용들어가는데 나중엔 append하면 될듯??
			</div>
			<div class="col-sm-2 newissue">
			여기에 시간넣으면됨
			</div>
		</div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
  <jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>

    <!-- Chartjs -->
    <script src="./plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="./plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="./plugins/d3v3/index.js"></script>
    <script src="./plugins/topojson/topojson.min.js"></script>
    <script src="./plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="./plugins/raphael/raphael.min.js"></script>
    <script src="./plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="./plugins/moment/moment.min.js"></script>
    <script src="./plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="./plugins/chartist/js/chartist.min.js"></script>
    <script src="./plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



    <script src="./js/dashboard/dashboard-1.js"></script>

</body>
</html>