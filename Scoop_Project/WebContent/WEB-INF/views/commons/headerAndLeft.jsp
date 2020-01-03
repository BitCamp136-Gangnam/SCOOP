<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script type="text/javascript">
        $(function(){
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
});
        

        var check = $("input[type='checkbox']");
        check.click(function(){
        	$("p").toggle();
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
  background-color: #2196F3;
}

input:focus + .slider_alarm {
  box-shadow: 0 0 1px #2196F3;
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
                <a href="index.do" style="padding-top: 0px;">
                    <b class="logo-abbr"><img class="img-responsive center-block" src="images/logo/ScoopTitle.png" alt="mini" style="width:100px;height: auto;padding-top:0;margin-top: 30px; "> </b>
                    <span class="logo-compact"><img class="img-responsive center-block"src="images/logo/ScoopBig.png" alt="" style="margin-top: 20px; text-align: center;"></span>
                    <span class="brand-title">
                        <img class="img-responsive center-block" src="images/logo/ScoopBig.png" alt="" style="margin-top: 3%;">
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
                                    		
                                    			<label class="switch_alarm">
  													<input type="checkbox">
  													<span class="slider_alarm round_alarm"></span>
													</label>
													<span>OFF</span>
													<span style="display:none;">ON</span>
                                    	
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
                                <img src="images/avatar/avatar.png" height="40" width="40" alt="">
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
        <div class="nk-sidebar" style="z-index: 0">           
            <div id="scnav" class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                	<li class="nav-label" style="padding-bottom: 10px;" ><b style="padding-bottom: 2%;">전체 정보</b></li>
                    <li>
                        <a href="index.do" aria-expanded="false">
                            <span class="iconify" data-icon="bx:bx-file-blank" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;새로운 소식</span>
                            <!-- <i class="icon-speedometer menu-icon"> -->
                        </a>
                    </li>
                    <li>
                        <a href="myissue.do" aria-expanded="false">
                            <span class="iconify" data-icon="simple-line-icons:emotsmile" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;내가 작성한 이슈</span>
                        </a>
                    </li>
                    <li>
                        <a href="calender.do" aria-expanded="false">
                            <span class="iconify" data-icon="bx:bx-calendar" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;캘린더</span>
                        </a>
                    </li>
                    <li class="nav-label" style="padding-bottom: 0"><b>개인 공간</b></li>
                    <li>
                        <a href="private.do" aria-expanded="false">
                            <span class="iconify" data-icon="ic:baseline-person" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;프라이빗 공간</span>
                        </a>
                    </li>
                    <li>
                        <a href="bookmark.do" aria-expanded="false">
                            <span class="iconify" data-icon="ic:round-bookmark" data-inline="false" style="width: 20px;height: auto;"> </span><span class="nav-text"> &nbsp;북마크</span>
                        </a>
                    </li>
                    <li class="nav-label" style="padding-bottom: 0"><b>협업 공간</b></li>
                    <li class="nav-label"><button type="button" class="btn" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" data-toggle="modal" data-target="#myModal"><i class="icon-note menu-icon"></i> 새 협업공간 만들기</button></li>
                    <li class="nav-label" style="padding-top: 0"><input type="search" class="form-control" style="border-radius: 0.25rem; height: 20px" placeholder="협업공간 검색"></li>
                    <li>
                        <a href="coop-issue.do" aria-expanded="false">
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
		<img width="100%" height="auto" style="margin: 1%" src="./images/chat/questionmark.png"><br>
		<p style="font-size: 15px; text-align: center">
		이미지이름.jpg<br>
		프로젝트 이름
		</p>
		</div>
	</div>
  </div>
  <div id="filediv2" style="display:none;"></div>
  <img src="./images/chat/close.png" id="fileclose" name="on" width=20px height=auto style="cursor: pointer; display: none;">
  
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
            <label for="content">이슈 설명</label>
    		<textarea class="form-control createmodal" rows="5" id="issuecontent" style="width: 100%" placeholder="@를 입력하여 멘션, 할 일, 파일 등을 추가해 보세요."></textarea>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" data-dismiss="modal">만들기</button>
          <button type="button" class="btn btn-secondary" style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;" data-dismiss="modal">취소</button>
        </div>
        </form>
      </div>
    </div>
          		      <!-- @자동완성 수정 많이해야됨 자동완성의 위치와 키다운 위아래랑 엔터 -->
	  <div class="list-group" id="mentionlist" style="display: none">
	  <a href="#" class="list-group-item list-group-item-action" id="men1" style="padding: 5px">멘션</a>
	  <a href="#" class="list-group-item list-group-item-action" id="men2" style="padding: 5px">소스코드</a>
	  <a href="#" class="list-group-item list-group-item-action" id="men3" style="padding: 5px">구글 드라이브</a>
	  <a href="#" class="list-group-item list-group-item-action" id="men4" style="padding: 5px">파일</a>
	  <a href="#" class="list-group-item list-group-item-action" id="men5" style="padding: 5px">표</a>
	  <a href="#" class="list-group-item list-group-item-action" id="men6" style="padding: 5px">관련 이슈</a>
	  <a href="#" class="list-group-item list-group-item-action" id="men7" style="padding: 5px">의사결정</a>
	  <a href="#" class="list-group-item list-group-item-action" id="men8" style="padding: 5px">할 일</a>
	  <a href="#" class="list-group-item list-group-item-action" id="men9" style="padding: 5px">일정</a>
	</div>
	<!--  -->
	<!-- 멘션할 사람 목록 -->
	<div class="list-group" id="memlist" style="display: none">
	  <a href="#" class="list-group-item list-group-item-action" style="padding: 5px">홍길동</a>
	  <a href="#" class="list-group-item list-group-item-action" style="padding: 5px">김유신</a>
	  <a href="#" class="list-group-item list-group-item-action" style="padding: 5px">임경균</a>
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
		
		$('.list-group-item').click(function(){
			var text = "";
			text = $('#issuecontent').val() + $(this).text();
			$('#issuecontent').val(text);
			$('#memlist').hide();
			});
		});
</script>