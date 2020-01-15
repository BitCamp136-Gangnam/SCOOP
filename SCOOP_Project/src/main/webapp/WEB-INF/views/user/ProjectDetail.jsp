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
<style>
.newissue{
   border-bottom: 1px solid #c8c8c8;
   padding-top: 0.7%;
   padding-bottom: 0.7%;
}
</style>
<script type="text/javascript">
$(function(){
   $('#myModal_Edit_Icon').mouseover(function(){
      $(this).attr("style","margin-left: 5px;cursor: pointer;color:#E71D36;");
   });
   $('#myModal_Edit_Icon').mouseout(function(){
      $(this).attr("style","margin-left: 5px;cursor: pointer;");
      });
   $('#admin_EditIcon').mouseover(function(){
      $(this).attr("style","cursor: pointer;font-size: 20px;color:#195ac2;");
   });
   $('#admin_EditIcon').mouseout(function(){
      $(this).attr("style","cursor: pointer;font-size: 20px;color:black;");
      });

   $('#c_InformationBtn').click(function(){
      $('#c_InformationBtn').attr("style","border:none; color: #E71D36;background-color: #fff;padding-left: 16px;padding-top: 16px;padding-right: 16px;");
      $('#c_ManagementBtn').attr("style","border:none; color: #000;background-color: #fff;");
      $('#c_Information').show();
      $('#c_Management').hide();
   });
   $('#c_ManagementBtn').click(function(){      
      $('#c_ManagementBtn').attr("style","border:none; color: #E71D36;background-color: #fff;");
      $('#c_InformationBtn').attr("style","border:none; color: #000;background-color: #fff;padding-left: 16px;padding-top: 16px;padding-right: 16px;");
      $('#c_Management').show();
      $('#c_Information').hide();
   });
   for(let i=0;i<$('.admin_EditIcon').length;i++){
	   $('#adminPlus'+i).click(function(){
		   console.log("admplus 포문")
	      $(this).hide();
	      $('#adminCancle'+i).show();
	      $('#iconAdd'+i).prepend('<i class="fas fa-user-cog" id="icon_First'+i+'" style="font-size: 20px;color:#195ac2;"></i>');
	   });
   }
   for(let i=0;i<$('.admCancle').length;i++){
	   $('#adminCancle'+i).click(function(){
		      $(this).hide();
		      $('#adminPlus'+i).show();
		      $('#icon_First'+i).remove();
		   });
   }
});

/* 프로젝트 이름 검색 - 도연 */
function project_filter() {
   var value, name, item, i;
   value = document.getElementById("searchId").value.toUpperCase();
   item = document.getElementsByClassName("search_NameEmail");
   for (i = 0; i < item.length; i++) {
      name = item[i].getElementsByClassName("finalsearch");
      console.log(name);
      if (name[0].innerText.toUpperCase().indexOf(value) > -1 || name[1].innerText.toUpperCase().indexOf(value) > -1) {
         item[i].style.display = "block";
      } else {
         item[i].style.display = "none";
      }
   }
}
</script>
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
         <div class="col-sm-12" style="padding-left: 0">
            <h3>${tpj.pname}
            <i class="fas fa-cog" id="myModal_Edit_Icon" style="margin-left: 5px;cursor: pointer;" data-toggle="modal" data-target="#myModal_Edit" >
            </i>
            </h3>
            ${tpj.pcontent }
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
          </ul>
      </div>
      <hr style="margin-top: 0;margin-left: 2%; margin-right: 2%">
      <div class="row" style="margin-left: 2%; margin-right: 2%">
         <div class="col-sm-2 newissue" >
         작성자
         </div>
         <div class="col-sm-8 newissue">
         제목 
         </div>
         <div class="col-sm-2 newissue">
         작성시간 
         </div>
      </div>
      <c:forEach items="${tp}" var="ti">
         <div class="row" style="margin-left: 2%; margin-right: 2%">
         <div class="col-sm-2 newissue" >
         ${ti.name }
         </div>
         <div class="col-sm-8 newissue">
         ${ti.tititle} 
         </div>
         <div class="col-sm-2 newissue">
         ${ti.tidate} 
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
        
