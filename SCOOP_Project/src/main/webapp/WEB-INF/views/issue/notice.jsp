<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="role" value="${sessionScope.role}" />

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
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

</head>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->

<style>
.newissue{
	border-bottom: 1px solid #c8c8c8;
	padding-top: 0.7%;
	padding-bottom: 0.7%;
}
</style>
<script>

 var array = new Array();
 var bnseq = new Array();
 var bntitle = new Array();
 var bncontent = new Array();

 function roll(a) {
     //alert(a);
     var no = '<c:out value="${no}"/>';
     console.log(no);
     console.log(a);
     console.log(bnseq);
     console.log(bntitle);
     console.log(bncontent);
     console.log(bnseq[0]);
     var seq = 0;
     $.each(bnseq, function(i, elt) {

         
     	  if(elt == a){
         	console.log(elt);
         	console.log(a);
         	console.log(bntitle[i]);
         	console.log(bncontent[i]);

         	
         	$("#title").attr("value",bntitle[i]);
           $("#content").html(bncontent[i]);		
         	$("#ntitle").attr("value",bntitle[i]);
           $("#ncontent").html(bncontent[i]);
           $("#nseq").attr("value",a);		
           seq = a;
			var bnseq = a;
			console.log("b : " + bnseq);
			$("#del").click(function(){
				 $.ajax({
					    url:'noticeDelete.do', //request 보낼 서버의 경로
					    type:'post', // 메소드(get, post, put 등)
					    data:{
					    	'bnseq':bnseq
					    	}, //보낼 데이터
					    
					    success: function(data) {
					   	Swal.fire(
					  		  '게시물 삭제에 성공했습니다',
					  		  '게시물 삭제 성공',
					  		  'success'
					  		)
					  		window.setTimeout(function() {
					  		location.href='notice.do';	
					  		}, 1500);
					    		
					    },
					    error: function(err) {
					    	Swal.fire({
					    		  title: "변경 실패",
					    		  text: "변경 실패",
					    		  icon: "error",
					    		  button: "확인"
					    		})
					    }
					});
				})
			

           }                  
     });
     
   }
	
</script>
<body>
	<script type="text/javascript">
$(document).ready(function(){
	var temp = 0;
	var moreEventArray = document.querySelectorAll(".card > a > .row ");
	 $(moreEventArray).attr("hidden","hidden");
	 $(moreEventArray).slice(0,10).removeAttr("hidden");
	 $(moreEventArray).slice(0,10);
	 temp = 10;
	$("#load").click(function(e){
		console.log(moreEventArray);
		/* console.log($('.card'));
		console.log($('.card > a'));
		console.log($('.card > a > .row'));
		console.log($(".card > a > .row").val()); */
		console.log("if");
		$(moreEventArray).slice(temp,temp+10).removeAttr("hidden");
		 temp +=10;
		if(moreEventArray.length<temp+10){
			$(moreEventArray).slice(temp,10).removeAttr("hidden");


			}
		
			
	}); 

});
</script>	

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
		<c:set value="${notice}" var="no" />
		<c:forEach items="${notice}" var="n">
		<a href="#" id="${n.bnseq}" name="bnseq" data-target="#noticeDetail" data-toggle="modal" class="bnseq" onclick="roll(this.id)">
			<script>
			array.push("${n}");
			bnseq.push("${n.bnseq}");
			bntitle.push("${n.bntitle}");
			bncontent.push("${n.bncontent}");
			</script>
		<div class="row" style="margin-left: 2%; margin-right: 2%" id="row">
			<div class="col-sm-3 newissue">
			<c:choose>
           		<c:when test="${fn:length(n.bntitle) > 19}">	
            <c:out value="${fn:substring(n.bntitle,0,18)}"/>...
           </c:when>
           <c:otherwise>
           		<c:out value="${n.bntitle}"/>
           </c:otherwise> 
          </c:choose>
			</div>
			
			<div class="col-sm-7 newissue">
			<c:choose>
          <c:when test="${fn:length(n.bncontent) > 56}">
             <c:out value="${fn:substring(n.bncontent,0,55)}"/>...
           </c:when>
           <c:otherwise>
           		<c:out value="${n.bncontent}"/>
           </c:otherwise> 
          </c:choose>
			</div>
			<div class="col-sm-2 newissue">
			${fn:substring(n.bntime,0,16)}
			</div>
      </div>
			</a>
			</c:forEach>
			<button id="load">더 보기</button>
			</div>
		
            <!-- #/ container -->
            
            </div>
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
					<label for="bntitle">공지사항</label> 
					<input class="form-control createmodal" id="title" name="title" type="text"style="width: 100%;background-color: #eeeeee;border: 1px solid #fffcfc;border-radius:0.5rem;" readonly="readonly">
					<br> <label for="noticecontent">공지 설명</label>
					<textarea class="form-control createmodal" rows="5" style="width: 100%;background-color: #eeeeee;border: 1px solid #fffcfc;border-radius:0.5rem; resize: none" id="content" name="content" readonly="readonly" ></textarea>	
				<!-- Modal footer -->
				<div class="modal-footer">
				<c:choose>
						<c:when test="${role == 'ROLE_ADMIN'}">
					<button type="button" class="btn btn-secondary"
						style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
						data-target="#noticeEdit" data-toggle="modal">수정</button>
					<button type="button" class="btn btn-secondary" id="del"
						style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
						>삭제</button>
						</c:when>
						</c:choose>
						<button type="button" class="btn btn-secondary"
						style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
						data-dismiss="modal">닫기</button>
					</div>
					
					</div>
				</div>
		</div>
	</div>
	
  <div class="modal fade" id="noticeEdit">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">공지사항 작성</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
	
			<form action="noticeEdit.do" method="POST">
				<!-- Modal body -->
				<div class="modal-body">
				<input type="hidden" name="bnseq" id="nseq">
					<!-- <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p> -->
					<label for="bntitle">공지사항</label> <input
						class="form-control createmodal" type="text" id="ntitle"
						name="bntitle" style="width: 100%">
					<br> <label for="noticecontent">공지 설명</label>
					<textarea class="form-control createmodal" rows="5"
						id="ncontent" name="bncontent" style="width: 100%"
						></textarea>	
						<input type="hidden" name="email" value="${sessionScope.email}">		
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-secondary"
						style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">수정</button>
					<button type="button" class="btn btn-secondary"
						style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
						data-dismiss="modal">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
        
  <jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
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