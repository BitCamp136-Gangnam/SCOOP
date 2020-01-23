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
<script type="text/javascript">
  
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
        <div class="content-body">
       
            <div class="container-fluid">
        <div class="card">
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
              <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">정렬</a>
               <div class="dropdown-menu">
                 <a class="dropdown-item" data-toggle="tab" href="newTissue.do">새로운 팀이슈</a>
                 <a class="dropdown-item" data-toggle="tab" href="newReply.do">새로운 댓글</a>
                 <a class="dropdown-item" data-toggle="tab" href="newNotice.do">새로운 공지사항</a>
                 <a class="dropdown-item" data-toggle="tab" href="#">새로운 투표</a>
               </div>
             </li>
          </ul>
      </div>
      <hr style="margin-top: 0;margin-left: 2%; margin-right: 2%">
      <c:if test="${alarm !=null }">
      <c:forEach items="${alarm }" var="al">
      <div class="row" style="margin-left: 2%; margin-right: 2%" id="ialarm">
      
         <div class="col-sm-2 newissue" id="al">
         <c:choose>
         	<c:when test="${al.pnseq!=0 }">
         	<p>새로운 팀프로젝트 공지사항이 생성됐습니다.</p>
         	</c:when>
         	<c:when test="${al.replyseq!=0 }">
         	<p>새로운 댓글이 달렸습니다.</p>
         	</c:when>
         	<c:when test="${al.tiseq!=0 }">
         	<p>새로운 팀 이슈가 생성되었습니다.</p>
         	</c:when>
         	<c:when test="${al.vseq!=0 }">
         	<p>새로운 의사결정이 생성되었습니다.</p>
         	</c:when>
         </c:choose>
         </div>
         <div class="col-sm-8 newissue" id="ti">
         
         <c:choose>
         	<c:when test="${al.pnseq!=0 }">
         	<p>${al.pnatitle }</p>
         	</c:when>
         	<c:when test="${al.replyseq!=0 }">
         	<p>${al.ratitle }</p>
         	</c:when>
         	<c:when test="${al.tiseq!=0 }">
         	<p>${al.tiatitle }</p>
         	</c:when>
         	<c:when test="${al.vseq!=0 }">
         	<p>${al.vatitle }</p>
         	</c:when>
         </c:choose>
         </div>
         <div class="col-sm-2 newissue" id="day">
         여기에 시간넣으면됨
         <c:choose>
         	<c:when test="${al.pnseq!=0 }">
         	
         	</c:when>
         	<c:when test="${al.replyseq!=0 }">
         	
         	</c:when>
         	<c:when test="${al.tiseq!=0 }">
         	
         	</c:when>
         	<c:when test="${al.vseq!=0 }">
         	
         	</c:when>
         </c:choose>
         </div>
      </div>
      </c:forEach>
      </c:if>
      		<!-- <button id="load" >더 보기</button> -->
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
	<script type="text/javascript">
		$(function(){
			$("p").slice(0,10).show();
			$("#load").click(function(e){
				console.log(e);
				e.prevenDefault();
				$("p hidden").slice(0,10).show();
					if($("<p>").length == 0){
					alert("더 이상 글이 없습니다.");
						}
				
				});

			});
	</script>
</body>
</html>