<div class="modal fade" id="myModal_Edit">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h4 class="modal-title">협업공간 관리</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
            <div style="padding-left: 25px;">
            <button id="c_InformationBtn" style=" border:none; border:hidden; ; color: #E71D36;background-color: #fff;padding-left: 16px;padding-top: 16px;padding-right: 16px;"><i class="far fa-edit" style="padding-right: 5px;"></i>협업공간 정보</button>
            <button id="c_ManagementBtn" style="border:none; color: #000;background-color: #fff;" ><i class="fas fa-user-friends" style="padding-right: 5px;"></i>멤버 관리</button>
            </div>

         <!-- Modal body -->
         <form action="" method="post">
            <div class="modal-body" style="width: 450px;height: 250px;margin-left: 25px;">
               <div  id="c_Information">
               <label for="pname_Edit">협업공간 이름</label> 
               <input class="form-control createmodal" type="text" id="pname_Edit" name="pname_Edit" style="width: 100%" value="${tpj.pname}"> <br> 
                  <label for="pcontent_Edit">협업공간 설명</label>
               <textarea class="form-control createmodal" rows="3" id="pcontent_Edit"name="pcontent_Edit" style="width: 100%">${tpj.pcontent }</textarea>
               </div>

               <div id="c_Management" class="nav-label" style="display: none;padding-left: 0px;padding-right: 0px;">
               <input onkeyup="project_filter()" type="search" id="searchId" class="form-control" style="border-radius: 0.25rem; height: 20px;margin-bottom: 15px;width: 400px;margin-left: 10px;" placeholder="이름  또는 이메일 주소로 멤버 검색">
                  <div class="row">
                  <c:forEach items="${projectmember}" var="pm" varStatus="status">
                     <div class="search_NameEmail col-sm-6">
                        <span class="nav-text finalsearch" id="member_Name${status.index}" style="color: #4d4d46;font-size: 13px;padding-bottom:5px;padding-top: 10px;"> &nbsp;${pm.name}</span>
                        <span class="log-user" id="iconAdd${status.index}" data-toggle="dropdown" style="float: right;top: 0px;padding-top: 10px;">
                        <c:choose>
                        	<c:when test="${pm.pjuserrank==100}"><i class="fas fa-user-cog" id="icon_First${status.index}" style="font-size: 20px;color:#195ac2;"></i></c:when>
                        	<c:when test="${pm.pjuserrank==200}">매니저</c:when>
                        </c:choose>
                           <i class="fas fa-cog admin_EditIcon" id="admin_EditIcon${status.index}" style="cursor: pointer;font-size: 20px;color:black;"></i>
                        </span>
                        <div class="drop-down dropdown-language animated fadeIn  dropdown-menu"  >
                        <div class="dropdown-content-body">
                        <ul style="margin-bottom: 0px; padding-bottom: 0px;padding-top: 0px;">
                           <li id="adminPlus${status.index}" class="admPlus">관리자로 설정</li>
                           <li id="adminCancle${status.index}" class="admCancle" style="display: none;">관리자 권한 해제</li>
                           <li>멤버 탈퇴</li>
                        </ul> 
                        </div>
                        </div>
                        
                        <span class="nav-text finalsearch" id="member_Email${status.index}" style="padding-bottom: 1%; padding-top:5px; font-weight: normal;"> &nbsp;${pm.email}</span>
                        
                     </div>
                  </c:forEach>
               </div>
               </div>
            </div>

            <!-- Modal footer -->

            <!-- <input type="hidden" name="tseq" value="1"> -->
            <!-- <input type="hidden" name="ischarge" value="0"> -->
            <input type="hidden" name="email" value="${sessionScope.email}">
            <!-- <input type="hidden" name="istpalarm" value="0"> -->
            <!-- <input type="hidden" name="ptime" value="20/01/08"> -->
            <div class="modal-footer" id="c_InformationSubmit">
               <input type="submit" class="btn btn-secondary" value="수정 완료"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">
               <input type="button" class="btn btn-secondary" value="취소"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
                  data-dismiss="modal">
            </div>
         </form>
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