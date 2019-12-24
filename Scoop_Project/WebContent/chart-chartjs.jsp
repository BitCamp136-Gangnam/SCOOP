<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

</head>

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

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Team</h4>
                                <canvas id="canvas" width="500" height="250"></canvas>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Team</h4>
                                <canvas id="team-chart" width="500" height="250"></canvas>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    
                </div>
                <!-- /# row -->
                <div class="row">
                    <!-- Bar Chart -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Bar chart</h4>
                                <canvas id="barChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Sales</h4>
                                <canvas id="sales-chart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <!-- Line Chart -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Line chart</h4>
                                <canvas id="lineChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- Pie Chart -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Pie chart</h4>
                                <canvas id="pieChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- Radar Chart -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Rader chart</h4>
                                <canvas id="radarChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                        <!-- Doughnut Chart -->
                        <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Doughut chart</h4>
                                <canvas id="doughutChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    
                    <!-- Polar Chart -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Polar chart</h4>
                                <canvas id="polarChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- Single Bar Chart -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Single Bar Chart</h4>
                                <canvas id="singelBarChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
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
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>

    <script src="./plugins/chart.js/Chart.bundle.min.js"></script>
    <script src="./js/plugins-init/chartjs-init.js"></script>

</body>

</html>