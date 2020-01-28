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
    <!-- Pignose Calender -->
   <!-- Pignose Calender -->
    <link href="<c:url value="/resources/plugins/pg-calendar/css/pignose.calendar.min.css" />" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="<c:url value="/resources/plugins/chartist/css/chartist.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css" />">
    <!-- Custom Stylesheet -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
        <br>
            <div class="container-fluid">
        <div class="card" style="min-height: 1080px">
		<div class="row" style="margin: 2%">
				<h3>북마크</h3>
		</div>
		<hr style="margin-top: 0;margin-left: 2%; margin-right: 2%">
		<div class="row" style="margin-left: 2%; margin-right: 2%">
			<div class="row col-sm-12">
				<div class="col-sm-3 newissue"><b>협업 공간</b></div>
				<div class="col-sm-5 newissue"><b>글 제목</b></div>
				<div class="col-sm-3 newissue"><b>글쓴이</b></div>
				<div class="col-sm-1 newissue">취소</div>
			</div>
			
		</div>
		<c:forEach items="${bookMarkList}" var="blist">
		<div class="row" style="margin-left: 2%; margin-right: 2%">
			<div class="row col-sm-12" >
			<c:choose>
				<c:when test="${blist.tiseq != 0}">
					<div class="col-sm-3 newissue"><!-- <i class="fas fa-angle-double-right" id="" name=""></i> -->
						<a href="projectDetail.do?tseq=${blist.tseq}">${blist.pname}</a>
					</div>
					<div class="col-sm-5 newissue">
						<a href="teamissueDetail.do?tiseq=${blist.tiseq}">${blist.tititle}</a>
					</div>
					<div class="col-sm-3 newissue">
						${blist.tiname}
					</div>
					<div class="col-sm-1 newissue" style="padding-left: 25px;">
						<i class="fas fa-times bookmark" id="timark" name="${blist.tiseq}"></i>
					</div>
				</c:when>
				<c:when test="${blist.piseq != 0}">
					<div class="col-sm-3 newissue" >
						<a href="private.do">프라이빗 공간</a>
					</div>
					<div class="col-sm-5 newissue" >
						<a href="myissueDetail.do?piseq=${blist.piseq}">${blist.pititle}</a>
					</div>
					<div class="col-sm-3 newissue" >
						${blist.piname}
					</div>
					<div class="col-sm-1 newissue" style="padding-left: 25px;">
						<i class="fas fa-times bookmark" id="pimark" name="${blist.piseq}"></i>
					</div>
				</c:when>
			</c:choose>
			
			</div>
		</div>
		</c:forEach>
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
	/* 북마크 제거 */
	$(function(){
		$('.bookmark').click(function(){
			console.log('click fnc');
		 	let seq = $(this).attr('name');
			let id = $(this).attr('id');
			let tiseq; let piseq;
			console.log('seq : ' + seq + " / id : " + id);

			if(id == "timark"){
				console.log('if문 ti');
				tiseq = seq;
				piseq = -1;
			}else if(id == "pimark"){
				console.log('if문 pi');
				piseq = seq;
				tiseq = -1;
			}

			seq = {"tiseq":tiseq, "piseq":piseq};
			console.log("data : " + seq);
			console.log("data : " + seq.tiseq + " / piseq : " + seq.piseq);

			$.ajax({
				url : "delbook.do",
				type : "POST",
				data : seq,
				success : function(data){
					console.log('성공');
					Swal.fire({
			    		  title: "북마크 삭제",
			    		  text: "북마크 삭제",
			    		  icon: "success",
			    		  button: "확인"
			    	})
				},
				error : function(err){
					console.log('실패');
					Swal.fire({
			    		  title: "북마크 삭제 에러",
			    		  text: "북마크 삭제 실패",
			    		  icon: "info",
			    		  button: "확인"
			    	})
			    	location.reload();
				}
			});
		})
	});
</script>
</body>
</html>