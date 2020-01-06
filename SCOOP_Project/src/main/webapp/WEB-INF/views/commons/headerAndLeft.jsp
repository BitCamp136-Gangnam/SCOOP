<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/lib/codemirror.css" />">
    <script src="<c:url value="/resources/lib/codemirror.js" />"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <%-- <link rel="stylesheet" href="<c:url value="/resources/demos/style.css" />"> --%>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  <script type="text/javascript">
        $(function(){ 
           $('.modal').on('hidden.bs.modal', function (e) {
               console.log('modal close');
               $('#memlist').hide();
               $('.CodeMirror').hide();
               $('#filename').empty();
               $('#imgpreview').hide();
               $('#issuecontent').show();
               $('#todo').hide();
               $('#todomem').empty();
               $('#todolist').empty();
               $('#todoresult').hide();
               $('#todoresult').empty();
               $('#datepick').hide();
               $('#from').empty();
               $('#to').empty();
             $(this).find('form')[0].reset()
           });
            $('#fileopen').click(function(){
               $('#filediv').show();
               $('#fileclose').show();
               $('#fileclose').attr('name','on');
               $('#pagelogo').attr('style','opacity:0.5');
               $('#scnav').attr('style','opacity:0.5');
               $('.content-body').attr('style','opacity:0.5');
               $('.header').attr('style','opacity:0.5');
               $('#helpopen').hide();
               $('#filediv2').show();
            });
            $('#fileclose').click(function(){
            $('#filediv').hide();
            $('#fileclose').hide();
            $('#pagelogo').attr('style','opacity:1');
               $('#scnav').attr('style','opacity:1');
               $('.content-body').attr('style','opacity:1');
               $('.header').attr('style','opacity:1');
               $('#helpopen').show();
               $('#filediv2').hide();
            });
            $('#filediv2').click(function(){
            $('#filediv').hide();
            $('#fileclose').hide();
            $('#pagelogo').attr('style','opacity:1');
               $('#scnav').attr('style','opacity:1');
               $('.content-body').attr('style','opacity:1');
               $('.header').attr('style','opacity:1');
               $('#helpopen').show();
               $('#filediv2').hide();
                });
              $(document).keydown(function(event) {
              if (event.ctrlKey && event.keyCode==190) {
                 if($('.fileon').attr('class')=='fileon'){
                       $('#filediv').attr('class','fileoff');
                       $('#filediv').show();
                         $('#fileclose').show();
                         $('#fileclose').attr('name','on');
                         $('#pagelogo').attr('style','opacity:0.5');
                         $('#scnav').attr('style','opacity:0.5');
                         $('.content-body').attr('style','opacity:0.5');
                         $('.header').attr('style','opacity:0.5');
                         $('#helpopen').hide();
                         $('#filediv2').show();
                    }else{
                       $('#filediv').attr('class','fileon');
                       $('#filediv').hide();
                      $('#fileclose').hide();
                      $('#pagelogo').attr('style','opacity:1');
                         $('#scnav').attr('style','opacity:1');
                         $('.content-body').attr('style','opacity:1');
                         $('.header').attr('style','opacity:1');
                         $('#helpopen').show();
                         $('#filediv2').hide();
                       }
              }
            });  
     
      $('#alarmbtn').click(function(event){
         event.stopPropagation();
         if($('#alarmbox').attr('name')=='on'){
            $('#alarmbox').attr('name','off');
         $('#alarm_power').text('OFF');
            }else{
               $('#alarmbox').attr('name','on');
               $('#alarm_power').text('ON');
               }
         
         });
});
</script>
  
<style>
  #filediv {
        position: fixed;
        bottom: 0;
        right: 0;
        font-size: 18px;
        z-index: 2;
        width: 84.6%;
        height: 100%;
      }
  #filediv2 {
        position: fixed;
        bottom: 0;
        right: left;
        font-size: 18px;
        z-index: 2;
        width: 15.4%;
        height: 100%;
        background-color: black;
        opacity: 0.5;
      }
  #fileclose {
        position: fixed;
        bottom: 95%;
        left: 1%;
        font-size: 18px;
        z-index: 3;
      }

