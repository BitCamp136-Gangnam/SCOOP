<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		$('.bookmark').click(function(){
			let book = $(this);
			
			let icon = book.attr('class').split(' ');
			let status = book.attr('name');
			let piseq = book.closest('div.row').children('input[name]').val();

			let dat;
			let mark;
			
			$.ajax({
				url : "pibookmark.do",
				type : "POST",
				data : {"piseq" : piseq , 
						"status" : status
				       },
				success : function(datadata){
					mark = book.attr('class').split(' ');

					if(status == "bookoff"){
						book.removeAttr('name').attr('name', 'bookon');
						book.removeClass(mark[1]+" "+mark[2]).addClass("fas fa-bookmark");
					}else if(status == "bookon"){
						book.removeAttr("name").attr("name", "bookoff");
						book.removeClass(mark[1]+" "+mark[2]).addClass("far fa-bookmark");
					}
					Swal.fire({
			    		  title: "북마크 성공",
			    		  text: "북마크 성공",
			    		  icon: "success",
			    		  button: "확인"
			    		})

				},
				error : function(err){
					console.log('error' + err);
					Swal.fire({
			    		  title: "북마크 중 에러 발생",
			    		  text: "북마크 중 에러 발생",
			    		  icon: "error",
			    		  button: "확인"
			    		})
					return false;
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
			<div class="col-sm-12" style="padding-left: 0">
				<h3>프라이빗 공간</h3>
				나만을 위한 공간에서 아이디어를 마음껏 펼쳐 보세요. 특정 파트너에게 나의 이슈를 공유할 수도 있습니다.
			</div>
		</div>
		<div class="row" style="margin-left: 2%;">
			<ul class="nav nav-pills">
			    <li class="nav-item">
			      <a class="nav-link" href="private.do">프라이빗 이슈</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="calendar.do">캘린더</a>
			    </li>
		    </ul>
		</div>
		<hr style="margin-top: 0;margin-left: 2%; margin-right: 2%">
			<div class="row" style="margin-left: 2%; margin-right: 2%">
				<div class="col-sm-2 newissue" >
					제목
				</div>
				<div class="col-sm-7 newissue">
				내용
				</div>
				<div class="col-sm-2 newissue">
				날짜
				</div>
				<div class="col-sm-1 newissue">
				북마크
				</div>
			</div>
		<c:forEach items="${myissuelist}" var="m">
		<div class="row" style="margin-left: 2%; margin-right: 2%">
			<input type="hidden" name="piseq" value="${m.piseq}" /> 
			<div class="col-sm-2 newissue" >
				${m.pititle}
			</div>
			<div class="col-sm-7 newissue">
				${m.picontent}
			</div>
			<div class="col-sm-2 newissue">
				${m.pidate}
			</div>
			<c:set var="mark" value="true" />
			<c:set var="loop" value="false" />
			<c:forEach items="${bookMark}" var="book">
				<c:if test="${not loop}" />
				<c:if test="${m.piseq == book.piseq}">
					<c:set var="mark" value="false" />
					<c:set var="loop" value="true" />
				</c:if>
			</c:forEach>
				<c:choose>
					<c:when test="${mark}">
						<div class="col-sm-1 newissue">
							<i class="bookmark far fa-bookmark" id="bookmark" name="bookoff"></i>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-sm-1 newissue">
							<i class="bookmark fas fa-bookmark" id="bookmark" name="bookon"></i>
						</div>
					</c:otherwise>
				</c:choose>
			
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

</body>
</html>