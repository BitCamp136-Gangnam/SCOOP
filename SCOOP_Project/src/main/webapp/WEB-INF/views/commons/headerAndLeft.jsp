<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="role" value="${sessionScope.role}" />
<style>
input::placeholder {
   color: #fff;
}
</style>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<link rel="stylesheet"
   href="<c:url value="/resources/lib/codemirror.css" />">
<script src="<c:url value="/resources/lib/codemirror.js" />"></script>
<%-- <link rel="stylesheet"
   href="<c:url value="/resources/dist/summernote.css" />">
<script src="<c:url value="/resources/dist/summernote.min.js" />"></script> --%>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%-- <link rel="stylesheet" href="<c:url value="/resources/demos/style.css" />"> --%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">
   $(function() {
      var number = 0;

      var target = 1;
      /* var regExp  = /([w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$/;
      
      if('!$("#invite_Submit").val()'){
          alert("이메일주소를 입력 해 주세요"); 
            $("#invite_Submit").focus(); 
            return false; 
      } else { 
         if(!regExp.test($("#invite_Submit").val())) { 
               alert("이메일 주소가 유효하지 않습니다"); 
               $("#invite_Submit").focus(); 
               return false; 
            } 
      }  */
      $('#invite_Submit').keyup(function(event) {
         console.log("gggg");
         $('#invite_email_append').show();
         $('#invite_email_append').empty();

         if ($('#invite_Submit').val().match('@')){
            $('#invite_email_append')
                  .append(
                        '<div id="email_append_1" class="email_append" style="margin:10px;color:#000;">'
                              + $(this).val());
         } else {
            $('#invite_email_append')
                  .append(
                        '<div id="email_append_1" class="email_append" style="margin:10px 7px 10px 7px;color:#000;">'
                              + $(this).val()
                              + '@naver.com</div>');
            $('#invite_email_append')
                  .append(
                        '<div id="email_append_2" class="email_append" style="margin:10px 7px 10px 7px;color:#000;">'
                              + $(this).val()
                              + '@gmail.com</div>');
            $('#invite_email_append')
                  .append(
                        '<div id="email_append_3" class="email_append" style="margin:10px 7px 10px 7px;color:#000;">'
                              + $(this).val()
                              + '@daum.net</div>');
         }

         if ($('#invite_Submit').val() == "") {
            $('#invite_email_append').hide();
         } else {
            $('#invite_email_append').show();
         }

         if (event.keyCode == 13) {
            $('#invite_email_append').hide();
         }

         var key = event.keyCode;
         console.log(key);
         switch (key) {
         case 38:
            console.log("위");
            target--;
            break;
         case 40:
            target++;
            break;
         case 39:
            break;
         case 37:
            break;
         }
         if (target < 1) {
            target = 1;
         }
         if (target > 3) {
            target = 3;
         }
         $('#email_append_' + target).focus();
         if ($('#email_append_' + target).focus()) {
            $('.email_append').css('background-color', '#fff');
            $('#email_append_' + target).css(
                  'background-color',
                  'rgba(225, 225, 225,0.5)');

            if (event.keyCode == 13) {

               var u_email = $('#email_append_' + target);
               var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
               console.log(u_email.text());
               if (u_email.text() == "@naver.com") {
                  alert("이메일을 입력하세요");
                  u_email.focus();
                  return false;
               } else {
                  if (!regEmail.test(u_email.text())) {
                     alert("유효한 이메일 형식이 아닙니다.");
                     u_email.focus();
                     return false;
                  }
               }
               
               if (event.shiftKey && event.keyCode == 50) {
                  console.log("?????");
                  $('#invite_email_append').hide();
                  $('#invite_Input')
                        .append(
                              '<span style="border:1px solid rgba(124, 119, 119,0.5);border-radius:0.25rem; padding-top: 1%;padding-bottom: 1%;padding-left: 2%;padding-right: 2%;margin:2%;"><i class="far fa-paper-plane" style="color:#9e6767;padding-right: 5px;"></i><input type="text" value='
                                    + $(this).val()
                                    + ' name=email'
                                    + (number++)
                                    + ' style="border:0px; width:200px;margin-left:3px;" readonly><button type="button" id=""  class="invite_close" style="border:0;background-color:#fff;border-radius:0.25rem;"><i class="fas fa-times" style="color:#A84747;padding-left: 10px;"></i></button></span>');
                  $(this).val('');
                  $('#invitebtn').removeAttr('disabled');
                  $('#invitecnt').val(number);
                  $('#invitebtn').empty();
                  $('#invitebtn')
                        .prepend(
                              $('#invite_Input')
                                    .children().length
                                    - 2 + '명의 멤버 초대하기');

               } else {
                  $('#invite_Input')
                        .append(
                              '<span style="border:1px solid rgba(124, 119, 119,0.5);border-radius:0.25rem; padding-top: 1%;padding-bottom: 1%;padding-left: 2%;padding-right: 2%;margin:2%;"><i class="far fa-paper-plane" style="color:#9e6767;padding-right: 5px;"></i><input type="text" value='
                                    + $(
                                          '#email_append_'
                                                + target)
                                          .text()
                                    + ' name=email'
                                    + (number++)
                                    + ' style="border:0px; width:200px;margin-left:3px;" readonly><button type="button" id=""  class="invite_close" style="border:0;background-color:#fff;border-radius:0.25rem;"><i class="fas fa-times" style="color:#A84747;padding-left: 10px;"></i></button></span>');
                  $(this).val('');
                  $('#invitebtn').removeAttr('disabled');
                  $('#invitecnt').val(number);
                  $('#invitebtn').empty();
                  $('#invitebtn')
                        .prepend(
                              $('#invite_Input')
                                    .children().length
                                    - 2 + '명의 멤버 초대하기');

               }
            }

            $('.invite_close')
                  .click(
                        function() {
                           $('#invitebtn').empty();
                           $('#invitebtn')
                                 .prepend(
                                       $(
                                             '#invite_Input')
                                             .children().length
                                             - 2
                                             + '명의 멤버 초대하기');
                           $(this).parent().remove();
                           if ($('#invite_Input')
                                 .children().length == 2) {
                              $('#invitebtn').empty();
                              $('#invitebtn').prepend(
                                    '멤버 초대하기');
                              $('#invitebtn').attr(
                                    'disabled',
                                    'disabled');
                              $('#invite_Input1').show();
                              $('#invite_Input2').show();
                           }
                        });

            if ($('#invite_Input').children().length > 2) {
               $('#invite_Input1').hide();
               $('#invite_Input2').hide();
            }

         }

      });
       $('#summernote').summernote({
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
     });
      $('#fileopen').click(function() {
         $('#filediv').show();
         $('#fileclose').show();
         $('#fileclose').attr('name', 'on');
         $('#pagelogo').attr('style', 'opacity:0.5');
         $('#scnav').attr('style', 'opacity:0.5');
         $('.content-body').attr('style', 'opacity:0.5');
         $('.header').attr('style', 'opacity:0.5');
         $('#helpopen').hide();
         $('#filediv2').show();
      });
      $('#fileclose').click(function() {
         $('#filediv').hide();
         $('#fileclose').hide();
         $('#pagelogo').attr('style', 'opacity:1');
         $('#scnav').attr('style', 'opacity:1');
         $('.content-body').attr('style', 'opacity:1');
         $('.header').attr('style', 'opacity:1');
         $('#helpopen').show();
         $('#filediv2').hide();
      });
      $('#filediv2').click(function() {
         $('#filediv').hide();
         $('#fileclose').hide();
         $('#pagelogo').attr('style', 'opacity:1');
         $('#scnav').attr('style', 'opacity:1');
         $('.content-body').attr('style', 'opacity:1');
         $('.header').attr('style', 'opacity:1');
         $('#helpopen').show();
         $('#filediv2').hide();
      });
      $(document).keydown(function(event) {
         if (event.ctrlKey && event.keyCode == 190) {
            if ($('.fileon').attr('class') == 'fileon') {
               $('#filediv').attr('class', 'fileoff');
               $('#filediv').show();
               $('#fileclose').show();
               $('#fileclose').attr('name', 'on');
               $('#pagelogo').attr('style', 'opacity:0.5');
               $('#scnav').attr('style', 'opacity:0.5');
               $('.content-body').attr('style', 'opacity:0.5');
               $('.header').attr('style', 'opacity:0.5');
               $('#helpopen').hide();
               $('#filediv2').show();
            } else {
               $('#filediv').attr('class', 'fileon');
               $('#filediv').hide();
               $('#fileclose').hide();
               $('#pagelogo').attr('style', 'opacity:1');
               $('#scnav').attr('style', 'opacity:1');
               $('.content-body').attr('style', 'opacity:1');
               $('.header').attr('style', 'opacity:1');
               $('#helpopen').show();
               $('#filediv2').hide();
            }
         }
      });

      $('#alarmbtn').click(function(event) {
         event.stopPropagation();
         if ($('#alarmbox').attr('name') == 'on') {
            $('#alarmbox').attr('name', 'off');
            $('#alarm_power').text('OFF');
         } else {
            $('#alarmbox').attr('name', 'on');
            $('#alarm_power').text('ON');
         }

      });

   });
   /* 프로젝트 이름 검색 - 도연 */
   function filter() {
      var value, name, item, i;
      value = document.getElementById("searchpjt").value.toUpperCase();
      item = document.getElementsByClassName("search_project");

      for (i = 0; i < item.length; i++) {
         name = item[i].getElementsByClassName("resultsearch");
         if (name[0].innerHTML.toUpperCase().indexOf(value) > -1) {
            item[i].style.display = "flex";
         } else {
            item[i].style.display = "none";
         }
      }
   }
