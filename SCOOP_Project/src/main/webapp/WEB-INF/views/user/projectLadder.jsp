<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
     <!-- Pignose Calender -->
    <link href="<c:url value="/resources/plugins/pg-calendar/css/pignose.calendar.min.css" />" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="<c:url value="/resources/plugins/chartist/css/chartist.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css" />">
    <!-- Custom Stylesheet -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link rel="import" href="http://www.polymer-project.org/components/paper-ripple/paper-ripple.html">
     <link href="<c:url value="/resources/css/style_la.css" />" rel="stylesheet">
     <link href="<c:url value="/resources/css/meterial.css" />" rel="stylesheet">

</head>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
.newissue{
   border-bottom: 1px solid #c8c8c8;
   padding-top: 0.7%;
   padding-bottom: 0.7%;
}
</style>

<body style="line-height: 1;">
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
         <div class="col-sm-12" style="padding-left: 0">
            <h3>${tpj.pname}
            	<c:if test="${rank == 100}">
            	<span data-toggle="tooltip" data-placement="top" title="협업공간 관리" >
            	<i class="fas fa-cog" id="myModal_Edit_Icon" style="margin-left: 5px;cursor: pointer; font-size: 15px" data-toggle="modal" data-target="#myModal_Edit" ></i>
            	</span>
            	<span data-toggle="tooltip" data-placement="top" title="공지사항 관리" >
            	<span id="nowrite" class="iconify" data-icon="jam:write" style="font-size:20px;cursor: pointer;padding-bottom: 3px;" data-inline="false" data-toggle="modal" data-target="#pnoticewrite">
            	</span>
            	</span>
            	
            	</c:if>
            </h3>
            ${tpj.pcontent}
         </div>
      </div>
      <div class="row" style="margin-left: 2%;">
         <ul class="nav nav-pills">
             <li class="nav-item">
               <a class="nav-link" href="projectDetail.do?tseq=${tpj.tseq}">팀이슈</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="./private-cal.jsp">팀 캘린더</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="cooperation-kanban.do?tseq=${tpj.tseq}">칸반</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="projectNotice.do?tseq${tpj.tseq}">공지사항</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="projectladder.do?tseq=${tpj.tseq}">사다리 타기</a>
             </li>
          </ul>
      </div>
      <div class="landing" id="landing">
       <div class="start-form">
            <div class="landing-form">
                <div class="group">      
                  <input type="text" name="member" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <label>참여자 수</label>
                    <div  id="button" class="button raised green">
                      <div  class="center" fit>START</div>
                      <paper-ripple fit></paper-ripple>
                    </div>
                </div>
            </div>
       </div>
    </div>
    <div id="ladder" class="ladder">
        <div class="dim"></div>
         <canvas class="ladder_canvas" id="ladder_canvas"></canvas>
    </div>
      

            
      </div>
      		
            <!-- #/ container -->
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
    <script src="<c:url value="/resources/js/ladder.js"/>"></script>
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