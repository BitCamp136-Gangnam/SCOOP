<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="index.jsp" style="padding-top: 5%">
                    <b class="logo-abbr"><img class="img-responsive center-block" src="images/logo/smalllogo.png" alt="mini" style="width:100px;height: auto;padding-top:0;margin-top: 30px; "> </b>
                    <span class="logo-compact"><img class="img-responsive center-block"src="images/logo/brownlogo.png" alt="" style="margin-top: 20px;"></span>
                    <span class="brand-title">
                        <img class="img-responsive center-block" src="images/logo/brownlogo.png" alt="" >
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
                        <input type="button" class="form-control" style="background-color: #fff5a5; border-color: #CCCCCC; margin-left: 2%; color: gray; cursor: pointer;" value="이슈작성">
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
                                <i class="mdi mdi-email-outline"></i>
                                <span class="badge badge-pill gradient-1">0</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <div class="notification-content">
                                                    <div class="notification-heading">제목</div>
                                                    <div class="notification-timestamp">시간</div>
                                                    <div class="notification-text">내용나오다가 생략...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Adam Smith</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Can you do me a favour?</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Barak Obama</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Hilari Clinton</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hello</div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-bell-outline"></i>
                                <span class="badge badge-pill gradient-2">0</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                <div class="dropdown-content-body">
                                    <ul>
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
                                <img src="images/avatar/avatar.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.jsp"><i class="icon-user"></i> <span>내 정보</span></a>
                                        </li>
                                        <li>
                                            <a href="app-file.jsp"><span class="iconify" data-icon="ion:folder-open-outline" data-inline="false" style="font-size: 15px"></span> <span> &nbsp;&nbsp;파일함</span></a>
                                        </li>
                                        <hr class="my-2">
                                        <li>
                                            <a href="page-lock.jsp"><i class="icon-lock"></i> <span>잠금모드</span></a>
                                        </li>
                                        <li><a href="page-login.jsp"><i class="icon-key"></i> <span>로그아웃</span></a></li>
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
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                	<li class="nav-label" style="padding-bottom: 0"><b>전체 정보</b></li>
                    <li>
                        <a href="./index.jsp" aria-expanded="false">
                            <span class="iconify" data-icon="bx:bx-file-blank" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;새로운 소식</span>
                            <!-- <i class="icon-speedometer menu-icon"> -->
                        </a>
                    </li>
                    <li>
                        <a href="./app-myissue.jsp" aria-expanded="false">
                            <span class="iconify" data-icon="simple-line-icons:emotsmile" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;내가 작성한 이슈</span>
                        </a>
                    </li>
                    <li>
                        <a href="./app-calender.jsp" aria-expanded="false">
                            <span class="iconify" data-icon="bx:bx-calendar" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;캘린더</span>
                        </a>
                    </li>
                    <li class="nav-label" style="padding-bottom: 0"><b>개인 공간</b></li>
                    <li>
                        <a href="./private-place.jsp" aria-expanded="false">
                            <span class="iconify" data-icon="ic:baseline-person" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;프라이빗 공간</span>
                        </a>
                    </li>
                    <li>
                        <a href="./private-bookmark.jsp" aria-expanded="false">
                            <span class="iconify" data-icon="ic:round-bookmark" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;북마크</span>
                        </a>
                    </li>
                    <li class="nav-label" style="padding-bottom: 0"><b>협업 공간</b></li>
                    <li class="nav-label"><button type="button" class="btn" style="background-color: #fff5a5; border-color: #CCCCCC; color: gray; cursor: pointer;" data-toggle="modal" data-target="#myModal"><i class="icon-note menu-icon"></i> 새 협업공간 만들기</button></li>
                    <li class="nav-label" style="padding-top: 0"><input type="search" class="form-control" style="border-radius: 0.25rem; height: 20px" placeholder="협업공간 검색"></li>
                    <li>
                        <a href="./cooperation-issue.jsp" aria-expanded="false">
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
          <button type="submit" class="btn btn-secondary" style="background-color: #fff5a5; border-color: #CCCCCC; color: gray; cursor: pointer;" data-dismiss="modal">만들기</button>
          <button type="button" class="btn btn-secondary" style="background-color: #fff5a5; border-color: #CCCCCC; color: gray; cursor: pointer;" data-dismiss="modal">취소</button>
        </div>
        </form>
      </div>
    </div>
  </div>