</script>
<script type="text/javascript">
   // The Browser API key obtained from the Google API Console.
   var developerKey = 'AIzaSyBIu-Whybpm37l7vHw8O5f48kjpG_bQtzo';

   // The Client ID obtained from the Google API Console. Replace with your own Client ID.
   var clientId = "237537328130-p9jshmj42atouica42uq96prsjk4qvtf.apps.googleusercontent.com";

   // Scope to use to access user's photos.
   var scope = 'https://www.googleapis.com/auth/drive.file';

   var pickerApiLoaded = false;
   var oauthToken;

   // Use the API Loader script to load google.picker and gapi.auth.
   function onApiLoad() {
      gapi.load('auth2', onAuthApiLoad);
      gapi.load('picker', onPickerApiLoad);
   }

   function onAuthApiLoad() {
      var authBtn = document.getElementById('auth');
      authBtn.disabled = false;
      authBtn.addEventListener('click', function() {
         gapi.auth2.init({
            client_id : clientId
         }).then(function(googleAuth) {
            googleAuth.signIn({
               scope : scope
            }).then(function(result) {
               handleAuthResult(result.getAuthResponse());
            })
         })
      });
   }

   function onPickerApiLoad() {
      pickerApiLoaded = true;
      createPicker();
   }

   function handleAuthResult(authResult) {
      if (authResult && !authResult.error) {
         oauthToken = authResult.access_token;
         createPicker();
      }
   }
   // Create and render a Picker object for picking from Google Photos.
   function createPicker() {
      if (pickerApiLoaded && oauthToken) {
         var picker = new google.picker.PickerBuilder().addView(
               google.picker.ViewId.DOCS).setOAuthToken(oauthToken)
               .setDeveloperKey(developerKey).setCallback(pickerCallback)
               .build();
         picker.setVisible(true);
         $('.picker-dialog').attr('style', 'z-index:1051;top:5%;left:20%')
      }
   }

   var url = '';
   var drivename = '';
   // A simple callback implementation.
   function pickerCallback(data) {
      if (data[google.picker.Response.ACTION] == google.picker.Action.PICKED) {
         var doc = data[google.picker.Response.DOCUMENTS][0];
         url = doc[google.picker.Document.URL];
         drivename = doc.name;
      }
      var message = url;
      if (url != '') {
         $('#todoresult')
               .append(
                     '<div><a href='+url+'><span class="iconify" data-icon="whh:googledrive" data-inline="false"></span>'
                           + drivename + '</a></div>');
         $('#todoresult').show();
      }
   }

   //이슈작성 validation
    function checkz() {
    //이슈 제목 공백 확인
     if($("#issuetitle").val() == ""){
        Swal.fire("제목을 입력해주세요.");
       $("#issuetitle").focus();
       return false;
     }

     //이슈 설명 공백 확인
     if($("#issuecontent").val() == ""){
        Swal.fire("내용을 입력해주세요.");
       $("#issuecontent").focus();
       return false;
     }

   return true;
   } 

   //협업공간 생성 validation
    function checkz2() {
    //협업공간 이름 확인
     if($("#pname").val() == ""){
        Swal.fire("제목을 입력해주세요.");
       $("#pname").focus();
       return false;
     }

     //협업공간 내용 확인
     if($("#pcontent").val() == ""){
        Swal.fire("내용을 입력해주세요.");
       $("#pcontent").focus();
       return false;
     }

   return true;
   } 
