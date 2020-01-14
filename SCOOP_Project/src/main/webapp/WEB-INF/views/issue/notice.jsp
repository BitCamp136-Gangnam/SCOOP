<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

</head>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
var n = ${n};
console.log(n);
var sum = 0;
var director = new Array();
var title = new Array();
var image = new Array();
var pubdate = new Array();
function roll(a) {
                  //alert(a);
                  console.log(n);
                  		$('#bntitle').attr('value',${n.bntitle});
                       /*  $('#director').attr('value',${n.bntime}); */
                        $('#bncontent').attr('value',${n.bncontent});
                  
                  console.log(a);
                  
         
                   /* if(image[a]==""|| image[a]==null){
                      
                       $('#release').attr( 'value', pubdate[a]);
                   } else{
                   $('#image').attr('src',image[a]);
                    $('#director').attr('value',director[a]);
                    $('#title').attr('value',title[a]);
                   $('#release').attr( 'value', pubdate[a]);
                   } */
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
	<script>var n = "<c:out value='${n}'/></script>

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
				<h3>공지사항</h3>
				스쿱의 새로운 소식을 전해드립니다.
			</div>
		</div>
		<c:forEach items="${notice}" var="n">
		<a href="#" id="${n.bnseq}" name="bnseq" data-target="#noticeDetail" data-toggle="modal" class="bnseq" onclick="roll(this.id)">
		<div class="row" style="margin-left: 2%; margin-right: 2%">
			<div class="col-sm-3 newissue" >
			<c:choose>
           		<c:when test="${fn:length(n.bntitle) > 19}">	
            <c:out value="${fn:substring(n.bntitle,0,18)}"/>...
           </c:when>
           <c:otherwise>
           		 <c:out value="${n.bntitle}"/>
           </c:otherwise> 
          </c:choose>
			</div>
			<div class="col-sm-8 newissue" >
			<c:choose>
           <c:when test="${fn:length(n.bncontent) > 56}">
            <c:out value="${fn:substring(n.bncontent,0,55)}"/>...
           </c:when>
           <c:otherwise>
           		 <c:out value="${n.bncontent}"/>
           </c:otherwise> 
          </c:choose>
			</div>
      
			<div class="col-sm-1 newissue">
			${n.bntime}
			</div>
		</div>
			</a>
			</c:forEach>
			</div>
            <!-- #/ container -->
            
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
  <div class="modal fade" id="noticeDetail">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">공지사항</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
	
				<!-- Modal body -->
				<div class="modal-body">
					<!-- <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p> -->
					<label for="bntitle">공지사항</label> <input
						class="form-control createmodal" id="bntitle"type="text"style="width: 100%" readonly="readonly" value="${n.bntitle}">
					<br> <label for="noticecontent">공지 설명</label>
					<textarea class="form-control createmodal" rows="5" style="width: 100%"
						 readonly="readonly" id="bncontent">${n.bncontent}</textarea>	
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
						data-dismiss="modal">취소</button>
					</div>
				</div>
		</div>
	</div>
	</div>
        
        
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

</body>
</html>