/* The switch - the box around the slider */
.switch_alarm {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch_alarm input {display:none;}

/* The slider */
.slider_alarm {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider_alarm:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider_alarm {
  background-color: #00D63D;
}

input:focus + .slider_alarm {
  box-shadow: 0 0 1px #00D63D;
}

input:checked + .slider_alarm:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider_alarm.round_alarm {
  border-radius: 34px;
}

.slider_alarm.round_alarm:before {
  border-radius: 50%;
}

span{
   margin:0px;
   display:inline-block;
   font-size:15px;
   font-weight:bold;
}
</style>

<!--**********************************
            Nav header start
        ***********************************-->
        <div id="pagelogo" class="nav-header">
            <div class="brand-logo">
                <a href="index.htm" style="padding-top: 0px;">
                    <b class="logo-abbr"><img class="img-responsive center-block" src="<c:url value="/resources/images/logo/ScoopTitle.png" />" alt="mini" style="width:100px;height: auto;padding-top:0;margin-top: 30px; "> </b>
                    <span class="logo-compact"><img class="img-responsive center-block"src="<c:url value="/resources/images/logo/ScoopBig.png" />" alt="" style="margin-top: 20px; text-align: center;"></span>
                    <span class="brand-title">
                        <img class="img-responsive center-block" src="<c:url value="/resources/images/logo/ScoopBig.png" />" alt="" style="margin-top: 3%;">
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <input type="search" class="form-control" placeholder="검색하세요" aria-label="Search">
                        <input type="button" class="form-control" style="background-color: #E71D36; border-color: #CCCCCC; margin-left: 2%; color: #fff; cursor: pointer;" value="이슈 작성" data-toggle="modal" data-target="#makeissue">
                        <div class="drop-down animated flipInX d-md-none">
                            <form action="#">
                                <input type="text" class="form-control" placeholder="Search">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-bell-outline"></i>
                                <span class="badge badge-pill gradient-2">0</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                <div class="dropdown-content-body">
                                    <ul>
                                       <li>
                                             <p style="display:inline-block; padding-right: 33%">전체 알람 설정 </p>
                                             <label class="switch_alarm">
                                         <input type="checkbox" checked="checked" id="alarmbox" name="on">
                                         <span class="slider_alarm round_alarm" id="alarmbtn"></span>
                                       </label>
                                       <span id="alarm_power">ON</span>
                                       
                                       </li>
                                       
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">무슨 알림인지</h6>
                                                    <span class="notification-text">알림 몇분전에 왔는지</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Event Started</h6>
                                                    <span class="notification-text">One hour ago</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Event Ended Successfully</h6>
                                                    <span class="notification-text">One hour ago</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Events to Join</h6>
                                                    <span class="notification-text">After two days</span> 
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown d-none d-md-flex">
                            <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                <span>한국어</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                            </a>
                            <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a href="javascript:void()">한국어</a></li>
                                        <li><a href="javascript:void()">English</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="<c:url value="/resources/images/avatar/avatar.png" />" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.jsp"><i class="icon-user"></i> <span>내 정보</span></a>
                                        </li>
                                        <li>
                                            <a href="#" id="fileopen"><span class="iconify" data-icon="ion:folder-open-outline" data-inline="false" style="font-size: 15px"></span> <span> &nbsp;&nbsp;파일함</span></a>
                                        </li>
                                        <hr class="my-2">
                                        <li>
                                            <a href="page-lock.jsp"><i class="icon-lock"></i> <span>잠금모드</span></a>
                                        </li>
                                        <c:choose>
                                        	<c:when test="${kind==normal}">
                                        		<li><a href="logout.do"><i class="icon-key"></i> <span>로그아웃</span></a></li>	
                                        	</c:when>
                                        	<c:when test="${kind==google}">
                                        		<li><a href="#" onclick="signOut();"><i class="icon-key"></i> <span>로그아웃</span></a></li>	
                                        	</c:when>
                                        	<c:when test="${kind==naver}">
                                        		<li><a href="#" onclick="signOut();"><i class="icon-key"></i> <span>로그아웃</span></a></li>	
                                        	</c:when>
                                        	<c:otherwise></c:otherwise>
                                        </c:choose>
                                        
                                        <li>
                                        <%=session.getAttribute("email")%>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <<c:set var="kind" value="${session.kind}}"></c:set>
        <div class="nk-sidebar" style="z-index: 0">           
            <div id="scnav" class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                   <li class="nav-label" style="padding-bottom: 10px;" ><b style="padding-bottom: 2%;">전체 정보</b></li>
                    <li>
                        <a href="index.htm" aria-expanded="false">
                            <span class="iconify" data-icon="bx:bx-file-blank" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;새로운 소식</span>
                            <!-- <i class="icon-speedometer menu-icon"> -->
                        </a>
                    </li>
                    <li>
                        <a href="myissue.htm" aria-expanded="false">
                            <span class="iconify" data-icon="simple-line-icons:emotsmile" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;내가 작성한 이슈</span>
                        </a>
                    </li>
                    <li>
                        <a href="calender.htm" aria-expanded="false">
                            <span class="iconify" data-icon="bx:bx-calendar" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;캘린더</span>
                        </a>
                    </li>
                    <li class="nav-label" style="padding-bottom: 0"><b>개인 공간</b></li>
                    <li>
                        <a href="private.do" aria-expanded="false" >
                            <span class="iconify" data-icon="ic:baseline-person" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;프라이빗 공간</span>
                        </a>
                    </li>
                    <li>
                        <a href="bookmark.htm" aria-expanded="false">
                            <span class="iconify" data-icon="ic:round-bookmark" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;북마크</span>
                        </a>
                    </li>
                    <li class="nav-label" style="padding-bottom: 0"><b>협업 공간</b></li>
                    <li class="nav-label"><button type="button" class="btn" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" data-toggle="modal" data-target="#myModal"><i class="icon-note menu-icon"></i> 새 협업공간 만들기</button></li>
                    <li class="nav-label" style="padding-top: 0"><input type="search" class="form-control" style="border-radius: 0.25rem; height: 20px" placeholder="협업공간 검색"></li>
                    <li>
                        <a href="coop-issue.htm" aria-expanded="false">
                            <span class="iconify" data-icon="bx:bxs-flag-alt" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;쫀쬬니(append로..)</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
        <!-- 
              협업공간 만들기 모달 생성
         -->
 <style>
 .createmodal{
 border: 1px solid #c8c8c8;
 background-color: white;
}
</style>

           <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title">새 협업공간 만들기</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form action="">
        <!-- Modal body -->
        <div class="modal-body">
        <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p>
          <label for="title">협업공간 이름</label>
          <input class="form-control createmodal" type="text" id="title" style="width: 100%">
          <br>
          <label for="content">협업공간 설명</label>
          <textarea class="form-control createmodal" rows="3" id="content" style="width: 100%"></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" data-dismiss="modal">만들기</button>
          <button type="button" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" data-dismiss="modal">취소</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <div id="filediv" class="fileon" style="display: none;background-color: white;">
     <div class="row"  style="margin: 2%;">
        <div class="col-sm-12">
           <h3>파일함(Ctrl + .)</h3>
           <h6>어디서든 Drag & Drop으로 파일을 업로드할 수 있습니다.</h6>
        </div>
     </div>
     <div class="row" style="margin: 2%;">
         <ul class="nav nav-pills">
             <li class="nav-item">
               <a class="nav-link" href="#">내 파일</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="#">전체 파일</a>
             </li>
             <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">프로젝트</a>
               <div class="dropdown-menu">
                 <a class="dropdown-item" href="#">쫀쬬니</a>
                 <a class="dropdown-item" href="#">스쿱</a>
               </div>
             </li>
             <li class="nav-item">
             <input type="search" class="form-control" style="border-radius: 0.25rem; height: 20px" placeholder="파일 검색">
             </li>
          </ul>
   </div>
   <div class="row" style="margin: 2%; overflow: auto; height: 600px">
      <div style="width: 10%; margin: 1%; cursor: pointer;">
      <img width="100%" height="auto" style="margin: 1%" src="<c:url value="/resources/images/chat/questionmark.png" />"><br>
      <p style="font-size: 15px; text-align: center">
      이미지이름.jpg<br>
      프로젝트 이름
      </p>
      </div>
   </div>
  </div>
  <div id="filediv2" style="display:none;"></div>
  <img src="<c:url value="/resources/images/chat/close.png" />" id="fileclose" name="on" width=20px height=auto style="cursor: pointer; display: none;">
  
  <div class="modal fade" id="makeissue">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title">이슈 작성</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form action="">
        <!-- Modal body -->
        <div class="modal-body">
        <!-- <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p> -->
            <label for="title">이슈 제목</label>
          <input class="form-control createmodal" type="text" id="issuetitle" style="width: 100%" placeholder="제목을 입력해 주세요.">
          <br>
            <label for="content">이슈 설명</label> <span id="filename"></span> <img id="imgpreview" alt="사진 미리보기 자리" style="display:none;width: 40px; height: 40px" src="#" />
            <input type="file" id="fileclick" name="files[0]" hidden="">
          <textarea class="form-control createmodal" rows="5" id="issuecontent" style="width: 100%" placeholder="@를 입력하여 멘션, 할 일, 파일 등을 추가해 보세요."></textarea>
          <textarea rows="" id="codemirrorarea" style="display: none"><-- 코드를 입력하세요 --></textarea>
          <div id="todoresult" style="display: none">
          </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <select id="selectpro" class="form-control">
            <option>프라이빗 공간</option>
            <option>쫀쬬니</option>
            <option>이곳저곳</option>
            <option>캠핑이지</option>
          </select>
          <button type="submit" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" data-dismiss="modal">만들기</button>
          <button type="button" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" data-dismiss="modal">취소</button>
        </div>
        </form>
      </div>
    </div>
    
     <div class="list-group" id="mentionlist" style="display: none">
     <a href="#" class="list-group-item list-group-item-action" id="men1" style="padding: 5px">멘션</a>
     <a href="#" class="list-group-item list-group-item-action" id="men2" style="padding: 5px">소스코드(코드미러 하다말았음)</a>
     <a href="#" class="list-group-item list-group-item-action" id="men3" style="padding: 5px">구글 드라이브(가능?)</a>
     <a href="#" class="list-group-item list-group-item-action" id="men4" style="padding: 5px">파일</a>
     <a href="#" class="list-group-item list-group-item-action" id="men5" style="padding: 5px">표(이건 어떻게함;;)</a>
     <a href="#" class="list-group-item list-group-item-action" id="men6" style="padding: 5px">관련 이슈</a>
     <a href="#" class="list-group-item list-group-item-action" id="men7" style="padding: 5px">의사결정</a>
     <a href="#" class="list-group-item list-group-item-action" id="men8" style="padding: 5px">할 일</a>
     <a href="#" class="list-group-item list-group-item-action" id="men9" style="padding: 5px">일정</a>
   </div>
   <!--  -->
   <!-- 멘션할 사람 목록 -->
   <div class="list-group memlist" id="memlist" style="display: none">
     <a href="#" class="list-group-item list-group-item-action todo" style="padding: 5px">홍길동</a>
     <a href="#" class="list-group-item list-group-item-action todo" style="padding: 5px">김유신</a>
     <a href="#" class="list-group-item list-group-item-action todo" style="padding: 5px">임경균</a>
   </div>
   <div class="list-group" id="todo" style="display: none;">
     <label for="todomem">담당자</label>
          <input class="form-control createmodal" type="text" id="todomem" style="width: 100%">
          <br>
            <label for="todolist">할 일</label>
            <textarea class="form-control createmodal" rows="3" id="todolist" style="width: 100%; margin-bottom: 2%" placeholder="할 일을 작성해주세요."></textarea>
            <button type="button" id="todomake" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">만들기</button>
          <button type="button" id="todocancle" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">취소</button>
   </div>
   <div class="list-group" id="datepick" style="display: none;">
   <label>일정 작성</label>
   <div class="row">
   <div class="col-sm-5" style="padding-right: 0;">
   <span class="iconify" data-icon="bx:bx-calendar" data-inline="false" style="width: 25px;height: auto;"></span>
   <input type="text" id="from" name="from" style="width: 70%; border: none;" placeholder="시작날짜">
   </div>
   <div class="col-sm-2" style="padding-left: 0; padding-right: 0;">
   ~
   </div>
   <div class="col-sm-5" style="padding-left: 0;">
   <span class="iconify" data-icon="bx:bx-calendar" data-inline="false" style="width: 25px;height: auto;"></span>
   <input type="text" id="to" name="to" style="width: 70%; border: none;" placeholder="종료날짜">
   </div>
   </div>
   <br>
   <label>할 일</label>
            <textarea class="form-control createmodal" rows="3" id="datecontent" style="width: 100%; margin-bottom: 2%" placeholder="일정을 작성해주세요."></textarea>
    <button type="button" id="datemake" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">만들기</button>
          <button type="button" id="datecancle" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">취소</button>
   </div>
  </div>

  <script type="text/javascript">
   $('#issuecontent').keydown(function(event){
      var top = ($('#issuecontent').offset().top);
      var left = ($('#issuecontent').offset().left+490);
      if(event.shiftKey && event.keyCode==50){
         console.log("top&left" + top + ", "+left);
         $('#mentionlist').attr('style','position:fixed; width:20%;top:'+top+'px;left:'+left+'px; z-index:4');
         $('#mentionlist').show();
         $('div').not('#mentionlist').click(function(){
            $('#mentionlist').hide();
            });
         }
      });
   $('#men1').click(function(){
      var top = ($('#issuecontent').offset().top);
      var left = ($('#issuecontent').offset().left+490);
      $('#mentionlist').hide();
      $('#memlist').attr('style','position:fixed; width:20%;top:'+top+'px;left:'+left+'px; z-index:4');
      $('#memlist').show();
		   $('.modal-content').not('#memlist').click(function(){
		       $('#memlist').hide();
		       });
      });
   $('#memlist > .list-group-item').click(function(){
 	  console.log("gkgkgkgk");
      var text = "";
      text = $('#issuecontent').val() + $(this).text();
      $('#issuecontent').val(text);
      $('#memlist').hide();
      });
   $('#men2').click(function(){
      $('#mentionlist').hide();
      $('#issuecontent').empty();
      $('#issuecontent').hide();
      var textarea = document.getElementById('codemirrorarea');
        var editor = CodeMirror.fromTextArea(textarea, {
            mode: "javascript",
            lineNumbers: true,
            lineWrapping: true,
            theme: "eclipse",
            val: textarea.value
        });
      });
   $('#men4').click(function(){
      $('#mentionlist').hide();
      $('#fileclick').click();
      });
    function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function(e) {
                   $('#imgpreview').attr('src', e.target.result);
                   if(e.target.result.substring(5,10)=='image'){
                      $('#imgpreview').show();
                  }else{
                     $('#imgpreview').hide();
                     }
               }
               reader.readAsDataURL(input.files[0]);
           }
       }
       $("#fileclick").change(function() {
           readURL(this);
           $('#filename').empty();
           $('#filename').append($("#fileclick").val().substring(12));
           var text = "";
         text = $('#issuecontent').val().replace("@","");
         $('#issuecontent').val(text);
           
       });
    $('#men8').click(function(){
       var top = ($('#issuecontent').offset().top);
         var left = ($('#issuecontent').offset().left+490);
         $('#mentionlist').hide();
         $('#memlist').attr('style','position:fixed; width:20%;top:'+top+'px;left:'+left+'px; z-index:4');
         $('#memlist').show();
         $('.todo').click(function(){
            $('#memlist').hide();
            $('#todo').attr('style','border-radius:0.25em;padding:1%;position:fixed; width:20%;top:'+(top-208) +'px;left:'+left+'px; z-index:4;background-color:white');
            $('#todo').show();
            $('#todomem').val($(this).text());
            $('.modal-content').not('#todo').click(function(){
   		       $('#todo').hide();
   		       });
            });
       });
    $('#todomake').click(function(){
       $('#todo').hide();
       var text = "";
      text = $('#issuecontent').val().replace("@","");
      $('#issuecontent').val(text);
      $('#todoresult').append('<br>');
      $('#todoresult').append('<span class="iconify" data-icon="bx:bx-check-circle" data-inline="false"></span>');
      $('#todoresult').append($('#todomem').val());
      $('#todoresult').append(' <span class="iconify" data-icon="bytesize:arrow-right" data-inline="false"></span> ');
      $('#todoresult').append($('#todolist').val());
      $('#todoresult').show();
       $('#todolist').val('');
    })
    $('#todocancle').click(function(){
       $('#todo').hide();
       var text = "";
      text = $('#issuecontent').val().replace("@","");
      $('#issuecontent').val(text);
       $('#todolist').val('');
    });
    
    $('#men9').click(function(){
         var top = ($('#issuecontent').offset().top);
         var left = ($('#issuecontent').offset().left+490);
         $('#mentionlist').hide();
          var text = "";
            text = $('#issuecontent').val().replace("@","");
            $('#issuecontent').val(text);
            $('#datepick').attr('style','border-radius:0.25em;padding:1%;position:fixed; width:20%;top:'+top +'px;left:'+left+'px; z-index:4;background-color:white');
         $('#datepick').show();
             $('.modal-content').not('#datepick').click(function(){
  		       $('#datepick').hide();
  		       });
         $('.hasDatepicker').click(function(){
             $('#datepick').append($('#ui-datepicker-div'));
         });
    });
    $('#datemake').click(function(){
        $('#datepick').hide();
        var text = "";
       text = $('#issuecontent').val().replace("@","");
       $('#issuecontent').val(text);
       $('#todoresult').append('<br>');
       $('#todoresult').append('<span class="iconify" data-icon="bx:bx-calendar" data-inline="false"></span>');
       $('#todoresult').append($('#from').val()+"~"+$('#to').val());
       $('#todoresult').append(' <span class="iconify" data-icon="bytesize:arrow-right" data-inline="false"></span> ');
       $('#todoresult').append($('#datecontent').val());
       $('#todoresult').show();
        $('#todolist').val('');
     })
     $('#todocancle').click(function(){
        $('#todo').hide();
        var text = "";
       text = $('#issuecontent').val().replace("@","");
       $('#issuecontent').val(text);
        $('#todolist').val('');
     });
    
    
        var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
      return date;
    }
    
    function signOut(){
    	var auth2 = gapi.auth2.getAuthInstance();
    	auth2.signOut().then(function(){
    		console.log('Google LogOut Success');
    		location.href="logout.do";
    		auth2.disconnect();
    	});
    }
</script>