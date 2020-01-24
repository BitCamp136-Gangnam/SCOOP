<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
<!-- Favicon icon -->
<!-- Pignose Calender -->
<link
   href="<c:url value="/resources/plugins/pg-calendar/css/pignose.calendar.min.css" />"
   rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet"
   href="<c:url value="/resources/plugins/chartist/css/chartist.min.css" />">
<link rel="stylesheet"
   href="<c:url value="/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css" />">
<!-- Custom Stylesheet -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
   
</script>

<style>
.newissue {
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
      <div class="content-body">

         <div class="container-fluid">
            <div class="card">
               <div class="row" style="margin: 2%">
                  <h3>새로운 소식</h3>
               </div>
               <div class="row" style="margin-left: 2%;">
                  <ul class="nav nav-pills">
                     <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">정렬</a>
                        <div class="dropdown-menu">
                           <a class="dropdown-item" data-toggle="tab" href="#">안읽음</a> <a
                              class="dropdown-item" data-toggle="tab" href="#">읽음</a>
                        </div></li>
                     <li class="nav-item"><a class="nav-link active"
                        data-toggle="tab" href="#">협업 진행률</a></li>
                     <li class="nav-item"><a class="nav-link active"
                        data-toggle="tab" href="#">이슈 업데이트</a></li>
                     <li class="nav-item"><a class="nav-link" data-toggle="tab"
                        href="#">@멘션</a></li>
                  </ul>
               </div>
               <hr style="margin-top: 0; margin-left: 2%; margin-right: 2%">
               <div class="row">
               <div class="col-sm-6" style="height:700px;background: #F3F3F9;margin: 2% 10px 2% 3%;padding-top:2%;padding-bottom: 2%;border-radius: 0.5rem;">
               호롷ㅇ로롷오홀호옿ㅇ로로로홀홀호롷롷롷롷로홇롷로호ㅗㅎㄹ홀호롷
               </div>
               <div class="col-sm-5" >
                <select id="selectDash" name="selectDash" class="form-control" style="margin-top: 7%;">
                  <option value="${sessionScope.email}">여기는 select공간</option>
                  <c:forEach items="${pjtlist}" var="p">
                           <option value="${p.tseq}">${p.pname}</option>
                  </c:forEach>
               </select>
               <div style="width:100%;height:640px;background: #F3F3F9;margin: 5% 0 5% 0;float: right;padding-top:2%;padding-bottom: 2%;border-radius: 0.5rem;">
                 	<canvas id="myChart"></canvas>
               </div>
               </div>
               </div>

            </div>
         </div>
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
   <script src="<c:url value="/resources/plugins/common/common.min.js" />"></script>
   <script src="<c:url value="/resources/js/custom.min.js" />"></script>
   <script src="<c:url value="/resources/js/settings.js" />"></script>
   <script src="<c:url value="/resources/js/gleek.js" />"></script>
   <script src="<c:url value="/resources/js/styleSwitcher.js" />"></script>

   <!-- Chartjs -->
   <script
      src="<c:url value="/resources/plugins/chart.js/Chart.bundle.min.js" />"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
   <!-- Circle progress -->
   <script
      src="<c:url value="/resources/plugins/circle-progress/circle-progress.min.js" />"></script>
   <!-- Datamap -->
   <script src="<c:url value="/resources/plugins/d3v3/index.js"/>"></script>
   <script
      src="<c:url value="/resources/plugins/topojson/topojson.min.js"/>"></script>
   <script
      src="<c:url value="/resources/plugins/datamaps/datamaps.world.min.js"/>"></script>
   <!-- Morrisjs -->
   <script
      src="<c:url value="/resources/plugins/raphael/raphael.min.js"/>"></script>
   <script src="<c:url value="/resources/plugins/morris/morris.min.js"/>"></script>
   <!-- Pignose Calender -->
   <script src="<c:url value="/resources/plugins/moment/moment.min.js"/>"></script>
   <script
      src="<c:url value="/resources/plugins/pg-calendar/js/pignose.calendar.min.js"/>"></script>
   <!-- ChartistJS -->
   <script
      src="<c:url value="/resources/plugins/chartist/js/chartist.min.js"/>"></script>
   <script
      src="<c:url value="/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"/>"></script>

   <script src="<c:url value="/resources/js/dashboard/dashboard-1.js"/>"></script>
   <script type="text/javascript">
		$('#selectDash').change(function(){
			let tseq = $(this).val();
			console.log(tseq);

			$.ajax({
				url: "selectChart.do",
				type: "POST",
				data: {"tseq" : tseq},
				success: function(data) {
					console.log(data);
				}
			})
		})
   </script>
	<script>
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx,
				{
					type : 'doughnut',
					data : {
						labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange' ],
						datasets : [ {
							label : '# of Votes',
							data : [ 12, 19, 3, 5, 2, 3 ],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
	</script>
</body>
</html>