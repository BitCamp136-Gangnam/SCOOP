<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">

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
	$(function(){
		$('#myissueCommentBtn').click(function(){
			console.log("들어오니");
			$.ajax({
				type:"POST",
				url:"teamComment.do",
				data:{
					rcontent: $("#teamComment").val(),
					email: ${sessionScope.email}
				},
				success:function(data){
					alert(data);
				},
				error:function(error){
					alert(error);
				}
					
			});
		});
	});
</script>
<style>
.newissue{
	border-bottom: 1px solid #c8c8c8;
	padding-top: 0.7%;
	padding-bottom: 0.7%;
}
.myissueDetail{
	font-size: 15px;
	margin-left: 3%;
	margin-bottom:1%;
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
        <div class="content-body"style="height: 680px;">
        <div class="container-fluid row" style="padding-right: 0px; margin-right: 0px;margin-left: 0px; padding-left: 15px;">
        <div class="card" style="padding-left: 2%;padding-right: 0px; padding-top:1%;min-width:900px;height: auto;overflow: auto;">
		<div class="row"style="margin:2% 2% 0 2%" >
				<h3 id="myissueSubject" style="padding-top: 2%;padding-left: 1%;">${myissue.pititle}</h3>
		</div>
		<c:choose>
        <c:when test="${myissue.pistart!=null}">
		<div class="myissueDetail" id="myissueDate" style="font-size: 15px;margin-left: 3%;margin-bottom:2%;"><i class="far fa-calendar-check"style="margin-right:1%;color:#abb335;"></i>${fn:substring(myissue.pistart,0,10)} ~ ${fn:substring(myissue.piend,0,10)}</div>
		</c:when>
		<c:otherwise>
		<div class="myissueDetail" id="myissueDate" style="font-size: 15px;margin-left: 3%;margin-bottom:2%;"><i class="far fa-calendar-check"style="margin-right:1%;color:#abb335;"></i>등록된 일정이 없습니다.</div>
		</c:otherwise>
		</c:choose>
		<c:forEach items="${mymentions}" var="m">
		<div class="myissueDetail" id="myissueMention">
		<sup><i class="fas fa-quote-left" style="color:#ca0000; font-size: 7px"></i></sup> @${m.name} <sup><i class="fas fa-quote-right"style="color:#ca0000;font-size: 7px"></i></sup>
		<br>
		</div>
		</c:forEach>
		<c:forEach items="${mygdrive}" var="gd">
		<div class="myissueDetail" id="myissueGoogledrive">
			<i class="fab fa-google-drive"></i>
			<a href="${gd.pgurl}" onclick="window.open(this.href,'팝업창','width=800, height=800');return false;">${gd.pgfilename}</a>
			<br>
		</div>
			</c:forEach>
			<c:forEach items="${mydowork}" var="work">
		<div class="myissueDetail" id="myissueTodo">
		<i class="far fa-check-circle"style="padding-right: 5px;"></i>${work.fromname}
		<i class="fas fa-long-arrow-alt-right" style="margin-left:5px;margin-right: 5px;"></i>${work.toname}<br>
		: ${work.pdowork}
		<br>
		</div>
		</c:forEach> 
        <div class="myissueDetail">
        ${myissue.picontent}
        </div>    
            <!-- #/ container -->
            </div> 
            <div class="card" style="float:right;background-color: #fff;margin-left:10px;padding-left: 0px;padding-right: 0px;width:400px;">
            <div class="card" style="min-height:430px;padding-left: 3%;padding-top: 5%;padding-right: 3%;padding-bottom: 5%;overflow: auto;">
            
            <div class="row" style="margin-left: 3%;margin-right: 3%;">
            <div class="col-sm-1" style="margin-top: 10px;margin-right:10px;padding-left:0;">
            <img id="memberImage" class="img-circle" alt="멤버 프로필 사진 넣는 곳" src="resources/images/avatar/avatar.png" style="width:40px;height: auto;padding-top: 1%;margin-left: 10px;margin-right: 10px;">
            </div>
            <div class="col-sm-10">
            <div id="commentMain" style="margin: 3% 5% 3% 5%;" >
            <div style="margin-bottom: 1%;">
            <span>도연(이름)</span><span style="padding-left:3%"><i class="far fa-clock" style="color:#E71D36 "></i>오후 16:03(시간)</span>
            <br>
            <div>보쌈 먹고 시퍼요(댓글 내용)</div>
            </div>
            </div>
            </div>
            
            
            
            <img src="resources/images/logo/ScoopTitle.png" style="width:150px;height: auto;opacity:0.3;position:absolute;top:25%;left: 32%;">
            </div>
            </div>
            <textarea id="myissueComment" rows="5" placeholder="말하지 않아도 아는것은 초코파이뿐입니다                        댓글 입력 후 저장을 클릭해주세요" style="resize: none;height:180px;width:auto;border: 1px solid #c8c8c8;border-radius: 0.5rem;margin-left: 15px;margin-bottom: 20px;margin-right: 15px;overflow:auto;padding: 4%"></textarea>
            <input id="myissueCommentBtn" type="button" value="저장" style="width: 90px;border-radius:0.5rem ;padding-top:7px;padding-bottom:7px; background-color: #E71D36;color: #fff; cursor: pointer;position: absolute;top:590px;left: 290px;">
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

</body>
</html>