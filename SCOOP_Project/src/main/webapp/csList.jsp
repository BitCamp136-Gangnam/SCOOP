<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
    <!-- Custom Stylesheet -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <!-- notice DataTables css-->
	<link rel="stylesheet"href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"type="text/css"/>
	<!-- notice DataTables css-->
	<link href="<c:url value="/resources/css/notice.datatables.css" />">
</head>
<script type="text/javascript" src="<c:url value="/resources/js/datatables.min.js" />"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
     $(document).ready(function(){
		$('#myTable').DataTable({
			/*language option*/
			"language": {
    	        "emptyTable": "데이터가 없습니다.",
    	        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
    	        "info": "현재 _START_ - _END_ / _TOTAL_건",
    	        "infoEmpty": "데이터 없음",
    	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
    	        "search": "검색: ",
    	        "zeroRecords": "일치하는 데이터가 없습니다.",
    	        "loadingRecords": "로딩중...",
    	        "processing": "잠시만 기다려 주세요",
    	        "paginate": {
    	            "next": "다음",
    	            "previous": "이전"
    	        }
    	    },
    	    "order": [[ 0, "desc" ]],
    	    "columnDefs": [
    	        {
        	      className: "dt-center", "targets": [1],
      	        }
    	      ]
			});	
	});

</script>
<body>
<jsp:include page="/WEB-INF/views/commons/preloader.jsp"></jsp:include>

<div id="main-wrapper">
	<jsp:include page="/WEB-INF/views/commons/headerAndLeft.jsp"></jsp:include>
	<div class="content-body">
	<div class="container-fluid">
	<div class="card">
	<div class="row" style="margin: 2%">
		<h3>CS(1:1) 문의 게시판</h3>
		<table id="myTable" class="dataTable display">
			<thead>
			<tr>
				<th class="notSeq" style="width: 10%">No</th>
				<th class="title" style="width: 60%">제목</th>
				<th class="regdate" style="width: 20%">작성일</th>
				<!-- <th class="count" style="width: 10%">조회수</th> -->
			</tr>
			</thead>
			<tbody>
			<%-- 
			<c:forEach items="${cslist}" var="cs" >
			<tr>
				<td class="notSeq">${n.notSeq}</td>
				<td class="title">
				  <a href="csDetail.do?csSeq=${cs.notSeq}">${cs.title}</a>
				</td>
				<td class="regdate">
				<fmt:formatDate value="${cs.regDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>				
			</tr>
			</c:forEach>
			 --%>
			 </tbody>
		</table>
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