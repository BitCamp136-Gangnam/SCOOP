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
              
          </ul>
          <select id="selectMenu" name="menu" class="nav-item" onchange="changeItem()">
                 <option value="#">이슈 업데이트</option>
                 <option value="0">새로운 팀이슈</option>
            	 <option value="1">새로운 댓글</option>	
            	 <option value="2">새로운 의사결정</option>
            	 <option value="3">새로운 공지사항</option>
          </select>
      </div>
      <hr style="margin-top: 0;margin-left: 2%; margin-right: 2%">
      <c:if test="${mypjtlist!=null }">
      <c:forEach items="${mypjtlist}" var="mpl">
      <c:if test="${myNewTissueList !=null }">
      <c:forEach items="${myNewTissueList }" var="mynewtissue">
      <c:if test="${myNewReplyList !=null }">
      <c:forEach items="${myNewReplyList }" var="mynewreply">
      <c:if test="${mpl.tseq==mynewtissue.tseq && mpl.tseq !=null && mynewreply.tiseq==mynewtissue.tiseq &&mynewreply.rdate > mpl.tpaddtime}">
      <div class="row" style="margin-left: 2%; margin-right: 2%" id="ialarm">
		 
         <div class="col-sm-2 newissue" id="al">
         
         <c:choose>
         	<c:when test="${mpl.tseq==mynewtissue.tseq && mpl.tseq !=null && mynewreply.tiseq==mynewtissue.tiseq &&mynewreply.rdate > mpl.tpaddtime}">
         	<p><a href="projectDetail.do?tseq=${mynewtissue.tseq }">${mpl.pname }</a></p>
         	</c:when>
         	
         </c:choose>
         </div>
         <div class="col-sm-8 newissue" id="ti">
         
         <c:choose>
         	<c:when test="${mpl.tseq==mynewtissue.tseq && mpl.tseq !=null && mynewreply.tiseq==mynewtissue.tiseq &&mynewreply.rdate > mpl.tpaddtime}">
         	<p><a href="teamissueDetail.do?tiseq=${mynewtissue.tiseq}">[${mynewtissue.tititle}]에 [${mynewreply.email }]님이 댓글을 남겼습니다.</a></p>
         	</c:when>
         	
         </c:choose>
         </div>
         <div class="col-sm-2 newissue" id="day">
         
         <c:choose>
         	<c:when test="${mpl.tseq==mynewtissue.tseq && mpl.tseq !=null && mynewreplylist.tiseq==mynewtissue.tiseq &&mynewreplylist.rdate > mpl.tpaddtime}">
         	<p>${fn:substring(mynewreplylist.rdate,0,16)}</p>
         	</c:when>
         	
         </c:choose>
         </div>
         
      </div>
      </c:if>
      </c:forEach>
      </c:if>
      </c:forEach>
      </c:if>
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
		var itemidSelect = document.getElementById('selectMenu');
		var itemId = itemidSelect.options[itemidSelect.selectedIndex].value;
		itemId=1;
		function changeItem(){
			  itemidSelect = document.getElementById('selectMenu');
			  itemId = itemidSelect.options[itemidSelect.selectedIndex].value;
			  console.log("itemid :"+itemId);
			  if(itemId==0){
				  location.href="newTissue.do";
			  } else if (itemId==1){
				  location.href="newReply.do";
			  } else if (itemId==2){
				  location.href="newVote.do";
			  } else if (itemId==3){
				  location.href="newNotice.do";
			  }
		  }
	</script>
</body>
</html>