</script>
<style>
.modal-content.modal-fullsize {
   height: auto;
   min-height: 100%;
   border-radius: 0;
   min-width: 950px;
   right: 230px;
}

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
   vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch_alarm input {
   display: none;
}

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

input:checked+.slider_alarm {
   background-color: #00D63D;
}

input:focus+.slider_alarm {
   box-shadow: 0 0 1px #00D63D;
}

input:checked+.slider_alarm:before {
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

span {
   margin: 0px;
   display: inline-block;
   font-size: 15px;
   font-weight: bold;
}
</style>

<!--**********************************
            Nav header start
        ***********************************-->
<div id="pagelogo" class="nav-header">
   <div class="brand-logo">
      <a href="userindex.do" style="padding-top: 0px;"> <b
         class="logo-abbr"><img class="img-responsive center-block"
            src="<c:url value="/resources/images/logo/ScoopTitle.png" />"
            alt="mini"
            style="width: 100px; height: auto; padding-top: 0; margin-top: 30px;">
      </b> <span class="logo-compact"><img
            class="img-responsive center-block"
            src="<c:url value="/resources/images/logo/ScoopBig.png" />" alt=""
            style="margin-top: 20px; text-align: center;"></span> <span
         class="brand-title"> <img class="img-responsive center-block"
            src="<c:url value="/resources/images/logo/ScoopBig.png" />" alt=""
            style="margin-top: 3%;">
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
               <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
                  id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
            </div>
            <input type="search" class="form-control" placeholder="검색하세요"
               aria-label="Search">
               <c:choose>
                  <c:when test="${role == 'ROLE_ADMIN'}">
               <input type="button"class="form-control"
               style="background-color: #E71D36; border-color: #CCCCCC; margin-left: 2%; color: #fff; cursor: pointer;"
               value="공지사항 작성" data-toggle="modal" data-target="#makenotice">
               <input type="button"class="form-control"
               style="background-color: #E71D36; border-color: #CCCCCC; margin-left: 2%; color: #fff; cursor: pointer;"
               value="이슈 작성" data-toggle="modal" data-target="#makeissue">
               </c:when>
               <c:otherwise>
               <input type="button"class="form-control"
               style="background-color: #E71D36; border-color: #CCCCCC; margin-left: 2%; color: #fff; cursor: pointer;"
               value="이슈 작성" data-toggle="modal" data-target="#makeissue">
               </c:otherwise>
               </c:choose>
            <div class="drop-down animated flipInX d-md-none">
               <form action="#">
                  <input type="text" class="form-control" placeholder="Search">
               </form>
            </div>
         </div>
      </div>
      <div class="header-right">
         <ul class="clearfix">
            <li class="icons dropdown d-none d-md-flex"><a
               href="javascript:void(0)" class="log-user" data-toggle="dropdown">
                  <span>한국어</span> <i class="fa fa-angle-down f-s-14"
                  aria-hidden="true"></i>
            </a>
               <div
                  class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                  <div class="dropdown-content-body">
                     <ul>
                        <li><a href="javascript:void()">한국어</a></li>
                        <li><a href="javascript:void()">English</a></li>
                     </ul>
                  </div>
               </div></li>

            <li class="icons dropdown d-none d-md-flex"><i
               class="fas fa-user-plus" data-toggle="modal" id="inviteModal_id"
               data-target="#inviteModal"
               style="cursor: pointer; color: #535359; font-size: 18px; padding-bottom: 12px;"></i>

            </li>
            <li class="icons dropdown"><a href="javascript:void(0)"
               data-toggle="dropdown"> <i class="mdi mdi-bell-outline"></i> <span
                  class="badge badge-pill gradient-2">0</span>
            </a>
               <div
                  class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                  <div class="dropdown-content-body">
                     <ul>
                        <li>
                           <p style="display: inline-block; padding-right: 33%">전체 알람
                              설정</p> <label class="switch_alarm"> <input type="checkbox"
                              checked="checked" id="alarmbox" name="on"> <span
                              class="slider_alarm round_alarm" id="alarmbtn"></span>
                        </label> <span id="alarm_power">ON</span>

                        </li>

                        <li><a href="javascript:void()"> <span
                              class="mr-3 avatar-icon bg-success-lighten-2"><i
                                 class="icon-present"></i></span>
                              <div class="notification-content">
                                 <h6 class="notification-heading">무슨 알림인지</h6>
                                 <span class="notification-text">알림 몇분전에 왔는지</span>
                              </div>
                        </a></li>
                        <li><a href="javascript:void()"> <span
                              class="mr-3 avatar-icon bg-danger-lighten-2"><i
                                 class="icon-present"></i></span>
                              <div class="notification-content">
                                 <h6 class="notification-heading">Event Started</h6>
                                 <span class="notification-text">One hour ago</span>
                              </div>
                        </a></li>
                        <li><a href="javascript:void()"> <span
                              class="mr-3 avatar-icon bg-success-lighten-2"><i
                                 class="icon-present"></i></span>
                              <div class="notification-content">
                                 <h6 class="notification-heading">Event Ended
                                    Successfully</h6>
                                 <span class="notification-text">One hour ago</span>
                              </div>
                        </a></li>
                        <li><a href="javascript:void()"> <span
                              class="mr-3 avatar-icon bg-danger-lighten-2"><i
                                 class="icon-present"></i></span>
                              <div class="notification-content">
                                 <h6 class="notification-heading">Events to Join</h6>
                                 <span class="notification-text">After two days</span>
                              </div>
                        </a></li>
                     </ul>

                  </div>
               </div></li>

            <li class="icons dropdown">
               <div class="user-img c-pointer position-relative"
                  data-toggle="dropdown">
                  <span class="activity active"></span> <img
                     src="<c:url value="/resources/images/avatar/avatar.png" />"
                     height="40" width="40" alt="">
               </div>
               <div
                  class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                  <div class="dropdown-content-body">
                     <ul>
                        <li><a href="memberEdit.do?${sessionScope.email}"><i
                              class="icon-user"></i> <span>내 정보</span></a></li>
                        <li><a href="#" id="fileopen"><span class="iconify"
                              data-icon="ion:folder-open-outline" data-inline="false"
                              style="font-size: 15px"></span> <span> &nbsp;&nbsp;파일함</span></a>
                        </li>
                        <hr class="my-2">
                        <li><a href="page-lock.jsp"><i class="icon-lock"></i><span>잠금모드</span></a>
                        </li>
                        <c:choose>
                           <c:when test="${kind=='normal'}">
                              <li><a href="logout.do"><i class="icon-key"></i> <span>로그아웃</span></a></li>
                           </c:when>
                           <c:when test="${kind=='google'}">
                              <li><a href="#" onclick="signOut();"><i
                                    class="icon-key"></i> <span>로그아웃</span></a></li>
                           </c:when>
                           <c:when test="${kind=='naver'}">
                              <li><a href="logout.do"><i class="icon-key"></i> <span>로그아웃</span></a></li>
                           </c:when>
                           <c:otherwise></c:otherwise>
                        </c:choose>

                        <li><%=session.getAttribute("email")%></li>
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
<c:set var="kind" value="${session.kind}}"></c:set>
<c:set var="email" value="${session.email}}"></c:set>

<div class="nk-sidebar" style="z-index: 0">
   <div id="scnav" class="nk-nav-scroll">
      <ul class="metismenu" id="menu">
         <li class="nav-label" style="padding-bottom: 10px;"><b
            style="padding-bottom: 2%;">전체 정보</b></li>
         <li><a href="notice.do" aria-expanded="false"><span class="iconify" data-icon="ps:megaphone" data-inline="false"></span>
         <span class="nav-text">
                  &nbsp;공지사항</span> <!-- <i class="icon-speedometer menu-icon"> -->
         </a></li>
         <li><a href="userindex.do" aria-expanded="false"> <span
               class="iconify" data-icon="bx:bx-file-blank" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;새로운 소식</span> <!-- <i class="icon-speedometer menu-icon"> -->
         </a></li>
         <li><a href="myissue.do" aria-expanded="false"> <span
               class="iconify" data-icon="simple-line-icons:emotsmile"
               data-inline="false" style="width: 20px; height: auto;"> </span><span
               class="nav-text"> &nbsp;내가 작성한 이슈</span>
         </a></li>
         <li><a href="calendar.do" aria-expanded="false"> <span
               class="iconify" data-icon="bx:bx-calendar" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;캘린더</span>
         </a></li>
         <li class="nav-label" style="padding-bottom: 0"><b>개인 공간</b></li>
         <li><a href="private.do" aria-expanded="false"> <span
               class="iconify" data-icon="ic:baseline-person" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;프라이빗 공간</span>
         </a></li>
         <li><a href="bookmark.do" aria-expanded="false"> <span
               class="iconify" data-icon="ic:round-bookmark" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;북마크</span>
         </a></li>
         <li class="nav-label" style="padding-bottom: 0"><b>협업 공간</b></li>
         <li class="nav-label"><button type="button" class="btn"
               style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
               data-toggle="modal" data-target="#myModal">
               <i class="icon-note menu-icon"></i> 새 협업공간 만들기
            </button></li>
         <li class="nav-label" style="padding-top: 0"><input
            onkeyup="filter()" type="search" id="searchpjt" class="form-control"
            style="border-radius: 0.25rem; height: 20px" placeholder="협업공간 검색"></li>
         <c:forEach items="${pjtlist}" var="p">
            <li class="search_project"><a
               href="projectDetail.do?tseq=${p.tseq}" class="projecthref" aria-expanded="false"><span
                  class="iconify" data-icon="bx:bxs-flag-alt" data-inline="false"
                  style="width: 20px; height: auto;"> </span><span
                  class="nav-text resultsearch"> &nbsp;${p.pname}</span></a></li>
         </c:forEach>
         <li class="nav-label" style="padding-bottom: 30px"></li>
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
.createmodal {
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

         <!-- Modal body -->
         <form onsubmit="return checkz2()" action="team.do" method="post">
            <div class="modal-body">
               <p style="font-size: 12px">
                  협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br> 협업공간을 만들고 함께
                  일할 멤버들을 초대해보세요.
               </p>
               <label for="pname">협업공간 이름</label> <input
                  class="form-control createmodal" type="text" id="pname"
                  name="pname" style="width: 100%"> <br> <label
                  for="pcontent">협업공간 설명</label>
               <textarea class="form-control createmodal" rows="3" id="pcontent"
                  name="pcontent" style="width: 100%"></textarea>
            </div>

            <!-- Modal footer -->

            <!-- <input type="hidden" name="tseq" value="1"> -->
            <!-- <input type="hidden" name="ischarge" value="0"> -->
            <input type="hidden" name="email" value="${sessionScope.email}">
            <!-- <input type="hidden" name="istpalarm" value="0"> -->
            <!-- <input type="hidden" name="ptime" value="20/01/08"> -->
            <div class="modal-footer">
               <input type="submit" id="chatmake" class="btn btn-secondary" value="만들기"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">
               <input type="button" class="btn btn-secondary" value="취소"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
                  data-dismiss="modal">
            </div>
         </form>
      </div>
   </div>
</div>

<div id="filediv" class="fileon"
   style="display: none; background-color: white;">
   <div class="row" style="margin: 2%;">
      <div class="col-sm-12">
         <h3>파일함(Ctrl + .)</h3>
         <h6>어디서든 Drag & Drop으로 파일을 업로드할 수 있습니다.</h6>
      </div>
   </div>
   <div class="row" style="margin: 2%;">
      <ul class="nav nav-pills">
         <li class="nav-item"><a class="nav-link" href="#">내 파일</a></li>
         <li class="nav-item"><a class="nav-link" href="#">전체 파일</a></li>
         <li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">프로젝트</a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="#">쫀쬬니</a> <a class="dropdown-item"
                  href="#">스쿱</a>
            </div></li>
         <li class="nav-item"><input type="search" class="form-control"
            style="border-radius: 0.25rem; height: 20px" placeholder="파일 검색">
         </li>
      </ul>
   </div>
   <div class="row" style="margin: 2%; overflow: auto; height: 600px">
      <div style="width: 10%; margin: 1%; cursor: pointer;">
         <img width="100%" height="auto" style="margin: 1%"
            src="<c:url value="/resources/images/chat/questionmark.png" />"><br>
         <p style="font-size: 15px; text-align: center">
            이미지이름.jpg<br> 프로젝트 이름
         </p>
      </div>
   </div>
</div>
<div id="filediv2" style="display: none;"></div>
<img src="<c:url value="/resources/images/chat/close.png" />"
   id="fileclose" name="on" width=20px height=auto
   style="cursor: pointer; display: none;">

<div class="modal fade" id="makeissue">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         
         <div class="modal-header">
            <h3 class="modal-title">이슈 작성</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <form onsubmit="return checkz()" action="writeIssue.do" method="POST" enctype="multipart/form-data">
            <!-- Modal body -->
            <div class="modal-body">
               <!-- <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p> -->
               <label for="title">이슈 제목</label> <input
                  class="form-control createmodal" type="text" id="issuetitle"
                  name="issuetitle" style="width: 100%" placeholder="제목을 입력해 주세요.">
               <br> <label for="content">이슈 설명</label> <span id="filename"></span>
               <img id="imgpreview" alt="사진 미리보기 자리"
                  style="display: none; width: 40px; height: 40px" src="#" /> 
                  <input type="file" multiple="multiple"  id="fileclick" name="files[]" hidden="">
               <button type="button" id="auth" disabled hidden="">Authenticate</button>
               <textarea class="form-control createmodal" rows="5"
                  id="issuecontent" name="issuecontent" style="width: 100%"
                  placeholder="@를 입력하여 멘션, 할 일, 파일 등을 추가해 보세요."></textarea>
                  <textarea name="content" id="summernote" value=""></textarea>
                  <script type="text/javascript">
                  $('#summernote').summernote();
                  </script>
               <textarea rows="" id="codemirrorarea" style="display: none"><-- 코드를 입력하세요 --></textarea>
               <div id="todoresult" style="display: none">
                  <!-- mention -->
               </div>
               <!-- The Google API Loader script. -->
               <script type="text/javascript"
                  src="https://apis.google.com/js/api.js?onload=onApiLoad"></script>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
               <select id="selectpro" name="selectTeam" class="form-control">
                  <option value="${sessionScope.email}">프라이빗 공간</option>
                  <c:forEach items="${pjtlist}" var="p">
                           <option value="${p.tseq}">${p.pname}</option>
                           <%-- <c:set value="${p.pname}" var="pname"></c:set> --%>
                           <%-- <input type="hidden" value="${p.pname}" name="pname"  readonly> --%>
                  </c:forEach>
               </select>
               <%-- <c:if test="${tseq!=null} }">
               <input type="hidden" value="${pname }" name="pname"  readonly>
               </c:if> --%>
               <button type="submit" class="btn btn-secondary"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">만들기</button>
               <button type="button" class="btn btn-secondary"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
                  data-dismiss="modal">취소</button>
            </div>
         </form>
      </div>
   </div>

   <div class="list-group" id="mentionlist" style="display: none">
      <a href="#" class="list-group-item list-group-item-action menli" id="men1"style="padding: 5px">멘션(완료)</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men2"style="padding: 5px">소스코드(코드미러 하다말았음)</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men3"style="padding: 5px">구글 드라이브(완료))</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men4"style="padding: 5px">파일(완료)</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men5"style="padding: 5px">표(이건 어떻게함;;)</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men6"style="padding: 5px">관련 이슈</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men7"style="padding: 5px">의사결정</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men8"style="padding: 5px">할 일(완료)</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men9"style="padding: 5px">일정(완료)</a>
   </div>
   <!--  -->
   <!-- 멘션할 사람 목록 -->
   <div class="list-group" id="memlist" style="display: none">
      <a href="#" class="list-group-item list-group-item-action todo"
         style="padding: 5px">홍길동</a> <a href="#"
         class="list-group-item list-group-item-action todo"
         style="padding: 5px">김유신</a> <a href="#"
         class="list-group-item list-group-item-action todo"
         style="padding: 5px">임경균</a>
   </div>
   <div class="list-group" id="todo" style="display: none;">
      <label for="todomem">담당자</label> <input
         class="form-control createmodal" type="text" id="todomem"
         style="width: 100%"> <br> <label for="todolist">할
         일</label>
      <textarea class="form-control createmodal" rows="3" id="todolist"
         style="width: 100%; margin-bottom: 2%" placeholder="할 일을 작성해주세요."></textarea>
      <button type="button" id="todomake" class="btn btn-secondary"
         style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">만들기</button>
      <button type="button" id="todocancle" class="btn btn-secondary"
         style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">취소</button>
   </div>
   <div class="list-group" id="datepick" style="display: none;">
      <label>일정 작성</label>
      <div class="row">
         <div class="col-sm-5" style="padding-right: 0;">
            <span class="iconify" data-icon="bx:bx-calendar" data-inline="false"
               style="width: 25px; height: auto;"></span> <input type="text"
               id="from" name="from" style="width: 70%; border: none;"
               placeholder="시작날짜">
         </div>
         <div class="col-sm-2" style="padding-left: 0; padding-right: 0;">
            ~</div>
         <div class="col-sm-5" style="padding-left: 0;">
            <span class="iconify" data-icon="bx:bx-calendar" data-inline="false"
               style="width: 25px; height: auto;"></span> <input type="text"
               id="to" name="to" style="width: 70%; border: none;"
               placeholder="종료날짜">
         </div>
      </div>
      <br> <label>할 일</label>
      <textarea class="form-control createmodal" rows="3" id="datecontent"
         style="width: 100%; margin-bottom: 2%" placeholder="일정을 작성해주세요."></textarea>
      <button type="button" id="datemake" class="btn btn-secondary"
         style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">만들기</button>
      <button type="button" id="datecancle" class="btn btn-secondary"
         style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">취소</button>
   </div>
</div>
<!-- 파트너 초대 모달 -->
<div class="modal fade" id="inviteModal">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content modal-fullsize"
         style="border-radius: 0.5rem;">
         <!-- Modal Header -->
         <div class="modal-header" style="padding-bottom: 0px;">
            <h5 style="padding-top: 2%; padding-left: 5px;">멤버 초대</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>

         <!-- Modal body -->
         <form action="inviteTeam.do" method="post">
            <div class="row" style="margin-bottom: 1%;">
               <div class="col-sm-6"
                  style="border-right: 1px solid #c8c8c8; padding-left: 20px;">
                  <div class="modal-body">
                     <p style="font-size: 12px">
                        더 많은 사람들을 초대하여 원활한 소통으로 업무를 효율적으로 처리해보세요.<br> 회사 동료뿐만 아니라
                        외부 협업자도 파트너로 초대할 수 있습니다.
                     </p>
                     <label for="title">파트너 초대</label> <input
                        class="form-control createmodal" type="text" id="invite_Submit"
                        placeholder="이메일 주소를 입력하고 Enter키를 눌러주세요"
                        style="width: 100%; border-radius: 0.25rem;">
                     <p style="font-size: 13px; margin-top: 2%; margin-left: 1%;">이메일
                        주소를 입력하고 Enter키를 눌러 동료들을 초대해 보세요.</p>
                     <div id="invite_email_append"
                        style="min-width: 35%; border: 1px solid #c8c8c8; border-radius: 0.25rem; background-color: #fff; display: none; position: absolute; top: 145px; left: 18px;">

                     </div>
                     <label for="content">협업 공간</label> <select id="select_invite"
                        name="tseq" class="form-control" style="border-radius: 0.25rem;">
                        <c:forEach items="${pjtlist}" var="p">
                           <option value="${p.tseq}">${p.pname}</option>
                        </c:forEach>
                     </select>
                  </div>
               </div>
               <div class="col-sm-6">
                  <label for="content" style="margin-top: 3%; margin-bottom: 0px;">초대
                     리스트</label>
                  <div id="invite_Input"
                     style="border: 1px solid rgba(124, 119, 119, 0.3); border-radius: 0.5rem; margin-right: 3%; height: 280px; overflow: auto; margin-bottom: 10px;">
                     <span id="invite_Input1"
                        style="margin-left: 35%; margin-top: 18%;"> <img
                        src="<c:url value="/resources/images/icon/mail.png" />"
                        style="width: 75px; height: 75px; margin-left: 40%;' ">
                     </span>
                     <p id="invite_Input2" style="text-align: center;">
                        초대 메일 보낼 이메일 주소를<br>여기에서 확인할 수 있습니다
                     </p>
                  </div>
                  <input type="hidden" name="invitecnt" id="invitecnt">
                  <button type="submit" class="btn btn-secondary" id="invitebtn"
                     style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer; margin-left: 100px; padding-left: 75px; padding-right: 75px;"
                     disabled="disabled">멤버 초대하기</button>
               </div>
            </div>
         </form>


      </div>
   </div>
</div>
<div class="modal fade" id="makenotice">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h3 class="modal-title">공지사항 작성</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <form action="noticeWrite.do" method="POST">
            <!-- Modal body -->
            <div class="modal-body">
               <!-- <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p> -->
               <label for="bntitle">공지사항</label> <input
                  class="form-control createmodal" type="text" id="bntitle"
                  name="bntitle" style="width: 100%" placeholder="제목을 입력해 주세요.">
               <br> <label for="noticecontent">공지 설명</label>
               <textarea class="form-control createmodal" rows="5"
                  id="bncontent" name="bncontent" style="width: 100%"
                  placeholder="내용을 적어주세요."></textarea>   
                  <input type="hidden" name="email" value="${sessionScope.email}">      
            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="submit" class="btn btn-secondary"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">만들기</button>
               <button type="button" class="btn btn-secondary"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
                  data-dismiss="modal">취소</button>
               </div>
            </div>
         </form>
      </div>
   </div>
   </div>
<script type="text/javascript">
$('.modal').on('hidden.bs.modal', function(e) {
   console.log('modal close');
   $('#memlist').hide();
   $('.CodeMirror').hide();
   $('#filename').empty();
   $('#imgpreview').hide();
   $('#issuecontent').show();
   $('#todo').hide();
   $('#todomem').empty();
   $('#todolist').empty();
   $('#todoresult').empty();
   $('#todoresult').hide();
   $('#datepick').hide();
   $('#from').empty();
   $('#to').empty();
   $('#memlist').attr('class', 'list-group');
   $(this).find('form')[0].reset()
});
var tar = 1;
var tar2 = 2;
$('.menli').keydown(function(event) {
   var key = event.keyCode;
    switch (key) {
    case 38:
       console.log("위");
       tar2--;
       break;
    case 40:
       tar2++;
       break;
    case 39:
       break;
    case 37:
       break;
    }
    if (tar2 < 1) {
       tar2 = 1;
    }
    if (tar2 > 9) {
       tar2 = 9;
    }
    $('#men' + tar2).focus();
    if ($('#men' + tar2).focus()) {
       $('.menli').css('background-color', '#fff');
       $('#men' + tar2).css(
             'background-color',
             'rgba(225, 225, 225,0.5)');
    }
    if(event.keyCode == 13){
       $(this).click();
    }
});
	$('#issuecontent').keydown(
			function(event) {
				if($('#mentionlist').css('display')==('flex')){
					console.log('여기서라면?');
					console.log(event.keyCode);
					var key = event.keyCode;
		               switch (key) {
		               case 38:
		                  console.log("위");
		                  tar--;
		                  break;
		               case 40:
		                  tar++;
		                  break;
		               case 39:
		                  break;
		               case 37:
		                  break;
		               }
		               if (tar < 1) {
		                  tar = 1;
		               }
		               if (tar > 9) {
		                  tar = 9;
		               }
		               $('#men' + tar).focus();
		               if ($('#men' + tar).focus()) {
		                  $('.menli').css('background-color', '#fff');
		                  $('#men' + tar).css(
		                        'background-color',
		                        'rgba(225, 225, 225,0.5)');
		               }
		               if(event.keyCode == 13){
		               	$(this).click();
		               }
				}
				var top = ($('#issuecontent').offset().top);
				var left = ($('#issuecontent').offset().left + 490);
				if (event.shiftKey && event.keyCode == 50) {
					console.log("top&left" + top + ", " + left);
					$('#mentionlist').attr(
							'style',
							'position:fixed; width:20%;top:' + top + 'px;left:'
									+ left + 'px; z-index:4');
					$('#mentionlist').show();
					$('div').not('#mentionlist').click(function() {
						$('#mentionlist').hide();
					});
				}
			});
	$('#men1').click(
			function() {
				var top = ($('#issuecontent').offset().top);
				var left = ($('#issuecontent').offset().left + 490);
				$('#mentionlist').hide();
				$('#memlist').attr(
						'style',
						'position:fixed; width:20%;top:' + top + 'px;left:'
								+ left + 'px; z-index:4');
				$('#memlist').show();
				$('#memlist').attr('class', 'list-group mem');
				$('.modal-content').not('#memlist').click(function() {
					$('#memlist').hide();
					$('#memlist').attr('class', 'list-group');
				});
			});
	$('#men2').click(function() {
		$('#mentionlist').hide();
		$('#issuecontent').empty();
		$('#issuecontent').hide();
		var textarea = document.getElementById('codemirrorarea');
		var editor = CodeMirror.fromTextArea(textarea, {
			mode : "javascript",
			lineNumbers : true,
			lineWrapping : true,
			theme : "eclipse",
			val : textarea.value
		});
	});
	$('#men3').click(function() {
		$('#mentionlist').hide();
		var text = "";
		text = $('#issuecontent').val().replace("@", "");
		$('#issuecontent').val(text);
		$('#auth').click();
		$('#issuecontent').append($('.picker-dialog'));

	});
	$('#men4').click(function() {
		$('#mentionlist').hide();
		$('#fileclick').click();
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#imgpreview').attr('src', e.target.result);
				if (e.target.result.substring(5, 10) == 'image') {
					$('#imgpreview').show();
				} else {
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
		text = $('#issuecontent').val().replace("@", "");
		$('#issuecontent').val(text);

	});
	$('#men8').click(
			function() {
				var text = "";
				text = $('#issuecontent').val().replace("@", "");
				$('#issuecontent').val(text);
				var top = ($('#issuecontent').offset().top);
				var left = ($('#issuecontent').offset().left + 490);
				$('#mentionlist').hide();
				$('#memlist').attr(
						'style',
						'position:fixed; width:20%;top:' + top + 'px;left:'
								+ left + 'px; z-index:4');
				$('#memlist').show();
			});
	$('.todo')
			.click(
					function() {
						var top = ($('#issuecontent').offset().top);
						var left = ($('#issuecontent').offset().left + 490);
						if ($(this).parents('#memlist').attr('class') == 'list-group mem') {
							var text = "";
							text = $('#issuecontent').val().replace("@", "");
							$('#issuecontent').val(text);
							$('#todoresult').append('<div><input type="text" id="mention" name="mention" value="@'+ $(this).text() + '" style="border:none" readonly></div>');
							console.log($(this).text());
							$('#todoresult').show();
							$('#memlist').hide();
							$('#memlist').attr('class', 'list-group');
						} else {
							$('#memlist').hide();
							$('#todo')
									.attr(
											'style',
											'border-radius:0.25em;padding:1%;position:fixed; width:20%;top:'
													+ (top - 208)
													+ 'px;left:'
													+ left
													+ 'px; z-index:4;background-color:white');
							$('#todo').show();
							$('#todomem').val($(this).text());
						}

						$('.modal-content').not('#todo').click(function() {
							$('#todo').hide();
						});
					});
	$('#todomake')
			.click(
					function() {
						$('#todo').hide();
						var text = "";
						text = $('#issuecontent').val().replace("@", "");
						$('#issuecontent').val(text);
						$('#todoresult')
								.append(
										'<div><span class="iconify" data-icon="bx:bx-check-circle" data-inline="false"></span>'
												+ $('#todomem').val()
												+ ' <span class="iconify" data-icon="bytesize:arrow-right" data-inline="false"></span> '
												+ $('#todolist').val()
												+ '</div>');
						$('#todoresult').show();
						$('#todolist').val('');
					})
	$('#todocancle').click(function() {
		$('#todo').hide();
		var text = "";
		text = $('#issuecontent').val().replace("@", "");
		$('#issuecontent').val(text);
		$('#todolist').val('');
	});

	$('#men9').click(
			function() {
				var top = ($('#issuecontent').offset().top);
				var left = ($('#issuecontent').offset().left + 490);
				$('#mentionlist').hide();
				var text = "";
				text = $('#issuecontent').val().replace("@", "");
				$('#issuecontent').val(text);
				$('#datepick').attr(
						'style',
						'border-radius:0.25em;padding:1%;position:fixed; width:20%;top:'
								+ top + 'px;left:' + left
								+ 'px; z-index:4;background-color:white');
				$('#datepick').show();
				$('.modal-content').not('#datepick').click(function() {
					$('#datepick').hide();
				});
				$('.hasDatepicker').click(function() {
					$('#datepick').append($('#ui-datepicker-div'));
				});
			});
	$('#datemake')
			.click(
					function() {
						$('#datepick').hide();
						var text = "";
						text = $('#issuecontent').val().replace("@", "");
						$('#issuecontent').val(text);
						$('#todoresult')
								.append(
										'<div><span class="iconify" data-icon="bx:bx-calendar" data-inline="false"></span>'
												+ $('#from').val()
												+ '~'
												+ $('#to').val()
												+ ' <span class="iconify" data-icon="bytesize:arrow-right" data-inline="false"></span> '
												+ $('#datecontent').val()
												+ '</div>');
						$('#todoresult').show();
						$('#todolist').val('');
					})
	$('#datecancle').click(function() {
		$('#datepick').hide();
		var text = "";
		text = $('#issuecontent').val().replace("@", "");
		$('#issuecontent').val(text);
		$('#todolist').val('');
	});

	var dateFormat = "mm/dd/yy", from = $("#from").datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 3
	}).on("change", function() {
		to.datepicker("option", "minDate", getDate(this));
	}), to = $("#to").datepicker({
		defaultDate : "+1w",
		changeMonth : true,
		numberOfMonths : 3
	}).on("change", function() {
		from.datepicker("option", "maxDate", getDate(this));
	});
	function getDate(element) {
		var date;
		try {
			date = $.datepicker.parseDate(dateFormat, element.value);
		} catch (error) {
			date = null;
		}
		return date;
	}

	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			location.href = "logout.do";
		});
		auth2.disconnect();

	}

	function onLoad() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
		});
	}

	$('#inviteModal_id')
			.mouseover(
					function() {
						$(this)
								.attr('style',
										'cursor: pointer;color:#e71d36;font-size: 18px;padding-bottom: 12px;');
					});
	$('#inviteModal_id')
			.mouseleave(
					function() {
						$(this)
								.attr('style',
										'cursor: pointer;color:#535359;font-size: 18px;padding-bottom: 12px;');
					});

</script>